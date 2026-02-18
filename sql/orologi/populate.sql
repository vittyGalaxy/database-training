INSERT INTO nazioni (nome) VALUES
('Italia'),
('Francia'),
('Svizzera'),
('Giappone'),
('Germania'),
('USA');

INSERT INTO produttori (nomeproduttore, idnazione) VALUES
('Breil',   (SELECT idnazione FROM nazioni WHERE nome='Italia')),
('Swatch',  (SELECT idnazione FROM nazioni WHERE nome='Svizzera')),
('Casio',   (SELECT idnazione FROM nazioni WHERE nome='Giappone')), -- terza lettera = 's'
('Omega',   (SELECT idnazione FROM nazioni WHERE nome='Svizzera')),
('Lip',     (SELECT idnazione FROM nazioni WHERE nome='Francia')),
('Seiko',   (SELECT idnazione FROM nazioni WHERE nome='Giappone')),
('Howard',  (SELECT idnazione FROM nazioni WHERE nome='USA'));

INSERT INTO tipi (tipo) VALUES
('da polso'),
('da taschino'),
('atomico'),
('automatico'),
('a pendolo'),
('a cucù');

-- -------------------------
-- OROLOGI: Breil (B/C/Y/Z)
-- -------------------------
INSERT INTO orologi (nome, valore, descrizione, idproduttore, idtipo) VALUES
('Breil Manta',            299.90, 'Cronografo sportivo',          (SELECT idproduttore FROM produttori WHERE nomeproduttore='Breil'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Breil Tribe',            399.00, 'Cassa ovale satinata',         (SELECT idproduttore FROM produttori WHERE nomeproduttore='Breil'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Breil Milano Automatic', 620.00, 'Automatico elegante',         (SELECT idproduttore FROM produttori WHERE nomeproduttore='Breil'), (SELECT idtipo FROM tipi WHERE tipo='automatico')),
('Breil AtomX',            410.00, 'Orologio atomico',            (SELECT idproduttore FROM produttori WHERE nomeproduttore='Breil'), (SELECT idtipo FROM tipi WHERE tipo='atomico')),
('Breil Classic',          180.00, 'Quadrante semplice',          (SELECT idproduttore FROM produttori WHERE nomeproduttore='Breil'), (SELECT idtipo FROM tipi WHERE tipo='da polso'));

-- -------------------------
-- Casio (produttore con 3a lettera "s" -> query I)
-- -------------------------
INSERT INTO orologi (nome, valore, descrizione, idproduttore, idtipo) VALUES
('Casio G-Shock',         159.99, 'Resistente urti',               (SELECT idproduttore FROM produttori WHERE nomeproduttore='Casio'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Casio Atomic Pro',      219.50, 'Radio controllato (atomico)',   (SELECT idproduttore FROM produttori WHERE nomeproduttore='Casio'), (SELECT idtipo FROM tipi WHERE tipo='atomico')),
('Casio Vintage',          79.90, 'Display digitale',              (SELECT idproduttore FROM produttori WHERE nomeproduttore='Casio'), (SELECT idtipo FROM tipi WHERE tipo='da polso'));

-- -------------------------
-- Swatch + 15 "Swatch Irony nero" (query V)
-- -------------------------
INSERT INTO orologi (nome, valore, descrizione, idproduttore, idtipo) VALUES
('Swatch Sistem51',       170.00, 'Automatico entry-level',        (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='automatico')),
('Swatch Irony blu',      120.00, 'Cassa in metallo',              (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso'));

INSERT INTO orologi (nome, valore, descrizione, idproduttore, idtipo) VALUES
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Swatch Irony nero', 110.00, 'Versione nera', (SELECT idproduttore FROM produttori WHERE nomeproduttore='Swatch'), (SELECT idtipo FROM tipi WHERE tipo='da polso'));

-- -------------------------
-- Altri (range valori, max/min/media, descrizione "ovale", ecc.)
-- -------------------------
INSERT INTO orologi (nome, valore, descrizione, idproduttore, idtipo) VALUES
('Omega Seamaster',      4200.00, 'Diver professionale',           (SELECT idproduttore FROM produttori WHERE nomeproduttore='Omega'),  (SELECT idtipo FROM tipi WHERE tipo='automatico')),
('Lip Himalaya',          260.00, 'Quadrante ovale vintage',       (SELECT idproduttore FROM produttori WHERE nomeproduttore='Lip'),    (SELECT idtipo FROM tipi WHERE tipo='da polso')),
('Seiko 5 Sports',        230.00, 'Automatico robusto',            (SELECT idproduttore FROM produttori WHERE nomeproduttore='Seiko'),  (SELECT idtipo FROM tipi WHERE tipo='automatico')),
('Howard Pocket',         340.00, 'Orologio da taschino',          (SELECT idproduttore FROM produttori WHERE nomeproduttore='Howard'), (SELECT idtipo FROM tipi WHERE tipo='da taschino'));

-- -------------------------
-- Tipi che iniziano con "a " (H) + esclusione "a cucù" (J)
-- -------------------------
INSERT INTO orologi (nome, valore, descrizione, idproduttore, idtipo) VALUES
('Pendolo Salotto',       310.00, 'A pendolo in legno',            (SELECT idproduttore FROM produttori WHERE nomeproduttore='Breil'),  (SELECT idtipo FROM tipi WHERE tipo='a pendolo')),
('Cucu Foresta Nera',     450.00, 'A cucù tradizionale',           (SELECT idproduttore FROM produttori WHERE nomeproduttore='Howard'), (SELECT idtipo FROM tipi WHERE tipo='a cucù'));