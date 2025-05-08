<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="author" content="Zapoï Piotr">
    <link rel="stylesheet" type="text/css" href="/static/style.css">
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
    <form action="/postuler" method="post">
        <label for="nom">Nom :</label><br>
        <input type="text" id="nom" name="nom" required><br><br>

        <label for="email">Email :</label><br>
        <input type="email" id="email" name="email" required><br><br>

        <label for="message">Message :</label><br>
        <textarea id="message" name="message" required></textarea><br><br>

        <input type="submit" value="Envoyer">
    </form>
</body>
</html>
