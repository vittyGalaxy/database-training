-- 1) Visualizzare i dipendenti
SELECT *
FROM dipendenti;

-- 2) Dipendenti nati a Roma e quelli nati a Torino
SELECT *
FROM dipendenti
WHERE comunenascita IN ('Roma', 'Torino');

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

