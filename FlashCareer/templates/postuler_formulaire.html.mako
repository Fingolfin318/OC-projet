<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="author" content="Zapoï Piotr">
    <link rel="stylesheet" type="text/css" href="/static/postuler_formulaire.css">
   <!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Postuler</title>
</head>
<body>
    <header class ="entete">
        <a href="${ url_for('accueil') }">
            <img src="${ url_for('static', filename='logo.png') }" alt="Accueil" style="height: 150px;">
        </a>
    </header>
    <h1>Formulaire de postulation</h1>
    <br>
    <br>
    <div class="liste">
        <form action="/postuler/<id>" method="post">
            <label for="nom">Nom :</label><br>
            <input type="text" id="nom" name="nom" required><br><br>

            <label for="prénom">Prénom :</label><br>
            <input type="text" id="prénom" name="prénom" required><br><br>

            <label for="email">Email :</label><br>
            <input type="email" id="email" name="email" required><br><br>

            <label for="texte_motiv">Texte de motivation :</label><br>
            <textarea id="texte_motiv" type="text" name="texte_motiv" required></textarea><br><br>

            <label for="CV">CV :</label><br>
            <textarea id="CV" type="text" name="CV" required></textarea><br><br>

            <input type="submit" value="Envoyer">
        </form>
    </div>
</body>
</html>
