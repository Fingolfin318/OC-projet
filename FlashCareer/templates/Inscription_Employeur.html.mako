<!DOCTYPE html>
<html>
    <head> <meta charset="utf-8">
        <meta name="author" content="Guillaume Kauf">
        <link rel="stylesheet" href="/static/styleGK.css">
        <link rel="stylesheet" href="/static/style_gen.css"> 
        <link rel="icon" href="/static/logo.jpg" type="image/x-icon">
        <title>Entreprise</title>
    </head>
    <body>
    % if error:
    <div class="error">${error}</div>
    % endif
        <div class="title_content">
            <header class ="entete">
                <a href="${ url_for('accueil') }" class ="logo-lien">
                    <img src="${ url_for('static', filename='logo.png') }" alt="Accueil" style="height: 100px;">
                </a>
            </header>
            <h1>Voici ton entreprise : </h1>
        </div>
        <section>  
            <form   action="${url_for('register_p')}" method="post">
                <p> <label>
                    <input type="radio" name="genre" value="mr" required>
                    Mr
                    </label>
                    <label>
                    <input type="radio" name="genre" value="mme" required>
                    Mme
                    </label>
                </p>
                <p><label>
                    <input type='radio' name='type' value='patron' required>
                    Patron
                    </label>
                </p>
                <p>
                    <label>Nom</label><br>
                    <input type="text" name="nom" required>
                </p>
                <p>
                    <label>Prénom</label><br>
                    <input type="text" name="prenom" required>
                </p>
                <p>
                    <label>Email</label><br>
                    <input type="email" name="email" required>
                </p>
                <p><label>Entreprise</label>
                    <input type='text' name='entreprise' required>
                </p>
                <p>
                    <label>Domaines</label><br>
                        <select name='domaine' required>
                            <option></option>
                            <option>Santé</option>
                            <option>Bâtiment, travaux publics, aménagement et transports</option>
                            <option>Arts, culture, lettres et communication </option>
                            <option>Enseignement et sciences de l'éducation, sciences humaines et sociales</option>
                            <option>Justice et protection du public</option>
                            <option>Administration, affaires, comptabilité et finance</option>
                            <option>Ressources naturelles, agriculture, faune et environnement</option>
                            <option>Tourisme et hôtellerie</option>
                            <option>Informatique</option>
                        </select>
                </p> 
                <p>
                  <label>Mot de passe</label><br>
                  <input type="password" name="mdp" required>
                <p>
                  <button type="submit">S'inscrire</button>
                  <button type="reset">Réinitialiser</button>
                </p>
                <p><div class="retour"><a href="${url_for('connexions')}">Retour</a></div></p>
            </form>
        </section>
      </body>
