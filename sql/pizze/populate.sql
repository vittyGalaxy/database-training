INSERT INTO pizzerie (nome, indirizzo, idcomune, idproprietario, idtipo) VALUES
('CIROMA', 'Via Garibaldi 10', (SELECT idcomune FROM comuni WHERE nomecomune='Reggio Calabria'),
 (SELECT idproprietario FROM proprietari WHERE nome='Ciro' AND cognome='Ferrara'),
 (SELECT idtipo FROM tipi WHERE tipo='napoletana'));

-- Pummarò a Crotone (per Y)
INSERT INTO pizzerie (nome, indirizzo, idcomune, idproprietario, idtipo) VALUES
('Pummarò', 'Via Marina 5', (SELECT idcomune FROM comuni WHERE nomecomune='Crotone'),
 (SELECT idproprietario FROM proprietari WHERE nome='Marco' AND cognome='Rossi'),
 (SELECT idtipo FROM tipi WHERE tipo='ristorante'));

-- Una pizzeria a Napoli dove lavora "Ciro Esposito" (per J)
INSERT INTO pizzerie (nome, indirizzo, idcomune, idproprietario, idtipo) VALUES
('Vesuvio', 'Via Toledo 99', (SELECT idcomune FROM comuni WHERE nomecomune='Napoli'),
 (SELECT idproprietario FROM proprietari WHERE nome='Giulia' AND cognome='Neri'),
 (SELECT idtipo FROM tipi WHERE tipo='napoletana'));

-- Pizzerie a Firenze (per N) + una in comune "Ala" (per M)
INSERT INTO pizzerie (nome, indirizzo, idcomune, idproprietario, idtipo) VALUES
('Giglio', 'Via Calzaiuoli 1', (SELECT idcomune FROM comuni WHERE nomecomune='Firenze'),
 (SELECT idproprietario FROM proprietari WHERE nome='Paolo' AND cognome='Verdi'),
 (SELECT idtipo FROM tipi WHERE tipo='ristorante')),
('Tris', 'Via Dante 3', (SELECT idcomune FROM comuni WHERE nomecomune='Firenze'),
 (SELECT idproprietario FROM proprietari WHERE nome='Sara' AND cognome='Esposito'),
 (SELECT idtipo FROM tipi WHERE tipo='asporto')),
('Ala Pizza', 'Via Roma 2', (SELECT idcomune FROM comuni WHERE nomecomune='Ala'),
 (SELECT idproprietario FROM proprietari WHERE nome='Luca' AND cognome='Bianchi'),
 (SELECT idtipo FROM tipi WHERE tipo='asporto'));

-- Pizzerie a Milano e Torino (per Q)
INSERT INTO pizzerie (nome, indirizzo, idcomune, idproprietario, idtipo) VALUES
('Duomo Slice', 'Corso Vittorio 7', (SELECT idcomune FROM comuni WHERE nomecomune='Milano'),
 (SELECT idproprietario FROM proprietari WHERE nome='Luca' AND cognome='Bianchi'),
 (SELECT idtipo FROM tipi WHERE tipo='asporto')),
('Mole Pizza', 'Via Po 12', (SELECT idcomune FROM comuni WHERE nomecomune='Torino'),
 (SELECT idproprietario FROM proprietari WHERE nome='Sara' AND cognome='Esposito'),
 (SELECT idtipo FROM tipi WHERE tipo='ristorante'));

-- Pizzerie "pizzagelato" (per G)
INSERT INTO pizzerie (nome, indirizzo, idcomune, idproprietario, idtipo) VALUES
('Gelapizza Roma', 'Via Appia 200', (SELECT idcomune FROM comuni WHERE nomecomune='Roma'),
 (SELECT idproprietario FROM proprietari WHERE nome='Marco' AND cognome='Rossi'),
 (SELECT idtipo FROM tipi WHERE tipo='pizzagelato')),
('Gelapizza Milano', 'Via Torino 30', (SELECT idcomune FROM comuni WHERE nomecomune='Milano'),
 (SELECT idproprietario FROM proprietari WHERE nome='Paolo' AND cognome='Verdi'),
 (SELECT idtipo FROM tipi WHERE tipo='pizzagelato'));

