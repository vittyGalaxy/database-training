-- Active: 1768521664416@@127.0.0.1@3306@esercizi
INSERT INTO dipendenti (nome, cogn, stipendio, numfigli, hobby, comunenascita) VALUES
('Mario',   'Rossi',   1200.00, 2,  'golf, musica classica',              'Roma'),
('Giulia',  'Bianchi',  980.00, 0,  'pallacanestro, cinema',              'Torino'),
('Luca',    'Verdi',   1500.00, 1,  'musica classica, lettura',           'Bari'),
('Sara',    'Neri',     450.00, 4,  'golf, pallacanestro',                'Napoli'),
('Paolo',   'Gialli',   500.00, 5,  'corsa, musica classica',             'Roma'),
('Chiara',  'Blu',     2000.00, NULL,'teatro, cucina',                    'Milano'),
('Alberto', 'Viola',    700.00, NULL,'glof, trekking',                    'Torino'), -- ERRORE: "glof" invece di "golf"
('Elena',   'Rosa',     400.00, 6,  'pallacanestro, musica classica',     'Roma'),
('Davide',  'Nero',     999.99, 7,  'golf, fotografia',                   'Bari'),
('Anna',    'Marrone', 1100.00, 2,  'pallacanestro, musica pop',          'Firenze'),
('Franco',  'Costa',    480.00, 0,  'musica classica, scacchi',           'Napoli'),
('Irene',   'Fontana', 1300.00, 3,  'golf, pallacanestro, musica classica','Torino');
