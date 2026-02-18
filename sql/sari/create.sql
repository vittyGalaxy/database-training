DROP TABLE IF EXISTS PrEventi;
DROP TABLE IF EXISTS Clienti;
DROP TABLE IF EXISTS Sale;
DROP TABLE IF EXISTS TipiEventi;
DROP TABLE IF EXISTS TipiSale;
DROP TABLE IF EXISTS Nazioni;

-- =========================
-- TABELLE
-- =========================

CREATE TABLE Nazioni (
  idnazione INT AUTO_INCREMENT PRIMARY KEY,
  nazione   VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE TipiSale (
  idtipo INT AUTO_INCREMENT PRIMARY KEY,
  nome   VARCHAR(50) NOT NULL UNIQUE,
  descrizione VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE TipiEventi (
  idtipo INT AUTO_INCREMENT PRIMARY KEY,
  tipo   VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE Sale (
  idsala INT AUTO_INCREMENT PRIMARY KEY,
  nome   VARCHAR(50) NOT NULL UNIQUE,     -- nomi colori: "Viola", "Magenta", ecc.
  idtipo INT NOT NULL,                    -- -> TipiSale
  descrizione VARCHAR(255),
  mq     INT NOT NULL,
  nposti INT NOT NULL,
  prezzo DECIMAL(10,2) NOT NULL,          -- prezzo previsto affitto sala
  CONSTRAINT fk_sale_tipisale
    FOREIGN KEY (idtipo) REFERENCES TipiSale(idtipo)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE Clienti (
  idcliente INT AUTO_INCREMENT PRIMARY KEY,
  nome      VARCHAR(50) NOT NULL,
  cognome   VARCHAR(50) NOT NULL,
  telefono  VARCHAR(20),                  -- varchar per gestire formati e zeri
  email     VARCHAR(120),
  idnazionalita INT NOT NULL,             -- -> Nazioni
  CONSTRAINT fk_clienti_nazioni
    FOREIGN KEY (idnazionalita) REFERENCES Nazioni(idnazione)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE PrEventi (
  idprevento INT AUTO_INCREMENT PRIMARY KEY,
  idcliente  INT NOT NULL,                -- -> Clienti
  dataarrivo DATE NOT NULL,
  oraprevista TIME NULL,                  -- NULL => penale 10 euro (regola Z)
  numpartecipanti INT NOT NULL,
  prezzofinale DECIMAL(10,2) NOT NULL,    -- prezzo realmente applicato (affitto sala)
  idtipo INT NOT NULL,                    -- -> TipiEventi
  idsala INT NOT NULL,                    -- -> Sale
  CONSTRAINT fk_preventi_clienti
    FOREIGN KEY (idcliente) REFERENCES Clienti(idcliente)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT fk_preventi_tipieventi
    FOREIGN KEY (idtipo) REFERENCES TipiEventi(idtipo)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT fk_preventi_sale
    FOREIGN KEY (idsala) REFERENCES Sale(idsala)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;
