-- Active: 1768521664416@@127.0.0.1@3306@esercizi
DROP TABLE IF EXISTS orologi;
DROP TABLE IF EXISTS produttori;
DROP TABLE IF EXISTS tipi;
DROP TABLE IF EXISTS nazioni;

-- =========================
-- TABELLE
-- =========================

CREATE TABLE nazioni (
  idnazione INT AUTO_INCREMENT PRIMARY KEY,
  nome      VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE produttori (
  idproduttore   INT AUTO_INCREMENT PRIMARY KEY,
  nomeproduttore VARCHAR(60) NOT NULL,
  idnazione      INT NOT NULL,
  CONSTRAINT fk_produttori_nazioni
    FOREIGN KEY (idnazione) REFERENCES nazioni(idnazione)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE tipi (
  idtipo INT AUTO_INCREMENT PRIMARY KEY,
  tipo   VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE orologi (
  idorologio   INT AUTO_INCREMENT PRIMARY KEY,
  nome         VARCHAR(80) NOT NULL,
  valore       DECIMAL(10,2) NOT NULL,
  descrizione  VARCHAR(255),
  idproduttore INT NOT NULL,
  idtipo       INT NOT NULL,
  CONSTRAINT fk_orologi_produttori
    FOREIGN KEY (idproduttore) REFERENCES produttori(idproduttore)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT fk_orologi_tipi
    FOREIGN KEY (idtipo) REFERENCES tipi(idtipo)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;