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
