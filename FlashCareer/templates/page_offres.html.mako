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
                Type demandé : ${offre['type_searched']}
                Domaine : ${offre['domaine']}
                Formations nécessaires : ${offre['patron_email']}
                Pour l'entreprise : ${offre['patron_entreprise']}
                Durée : ${offre['duration']}
                Email de l'entreprise : ${offre['patron_email']}
                Offre crée le : ${offre['created_at']}
            % endfor
        </div>
    </div>
    <a href="${url_for('accueil')}">Accueil</a>
</body>
