import os
os.chdir(os.path.dirname(os.path.realpath(__file__)))
##
from flask import Flask, abort, session   # Importe le type Flask.
from datetime import datetime
from flask_mako import render_template, MakoTemplates
from flask_sqlite import SQLiteExtension, get_db
from random import randint
from flask import request, redirect, url_for
from sqlite3 import IntegrityError
##
app = Flask("flashcareer") 
app.secret_key = b'\xc4*\xc1P\x01M\xbdo\x92kv\x8a|\xb5\x18q'
MakoTemplates(app)
SQLiteExtension(app)


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