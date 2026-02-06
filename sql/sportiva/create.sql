-- Active: 1768517081752@@127.0.0.1@3306@esercizi
/* ============================================================
   RESET (ordine corretto per vincoli FK)
   ============================================================ */
DROP TABLE IF EXISTS lezioni;
DROP TABLE IF EXISTS iscritti;
DROP TABLE IF EXISTS corsi;
DROP TABLE IF EXISTS istruttori;
DROP TABLE IF EXISTS comuni;

/* ============================================================
   TABELLE
   ============================================================ */

CREATE TABLE comuni (
  idcomune        INT PRIMARY KEY,
  nomecomune      VARCHAR(80) NOT NULL,
  cap             CHAR(5) NOT NULL,
  UNIQUE (nomecomune, cap)
);

CREATE TABLE istruttori (
  idistruttore    INT PRIMARY KEY,
  nome            VARCHAR(60) NOT NULL,
  cognome         VARCHAR(60) NOT NULL,
  idcomune        INT NOT NULL,
  CONSTRAINT fk_istruttori_comuni
    FOREIGN KEY (idcomune) REFERENCES comuni(idcomune)
);

CREATE TABLE corsi (
  idcorso         INT PRIMARY KEY,
  nomecorso       VARCHAR(120) NOT NULL,
  descrizione     VARCHAR(255) NOT NULL,
  prezzocorso     DECIMAL(8,2) NOT NULL CHECK (prezzocorso >= 0),
  idistruttore    INT NOT NULL,
  CONSTRAINT fk_corsi_istruttori
    FOREIGN KEY (idistruttore) REFERENCES istruttori(idistruttore)
);

CREATE TABLE iscritti (
  idiscritto      INT PRIMARY KEY,
  nome            VARCHAR(60) NOT NULL,
  cognome         VARCHAR(60) NOT NULL,
  datanascita     DATE NOT NULL,
  idcomunenascita INT NOT NULL,
  idcorso         INT NOT NULL,
  CONSTRAINT fk_iscritti_comuni
    FOREIGN KEY (idcomunenascita) REFERENCES comuni(idcomune),
  CONSTRAINT fk_iscritti_corsi
    FOREIGN KEY (idcorso) REFERENCES corsi(idcorso)
);

CREATE TABLE lezioni (
  idlezione       INT PRIMARY KEY,
  descrizione     VARCHAR(255) NOT NULL,
  idistruttore    INT NOT NULL,
  idcorso         INT NOT NULL,
  ore             DECIMAL(4,2) NOT NULL CHECK (ore > 0),
  CONSTRAINT fk_lezioni_istruttori
    FOREIGN KEY (idistruttore) REFERENCES istruttori(idistruttore),
  CONSTRAINT fk_lezioni_corsi
    FOREIGN KEY (idcorso) REFERENCES corsi(idcorso)
);

/* Indici utili per query */
CREATE INDEX idx_iscritti_idcorso ON iscritti(idcorso);
CREATE INDEX idx_iscritti_idcomunenascita ON iscritti(idcomunenascita);
CREATE INDEX idx_corsi_idistruttore ON corsi(idistruttore);
CREATE INDEX idx_lezioni_idcorso ON lezioni(idcorso);
CREATE INDEX idx_lezioni_idistruttore ON lezioni(idistruttore);