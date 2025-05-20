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
        <div class="logo-lien">
        <div class="title_content">
            <header class ="entete">
                <a href="${ url_for('accueil') }">
                    <img src="${ url_for('static', filename='logo.png') }" alt="Accueil" style="height: 100px;">
                </a>
            </header>
            <h1>Voici ton offre de poste : </h1>
        </div>
        </div>
        <section>  
            <form   action="${url_for('poster_offre')}" 
                    method="post"
                    target="_self">
                <p>
                    <label>Nom de l'emploi</label><br>
                    <input type='text' name='trav_nom' required>
                </p>
                <p>
                    <label>Entreprise</label><br>
                    <input type="text" name="patron_entreprise" required>
                </p>
                <p>
                    <label>Email</label><br>
                    <input type="email" name="patron_email" required>
                </p>
                <p>
                    <label>Profil(s) recherché(s)</label><br>
                    <input type="text" name="type_searched" required>
                </p>
                <p>
                    <label>Domaines</label><br>
                        <select name='domaine'>
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
                    <label>Durée du contrat</label><br>
                    <input type="text" name="duration" required>
                </p>
                <p>
                  <label>Formation(s) nécessaire(s)</label><br>
                  <input type="text" name="forma_needed" required>
                </p>
                <p>
                    <label>Détail du travail :</label><br>
                    <input type='text' name='detail' required>
                </p>
                <p>
                  <button type="submit">Poster</button>
                </p>
                <p><div class="retour"><a href="${url_for('accueil')}">Retour</a></div></p>
            </form>
        </section>
      </body>
