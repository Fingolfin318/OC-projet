<!DOCTYPE html>
<html>
 <head> <meta charset="utf-8">
           <meta name="author" content="Guillaume Kauf">
           <link rel="stylesheet" href="/static/styleGK.css">
           <script src="static\PyScript.py"></script>
           <link rel="icon" href="/static/logo.jpg" type="image/x-icon">
           <title>Connexions</title>
 </head>
    <body>
    % if error:
    <div class="error">${error}</div>
    % endif
        <div class="title_content">
            <header class ="entete">
                <a href="${ url_for('accueil') }" class="logo-lien">
                    <img src="${ url_for('static', filename='logo.png') }" alt="Accueil" style="height: 100px;">
                </a>
            <h1>Salut, connecte-toi ici : </h1>
            </header>
        </div>
        <section>
            <form action="${url_for('connexions')}" method="post">
                <p>
                    <label for="nom">Nom</label>
                   <input type="text" name="nom" required>
                </p>
                <p>
                    <label for="prenom">Prénom</label>
                   <input type="text" name="prenom" required>
                </p>
                <p>
                    <label for="mdp">Mot de passe</label>
                    <input type="text" name="mdp" required>
                </p>
                <div class="signnincontent_button_link">
                    <p>
                        <button type="submit">Se connecter</button>
                    </p>
                </div>
            </form>
            <h3><button class="signnincontent_button_link"><a href="${url_for('register_c')}">Pour s'inscrire en tant qu'étudiant ou chercheur d'emploi, c'est ici : </a></button></h3>
            <h3><button class="signnincontent_button_link"><a href="${url_for('register_p')}">Pour s'inscrire en tant que patron, c'est ici : </a></button></h3>
        </section>
        <div class="retour"><a href="${url_for('accueil')}">Retour</a></div>
    </body>
