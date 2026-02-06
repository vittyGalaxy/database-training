-- Active: 1768517081752@@127.0.0.1@3306@esercizi
INSERT INTO comuni (idcomune, nomecomune, cap) VALUES
  (1, 'Torino',  '10123'),
  (2, 'Milano',  '20123'),
  (3, 'Roma',    '00183'),
  (4, 'Firenze', '50123'),
  (5, 'Genova',  '16123'),
  (6, 'Napoli',  '80123'),
  (7, 'Cuneo',   '12003');   -- CAP che inizia con 12 e finisce con 3 (punto K)

INSERT INTO istruttori (idistruttore, nome, cognome, idcomune) VALUES
  (1, 'Mario', 'Rossi', 3),   -- Roma (serve per punto I)
  (2, 'Lucia', 'Bianchi', 1), -- Torino
  (3, 'Gianni','Verdi', 2);   -- Milano

/* Corsi “base” (Yoga, Scherma, Step, ecc.) */
INSERT INTO corsi (idcorso, nomecorso, descrizione, prezzocorso, idistruttore) VALUES
  (1, 'Yoga', 'Corso di Yoga base: respirazione e mobilità', 80.00, 1),
  (2, 'Scherma', 'Tecniche di scherma: affondi e parate', 120.00, 2),
  (3, 'Step', 'Step aerobico di gruppo', 60.00, 1),
  (4, 'Step primo livello 13', 'Step del primo livello: sessioni guidate', 150.00, 1),
  (5, 'Danza classica', 'Danza classica: postura e tecnica', 180.00, 3),
  (6, 'Danza del ventre', 'Danza del ventre: tecnica del bacino', 140.00, 3),
  (7, 'Latino americano', 'Latino americano: salsa e bachata', 90.00, 1);

/* Altri corsi per far risultare che un istruttore ha >17 corsi (punto Q) */
INSERT INTO corsi (idcorso, nomecorso, descrizione, prezzocorso, idistruttore) VALUES
  (101, 'Corso Extra 01', 'Allenamento del core', 55.00, 1),
  (102, 'Corso Extra 02', 'Tecnica del movimento', 55.00, 1),
  (103, 'Corso Extra 03', 'Preparazione atletica', 55.00, 1),
  (104, 'Corso Extra 04', 'Mobilità articolare', 55.00, 1),
  (105, 'Corso Extra 05', 'Stretching del mattino', 55.00, 1),
  (106, 'Corso Extra 06', 'Circuit training', 55.00, 1),
  (107, 'Corso Extra 07', 'Cardio base', 55.00, 1),
  (108, 'Corso Extra 08', 'Core stability', 55.00, 1),
  (109, 'Corso Extra 09', 'Postura e schiena', 55.00, 1),
  (110, 'Corso Extra 10', 'Pilates base', 55.00, 1),
  (111, 'Corso Extra 11', 'Pilates intermedio', 55.00, 1),
  (112, 'Corso Extra 12', 'Functional del corpo', 55.00, 1),
  (113, 'Corso Extra 13', 'Total body', 55.00, 1),
  (114, 'Corso Extra 14', 'Interval training', 55.00, 1),
  (115, 'Corso Extra 15', 'Resistenza del fiato', 55.00, 1),
  (116, 'Corso Extra 16', 'Coordinazione', 55.00, 1),
  (117, 'Corso Extra 17', 'Equilibrio', 55.00, 1),
  (118, 'Corso Extra 18', 'Forza del tronco', 55.00, 1);

/* Iscritti: distribuiti su vari corsi e comuni per coprire i punti A..O */
INSERT INTO iscritti (idiscritto, nome, cognome, datanascita, idcomunenascita, idcorso) VALUES
  (1, 'Anna',   'Neri',     '1998-05-10', 1, 1), -- Yoga, Torino
  (2, 'Luca',   'Rossi',    '1995-11-02', 2, 1), -- Yoga, Milano
  (3, 'Paolo',  'Bianchi',  '2001-01-20', 3, 2), -- Scherma, Roma
  (4, 'Sara',   'Verdi',    '1999-07-07', 1, 2), -- Scherma, Torino (C)
  (5, 'Giulia', 'Blu',      '2000-03-15', 2, 2), -- Scherma, Milano (C)
  (6, 'Marco',  'Gialli',   '1997-09-30', 7, 3), -- Step, Cuneo (CAP 12003)
  (7, 'Elena',  'Viola',    '2002-12-01', 4, 5), -- Danza classica
  (8, 'Nadia',  'Rame',     '1996-02-22', 5, 6), -- Danza del ventre
  (9, 'Diego',  'Santos',   '1994-04-04', 6, 7), -- Latino americano
  (10,'Marta',  'Zeta',     '2003-08-18', 3, 4); -- Step primo livello 13

/* Lezioni “a mano” per Scherma + parole speciali (punto H e R) */
INSERT INTO lezioni (idlezione, descrizione, idistruttore, idcorso, ore) VALUES
  (1, 'Scherma: fondamentali e riscaldamento', 2, 2, 1.50),
  (2, 'Scherma: assalti guidati',             2, 2, 2.00),
  (3, 'Lezione roboante e leggiadro per test ricerca', 2, 2, 1.00);

/* 120 lezioni per Yoga (serve per punto N: istruttori con >=120 lezioni)
   MySQL 8+: inserimento massivo con CTE ricorsiva */
WITH RECURSIVE seq AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM seq WHERE n < 120
)
INSERT INTO lezioni (idlezione, descrizione, idistruttore, idcorso, ore)
SELECT
  1000 + n AS idlezione,
  CONCAT('Yoga sessione #', n, ' - mobilità e respiro') AS descrizione,
  1 AS idistruttore,
  1 AS idcorso,
  1.00 AS ore
FROM seq;

/* Alcune lezioni per Step primo livello 13 (per punto T: guadagno su quel corso) */
INSERT INTO lezioni (idlezione, descrizione, idistruttore, idcorso, ore) VALUES
  (2001, 'Step primo livello 13 - tecnica', 1, 4, 1.00),
  (2002, 'Step primo livello 13 - cardio',  1, 4, 1.00);
