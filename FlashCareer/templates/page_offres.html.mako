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
            % for offre in offres :
                <h2>
                    <li>${offre['nom_trav']}</li>
                </h2>
                <div class="liste">
                    <p>
                        <li>Domaine : ${offre['domaine']}</li>
                    </p>
                    <p>
                        <li>profil recherché : ${offre['type_searched']}</li>
                    </p>
                    <p>
                        <li>Formations nécessaires : ${offre['forma_needed']}</li>
                    </p>
                    <p>
                        <li>Pour l'entreprise : ${offre['patron_entreprise']}</li>
                    </p>
                    <p>
                        <li>Durée : ${offre['duration']}</li>
                    </p>
                    <p>
                        <li>Email de l'entreprise : ${offre['patron_email']}</li>
                    </p>
                    <p>
                        <li>Numéro de l'offre : ${offre['id']}
                    </p>
                    <li class="postuler">
                        <a href="${url_for('offre', id=offre['id'])}">Postuler à l'offre</a>
                    </li>
                </div>
            % endfor
        </div>
    </div>
    <br><br><br><br>
</body>
