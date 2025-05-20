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
            <h2>${offre['nom_trav']} :</h2>
        </header>
    </div>
    <div>
        <li><strong>Domaine :</strong> ${offre['domaine']}</li>
        <li><strong>Profil recherché :</strong> ${offre['type_searched']}</li>
        <li><strong>Formations nécessaires :</strong> ${offre['forma_needed']}</li>
        <li><strong>Entreprise :</strong> ${offre['patron_entreprise']}</li>
        <li><strong>Durée :</strong> ${offre['duration']}</li>
        <li><strong>Email :</strong> ${offre['patron_email']}</li>
        <li><strong>Numéro de l'offre :</strong> ${offre['id']}</li>
        <div class=boutonnn>
        <button><a class = boutonnn href="${url_for('postuler')}">Postuler</a></button>
        <button><a href="${url_for('page_offres')}">Retour sur la page des offres</a></button>
        </div>
    </div>