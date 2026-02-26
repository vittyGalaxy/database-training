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
4. quali viaggio comprendono una sosta a Barcellona
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

## Exercise 5

iscritti( idiscritto, nome, cognome, datanascita, idcomunenascita, idcorso)
comuni(idcomune, nomecomune, cap)
corsi( idcorso, nomecorso, descrizione, prezzocorso, idistruttore)
istruttori(idistruttore, nome, cognome, idcomune)
lezioni(idlezione, descrizione, idistruttore, idcorso, ore)

1. visualizzare l'elenco degli iscritti a ogni corso (mostrare corso e comune di nascita)
2. visualizzare l'elenco degli iscritti al corso di “Yoga” ordinati in ordine alfabetico inverso
3. visualizzare l'elenco degli iscritti al corso di “Scherma” nati a Torino oppure a Milano
4. visualizzare l'elenco degli iscritti al corso di “Yoga” e quelli del corso di “Step”
5. dire quanti sono gli iscritti nati fuori dal comune di Torino
6. visualizzare l'elenco degli iscritti ai corsi di danza (classica, del ventre o altro)
7. visualizzare tutti i corsi che costano minimo 50 euro ma meno di 200 euro
8. visualizzare tutte le lezioni del corso di Scherma
9. visualizzare gli iscritti ai corsi dell’istruttore “Mario Rossi” di Roma
10. visualizzare i corsi che nella descrizione hanno la parola “del”
11. visualizzare l'elenco degli iscritti in cui il cap del comune di nascita inizia con 12 e finisce con 3
12. visualizzare il numero di iscritti per ogni corso
13. visualizzare il numero di lezioni per istruttore
14. visualizzare gli istruttori che hanno effettuato almeno 120 lezioni
15. dire qual è il numero di iscritti al corso di “Latino americano"
16. visualizzare quante ore e quante lezioni sono state svolte per ogni corso
17. visualizzare gli istruttori che hanno fatto più di 17 corsi
18. visualizzare le lezioni nella cui descrizione ci sono le parole “roboante” e “leggiadro” in qualsiasi ordine
19. quanto pagherò per il corso di “Scherma” se viene applicato lo sconto di una certa percentuale e la quota associativa di 20 euro
20. quanto guadagna l'associazione per il corso “Step primo livello 13”

## Exercise 6

orologi( idorologio, nome, valore, descrizione, idproduttore, idtipo )
produttori( idproduttore, nomeproduttore, idnazione)
tipi( idtipo, tipo)
nazioni(idnazione, nome)

1. visualizzare l'elenco di tutti gli orologi (mostrare tipo e produttore)
2. visualizzare l'elenco di tutti gli orologi della Breil
3. visualizzare l'elenco di tutti gli orologi della Breil il cui valore supera i 350 euro
4. visualizzare l'elenco di tutti gli orologi il cui valore va tra i 200 e i 400 euro
5. visualizzare l'elenco di tutti gli orologi atomici e automatici
6. visualizzare gli orologi italiani e francesi
7. visualizzare l'elenco di tutti gli orologi la cui descrizione contiene la parola “ovale”
8. visualizzare gli orologi in cui il tipo inizi per la lettera a seguita da uno spazio (es. a pendolo, a cucù)
9. visualizzare l'elenco di tutti gli orologi il cui produttore abbia come terza lettera esattamente la “s”
10. visualizzare l'elenco degli orologi che non siano “a cucù”
11. dire quanti sono tutti gli orologi posseduti
12. dire quanti sono tutti gli orologi “a pendolo” posseduti
13. dire quanti orologi sono posseduti per ogni tipo
14. mostrare i tipi di orologi di cui si posseggono meno di 10 esemplari
15. visualizzare il costo dell'orologio più costoso
16. visualizzare gli orologi che hanno valore uguale al più costoso
17. visualizzare i costi massimo, minimo e medio degli orologi
18. visualizzare quanto guadagnerebbe il collezionista se vendesse tutti i suoi orologi
19. visualizzare quanto guadagnerebbe il collezionista se vendesse tutti i suoi orologi atomici
20. visualizzare il guadagno per ogni tipo
21. visualizzare quanti orologi si hanno per ogni nazione
22. sapendo che il collezionista possiede 15 “Swatch Irony neri” dire quanto guadagnerebbe se ne vendesse in blocco 7 (suggerimento: “Swatch Irony nero” è il nome dell'orologio)
23. visualizzare il numero di orologi per produttore
24. visualizzare quanto guadagnerebbe il collezionista vendendo tutti gli orologi di un certo produttore
25. visualizzare il costo di ogni “Breil” aggiungendo per ognuno il costo di spedizione (di euro 17.50)
26. visualizzare il costo totale della vendita di tutti i Breil compreso di costo di spedizione (di euro 37.80)