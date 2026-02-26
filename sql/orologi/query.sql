-- Active: 1768521664416@@127.0.0.1@3306@esercizi
-- 1. visualizzare l'elenco di tutti gli orologi (mostrare tipo e produttore)
select orologi.idorologio, orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, produttori.nomeproduttore, tipi.tipo
from orologi
join produttori on orologi.idproduttore = produttori.idproduttore
join tipi on orologi.idtipo = tipi.idtipo

-- 2. visualizzare l'elenco di tutti gli orologi della Breil
select orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, tipi.tipo
from orologi
join tipi on orologi.idtipo = tipi.idtipo
where orologi.nome like "Breil%"

-- 3. visualizzare l'elenco di tutti gli orologi della Breil il cui valore supera i 350 euro
select orologi.idorologio, orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, tipi.tipo
from orologi
join tipi on orologi.idtipo = tipi.idtipo
where   orologi.nome like "Breil%" and
        orologi.valore > 350

-- 4. visualizzare l'elenco di tutti gli orologi il cui valore va tra i 200 e i 400 euro
select orologi.idorologio, orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, tipi.tipo
from orologi
join produttori on orologi.idproduttore = produttori.idproduttore
join tipi on orologi.idtipo = tipi.idtipo
where   orologi.valore >= 200 and
        orologi.valore <= 400

-- 5. visualizzare l'elenco di tutti gli orologi atomici e automatici
select orologi.idorologio, orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, tipi.tipo
from orologi
join produttori on orologi.idproduttore = produttori.idproduttore
join tipi on orologi.idtipo = tipi.idtipo
where   orologi.descrizione like "%atomici%" or
        orologi.descrizione like "%automatici%"

-- 6. visualizzare gli orologi italiani e francesi
select orologi.idorologio, orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, tipi.tipo, nazioni.nome
from orologi
join produttori on orologi.idproduttore = produttori.idproduttore
join tipi on orologi.idtipo = tipi.idtipo
join nazioni on produttori.idnazione = nazioni.idnazione
where   nazioni.nome = "Italia" or
        nazioni.nome = "Francia"
