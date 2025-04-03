pragma encoding="UTF-8"
--dd--
create table patrons (
    key integer primary key,
    nom text not null,
    prenom text not null,
    email text not null,
    genre text not null,
    entreprise text,
    domaine text not null,
    mdp text not null,
    type text not null
);