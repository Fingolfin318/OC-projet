<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="Michael Ireneo Guillaume" content="FlashCareer">
    <link rel="stylesheet" type="text/css" href="/static/Accueil.css">
    <link rel="stylesheet" type="text/css" href="/static/style_gen.css">
    <link rel="icon" type="image/x-icon" href="/images/logo.jpg">
    <title>Accueil FlashCareer</title>
</head>
<body>
    <div class ="general">
        <div class = "menu">
            <h2>Accueil</h2>
            %if logged_user is None : 
            <div class="br"><a href="${url_for('a_propos')}">À propos du site</a></div>
            <a href="${url_for('connexions')}">Se connecter</a>
            %elif user_type == 'patron' :
            <div class="br"><a href="${url_for('profil')}">Profil</a></div>
            <div class="br"><a href="${url_for('a_propos')}">À propos du site</a></div>
            <div class="br"><a href="${url_for('poster_offre')}">Poster une offre</a></div>
            <a href="${url_for('connexions')}">Se connecter</a>
            %elif user_type == 'chercheur' or logged_user.type == 'étudiant' :
            <div class="br"><a href="${url_for('profil')}">Profil</a></div>
            <div class="br"><a href="${url_for('a_propos')}">À propos du site</a></div>
            <div class="br"><a href="${url_for('postuler')}">Postuler à une offre</a></div>
            <a href="${url_for('connexions')}">Se connecter</a>
            %endif
        </div>
        <div class ="titre-content">
            <div class="titre">
                <h1>FlashCareer</h1>
                <div class="img_logo"><img src="images/logo.png" alt="logo" width="270" height="270"></div>
            </div>
            <div class = "content">
                <p>
                    Bienvenue sur FlashCareer ! 💼🚀  
                    Trouve le job de tes rêves sur le seul site d'offre d'emplois efficaces et plus passionnant que rester devant son écran béatement.
                    <br><br>

                    Envie d’un boulot ? Ici, on ne te vend pas du rêve, on te le livre en express. Besoin de passer de "chercheur d'emploi en pyjama" à "professionnel en costard" ? Pas de souci, avec FlashCareer, on va te catapulter vers ton destin professionnel plus vite qu’un clic sur le bouton "Postuler". 🚀💼
                    <br><br>

                    Ici, pas de bla-bla. Des annonces. Des opportunités. Des patrons qui t’attendent comme des enfants le jour de Noël. 🎁 Et toi, en superstar que tu es, tu fais ton choix en mode diva.
                    <br><br>

                    Alors, prêt à trouver le job qui te correspond ? Allez, arrête de scroller sur les réseaux, ton CV va devenir plus populaire qu’un meme viral !
                </p>
            </div>
        </div>
    </div>
</body>
