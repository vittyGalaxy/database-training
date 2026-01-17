-- elenco film completo
SELECT *
FROM film

-- elenco di film del 1998
SELECT *
FROM film
WHERE annoproduzione = 1998

-- elenco di film dal 2007 in poi in ordine di costo
SELECT *
FROM film
WHERE annoproduzione >= 2007
ORDER BY costo ASC

-- elenco di film prodotti dal 2000 fino al 2010 escluso
SELECT *
FROM film
WHERE annoproduzione >= 2000 AND annoproduzione < 2010

-- elenco di film esclusi dal 2000 al 2005
SELECT *
FROM film
WHERE annoproduzione < 2000 OR annoproduzione > 2005

-- elenco di film dopo il 2007 costati meno di 10000 euro
SELECT *
FROM film
WHERE annoproduzione > 2007 and costo < 10000

-- elenco di film del regista "Gabriele Muccino"
SELECT *
FROM film
WHERE nomeregista = "Gabriele" and cognomeregista = "Muccino"

-- elenco di film che come nome autore é "alessandro" e italiano
SELECT *
FROM film
WHERE nomeregista = "alessandro" and nazione = "Italia"

-- elenco di film italiano e francese
SELECT *
FROM film
WHERE nazione = "Italia" OR nazione = "Francia"

-- elenco di film del 2007 ordinati per nazione in maniera decrescente
SELECT *
FROM film
WHERE annoproduzione = 2007
ORDER BY nazione DESC