<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="author" content="Zapoï Piotr">
    <link rel="stylesheet" type="text/css" href="/static/style_gen.css">
    <link rel="stylesheet" type="text/css" href="/static/page_offres.css">
    <link rel="stylesheet" type="text/css" href="/static/style.css">
   <!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Postulations</title>
</head>
<body>
    <header class ="entete">
        <a class="logo-lien" href="${ url_for('accueil') }">
            <img src="${ url_for('static', filename='logo.png') }" alt="Accueil" style="height: 150px;">
        </a>
        <h1>Postulations pour vos offres :<h1>
    </header>
    <div class="offres">
            % for postulation in postulations :
                Pour l'offre : ${postulation['offre_id']}<br><br>
                <div class="liste">
                    <li>Nom du postulant : ${postulation['chercheur_nom']}</li>
                    <li>Prénom du postulant : ${postulation['chercheur_prénom']}</li>
                    <li>CV du postulant : ${postulation['CV']}</li>
                    <li>Texte de motivation : ${postulation['texte_motiv']}</li>
                    <li>Email du postulant : ${postulation['chercheur_email']}</li>
                </div>
            % endfor
    </div>
</body>
</html>
