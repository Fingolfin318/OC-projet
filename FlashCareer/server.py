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
            return render_template("Inscription_Chercheur.html.mako", error=str('Valeurs incorrectes'))
        finally : 
            db.rollback()

@app.route("/Connexions", methods=["GET", "POST"])
def Connexions():
    if "user_id" in session: #si utilisateur est déjà connecté
        return redirect(url_for("Accueil.html.mako"))
    if request.method == "GET":
        return render_template("Connexions.html.mako", error=None)
    elif request.method =="POST":
        db = get_db()
        try:
            cursor = db.execute("select * from users where nom=? and where prénom=? limit 1", 
                                (request.form["nom", "prénom"], )) 
            user=cursor.fetchone()
            if user is None :
                raise ValidationError("nom ou prénom invalide")
            if user["mdp"] != request.form["mdp"]:
                raise ValidationError("Mot de passe invalide")
            session.clear()
            session["user_id"] = user["id"]
            app.loger.info("LOG IN '%s' (id=%d)", user['prénom', 'nom'], user['id'])
            return redirect(url_for("Accueil.html.mako"), code=303)
        except ValidationError as e:
            return render_template("login.html.mako", error=str(e))
        
@app.route('/')
def index():
    redirect(url_for("Accueil"), code=303)

@app.route("/accueil")
def accueuil():
    logged_user = load_connected_user()
    user_type = load_type_user
    return render_template("Accueil.html.mako", logged_user=logged_user, user_type=user_type)



app.run(debug=True)
