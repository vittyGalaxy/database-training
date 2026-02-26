-- Active: 1768521664416@@127.0.0.1@3306@esercizi
-- 1. visualizzare l'elenco di tutti gli orologi (mostrare tipo e produttore)
select orologi.idorologio, orologi.nome, orologi.valore, orologi.descrizione, produttori.nomeproduttore, tipi.tipo
from orologi
join produttori on orologi.idproduttore = produttori.idproduttore
join tipi on orologi.idtipo = tipi.idtipo