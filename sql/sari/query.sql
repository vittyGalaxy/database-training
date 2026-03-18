-- Active: 1768521664416@@127.0.0.1@3306@esercizi
-- 1. Visualizzare tutti le righe e tutti i campi della tabella clienti
select Clienti.nome, Clienti.cognome, Clienti.telefono, Clienti.email, Clienti.idnazionalita
from Clienti
join nazioni on Clienti.idnazionalita = nazioni.idnazione

-- 2. Visualizzare le sale mostrando il tipo e la descrizione in ordine alfabetico per nome
select TipiSale.nome, TipiSale.descrizione
from Sale
join TipiSale on Sale.idtipo = TipiSale.idtipo
order by TipiSale.nome

-- 3. Visualizzare le sale convegno e quelle ristorante
select Sale.idsala, Sale.nome, TipiSale.nome
from Sale
join TipiSale on Sale.idtipo = TipiSale.idtipo
where TipiSale.nome = "sala convegno"