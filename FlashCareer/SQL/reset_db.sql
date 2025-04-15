--dd--
drop table if exists users ;
drop table if exists offres ;
drop table if exists postulations ;
--dd--
create table offres (
    id integer primary key,
    patron_entreprise text not null,
    domaine text not null,
    duration text not null,
    created_at text not null,
    patron_emailtext not null,
    forma_needed text not null
);
--dd--
create table postulations (
    id integer primary key,
    chercheur_nom text not null,
    chercheur_prénom text not null,
    CV text not null,
    chercheur_email text not null,
    texte_motiv text not null,
    offre_key integer
);
--dd--
create table users(
    id integer primary key,
    nom text not null,
    prenom text not null,
    email text not null,
    genre text not null,
    entreprise text,
    domaine text not null,
    mdp text not null,
    type text not null
);
--dd--
insert into users Values('1', 'cool','cooled', 'm@gmail.com', 'homme', 'Lool', 'santé', 'lavieccool', 'étudiant');