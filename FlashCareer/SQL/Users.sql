drop table if exists users
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
insert into users values(22, 'cool','cooled', 'm@gmail.com', 'homme', NULL, 'santé', 'lavieccool', 'étudiant');
