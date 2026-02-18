DROP TABLE IF EXISTS pizze;
DROP TABLE IF EXISTS pizzaioli;
DROP TABLE IF EXISTS pizzerie;
DROP TABLE IF EXISTS proprietari;
DROP TABLE IF EXISTS tipi;
DROP TABLE IF EXISTS comuni;

-- =========================
-- TABELLE
-- =========================

CREATE TABLE comuni (
  idcomune   INT AUTO_INCREMENT PRIMARY KEY,
  nomecomune VARCHAR(60) NOT NULL UNIQUE,
  cap        VARCHAR(10) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE tipi (
  idtipo INT AUTO_INCREMENT PRIMARY KEY,
  tipo   VARCHAR(40) NOT NULL UNIQUE  -- es: asporto, ristorante, napoletana, pizzagelato...
) ENGINE=InnoDB;

CREATE TABLE proprietari (
  idproprietario  INT AUTO_INCREMENT PRIMARY KEY,
  nome            VARCHAR(40) NOT NULL,
  cognome         VARCHAR(40) NOT NULL,
  idcomunenascita INT NOT NULL,
  CONSTRAINT fk_proprietari_comune_nascita
    FOREIGN KEY (idcomunenascita) REFERENCES comuni(idcomune)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE pizzerie (
  idpizzeria     INT AUTO_INCREMENT PRIMARY KEY,
  nome           VARCHAR(80) NOT NULL,
  indirizzo      VARCHAR(120) NOT NULL,
  idcomune       INT NOT NULL,          -- comune in cui si trova la pizzeria
  idproprietario INT NOT NULL,
  idtipo         INT NOT NULL,
  CONSTRAINT fk_pizzerie_comuni
    FOREIGN KEY (idcomune) REFERENCES comuni(idcomune)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT fk_pizzerie_proprietari
    FOREIGN KEY (idproprietario) REFERENCES proprietari(idproprietario)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT fk_pizzerie_tipi
    FOREIGN KEY (idtipo) REFERENCES tipi(idtipo)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE pizzaioli (
  idpizzaiolo INT AUTO_INCREMENT PRIMARY KEY,
  nome        VARCHAR(40) NOT NULL,
  cognome     VARCHAR(40) NOT NULL,
  idpizzeria  INT NOT NULL,
  CONSTRAINT fk_pizzaioli_pizzerie
    FOREIGN KEY (idpizzeria) REFERENCES pizzerie(idpizzeria)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE pizze (
  idpizza     INT AUTO_INCREMENT PRIMARY KEY,
  nomepizza   VARCHAR(60) NOT NULL,
  ingredienti VARCHAR(255) NOT NULL,
  costo       DECIMAL(10,2) NOT NULL,
  idpizzeria  INT NOT NULL,
  CONSTRAINT fk_pizze_pizzerie
    FOREIGN KEY (idpizzeria) REFERENCES pizzerie(idpizzeria)
    ON UPDATE CASCADE
    ON DELETE CASCADE
) ENGINE=InnoDB;