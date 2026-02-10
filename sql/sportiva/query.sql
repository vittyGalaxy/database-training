-- 1. visualizzare l'elenco degli iscritti a ogni corso (mostrare corso e comune di nascita)
select iscritti.nome, iscritti.cognome, corsi.nomecorso, comuni.nomecomune
from corsi, iscritti, comuni
where   iscritti.idcorso = corsi.idcorso AND
        iscritti.idcomunenascita = comuni.idcomune

-- 1. visualizzare l'elenco degli iscritti a ogni corso (mostrare corso e comune di nascita)
select iscritti.nome, iscritti.cognome, corsi.nomecorso, comuni.nomecomune
from    corsi INNER JOIN iscritti ON iscritti.idcorso = corsi.idcorso
        inner join comuni on iscritti.idcomunenascita = comuni.idcomune

-- 2. visualizzare l'elenco degli iscritti al corso di “Yoga” ordinati in ordine alfabetico inverso
select DISTINCT iscritti.nome, iscritti.idiscritto, lezioni.descrizione
from iscritti, lezioni
where   iscritti.idcorso = lezioni.idcorso AND
        lezioni.descrizione LIKE "Yoga%"
ORDER BY iscritti.nome DESC;

-- 3. visualizzare l'elenco degli iscritti al corso di “Scherma” nati a Torino oppure a Milano
select iscritti.idiscritto, iscritti.nome, iscritti.cognome, comuni.nomecomune, corsi.nomecorso
from iscritti, comuni, corsi
where   iscritti.idcomunenascita = comuni.idcomune AND
        iscritti.idcorso = corsi.idcorso AND
        corsi.nomecorso LIKE "Scherma" AND
        ((comuni.nomecomune = "Torino") OR (comuni.nomecomune = "Milano"))