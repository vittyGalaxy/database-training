-- 1. visualizzare l'elenco dei film
select *
from dipendenti

-- 2. visualizzare i dipendenti nati a Roma e quelli nati a Torino
select *
from dipendenti
where comunenascita = "Roma" or comunenascita = "Torino"

-- 3. visualizzare i dipendenti che hanno dai 4 ai 7 figli in ordine alfabetico
select *
from dipendenti
where numfigli >= 4 and numfigli <= 7

-- 4. visualizzare i dipendenti con stipendio di almeno 1000 euro e meno di 3 figli in ordine di stipendio dallo stipendio più alto al più basso
select *
from dipendenti
where stipendio >= 1000 and numfigli < 3
order by stipendio desc

-- 5. visualizzare i dipendenti nati a Roma, Bari, Napoli
select *
from dipendenti
where comunenascita = "Roma" or comunenascita = "Bari" or comunenascita = "Napoli"

-- 6. visualizzare la media degli stipendi dei dipendenti
select AVG(stipendio) as media_stipendi
from dipendenti

-- 7. visualizzare lo stipendio minimo e lo stipendio massimo
select min(stipendio) as minimo,
       max(stipendio) as massimo
from dipendenti

-- 8. visualizzare il dipendente che ha lo stipendio minore
select *
from dipendenti
where stipendio = (select min(stipendio) from dipendenti)

-- 9. quanti dipendenti non hanno figli?
select *
from dipendenti
where numfigli = 0

-- 10. in quanti dipendenti non ho inserito il numero di figli?
select count(*) as senza_figli
from dipendenti
where numfigli is null

-- 11. chi sono i dipendenti in cui non ho inserito il numero di figli?
select iddip, nome, cogn
from dipendenti
where numfigli is null

-- 12. quali dipendenti hanno il golf tra i propri hobby?
select *
from dipendenti
where hobby like "%golf%"

-- 13. quali dipendenti hanno il golf e la pallacanestro tra i propri hobby?
select *
from dipendenti
where hobby like "%golf%" and
      hobby like "%pallacanestro%"

-- 14. quanti dipendenti ascoltano musica classica?
select count(*) as ascoltano_musica_classica
from dipendenti
where hobby like "%musica classica%"