-- Pizzeria a Faenza (utile per query con Faenza)
INSERT INTO pizzerie (nome, indirizzo, idcomune, idproprietario, idtipo) VALUES
('Faenza Centro', 'Piazza del Popolo 1', (SELECT idcomune FROM comuni WHERE nomecomune='Faenza'),
 (SELECT idproprietario FROM proprietari WHERE nome='Ciro' AND cognome='Ferrara'),
 (SELECT idtipo FROM tipi WHERE tipo='ristorante'));

-- Pizzeria a Roma ma proprietario nato fuori Roma (utile per E)
INSERT INTO pizzerie (nome, indirizzo, idcomune, idproprietario, idtipo) VALUES
('Roma Nord', 'Via Nomentana 55', (SELECT idcomune FROM comuni WHERE nomecomune='Roma'),
 (SELECT idproprietario FROM proprietari WHERE nome='Paolo' AND cognome='Verdi'), -- nato a Pisa
 (SELECT idtipo FROM tipi WHERE tipo='asporto'));

-- =========================
-- BULK: 55 pizzerie d'ASPORTO a CATANIA (per F, U, V)
-- =========================
WITH RECURSIVE seq AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n+1 FROM seq WHERE n < 55
)
INSERT INTO pizzerie (nome, indirizzo, idcomune, idproprietario, idtipo)
SELECT
  CONCAT('Catania Asporto ', n),
  CONCAT('Via Etnea ', 100 + n),
  (SELECT idcomune FROM comuni WHERE nomecomune='Catania'),
  (SELECT idproprietario FROM proprietari WHERE nome='Marco' AND cognome='Rossi'),
  (SELECT idtipo FROM tipi WHERE tipo='asporto')
FROM seq;

-- =========================
-- PIZZAIOLI (1..N per pizzeria)
-- =========================

-- CIROMA (Reggio Calabria): 3 pizzaioli, incluse iniziali P..Z (per S)
INSERT INTO pizzaioli (nome, cognome, idpizzeria) VALUES
('Pietro', 'Longo',  (SELECT idpizzeria FROM pizzerie WHERE nome='CIROMA')),
('Quinto', 'Riva',   (SELECT idpizzeria FROM pizzerie WHERE nome='CIROMA')),
('Zeno',   'Marini', (SELECT idpizzeria FROM pizzerie WHERE nome='CIROMA'));

-- Pummarò (Crotone): 2 pizzaioli
INSERT INTO pizzaioli (nome, cognome, idpizzeria) VALUES
('Antonio', 'Greco', (SELECT idpizzeria FROM pizzerie WHERE nome='Pummarò')),
('Nino',    'Costa', (SELECT idpizzeria FROM pizzerie WHERE nome='Pummarò'));

-- Vesuvio (Napoli): include "Ciro Esposito" (per J)
INSERT INTO pizzaioli (nome, cognome, idpizzeria) VALUES
('Ciro',  'Esposito', (SELECT idpizzeria FROM pizzerie WHERE nome='Vesuvio')),
('Luigi', 'Esposito', (SELECT idpizzeria FROM pizzerie WHERE nome='Vesuvio'));

-- Milano/Torino (per Q)
INSERT INTO pizzaioli (nome, cognome, idpizzeria) VALUES
('Paolo', 'Rizzi', (SELECT idpizzeria FROM pizzerie WHERE nome='Duomo Slice')),
('Marta', 'Rizzi', (SELECT idpizzeria FROM pizzerie WHERE nome='Duomo Slice')),
('Giorgio', 'Serra', (SELECT idpizzeria FROM pizzerie WHERE nome='Mole Pizza'));

-- =========================
-- PIZZE (menu per pizzeria)
-- =========================

