-- 1) Visualizzare i dipendenti
SELECT *
FROM dipendenti;

-- 2) Dipendenti nati a Roma e quelli nati a Torino
SELECT *
FROM dipendenti
WHERE comunenascita = "Roma" OR comunenascita = "Torino"

-- 3) Dipendenti che hanno dai 4 ai 7 figli in ordine alfabetico
SELECT *
FROM dipendenti
WHERE numfigli BETWEEN 4 AND 7
ORDER BY cogn ASC, nome ASC;

-- 4) Stipendio almeno 1000 e meno di 3 figli, ordinati per stipendio decrescente
SELECT *
FROM dipendenti
WHERE stipendio >= 1000
  AND numfigli < 3
ORDER BY stipendio DESC;

-- 5) Dipendenti nati a Roma, Bari, Napoli
SELECT *
FROM dipendenti
WHERE comunenascita IN ('Roma', 'Bari', 'Napoli');

-- 6) Media degli stipendi
SELECT AVG(stipendio) AS media_stipendi
FROM dipendenti;

-- 7) Stipendio minimo e massimo
SELECT
  MIN(stipendio) AS stipendio_min,
  MAX(stipendio) AS stipendio_max
FROM dipendenti;

-- 8) Dipendente con lo stipendio minore
SELECT *
FROM dipendenti
WHERE stipendio = (SELECT MIN(stipendio) FROM dipendenti);

-- 9) Quanti dipendenti non hanno figli? (numfigli = 0)
SELECT COUNT(*) AS senza_figli
FROM dipendenti
WHERE numfigli = 0;

-- 10) In quanti dipendenti non ho inserito il numero di figli? (numfigli NULL)
SELECT COUNT(*) AS numfigli_non_inserito
FROM dipendenti
WHERE numfigli IS NULL;

-- 11) Chi sono i dipendenti in cui non ho inserito il numero di figli?
SELECT iddip, nome, cogn
FROM dipendenti
WHERE numfigli IS NULL;

-- 12) Quali dipendenti hanno il golf tra i propri hobby?
SELECT *
FROM dipendenti
WHERE hobby LIKE '%golf%';

-- 13) Quali dipendenti hanno golf e pallacanestro tra i propri hobby?
SELECT *
FROM dipendenti
WHERE hobby LIKE '%golf%'
  AND hobby LIKE '%pallacanestro%';

-- 14) Quanti dipendenti ascoltano musica classica?
SELECT COUNT(*) AS ascoltano_classica
FROM dipendenti
WHERE hobby LIKE '%musica classica%';

-- 15) Trovare il dipendente in cui ho inserito per errore “pallacanestro” sbagliando probabilmente l’ultima lettera
SELECT *
FROM dipendenti
WHERE hobby REGEXP 'pallacanestr.$';

-- 16) Dipendenti con al massimo 500€ e almeno 4 figli: mostra stipendio iniziale e stipendio aumentato di 350€
SELECT
  iddip,
  nome,
  cogn,
  stipendio AS stipendio_iniziale,
  stipendio + 350 AS stipendio_con_bonus,
  numfigli
FROM dipendenti
WHERE stipendio <= 500
  AND numfigli >= 4;
