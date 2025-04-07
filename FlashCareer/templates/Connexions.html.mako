<!DOCTYPE html>
<html>
 <head> <meta charset="utf-8">
           <meta name="author" content="Guillaume Kauf">
           <link rel="stylesheet" href="FlashCareer\static\styleGK.css">
           <link rel="stylesheet" href="FlashCareer\static\style_gen.css">
           <script src="static\PyScript.py"></script>
           <link rel="icon" href="FlashCareer\images/logo.jpg" type="image/x-icon">
           <title>Connexions</title>
 </head>
    <body>
        <div class="title_content">
            <h1>Salut, connecte-toi ici : </h1>
        </div>
        <section>
            <form action="/signup" method="post">
                <p>
                    <label for="Pseudo">Nom et prénom</label>
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
            <h3><button class="signnincontent_button_link"><a href="Inscriptions_Chercheur.html.mako">Pour s'inscrire en tant qu'étudiant ou chercheur d'emploi, c'est ici : </a></button></h3>
            <h3><button class="signnincontent_button_link"><a href="Inscriptions_Employeur.html.mako">Pour s'inscrire en tant que patron, c'est ici : </a></button></h3>
        </section>
        <div class="retour"><a href="Accueil.html.mako">Retour</a></div>
    </body>
