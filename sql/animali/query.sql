-- Active: 1768521664416@@127.0.0.1@3306@esercizi
-- 1. Elenco degli animali
select *
from animali

-- 2. Animali dell’habitat: deserto
select idanimale, nome, specie, habitat
from animali
where habitat = "deserto"

-- 3. Animali dell’habitat: deserto e tropicale
select idanimale, nome, specie, habitat
from animali
where (habitat = "deserto") OR
      (habitat = "tropicale")

-- 4. Animali nello zoo da più di 10 anni
select idanimale, nome, specie, anniInzoo
from animali
where anniInzoo > 10

-- 5. Animali nello zoo da più di 10 anni ma meno di 15
select idanimale, nome, specie, anniInzoo
from animali
where (anniInzoo > 10) AND
      (anniInzoo < 15)

-- 6. Tutti gli animali con colore bianco
select idanimale, nome, specie, colore
from animali
where colore = "bianco"

-- 7. Tutti gli animali con colore bianco e verde
select idanimale, nome, specie, colore
from animali
where colore = "bianco" AND
      colore = "verde"

-- 8. Bianco e verde ma non viola
select idanimale, nome, specie, colore
from animali
where colore = "bianco" AND
      colore = "verde" AND
      colore != "viola"

-- 9. Animali il cui nome inizia per R e contiene la stringa "dol"
select idanimale, nome, specie
from animali
where nome LIKE "R%dol%"

-- 10. Quanti sono gli armadilli
select count(specie) as num_armadilli
from animali

-- 11. Media degli anni in zoo
select AVG(anniInzoo) as media_anni
from animali

-- 12. Prezzo totale delle zone (problema e soluzioni)
select SUM(prezzozona) as prezzo_totale
from animali