INSERT INTO Nazioni (nazione) VALUES
('Italia'),
('Francia'),
('Germania'),
('Spagna'),
('USA');

INSERT INTO TipiSale (nome, descrizione) VALUES
('ristorante',     'Sala per ricevimenti con servizio ristorazione'),
('sala convegno',  'Sala attrezzata per convegni e congressi'),
('meeting',        'Sala per meeting aziendali'),
('auditorium',     'Sala ampia per conferenze e spettacoli');

INSERT INTO TipiEventi (tipo) VALUES
('matrimonio'),
('battesimo'),
('compleanno'),
('congresso'),
('meeting aziendale');

-- =========================
-- SALE (nomi colori)
-- descrizioni studiate per query H/I
-- =========================

INSERT INTO Sale (nome, idtipo, descrizione, mq, nposti, prezzo) VALUES
('Viola',   (SELECT idtipo FROM TipiSale WHERE nome='ristorante'),
            'Ristorante con veranda e vista sul mare', 120, 140, 160.00),
('Magenta', (SELECT idtipo FROM TipiSale WHERE nome='ristorante'),
            'Ristorante intimo (senza veranda) con vista sul mare', 90, 90, 150.00),
('Rossa',   (SELECT idtipo FROM TipiSale WHERE nome='sala convegno'),
            'Sala convegno con impianto audio e proiettore', 300, 600, 500.00),
('Blu',     (SELECT idtipo FROM TipiSale WHERE nome='meeting'),
            'Meeting room con veranda', 80, 60, 130.00),
('Verde',   (SELECT idtipo FROM TipiSale WHERE nome='auditorium'),
            'Auditorium con palco e vista sul mare', 500, 900, 700.00),
('Gialla',  (SELECT idtipo FROM TipiSale WHERE nome='sala convegno'),
            'Sala convegno standard', 250, 400, 420.00);

-- Variabile "oggi" (comoda per query L/Q/X/Y)
SET @oggi = CURDATE();

-- =========================
-- CLIENTI "MANUALI" (per query specifiche: telefono 9 cifre finisce 09, ecc.)
-- =========================

INSERT INTO Clienti (nome, cognome, telefono, email, idnazionalita) VALUES
('Mario',  'Rossi',   '123456709', 'mario.rossi@sari.test',   (SELECT idnazione FROM Nazioni WHERE nazione='Italia')),  -- 9 cifre, finisce 09
('Anna',   'Bianchi', '333444550', 'anna.bianchi@sari.test',  (SELECT idnazione FROM Nazioni WHERE nazione='Italia')),
('Claire', 'Durand',  '987654309', 'claire.durand@sari.test', (SELECT idnazione FROM Nazioni WHERE nazione='Francia')), -- 9 cifre finisce 09
('Hans',   'Muller',  '555666777', 'hans.muller@sari.test',   (SELECT idnazione FROM Nazioni WHERE nazione='Germania'));

-- =========================
-- PRENOTAZIONI "OGGI"
-- Obiettivo: oggi TUTTE le sale sono occupate (query Q)
-- e "Viola" e "Magenta" oggi sono prenotate per la PRIMA VOLTA (X/Y).
-- Quindi: NESSUNA prenotazione precedente su Viola/Magenta.
-- =========================

-- VIOLA: prima prenotazione oggi, prezzo promo = prezzo previsto - 10 (X)
INSERT INTO PrEventi (idcliente, dataarrivo, oraprevista, numpartecipanti, prezzofinale, idtipo, idsala)
VALUES (
  (SELECT idcliente FROM Clienti WHERE nome='Mario' AND cognome='Rossi'),
  @oggi, '16:00:00', 80,
  (SELECT prezzo - 10 FROM Sale WHERE nome='Viola'),
  (SELECT idtipo FROM TipiEventi WHERE tipo='matrimonio'),
  (SELECT idsala FROM Sale WHERE nome='Viola')
);

-- MAGENTA: prima prenotazione oggi, prezzo promo (Y) - metto sconto 25
INSERT INTO PrEventi (idcliente, dataarrivo, oraprevista, numpartecipanti, prezzofinale, idtipo, idsala)
VALUES (
  (SELECT idcliente FROM Clienti WHERE nome='Anna' AND cognome='Bianchi'),
  @oggi, '15:30:00', 70,
  (SELECT prezzo - 25 FROM Sale WHERE nome='Magenta'),
  (SELECT idtipo FROM TipiEventi WHERE tipo='compleanno'),
  (SELECT idsala FROM Sale WHERE nome='Magenta')
);

-- ROSSA: congresso >= 300 partecipanti (J), oggi
INSERT INTO PrEventi (idcliente, dataarrivo, oraprevista, numpartecipanti, prezzofinale, idtipo, idsala)
VALUES (
  (SELECT idcliente FROM Clienti WHERE nome='Claire' AND cognome='Durand'),
  @oggi, '17:00:00', 350,
  480.00,
  (SELECT idtipo FROM TipiEventi WHERE tipo='congresso'),
  (SELECT idsala FROM Sale WHERE nome='Rossa')
);

-- BLU: meeting, oggi (serve occupazione totale Q)
INSERT INTO PrEventi (idcliente, dataarrivo, oraprevista, numpartecipanti, prezzofinale, idtipo, idsala)
VALUES (
  (SELECT idcliente FROM Clienti WHERE nome='Hans' AND cognome='Muller'),
  @oggi, '14:30:00', 40,
  120.00,
  (SELECT idtipo FROM TipiEventi WHERE tipo='meeting aziendale'),
  (SELECT idsala FROM Sale WHERE nome='Blu')
);

-- VERDE (auditorium): oggi, oraprevista NULL -> penale (Z)
INSERT INTO PrEventi (idcliente, dataarrivo, oraprevista, numpartecipanti, prezzofinale, idtipo, idsala)
VALUES (
  (SELECT idcliente FROM Clienti WHERE nome='Mario' AND cognome='Rossi'),
  @oggi, NULL, 500,
  690.00,
  (SELECT idtipo FROM TipiEventi WHERE tipo='congresso'),
  (SELECT idsala FROM Sale WHERE nome='Verde')
);

-- GIALLA: oggi, congresso ma <300 (così J filtra bene)
INSERT INTO PrEventi (idcliente, dataarrivo, oraprevista, numpartecipanti, prezzofinale, idtipo, idsala)
VALUES (
  (SELECT idcliente FROM Clienti WHERE nome='Anna' AND cognome='Bianchi'),
  @oggi, '18:00:00', 220,
  400.00,
  (SELECT idtipo FROM TipiEventi WHERE tipo='congresso'),
  (SELECT idsala FROM Sale WHERE nome='Gialla')
);