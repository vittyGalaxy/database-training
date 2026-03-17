-- Active: 1768521664416@@127.0.0.1@3306@esercizi
-- 1. Visualizzare tutti le righe e tutti i campi della tabella clienti
select Clienti.nome, Clienti.cognome, Clienti.telefono, Clienti.email, Clienti.idnazionalita
from Clienti
join nazioni on Clienti.idnazionalita = nazioni.idnazione