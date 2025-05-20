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
    <div class="titre">
        <header class ="entete">
            <a href="${url_for('accueil')}" class ="entete">
                <img src="${url_for('static', filename='logo.png')}" alt="Accueil" style="height: 200px;">
            </a>
            <h2>${offre['detail']} :</h2>
        </header>
    </div>
    <div>
        <li>Domaines : ${offre['domaine']}</li>
        <li>Formations nécessaires : ${offre['forma_needed']}</li>
        <button><a href="${url_for('postuler', id=offre['id'])}">Postuler</a></button>
        <button><a href="${url_for('page_offres')}">Retour sur la page des offres</a></button>
    </div>