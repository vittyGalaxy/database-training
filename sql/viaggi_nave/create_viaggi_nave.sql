CREATE TABLE viaggiinnave (
  idviaggio            INT NOT NULL,
  nome                 VARCHAR(120) NOT NULL,
  descrizione          TEXT,
  datapartenza         DATE NOT NULL,
  dataarrivo           DATE NOT NULL,
  costo                DECIMAL(10,2) NOT NULL,  -- costo per persona
  portopartenza        VARCHAR(80) NOT NULL,
  portoarrivo          VARCHAR(80) NOT NULL,
  numpasseggeriMAX     INT NOT NULL,
  numpasseggerireali   INT NOT NULL,
  nomepasseggero       VARCHAR(80) NOT NULL,
  cogonemepasseggero   VARCHAR(80) NOT NULL,
  datanascita          DATE NOT NULL,

  PRIMARY KEY (idviaggio, nomepasseggero, cogonemepasseggero, datanascita)
);
