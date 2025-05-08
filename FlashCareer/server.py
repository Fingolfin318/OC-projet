import os
os.chdir(os.path.dirname(os.path.realpath(__file__)))
##
from flask import Flask,request, redirect, url_for, session
from flask_mako import render_template, MakoTemplates
from flask_sqlite import SQLiteExtension, sqlite3, get_db
from sqlite3 import IntegrityError
from time import sleep
##
app = Flask("flashcareer") 
app.secret_key = os.urandom(24) 
MakoTemplates(app)
SQLiteExtension(app)

class ValidationError(ValueError):
    pass


@app.route('/')
def index():
    return redirect(url_for("accueil"), code=303)

@app.route("/accueil")
def accueil():
    if "user_type" in session and "nom" in session:
        user_type = session["user_type"]
        user_nom = session["nom"]
        user_message = session['message']
    else:
        user_type = None
        user_nom = None
        user_message=None
    return render_template("accueil.html.mako", user_type=user_type, nom=user_nom, message=user_message)

@app.route('/a_propos')
def a_propos() :
    return render_template('a_propos.html.mako')

@app.route('/profil')
def profil() :
    if "nom" not in session:
        return redirect(url_for("accueil"), code=303)
    user_nom = session["nom"]
    user_prenom = session["prenom"]
    user_type = session["user_type"]
    user_domaine = session['domaine']
    user_entreprise = session['entreprise']
    print(user_entreprise)
    return render_template('profil.html.mako', nom=user_nom, prenom=user_prenom, user_type=user_type, domaine=user_domaine, entreprise=user_entreprise)

@app.route('/contact')
def contact():
    return render_template('contact.html.mako')

@app.route("/inscription_patrons", methods=["GET", "POST"])
def register_p():
    if request.method == "GET":
        return render_template("inscription_Employeur.html.mako", error=None)
    elif request.method == "POST":
        db = get_db()
        nom = request.form["nom"]
        prenom = request.form["prenom"]
        utilisateur_existant = db.execute(
            """
            SELECT * FROM users WHERE nom = ? AND prenom = ?
            """,
            (nom, prenom)
        ).fetchone()

        if utilisateur_existant:
            return render_template("inscription_Employeur.html.mako", error="Un utilisateur avec ce nom et prénom existe déjà.")
        try:
            db.execute(
                """
                INSERT INTO users (nom, prenom, email, genre, entreprise, domaine, mdp, type)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?);
                """,
                (request.form["nom"], request.form["prenom"], request.form["email"], request.form["genre"], request.form['entreprise'],request.form["domaine"],request.form["mdp"], request.form["type"], ))
            db.commit()
            session.clear()
            session["user_type"] = request.form["type"]
            session["nom"] = request.form["nom"]
            session["prenom"] = request.form["prenom"]
            session['message'] = 'Inscription réussie ! Explorez les possibilitées sans fin de Flashcareer... '
        except IntegrityError as e:
            return render_template("inscription_Chercheur.html.mako", error=str('Valeurs incorrectes'))
        return redirect(url_for("accueil"))

@app.route("/inscription_chercheurs", methods=["GET", "POST"])
def register_c():
    if request.method == "GET":
        return render_template("inscription_Chercheur.html.mako", error=None)
    elif request.method == "POST":
        db = get_db()
        nom = request.form["nom"]
        prenom = request.form["prenom"]
        utilisateur_existant = db.execute(
            """
            SELECT * FROM users WHERE nom = ? AND prenom = ?
            """,
            (nom, prenom)
        ).fetchone()

        if utilisateur_existant:
            return render_template("inscription_Chercheur.html.mako", error="Un utilisateur avec ce nom et prénom existe déjà.")
        try:
            db.execute(
                """
                INSERT INTO users (nom, prenom, email, genre, entreprise, domaine, mdp, type)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?);
                """,
                (request.form["nom"], request.form["prenom"], request.form["email"], request.form["genre"], None, request.form["domaine"], request.form["mdp"], request.form["type"], ))
            db.commit()
            session["user_type"] = request.form["type"]
            session["nom"] = request.form["nom"]
            session["prenom"] = request.form["prenom"]
            session['message'] = 'Inscription réussie ! Explorez les possibilitées sans fin de Flashcareer... '
        except IntegrityError as e:
            return render_template("inscription_Chercheur.html.mako", error=str('Valeurs incorrectes...'))
        return redirect(url_for("accueil"))

@app.route("/connexions", methods=["GET", "POST"])
def connexions():
    if request.method == "GET":
        return render_template("connexions.html.mako", error=None)
    elif request.method == "POST":
        db = get_db()
        try:
            cursor = db.execute(
                "SELECT * FROM users WHERE nom = ? AND prenom = ? AND mdp = ? LIMIT 1",
                (request.form["nom"], request.form["prenom"], request.form['mdp']))
            user = cursor.fetchone()
            if user:
                session.clear()
                session["user_id"] = user["id"]
                session["user_type"] = user["type"]
                session["nom"] = user["nom"]
                session["prenom"] = user["prenom"]
                session['domaine'] = user['domaine']
                session['entreprise'] = user['entreprise']
                session['message'] = 'Connexion réussie ! Explorez Explorez les possibilitées sans fin de Flashcareer... '
                return redirect(url_for("accueil"))
            else:
                return render_template("connexions.html.mako", error="Identifiants incorrects.")
        except Exception as e:
            return render_template("connexions.html.mako", error=str(e))
        
@app.route('/deconnexions')
def deconnexions():
   session.clear()
   return redirect(url_for('accueil', code=303))

@app.route('/poster_offre', methods=["GET", "POST"])
def poster_offre() :
    if request.method == "GET":
        return render_template('poster_Offre.html.mako')
    elif request.method == "POST":
        db = get_db()
        try:
            db.execute(
                """
                INSERT INTO offres (patron_entreprise, patron_email, type_searched, domaine, duration, forma_needed)
                VALUES (?, ?, ?, ?, ?, ?);
                """,
                (request.form["patron_entreprise"], request.form["patron_email"], request.form["type_searched"], request.form["domaine"], request.form["duration"], request.form["forma_needed"], ))
            db.commit()
            session['message'] = 'Création réussie ! Regardez bien vos mails, au cas où une personne aurait déjà répondu, qui sait... '
        except IntegrityError as e:
            return render_template('poster_Offre.html.mako', error=str('Valeurs incorrectes...'))
        return redirect(url_for("accueil"))

@app.route('/postuler', methods=['GET', 'POST'])
def postuler():
    db = get_db()
    offres = db.execute('select * from offres').fetchall()
    return render_template('page_offres.html.mako', offres=offres)


#RIEN APRÈS CA !!!#
app.run(debug=True)