<html>
<head>
    <meta charset="UTF-8">
    <meta name="author" content="Zapoï Piotr">
    <title>Profil</title>
    <link rel="stylesheet" type="text/css" href="/static/ire.css">
    <link rel="icon" href="/static/logo.jpg" type="image/x-icon">
</head>

<body>
    <header class ="entete">
        <a href="${ url_for('accueil') }">
            <img src="${ url_for('static', filename='logo.png') }" alt="Accueil" style="height: 150px;">
        </a>
        <h1>Profil :</h1>
    </header>
    <main>
    %if logged_user is None :
        <section class="retour-accueil text-center">
            <button class="connexion"><a href="${url_for('connexions')}">Veuillez vous connectez !</a></button>
    %elif logged_user is not None :
        %if user_type == 'patron' :
            <section class="profile-info text-center">
                <h2>Prénom : ${prenom}</h2>
                <h2>Nom : ${nom}</h2>
                <h2>Status : ${type}</h2>
                <h2>Domaine : ${domaine}</h2>
                <h2>Entreprise : ${entreprise}</h2>
            </section>
        %else :
            <section class="profile-info text-center">
                <h2>Prénom : ${prenom}</h2>
                <h2>Nom : ${nom}</h2>
                <h2>Status : ${type}</h2>
                <h2>Domaine : ${domaine}</h2>
            </section>
        %endif
    %endif
    </main>
    <footer>
        <section class="retour-accueil text-center">
            <button class="retour"><a href="${url_for('accueil')}">Accueil</a></button>
        </section>
    </footer>
</body>
</html>