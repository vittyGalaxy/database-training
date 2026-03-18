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

-- 4. Visualizzare le sale ristorante che costano massimo 145 euro ad evento
select Sale.idsala, Sale.nome, TipiSale.nome, Sale.prezzo
from Sale
join TipiSale on Sale.idtipo = TipiSale.idtipo
where TipiSale.nome = "ristorante" and Sale.prezzo <= 145

-- 5. Visualizzare i clienti a cui ho concesso sale ristorante a un prezzo compreso tra 120 e 150 euro
select Clienti.idcliente, Clienti.nome, Clienti.cognome, TipiSale.nome, PrEventi.prezzofinale
from PrEventi
join Clienti on PrEventi.idcliente = Clienti.idcliente
join TipiSale on PrEventi.idtipo = TipiSale.idtipo
where   TipiSale.nome = "ristorante" and 
        ((PrEventi.prezzofinale >= 120) and PrEventi.prezzofinale <= 150)

-- 6. Visualizzare le prenotazioni mostrando il cliente, la sala e il tipo di evento
select PrEventi.idprevento, Clienti.nome, Clienti.cognome, Sale.nome, TipiEventi.tipo
from PrEventi
join Clienti on PrEventi.idcliente = Clienti.idcliente
join TipiEventi on PrEventi.idtipo = TipiEventi.idtipo
join Sale on PrEventi.idsala = Sale.idsala

-- 8. Visualizzare le sale con “vista sul mare”
select Sale.idsala, Sale.nome, Sale.descrizione, TipiSale.nome
from Sale
join TipiSale on Sale.idtipo = TipiSale.idtipo
where Sale.descrizione like "%vista sul mare%"