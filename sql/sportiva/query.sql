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
select DISTINCT iscritti.nome, iscritti.idiscritto, corsi.nomecorso
from iscritti, corsi
where   iscritti.idcorso = corsi.idcorso AND
        corsi.nomecorso = "Yoga"
ORDER BY iscritti.nome DESC;

-- 3. visualizzare l'elenco degli iscritti al corso di “Scherma” nati a Torino oppure a Milano
select iscritti.idiscritto, iscritti.nome, iscritti.cognome, comuni.nomecomune, corsi.nomecorso
from iscritti, comuni, corsi
where   iscritti.idcomunenascita = comuni.idcomune AND
        iscritti.idcorso = corsi.idcorso AND
        corsi.nomecorso LIKE "Scherma" AND
        ((comuni.nomecomune = "Torino") OR (comuni.nomecomune = "Milano"))

-- 4. visualizzare l'elenco degli iscritti al corso di “Yoga” e quelli del corso di “Step”
select iscritti.nome, iscritti.cognome, corsi.nomecorso
from iscritti, corsi
where   iscritti.idcorso = corsi.idcorso AND
        corsi.nomecorso = "Yoga" OR
        corsi.nomecorso = "Step"

-- 5. dire quanti sono gli iscritti nati fuori dal comune di Torino
select iscritti.nome, iscritti.cognome, comuni.nomecomune
from iscritti, comuni
where   iscritti.idcomunenascita = comuni.idcomune AND
        comuni.nomecomune != "Torino"

-- 6. visualizzare l'elenco degli iscritti ai corsi di danza (classica, del ventre o altro)
select iscritti.nome, iscritti.cognome, corsi.nomecorso, corsi.descrizione
from iscritti, corsi
where   iscritti.idcorso = corsi.idcorso AND
        corsi.nomecorso LIKE "Danza%"

-- 7. visualizzare tutti i corsi che costano minimo 50 euro ma meno di 200 euro
select corsi.nomecorso, corsi.descrizione, corsi.prezzocorso
from corsi
where   corsi.prezzocorso >= 50 AND
        corsi.prezzocorso < 200

-- 8. visualizzare tutte le lezioni del corso di Scherma
select corsi.nomecorso, lezioni.descrizione, lezioni.ore
from lezioni, corsi
where   lezioni.idlezione = corsi.idcorso AND
        corsi.nomecorso = "Scherma"