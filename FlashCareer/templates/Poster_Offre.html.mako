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
        <div class="title_content"><h1>Voici ton ofrre de poste : </h1></div>
        <section>  
            <form   action="/signin" 
                    method="post"
                    target="_self">
                <p>
                    <label>Entreprise</label><br>
                    <input type="text" name="nom" required>
                </p>
                <p>
                    <label>Email</label><br>
                    <input type="email" name="email" required>
                </p>
                <p>
                    <label>Type(s) recherché(s)</label><br>
                    <input type="text" name="compétences" required>
                </p>
                <p>
                    <label>Domaines</label><br>
                        <select>
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
                    <input type="text" name="durée_contrat" required>
                </p>
                <p>
                  <label>Formation(s) nécessaire(s)</label><br>
                  <input type="text" name="formations_et_anciens_métiers" required>
                </p>
                <p>
                  <button type="submit">Poster</button>
                </p>
                <p><div class="retour"><a href="${url_for('accueil')}">Retour</a></div></p>
            </form>
        </section>
      </body>