-- CIROMA: costi vari + "Giro Pizza" a 10 euro (per Z) + max globale (per T)
INSERT INTO pizze (nomepizza, ingredienti, costo, idpizzeria) VALUES
('Margherita',     'pomodoro, mozzarella, basilico',  7.50, (SELECT idpizzeria FROM pizzerie WHERE nome='CIROMA')),
('Capricciosa',    'pomodoro, mozzarella, prosciutto, funghi, carciofi, olive',  11.00, (SELECT idpizzeria FROM pizzerie WHERE nome='CIROMA')),
('Diavola',        'pomodoro, mozzarella, salame piccante',  9.50, (SELECT idpizzeria FROM pizzerie WHERE nome='CIROMA')),
('Giro Pizza',     'formula all you can eat',         10.00, (SELECT idpizzeria FROM pizzerie WHERE nome='CIROMA')),
('Oro',            'tartufo, bufala, prosciutto crudo', 25.00, (SELECT idpizzeria FROM pizzerie WHERE nome='CIROMA')); -- MAX globale

-- Pummarò (Crotone): "Capricciosa" (per Y)
INSERT INTO pizze (nomepizza, ingredienti, costo, idpizzeria) VALUES
('Capricciosa', 'pomodoro, mozzarella, prosciutto, funghi, carciofi, olive', 8.00,
 (SELECT idpizzeria FROM pizzerie WHERE nome='Pummarò')),
('Margherita',  'pomodoro, mozzarella, basilico', 6.50,
 (SELECT idpizzeria FROM pizzerie WHERE nome='Pummarò'));

-- Vesuvio (Napoli): "Napoletana" per pizzaiolo Ciro Esposito (per J)
INSERT INTO pizze (nomepizza, ingredienti, costo, idpizzeria) VALUES
('Napoletana', 'pomodoro San Marzano, mozzarella di bufala, basilico, olio EVO', 9.00,
 (SELECT idpizzeria FROM pizzerie WHERE nome='Vesuvio')),
('Marinara',   'pomodoro, origano, aglio, olio EVO', 7.00,
 (SELECT idpizzeria FROM pizzerie WHERE nome='Vesuvio'));

-- Pizzeria di Ciro Ferrara: pizze 10..12 (per H)
-- (qui uso "Faenza Centro" che è di Ciro Ferrara)
INSERT INTO pizze (nomepizza, ingredienti, costo, idpizzeria) VALUES
('Boscaiola', 'mozzarella, salsiccia, funghi', 10.50, (SELECT idpizzeria FROM pizzerie WHERE nome='Faenza Centro')),
('4 Formaggi', 'mozzarella, gorgonzola, fontina, parmigiano', 11.50, (SELECT idpizzeria FROM pizzerie WHERE nome='Faenza Centro')),
('Bufalina', 'pomodoro, bufala, basilico', 12.00, (SELECT idpizzeria FROM pizzerie WHERE nome='Faenza Centro'));

-- Pizza dolce con nutella e pistacchio (per K) - la metto su Gelapizza Roma
INSERT INTO pizze (nomepizza, ingredienti, costo, idpizzeria) VALUES
('Nutella e Pistacchio', 'nutella, pistacchio, granella di nocciole', 8.50,
 (SELECT idpizzeria FROM pizzerie WHERE nome='Gelapizza Roma'));

-- Altre pizze per test fasce prezzo (per I: non tra 5 e 10)
INSERT INTO pizze (nomepizza, ingredienti, costo, idpizzeria) VALUES
('Margherita', 'pomodoro, mozzarella, basilico', 4.50, (SELECT idpizzeria FROM pizzerie WHERE nome='Duomo Slice')), -- <5
('Tonno e Cipolla', 'pomodoro, mozzarella, tonno, cipolla', 10.50, (SELECT idpizzeria FROM pizzerie WHERE nome='Duomo Slice')), -- >10
('Vegetariana', 'pomodoro, mozzarella, verdure grigliate', 9.50, (SELECT idpizzeria FROM pizzerie WHERE nome='Mole Pizza'));

-- Menu molto piccolo per W (pizzeria con poche pizze)
INSERT INTO pizze (nomepizza, ingredienti, costo, idpizzeria) VALUES
('Margherita', 'pomodoro, mozzarella, basilico', 6.00, (SELECT idpizzeria FROM pizzerie WHERE nome='Ala Pizza'));