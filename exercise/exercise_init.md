# Exercises

## Exercise 1

Per la tabella: film( idfilm, titolo, annoproduzione, costo , trama, nomeregista, cognomeregista, nazione )

Scrivere le query in linguaggio SQL necessarie a:

1. visualizzare l'elenco dei film
2. visualizzare l'elenco dei film del 1998
3. visualizzare l'elenco dei film prodotti dopo il 2007 ordinati per costo
4. visualizzare l'elenco dei film prodotti dal 2000 in poi ma fino al 2010 escluso
5. visualizzare tutti i film tranne quelli prodotti tra il 2000 e il 2005
6. visualizzare l'elenco dei film prodotti dopo il 2007 costati meno di 10000 euro
7. visualizzare l'elenco dei film del regista 'Gabriele Muccino'
8. visualizzare l'elenco di tutti i film italiani di registi che si chiamano Alessandro
9. visualizzare l'elenco di tutti i film italiani e francesi
10. visualizzare l'elenco di tutti i film del 2007 ordinati per nazione in maniera decrescente
11. Il film Lassú qualcuno è impazzito è stato sovvenzionato per il 25% dallo stato; visualizzare il costo iniziale, la cifra sovvenzionata e il prezzo pagato dai produttori per questo film.
12. Il film Lassù qualcuno mi ama è costato il triplo del film L'onorata società visualizzare i due  costi

## Exercise 2

Data la seguente tabella
dipendenti(iddip, nome, cogn, stipendio, numfigli, hobby, comunenascita)

Svolgere le seguenti query con una tabella

1. visualizzare i dipendenti
2. visualizzare i dipendenti nati a Roma e quelli nati a Torino
3. visualizzare i dipendenti che hanno dai 4 ai 7 figli in ordine alfabetico
4. visualizzare i dipendenti con stipendio di almeno 1000 euro e meno di 3 figli in ordine di stipendio dallo stipendio più alto al più basso
5. visualizzare i dipendenti nati a Roma, Bari, Napoli
6. visualizzare la media degli stipendi dei dipendenti
7. visualizzare lo stipendio minimo e lo stipendio massimo
8. visualizzare il dipendente che ha lo stipendio minore
9. quanti dipendenti non hanno figli?
10. in quanti dipendenti non ho inserito il numero di figli?
11. chi sono i dipendenti in cui non ho inserito il numero di figli?
12. quali dipendenti hanno il golf tra i propri hobby?
13. quali dipendenti hanno il golf e la pallacanestro tra i propri hobby?
14. quanti dipendenti ascoltano musica classica?
15. trovare il dipendente in cui ho inserito per errore la parola pallacanestro tra gli hobby in cui ho probabilmente sbagliato l'ultima lettera
16. visualizzare i dipendenti che hanno al massimo 500 euro di stipendio e almeno 4 figli con lo stipendio aumentato di 350 euro (bonus famiglia), visualizzando anche lo stipendio iniziale

## Exercise 3

Data la seguente tabella
viaggiinnave(idviaggio, nome, descrizione, datapartenza, dataarrivo, costo, portopartenza, portoarrivo, numpasseggeriMAX, numpasseggerireali, nomepasseggero, cogonemepasseggero, datanascita)
per costo si intende il costo per persona

Svolgere le seguenti query con una tabella
1. visualizzare tutti i viaggi
2. quanti viaggi hanno più di 500 passeggeri
3. quali viaggi arrivano a Civitavecchia
4.quali viaggio comprendono una sosta a Barcellona
5. quali viaggio comprendono una sosta a Barcellona e una a Marsiglia)
6. quali viaggi sono previsti nel Mar Atlantico
7. quanti porti sono coinvolti in partenza, e quanti in arrivo
8. Trovare  tutti quelli il cui nome inizi per D del viaggio "Crociera in Mediterraneo"
9. Il costo per i bambini sotto 10 anni equivale al 45% del totale calcolarlo
10. Quanti sono  i bambini sotto 10 anni che pagano meno e quanto pagano in totale (cioè quanto guadagna la compagnia) 
11. Come la 10 ma solo per il viaggio "Crociera Divertente"

## Exercise 4

animali(idanimale, nome, specie, razza, habitat, anniInzoo, zona, prezzozona)
per habitat si intende ad esempio: tropicale, oceano, innevato, deserto ecc., per anniInzoo si intende da quanti  anni è dentro lo zoo, colori, per zona si intende ad esemnpio: acquario, parco vegetale, parchetto domestici, dune, ecc.; per colori sii ntende un elenco di colori, per prezzo zona si intende il prezzo che serve per visitare la zona dove sta ogni animale

1. visualizzare l'elenco degli animali
2. visualizzare gli animali dell'habitat: deserto
3. visualizzare gli animali dell'habitat: deserto e dell'habitat tropicale
4. visualizzare gli animali che sono nello zoo da più di 10 anni
5. visualizzare gli animali che sono nello zoo da più di 10 anni ma da meno di 15
6. visualizzare tutti gli animali con colore bianco
7. visualizzare tutti gli animali con colore bianco e verde
8. visualizzare tutti gli animali con colore bianco e verde ma che non siano viola
9. visulaizzare tutti gli animali il cui nome inizia per R e contiene la stringa "dol" 
10. Quanti sono gli armadilli
11. Media degli anni in zoo 
12. Prezzo totale delle zone (nella tabella non ormalizzata abbiamo un problema: individuarlo e cercare una soluzione anche online)
13. Prezzi Massimo e Minimo delle zone