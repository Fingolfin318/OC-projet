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
                    ${offre['patron_email']}
                % endfor
                
                %for i in l_offres :
                    <div class=offre>
                    Type demandé : ${type_searched}
                    Domaine : ${domaine}
                    Formations nécessaires : ${forma_needed}
                    Pour l'entreprise : ${patron_entreprise}
                    Durée : ${duration}
                    Email de l'entreprise : ${patron_email}
                    Offre crée le : ${creation_time}

            </div>
    </div>
    <a href="${url_for('accueil')}">Accueil</a>
</body>
