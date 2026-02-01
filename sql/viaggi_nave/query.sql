-- Active: 1768521664416@@127.0.0.1@3306@esercizi
-- 1. visualizzare tutti i viaggi
select *
from viaggiinnave

-- 2. quanti viaggi hanno più di 500 passeggeri
select *
from viaggiinnave
where numpasseggerireali > 500

-- 3. quali viaggi arrivano a Civitavecchia
select *
from viaggiinnave
where portoarrivo = "Civitavecchia"

-- 4. quali viaggio comprendono una sosta a Barcellona
select *
from viaggiinnave
where descrizione = "%Barcellona%"

-- 5. quali viaggio comprendono una sosta a Barcellona e una a Marsiglia
select *
from viaggiinnave
where descrizione = "%Barcellona%" AND
      descrizione = "%Marsiglia%"

-- 6. quali viaggi sono previsti nel Mar Atlantico
select *
from viaggiinnave
where descrizione = "%Mar Atlantico%"

-- 7. quanti porti sono coinvolti in partenza, e quanti in arrivo
select COUNT(DISTINCT portopartenza) as num_partenze,
       COUNT(DISTINCT portoarrivo) as num_arrivi
from viaggiinnave