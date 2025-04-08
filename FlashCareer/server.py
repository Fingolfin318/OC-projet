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
        user = get_db().execute('select * from users where id = ? limit 1', (user_id,)).fetchone()
        return user

def load_type_user():
    user_type = session.get('user_type')
    if user_type is None :
        user = get_db().execute('select type from users where id = user_id limit 1', (user_type,)).fetchone()
        return user

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
        finally : 
            db.rollback()

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
        finally : 
            db.rollback()

@app.route("/Connexions", methods=["GET", "POST"])
def Connexions():
    if "user_id" in session: 
        return redirect(url_for("Accueil.html.mako", error=str('Vous êtes déjà connecté !')))
    if request.method == "GET":
        return render_template("Connexions.html.mako", error=None)
    elif request.method =="POST":
        db = get_db()
        try:
            cursor = db.execute("select * from users where nom=? and where prenom=? limit 1", 
                                (request.form["nom", "prénom"], )) 
            user=cursor.fetchone()
            if user is None :
                raise ValidationError("nom ou prénom invalide")
            if user["mdp"] != request.form["mdp"]:
                raise ValidationError("Mot de passe invalide")
            session.clear()
            session["user_id"] = user["id"]
            app.loger.info("LOG IN '%s' (id=id)", user['prenom', 'nom'], user['id'])
            return redirect(url_for("Accueil.html.mako"), code=303)
        except ValidationError as e:
            return render_template("login.html.mako", error=str(e))
        
@app.route('/')
def index():
    return redirect(url_for("accueil"), code=303)

@app.route("/accueil")
def accueil():
    logged_user = load_connected_user()
    user_type = load_type_user
    return render_template("Accueil.html.mako", logged_user=logged_user, user_type=user_type)

@app.route('/a_propos')
def a_propos() :
    marque = 'Pignouf.exe'
    return render_template('a_propos.html.mako', marque=marque)

app.run(debug=True)


@app.route('/postuler', methods=['GET', 'POST'])
def postuler():
    if request.method == 'POST':
        nom = request.form.get('nom')
        email = request.form.get('email')
        message = request.form.get('message')

        # Traitement de la postulation (ex: enregistrement, envoi mail, etc.)
        print(f"Nouvelle postulation : {nom} ({email}) - {message}")

        #flash("Votre postulation a bien été envoyée !")
        return redirect(url_for('postuler'))

    return render_template('postuler.html.mako')

if __name__ == '__main__':
    app.run(debug=True)