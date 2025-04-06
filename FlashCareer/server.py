import os
os.chdir(os.path.dirname(os.path.realpath(__file__)))
##
from flask import Flask, abort, session   # Importe le type Flask.
from datetime import datetime
from flask_mako import render_template, MakoTemplates
from flask_sqlite import SQLiteExtension, get_db, sqlite3
from random import randint
from flask import request, redirect, url_for
from sqlite3 import IntegrityError
##
app = Flask("flashcareer") 
app.secret_key = b'\xc4*\xc1P\x01M\xbdo\x92kv\x8a|\xb5\x18q'
MakoTemplates(app)
SQLiteExtension(app)
app.secret_key = b't\t\x01\x82/\xbc\xdd\x9fE0\x01S\xc5Ze@'

def load_connected_user():
    user_id = session.get('user_id')
    if user_id is None :
        user = get_db().execute('select * from users where id = ? limit 1', (user_id,)).fetchone()
        return user

def load_type_user():
    user_type = session.get('user_type')
    if user_type is None :
        user = get_db().execute('select * from users where type = ? limit 1', (user_type,)).fetchone()
        return user

@app.route("/inscription_chercheur", methods=["GET", "POST"])
def register():
    if request.method == "GET":
        return render_template("inscription_chercheur.html.mako", error=None)
    elif request.method == "POST":
        db = get_db()
        try:
            db.execute(
                """
                INSERT INTO Users (type, genre, nom, prénom, email, domaine, mdp)
                VALUES (?, ?, ?, ?, ?, ?, ?);
                """,
                (request.form["genre"], request.form["nom"],request.form["prénom"],request.form["email"],request.form["type"],request.form["email"],request.form["domaine"],request.form["mdp"]))
            db.commit()
            return redirect(url_for("accueil"), code=303)
        except ValidationError as e:
            return render_template("register.html.mako", error=str('c pa bien'))
        except IntegrityError as i:
            return render_template("register.html.mako", error=str('c pa bien'))
        finally : 
            db.rollback()


@app.route("/Connexions", methods=["GET", "POST"])
def Connexions():
    if "user_id" in session: #si utilisateur est déjà connecté
        return redirect(url_for("welcome"))
    if request.method == "GET":
        return render_templates("Connexions.html.mako", error=None)
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
            return redirect(url_for("Acceuil"), code=303)
        except ValidationError as e:
            return render_templates("login.html.mako", error=str(e))
        
#@app.route("/Acceuil")
#def acceuil():
   # logged_user = load_connected_user()
    #db = get_db()
    #cursor = db.execute("SELECT * FROM users ORDER BY random() LIMIT 1")
   # user = cursor.fetchone()
    #return render_template("Acceuil.html.mako",
                           #heure_actuelle=str(datetime.now())
                           #day_user_pseudo=user['pseudo'],
#                           logged_user=logged_use)


app.run(debug=True)
