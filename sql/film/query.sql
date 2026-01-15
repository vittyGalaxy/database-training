-- 1) Visualizzare l'elenco dei film
SELECT *
FROM film;

-- 2) Visualizzare l'elenco dei film del 1998
SELECT *
FROM film
WHERE annoproduzione = 1998;

-- 3) Film prodotti dopo il 2007 ordinati per costo
SELECT *
FROM film
WHERE annoproduzione > 2007
ORDER BY costo ASC;

-- 4) Film prodotti dal 2000 in poi ma fino al 2010 escluso
SELECT *
FROM film
WHERE annoproduzione >= 2000
  AND annoproduzione < 2010;

-- 5) Tutti i film tranne quelli prodotti tra il 2000 e il 2005
SELECT *
FROM film
WHERE annoproduzione NOT BETWEEN 2000 AND 2005;

-- 6) Film prodotti dopo il 2007 costati meno di 10000 euro
SELECT *
FROM film
WHERE annoproduzione > 2007
  AND costo < 10000;

-- 7) Film del regista 'Gabriele Muccino'
SELECT *
FROM film
WHERE nomeregista = 'Gabriele'
  AND cognomeregista = 'Muccino';

-- 8) Tutti i film italiani di registi che si chiamano Alessandro
SELECT *
FROM film
WHERE nazione = 'Italia'
  AND nomeregista = 'Alessandro';

-- 9) Tutti i film italiani e francesi
SELECT *
FROM film
WHERE nazione IN ('Italia', 'Francia');

-- 10) Tutti i film del 2007 ordinati per nazione in maniera decrescente
SELECT *
FROM film
WHERE annoproduzione = 2007
ORDER BY nazione DESC;

-- 11) “Lassù qualcuno è impazzito” sovvenzionato al 25%: costo iniziale, cifra sovvenzionata, prezzo pagato dai produttori
SELECT
  titolo,
  costo AS costo_iniziale,
  costo * 0.25 AS cifra_sovvenzionata,
  costo * 0.75 AS prezzo_produttori
FROM film
WHERE titolo = "Lassù qualcuno è impazzito";

-- 12) “Lassù qualcuno mi ama” è costato il triplo di “L'onorata società”: visualizzare i due costi
SELECT
  f1.titolo AS film_1,
  f1.costo  AS costo_film_1,
  f2.titolo AS film_2,
  f2.costo  AS costo_film_2
FROM film f1
JOIN film f2
  ON f1.titolo = "Lassù qualcuno mi ama"
 AND f2.titolo = "L'onorata società"
WHERE f1.costo = f2.costo * 3;
