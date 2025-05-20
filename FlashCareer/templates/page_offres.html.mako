<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="Michael Ireneo Guillaume" content="FlashCareer">
    <link rel="stylesheet" type="text/css" href="/static/postuler.css">
    <link rel="stylesheet" type="text/css" href="/static/style_gen.css">
    <link rel="stylesheet" type="text/css" href="/static/page_offres.css">
    <link rel="icon" href="/static/logo.jpg" type="image/x-icon">
    <title>Offres</title>
</head>
<body>
    <div class="general">
        <div class="titre">
            <header class ="entete">
                    <a href="${ url_for('accueil') }" class ="entete">
                        <img src="${url_for('static', filename='logo.png')}" alt="Accueil" style="height: 200px;">
                    </a>
                    <h1>Offres :</h1>
            </header>
        </div>
        <div class="offres">
            % for offre in offres:
            <div class="offre-card">
                <h2>${offre['nom_trav']}</h2>
                <ul class="liste">
                    <li><strong>Domaine :</strong> ${offre['domaine']}</li>
                    <li><strong>Profil recherché :</strong> ${offre['type_searched']}</li>
                    <li><strong>Formations nécessaires :</strong> ${offre['forma_needed']}</li>
                    <li><strong>Entreprise :</strong> ${offre['patron_entreprise']}</li>
                    <li><strong>Durée :</strong> ${offre['duration']}</li>
                    <li><strong>Email :</strong> ${offre['patron_email']}</li>
                    <li><strong>Numéro de l'offre :</strong> ${offre['id']}</li>

                <div class="postuler">
                    <a href="${url_for('offre', id=offre['id'])}">Postuler</a>
                </div>
                </ul>
            </div>
            % endfor
        </div>