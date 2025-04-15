import os
os.chdir(os.path.dirname(os.path.realpath(__file__)))
##
from flask import Flask, abort, session   # Importe le type Flask.
from datetime import datetime
from flask_mako import render_template, MakoTemplates
from flask_sqlite import SQLiteExtension, sqlite3, get_db
from random import randint
from flask import request, redirect, url_for
from sqlite3 import IntegrityError
##
app = Flask("flashcareer") 
app.secret_key = b'\xc4*\xc1P\x01M\xbdo\x92kv\x8a|\xb5\x18q'
MakoTemplates(app)
SQLiteExtension(app)

class ValidationError(ValueError):
    pass

def load_connected_user():
    user_id = session.get('user_id')
    if user_id is None :
        return None
    user = get_db().execute('select * from users where id = ? limit 1', (user_id,)).fetchone()
    return user

def load_type_user():
    user_type = session.get('user_type')
    if user_type is None :
        return None
    user = get_db().execute('select type from users where id = ? limit 1', (user_type,)).fetchone()
    return user['type'] if user else None

@app.route("/inscription_patrons", methods=["GET", "POST"])
def register_p():
    if request.method == "GET":
        return render_template("Inscription_Employeur.html.mako", error=None)
    elif request.method == "POST":
        db = get_db()
        try:
            db.execute(
                """
                INSERT INTO users (genre, type, nom, prénom, email, entreprise, domaine, mdp)
                VALUES (?, ?, ?, ?, ?, ?, ?);
                """,
                (request.form["genre"],request.form["type"], request.form["nom"],request.form["prénom"],request.form["email"],request.form['entreprise'],request.form["domaine"],request.form["mdp"]))
            db.commit()
            return redirect(url_for("Accueil.html.mako"), code=303)
        except IntegrityError as e:
            return render_template("Inscription_Chercheur.html.mako", error=str('Valeurs incorrectes'))

@app.route("/inscription_chercheurs", methods=["GET", "POST"])
def register_c():
    if request.method == "GET":
        return render_template("Inscription_Chercheur.html.mako", error=None)
    elif request.method == "POST":
        db = get_db()
        try:
            db.execute(
                """
                INSERT INTO users (genre, type, nom, prénom, email, domaine, mdp)
                VALUES (?, ?, ?, ?, ?, ?, ?);
                """,
                (request.form["genre"],request.form["type"], request.form["nom"],request.form["prénom"],request.form["email"],request.form["domaine"],request.form["mdp"]))
            db.commit()
            return redirect(url_for("Accueil.html.mako"), code=303)
        except IntegrityError as e:
            return render_template("Inscription_Chercheur.html.mako", error=str('Valeurs incorrectes...'))

@app.route("/connexions", methods=["GET", "POST"])
def connexions():
    if request.method == "GET":
        return render_template("Connexions.html.mako", error=None)
    if "user_id" in session: 
        return redirect(url_for("accueil", error=str('Vous êtes déjà connecté !')))
    elif request.method =="POST":
        db = get_db()
        try:
            cursor = db.execute("select * from users where nom = ? and prenom = ? and mdp = ? limit 1", 
                                (request.form["nom"], request.form["prenom"], request.form['mdp'], )) 
            user=cursor.fetchone()
            if not user :
                raise ValidationError("Nom ou prénom invalide ou inexistant")
            if user["mdp"] != request.form["mdp"]:
                raise ValidationError("Mot de passe invalide")
            session.clear()
            session["user_id"] = user["id"]
            session["user_type"] = user['type']
            return redirect(url_for("accueil"), code=303)
        except ValidationError as e:
            return render_template("Connexions.html.mako", error=str(e))
        
@app.route('/')
def index():
    return redirect(url_for("accueil"), code=303)

@app.route("/accueil")
def accueil():
    logged_user = load_connected_user()
    user_type = load_type_user()
    return render_template("Accueil.html.mako", logged_user=logged_user, user_type=user_type)

@app.route('/a_propos')
def a_propos() :
    marque = 'Pignouf.exe'
    return render_template('a_propos.html.mako')

@app.route('/postuler', methods=['GET', 'POST'])
def postuler():
    if request.method == 'POST':
        nom = request.form.get('nom')
        email = request.form.get('email')
        message = request.form.get('message')

        # Traitement de la postulation (ex: enregistrement, envoi mail, etc.)
        print(f"Nouvelle postulation : {nom} ({email}) - {message}")

        #flash("Votre postulation a bien été envoyée")
        return redirect(url_for('postuler'))

    return render_template('postuler.html.mako')

@app.route('/profil')
def profil() :
    return render_template('profil.html.mako')

@app.route('/poster_offre')
def poster_offre() :
    return render_template('Poster_Offre.html.mako')

@app.route('/contact')
def contact():
    return render_template('Contact.html.mako')

#RIEN APRÈS CA !!!#
app.run(debug=True)