drop table if EXISTS offres;
--dd--
create table offres (
    id integer primary key,
    patron_entreprise text not null,
    domaine text not null,
    duration text not null,
    type_searched text not null,
    patron_email text not null,
    forma_needed text not null
);
drop table if exists postulations;
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