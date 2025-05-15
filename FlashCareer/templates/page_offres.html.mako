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
                <div class="type">Type demandé : ${offre['type_searched']}<button class="redirection"><a href="${url_for('postuler')}">Postuler à l'offre ${offre['id']}</a></div></div>
                <li>Domaine : ${offre['domaine']}</li>
                <li>Formations nécessaires : ${offre['patron_email']}</li>
                <li>Pour l'entreprise : ${offre['patron_entreprise']}</li>
                <li>Durée : ${offre['duration']}</li>
                <li>Email de l'entreprise : ${offre['patron_email']}</li>
            % endfor
        </div>
    </div>
    <a href="${url_for('accueil')}">Accueil</a>
</body>
