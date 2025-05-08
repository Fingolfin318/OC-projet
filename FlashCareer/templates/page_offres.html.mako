<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="Michael Ireneo Guillaume" content="FlashCareer">
    <link rel="stylesheet" type="text/css" href="/static/postuler.css">
    <link rel="stylesheet" type="text/css" href="/static/style_gen.css">
    <link rel="icon" href="/static/logo.jpg" type="image/x-icon">
    <title>Offres</title>
</head>
<body>
    <div class="general">
        <div class="titre">
            <header class ="entete">
                    <a href="${ url_for('accueil') }" class ="entete">
                        <img src="${ url_for('static', filename='logo.png') }" alt="Accueil" style="height: 200px;">
                    </a>
                    <h1>Offres :</h1>
            </header>
        </div>
        <div class="offres">
            % for offre in offres :
                Type demandé : ${offre[4]}
                Domaine : ${offre[2]}
                Formations nécessaires : ${offre[6]}
                Pour l'entreprise : ${offre[1]}
                Durée : ${offre[3]}
                Email de l'entreprise : ${offre[5]}
                
            % endfor
        </div>
    </div>
    <a href="${url_for('accueil')}">Accueil</a>
</body>
