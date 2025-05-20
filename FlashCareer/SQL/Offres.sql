drop table if EXISTS offres;
--dd--
create table offres (
    id integer primary key,
    patron_entreprise text not null,
    domaine text not null,
    duration text not null,
    type_searched text not null,
    patron_email text not null,
    forma_needed text not null,
    detail text not null,
    nom_trav text not null
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
    offre_id integer not null,
    offre_patr_nom text not null
);

insert into offres values (0, 'co', 'coo', 'col', 'cool', 'cl', 'cll', 'cours dappui après 1600', 'étudiant pour cours dappui');
insert into postulations values (1, 'bla', 'bli', 'blublu', 'd@g.c', 'blibl', 1, 'richard');
