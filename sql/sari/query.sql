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

-- 7. Visualizzare tutte le prenotazioni di un dato cliente
SELECT Clienti.nome, Clienti.cognome, PrEventi.dataarrivo, PrEventi.oraprevista, PrEventi.numpartecipanti, PrEventi.prezzofinale, TipiEventi.tipo AS tipo_evento, Sale.nome AS sala
FROM Clienti
JOIN PrEventi ON Clienti.idcliente = PrEventi.idcliente
JOIN TipiEventi ON PrEventi.idtipo = TipiEventi.idtipo
JOIN Sale ON PrEventi.idsala = Sale.idsala

-- 8. Visualizzare le sale con “vista sul mare”
select Sale.idsala, Sale.nome, Sale.descrizione, TipiSale.nome
from Sale
join TipiSale on Sale.idtipo = TipiSale.idtipo
where Sale.descrizione like "%vista sul mare%"

-- 9. Visualizzare le sale meeting con “veranda” e “vista sul mare”
select Sale.nome, TipiSale.nome, Sale.descrizione
from Sale
join TipiSale on Sale.idtipo = TipiSale.idtipo
where   (Sale.descrizione like "%veranda%" or
        Sale.descrizione like "%vista sul mare%") and
        TipiSale.nome = "meeting"

-- 10. Visualizzare le sale che sono state prenotate per congressi di almeno 300 partecipanti
select PrEventi.idprevento, PrEventi.numpartecipanti, Sale.nome
from PrEventi
join Sale on PrEventi.idsala = Sale.idsala
where PrEventi.numpartecipanti >= 300

-- 11. Visualizzare i clienti il cui numero di telefono sia esattamente di 9 cifre e le ultime due cifre zero e nove
select Clienti.nome, Clienti.cognome, Clienti.telefono
from Clienti
where Clienti.telefono like "_______09"

-- 12. Visualizzare i clienti che arrivano oggi dalle ore 15 in poi; ordinare dalla Z alla A
select Clienti.nome, Clienti.cognome, PrEventi.oraprevista
from PrEventi
join Clienti on PrEventi.idcliente = Clienti.idcliente
where PrEventi.oraprevista >= "15:00:00"

-- 13. Visualizzare quante sale ci sono nel mio “SaRi”
select count(Sale.idsala) as numero_sale
from Sale

-- 14. Visualizzare il prezzo medio delle sale ristorante
select TipiSale.nome, avg(Sale.prezzo) as media_prezzo_sale
from Sale
join TipiSale on Sale.idtipo = TipiSale.idtipo
group by TipiSale.nome
having TipiSale.nome = "ristorante"

-- 15. Visualizzare quanti clienti hanno scelto l’auditorium
select TipiSale.nome, count(Clienti.idcliente) as clienti_in_auditorium
from PrEventi
join TipiSale on PrEventi.idtipo = TipiSale.idtipo
join Clienti on PrEventi.idcliente = Clienti.idcliente
group by TipiSale.nome
having TipiSale.nome = "auditorium"

-- 16. Visualizzare quanto guadagnerei al giorno se tutte le sale fossero occupate facendo pagare a prezzo pieno (quello previsto)
SELECT Sale.nome, TipiSale.nome AS tipo_sala, Sale.nposti, Sale.prezzo
FROM Sale
JOIN TipiSale ON Sale.idtipo = TipiSale.idtipo;

-- 17. Visualizzare quanto guadagno oggi visto che tutte le sale sono realmente occupate
select sum(Sale.prezzo) as guadagno_oggi
from PrEventi
join Sale on PrEventi.idsala = Sale.idsala

-- 18. Visualizzare quante sale ho per ogni tipo
select TipiSale.nome, count(Sale.idsala)
from Sale
join TipiSale on Sale.idtipo = TipiSale.idtipo
group by TipiSale.nome

-- 19. Visualizzare quante prenotazioni sono state finora effettuate per ogni tipo di sala
select TipiSale.nome, count(PrEventi.idprevento)
from PrEventi
join TipiSale on PrEventi.idtipo = TipiSale.idtipo
group by TipiSale.nome

-- 20. Visualizzare quante prenotazioni sono state finora effettuate per ogni tipo di evento
select TipiEventi.tipo, count(PrEventi.idprevento)
from PrEventi
join TipiEventi on PrEventi.idtipo = TipiEventi.idtipo
group by TipiEventi.tipo

-- 21. Visualizzare il prezzo medio per tipo di sala
select TipiSale.nome, avg(Sale.prezzo)
from Sale
join TipiSale on Sale.idtipo = TipiSale.idtipo
group by TipiSale.nome

-- 22. Visualizzare quanti clienti hanno prenotato per ogni Nazione a esclusione degli Italiani
select Nazioni.nazione, count(Clienti.idcliente)
from Clienti
join Nazioni on Clienti.idnazionalita = Nazioni.idnazione
group by Nazioni.nazione

-- 23. Visualizzare quanti clienti hanno prenotato per ogni Nazione tranne per quelle nazioni in cui ho avuto meno di 100 clienti
select Nazioni.nazione, count(distinct Clienti.idcliente) as num_clienti
from Clienti
join PrEventi on PrEventi.idcliente = Clienti.idcliente
join Nazioni on Clienti.idnazionalita = Nazioni.idnazione
group by Nazioni.nazione
having count(distinct Clienti.idcliente) >= 100

-- 24. Per la sala “Viola” prenotata oggi per la prima volta ho applicato un prezzo di 10 euro in promozione; visualizzare quanto ho perso rispetto al prezzo previsto.
select sum(Sale.prezzo - PrEventi.prezzofinale) as perdita_totale
from PrEventi
join Sale on PrEventi.idsala = Sale.idsala
where Sale.nome = 'Viola'