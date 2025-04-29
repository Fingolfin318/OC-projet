<!DOCTYPE html>
<html>
    <head><meta charset="utf-8">
        <meta name="author" content="Guillaume Kauf">
        <link rel="stylesheet" href="/static/styleGK.css">
        <link rel="stylesheet" href="/static/style_gen.css"> 
        <link rel="icon" href="/static/logo.jpg" type="image/x-icon">
        <title>CV</title>
     </head>
 <body>
    <section>
      <form action="${url_for('register_c')}" 
              method="post"
              target="_self">
          <header class ="entete">
            <a href="${ url_for('accueil') }">
              <img src="${ url_for('static', filename='logo.png') }" alt="Accueil" style="height: 150px;">
            </a>
            <p>
              <label>
              <input type="radio" name="genre" value="mr" required>
                Mr
              </label>
              <label>
              <input type="radio" name="genre" value="mme" required>
                Mme
              </label>
              <label>
              <input type= "radio" name="genre" value="hélicoptère_de_combat" required>
                Hélicoptère de combat
              </label>
            </p>
          </header>
            <p>
              <label>
                <input type= "radio" name="type" value="étudiant" required>
                  Étudiant
              </label>
              <label>
                <input type= "radio" name="type" value="chercheur_emploi" required>
                  Chercheur d'emploi
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
            <p>
                <label>Domaines</label><br>
                  <select name='domaine' required>
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
              <input type="mdp" name="mdp" required>
            <p>
              <button 1 type="submit">S'inscrire</button>
              <button 2 type="reset">Réinitialiser</button>
            </p>
            <p>
              <div class="retour"><a href="${url_for('connexions')}">Retour</a></div>
            </p>
        </form>
    </section>
  </body>
