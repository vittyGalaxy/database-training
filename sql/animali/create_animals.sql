DROP TABLE IF EXISTS animali;

CREATE TABLE animali (
  idanimale INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(60) NOT NULL,
  specie VARCHAR(80) NOT NULL,
  razza VARCHAR(80) NULL,
  habitat VARCHAR(80) NOT NULL,
  anniInzoo INT NOT NULL,
  colore VARCHAR(120) NOT NULL,
  zona VARCHAR(60) NOT NULL,
  prezzozona DECIMAL(10,2) NOT NULL,
  CHECK (anniInzoo >= 0),
  CHECK (prezzozona >= 0)
);
