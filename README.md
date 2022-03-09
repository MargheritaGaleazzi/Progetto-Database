# Progettazione di una base di dati

Progettazione di una base di dati per la gestione degli abbonamenti e dei guasti di una rete telefonica


## Progettazione Concettuale

Nella progettazione si è optato per un approccio ibrido tra bottom-up e top-down ed in questo modo si è elaborato il seguente 
### diagramma E-R:
![Diagramma E-R](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/1.jpg)
### schema logico:
![Schema logico](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/2.jpg)

## Codifica SQL e testing
Si riporta di seguito la definizione dello schema in linguaggio sql e l’output del terminale riguardante le tabelle così come sono implementate nel dump allegato. Per completezza e per garantire una maggiore leggibilità riportiamo in questa posizione anche l’output con l’elenco di tutte le tabelle implementate.

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/showtables.png)

### DEFINIZIONE DELLO SCHEMA E OUTPUT DEL TERMINALE A SEGUITO DELL’INSERIMENTO DEI DATI 
**Struttura della tabella “ContrattoCliente”**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/selectContrattoCliente.png)

**Struttura della tabella “Cliente”**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/selectCliente.png)

**Struttura della tabella “Offerta”**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/selectOfferta.png)

**Struttura della tabella “ContrattoDipendente”**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/selectContrattoDipendente.png)

**Struttura della tabella “Tecnico”**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/selectTecnico.png)

**Struttura della tabella “Bolletta”**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/selectBolletta.png)

**Struttura della tabella “Modem”**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/selectModem.png)

**Struttura della tabella “Impianto”**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/selectImpianto.png)

**Struttura della tabella “Guasto”**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/selectGuasto.png)

**Struttura della tabella “Attrezzatura”**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/selectAttrezzatura.png)

**Struttura della tabella “Email”**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/selectEmail.png)

**Struttura della tabella “Riparazione”**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/selectRiparazione.png)

### CODIFICA DELLE OPERAZIONI E OUTPUT DEL TERMINALE

Di seguito sono riportate alcune operazioni, più significative, scritte in SQL e l'output del terminale.

**Statistica numero guasti per tipo (una volta ogni due mesi)**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/query28.png)

**Statistica acquisizione clienti (una volta al mese)**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/query29.png)

**Statistica contratti per tipo collegamento (una volta ogni sei mesi)**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/query30.png)

**Statistica offerta maggiormente sottoscritta dai clienti (una volta
ogni due mesi)**

![](https://github.com/MargheritaGaleazzi/Progetto-Database/blob/main/immagini%20query%20database/query31.png)

## Sviluppatori

 - Margherita Galeazzi
 - Chiara Amalia Caporusso
