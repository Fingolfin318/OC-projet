<!DOCTYPE html>
<html>
 <head> <meta charset="utf-8">
           <meta name="author" content="Guillaume Kauf">
           <link rel="stylesheet" href="/static/styleGK.css">
           <link rel="stylesheet" href="/static/style_gen.css">
           <script src="static\PyScript.py"></script>
           <link rel="icon" href="/images/logo.jpg" type="image/x-icon">
           <title>Connexions</title>
 </head>
    <body>
        <div class="title_content">
            <h1>Salut, connecte-toi ici : </h1>
        </div>
        <section>
            <form action="/signup" method="post">
                <p>
                    <label for="Nom">Nom</label>
                   <input type="text" name="Pseudo" required>
                </p>
                <p>
                    <label for="Prenom">Prénom</label>
                   <input type="text" name="Pseudo" required>
                </p>
                <p>
                    <label for="Password">Mot de passe</label>
                    <input type="text" name="Password" required>
                </p>
                <div class="signnincontent_button_link">
                    <p>
                        <button class="submit">Se connecter</button>
                    </p>
                </div>
            </form>
            <h3><button class="signnincontent_button_link"><a href="${url_for('register_c')}">Pour s'inscrire en tant qu'étudiant ou chercheur d'emploi, c'est ici : </a></button></h3>
            <h3><button class="signnincontent_button_link"><a href="${url_for('register_p')}">Pour s'inscrire en tant que patron, c'est ici : </a></button></h3>
        </section>
        <div class="retour"><a href="${url_for('accueil')}">Retour</a></div>
    </body>
