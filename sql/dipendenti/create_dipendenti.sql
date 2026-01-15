DROP TABLE IF EXISTS dipendenti;

CREATE TABLE dipendenti (
  iddip INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  cogn VARCHAR(50) NOT NULL,
  stipendio DECIMAL(10,2) NOT NULL,
  numfigli INT NULL,
  hobby VARCHAR(255) NULL,
  comunenascita VARCHAR(60) NOT NULL,
  CHECK (stipendio >= 0),
  CHECK (numfigli IS NULL OR numfigli >= 0)
);
