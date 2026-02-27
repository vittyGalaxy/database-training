-- Active: 1768521664416@@127.0.0.1@3306@esercizi
-- 1. visualizzare l'elenco di tutti gli orologi (mostrare tipo e produttore)
select orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, produttori.nomeproduttore, tipi.tipo
from orologi
join produttori on orologi.idproduttore = produttori.idproduttore
join tipi on orologi.idtipo = tipi.idtipo

-- 2. visualizzare l'elenco di tutti gli orologi della Breil
select orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, tipi.tipo
from orologi
join tipi on orologi.idtipo = tipi.idtipo
where orologi.nome like "Breil%"

-- 3. visualizzare l'elenco di tutti gli orologi della Breil il cui valore supera i 350 euro
select orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, tipi.tipo
from orologi
join tipi on orologi.idtipo = tipi.idtipo
where   orologi.nome like "Breil%" and
        orologi.valore > 350

-- 4. visualizzare l'elenco di tutti gli orologi il cui valore va tra i 200 e i 400 euro
select orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, tipi.tipo
from orologi
join produttori on orologi.idproduttore = produttori.idproduttore
join tipi on orologi.idtipo = tipi.idtipo
where   orologi.valore >= 200 and
        orologi.valore <= 400

-- 5. visualizzare l'elenco di tutti gli orologi atomici e automatici
select orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, tipi.tipo
from orologi
join produttori on orologi.idproduttore = produttori.idproduttore
join tipi on orologi.idtipo = tipi.idtipo
where   tipi.tipo = "atomico" or
        tipi.tipo = "automatico"

-- 6. visualizzare gli orologi italiani e francesi
select orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, produttori.nomeproduttore, tipi.tipo, nazioni.nome
from orologi
join produttori on orologi.idproduttore = produttori.idproduttore
join tipi on orologi.idtipo = tipi.idtipo
join nazioni on produttori.idnazione = nazioni.idnazione
where   nazioni.nome = "Italia" or
        nazioni.nome = "Francia"

-- 7. visualizzare l'elenco di tutti gli orologi la cui descrizione contiene la parola “ovale”
select orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, produttori.nomeproduttore, tipi.tipo
from orologi
join produttori on orologi.idproduttore = produttori.idproduttore
join tipi on orologi.idtipo = tipi.idtipo
where orologi.descrizione like "%ovale%"

-- 8. visualizzare gli orologi in cui il tipo inizi per la lettera a seguita da uno spazio (es. a pendolo, a cucù)
select orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, produttori.nomeproduttore, tipi.tipo
from orologi
join produttori on orologi.idproduttore = produttori.idproduttore
join tipi on orologi.idtipo = tipi.idtipo
where tipi.tipo like "a %"

-- 9. visualizzare l'elenco di tutti gli orologi il cui produttore abbia come terza lettera esattamente la “s”
select orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, produttori.nomeproduttore, tipi.tipo
from orologi
join produttori on orologi.idproduttore = produttori.idproduttore
join tipi on orologi.idtipo = tipi.idtipo
where produttori.nomeproduttore like "__s%"

-- 10. visualizzare l'elenco degli orologi che non siano “a cucù”
select orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, produttori.nomeproduttore, tipi.tipo
from orologi
join produttori on orologi.idproduttore = produttori.idproduttore
join tipi on orologi.idtipo = tipi.idtipo
where tipi.tipo != "a cucú"

-- 13. dire quanti orologi sono posseduti per ogni tipo
select tipi.idtipo, tipi.tipo, count(idorologio)
from orologi
join tipi on orologi.idtipo = tipi.idtipo
group by tipi.idtipo, tipi.tipo