-- Active: 1768517081752@@127.0.0.1@3306@esercizi
DROP TABLE IF EXISTS film;

CREATE TABLE film (
  idfilm INT AUTO_INCREMENT PRIMARY KEY,
  titolo VARCHAR(200) NOT NULL,
  annoproduzione INT NOT NULL,
  costo DECIMAL(12,2) NOT NULL,
  trama TEXT,
  nomeregista VARCHAR(80) NOT NULL,
  cognomeregista VARCHAR(80) NOT NULL,
  nazione VARCHAR(60) NOT NULL,
  CHECK (annoproduzione >= 1888),
  CHECK (costo >= 0)
);
