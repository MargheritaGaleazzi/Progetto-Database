-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: ZeusPhone
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attrezzatura`
--

DROP TABLE IF EXISTS `attrezzatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attrezzatura` (
  `Codice` varchar(30) NOT NULL,
  `qta` int NOT NULL,
  `qtamin` int NOT NULL,
  `Scaffale` char(30) NOT NULL,
  `Ripiano` int NOT NULL,
  PRIMARY KEY (`Codice`),
  CONSTRAINT `attrezzatura_chk_1` CHECK ((`qta` > 0)),
  CONSTRAINT `attrezzatura_chk_2` CHECK ((`qtamin` > 0)),
  CONSTRAINT `attrezzatura_chk_3` CHECK ((`qta` > `qtamin`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attrezzatura`
--

LOCK TABLES `attrezzatura` WRITE;
/*!40000 ALTER TABLE `attrezzatura` DISABLE KEYS */;
INSERT INTO `attrezzatura` VALUES ('CavoRame10mt',249,100,'cavi',1),('CavoRame15mt',299,150,'cavi',1),('CavoRame1mt',170,80,'cavi',1),('CavoRame20mt',349,160,'cavi',1),('CavoRame2mt',184,80,'cavi',1),('CavoRame3mt',199,130,'cavi',1),('CavoRame5mt',230,90,'cavi',1),('FibraOttica100mt',348,250,'cavi',2),('FibraOttica200mt',499,350,'cavi',2),('FibraOttica30mt',398,300,'cavi',2),('FibraOttica50mt',500,400,'cavi',2),('ModemADSL',198,100,'modem',1),('ModemVDSL',167,80,'modem',3),('RicambiModemADSL',384,100,'modem',2),('RicambiModemVDSL',425,80,'modem',4),('RicambiPiastraUtente',158,100,'centrale',1);
/*!40000 ALTER TABLE `attrezzatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bolletta`
--

DROP TABLE IF EXISTS `bolletta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bolletta` (
  `Nfattura` int NOT NULL AUTO_INCREMENT,
  `Data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Scadenza` date NOT NULL,
  `Periodo` char(21) NOT NULL,
  `StatoPag` enum('effettuato','non effettuato') NOT NULL DEFAULT 'non effettuato',
  `RimborsoGuasti` decimal(6,2) NOT NULL DEFAULT '0.00',
  `CostoAssistenze` decimal(6,2) NOT NULL DEFAULT '0.00',
  `CodModem` char(11) NOT NULL,
  PRIMARY KEY (`Nfattura`),
  KEY `CodModem` (`CodModem`),
  CONSTRAINT `bolletta_ibfk_1` FOREIGN KEY (`CodModem`) REFERENCES `modem` (`CSeriale`) ON UPDATE CASCADE,
  CONSTRAINT `bolletta_chk_1` CHECK ((`RimborsoGuasti` <= 0)),
  CONSTRAINT `bolletta_chk_2` CHECK ((`CostoAssistenze` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bolletta`
--

LOCK TABLES `bolletta` WRITE;
/*!40000 ALTER TABLE `bolletta` DISABLE KEYS */;
INSERT INTO `bolletta` VALUES (1,'2018-02-11 23:00:00','2018-02-22','11/01/2018-11/02/2018','effettuato',0.00,0.00,'HG3452LKJ12'),(2,'2020-12-11 23:00:00','2020-12-22','11/11/2020-11/12/2020','effettuato',0.00,0.00,'HG3452LKJ12'),(3,'2017-01-11 23:00:00','2017-01-22','11/12/2016-11/01/2017','effettuato',-7.00,0.00,'AK2098DLK89'),(4,'2019-02-11 23:00:00','2019-02-22','11/01/2019-11/02/2019','effettuato',0.00,0.00,'AK2098DLK89'),(5,'2020-01-02 23:00:00','2020-01-13','02/12/2019-02/01/2020','effettuato',0.00,0.00,'AZ6057KOJ23'),(6,'2020-07-02 22:00:00','2020-07-13','02/06/2020-02/07/2020','effettuato',0.00,0.00,'AZ6057KOJ23'),(7,'2021-01-02 23:00:00','2021-01-13','02/12/2020-02/01/2021','non effettuato',0.00,0.00,'AZ6057KOJ23'),(8,'2019-12-02 23:00:00','2019-12-13','02/11/2019-02/12/2019','effettuato',0.00,0.00,'FD5466OHT23'),(9,'2020-12-02 23:00:00','2020-12-13','02/11/2020-02/12/2020','effettuato',0.00,0.00,'FD5466OHT23'),(10,'2020-12-22 23:00:00','2021-01-02','22/11/2020-22/12/2020','effettuato',0.00,0.00,'KJ5032WSA18'),(11,'2020-12-17 23:00:00','2020-12-28','17/11/2020-17/12/2020','effettuato',0.00,0.00,'LE6784WQO20'),(12,'2020-12-19 23:00:00','2020-12-30','19/11/2020-19/12/2020','effettuato',0.00,0.00,'LK6087FGE30'),(13,'2019-07-04 22:00:00','2019-07-15','04/06/2019-04/07/2019','effettuato',-15.00,10.00,'OT3209LIU11'),(14,'2020-03-04 23:00:00','2020-03-15','04/02/2020-04/03/2020','effettuato',0.00,0.00,'OT3209LIU11'),(15,'2021-01-04 23:00:00','2021-01-15','04/12/2020-04/01/2021','non effettuato',0.00,0.00,'OT3209LIU11'),(16,'2020-08-20 22:00:00','2020-08-31','20/07/2020-20/08/2020','effettuato',-25.00,0.00,'PL3065ASW13'),(17,'2020-12-20 23:00:00','2020-12-31','20/11/2020-20/12/2020','effettuato',0.00,0.00,'PL3065ASW13'),(18,'2016-09-25 22:00:00','2016-10-06','25/08/2016-25/09/2016','effettuato',0.00,20.00,'PO3309KKF66'),(19,'2020-08-25 22:00:00','2020-09-05','25/07/2020-25/08/2020','effettuato',0.00,0.00,'PO3309KKF66'),(20,'2020-10-25 23:00:00','2020-11-05','25/09/2020-25/10/2020','effettuato',0.00,0.00,'TU5503EOQ45'),(21,'2020-12-25 23:00:00','2021-01-05','25/11/2020-25/12/2020','non effettuato',0.00,0.00,'TU5503EOQ45'),(22,'2020-07-15 22:00:00','2020-07-26','15/06/2020-15/07/2020','effettuato',0.00,0.00,'PT5743QIU02'),(23,'2020-12-15 23:00:00','2020-12-26','15/11/2020-15/12/2020','effettuato',0.00,0.00,'PT5743QIU02'),(24,'2017-06-25 22:00:00','2017-07-06','25/05/2017-25/06/2017','effettuato',0.00,0.00,'AJ2835IYG44'),(25,'2019-03-25 23:00:00','2019-04-05','25/02/2019-25/03/2019','non effettuato',0.00,0.00,'AJ2835IYG44'),(26,'2020-09-11 22:00:00','2020-09-22','11/08/2020-11/09/2020','effettuato',-10.00,0.00,'GT4738AZU47'),(27,'2020-12-11 23:00:00','2020-12-22','11/11/2020-11/12/2020','effettuato',0.00,0.00,'GT4738AZU47');
/*!40000 ALTER TABLE `bolletta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Codice` int NOT NULL AUTO_INCREMENT,
  `Fascia` enum('Residenziale','Affari','Alta') NOT NULL,
  `ViaFatt` varchar(30) NOT NULL,
  `NcivicoFatt` int NOT NULL,
  `CAPFatt` int NOT NULL,
  `CittaFatt` varchar(30) NOT NULL,
  `Tipo` enum('privato','azienda') NOT NULL,
  `PIVAoCF` varchar(16) DEFAULT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `Cognome` varchar(30) DEFAULT NULL,
  `DataNasc` date DEFAULT NULL,
  `RagSoc` varchar(10) DEFAULT NULL,
  `NomeAz` varchar(50) DEFAULT NULL,
  `NcontrattiAss` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Codice`),
  CONSTRAINT `cliente_chk_1` CHECK (((`PIVAoCF` like _cp850'___________') or (`PIVAoCF` like _cp850'________________')))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Residenziale','via Romani',15,20019,'Milano','privato','RSSMRA80A01F205X','Mario','Rossi','1980-01-01',NULL,NULL,1),(2,'Residenziale','via Battisti',25,61121,'Pesaro','privato','BNCCSN96R48G479Q','Cassandra','Bianchi','1996-10-08',NULL,NULL,2),(3,'Residenziale','via Milano',98,35485,'Padova','privato','FSCDNL69E08G224O','Daniele','Foscari','1969-05-05',NULL,NULL,0),(4,'Residenziale','via Leotti',21,98754,'Ancona','privato','NGLGLN93S46A271Q','Giuliana','Angeli','1993-11-06',NULL,NULL,2),(5,'Residenziale','via Leopardi',45,60234,'Trieste','privato','GLLLSS67D05L424O','Alessio','Gialli','1967-04-05',NULL,NULL,1),(6,'Residenziale','via Rovereto',23,63965,'Genova','privato','FSCWTR84C27D969F','Walter','Foschi','1984-03-27',NULL,NULL,2),(7,'Affari','via Roveri',25,80122,'Napoli','azienda','25698874236',NULL,NULL,NULL,'s.r.l.','Pulisci Rapido s.r.l.',0),(8,'Affari','via Costantini',57,35121,'Padova','azienda','49663255777',NULL,NULL,NULL,'s.r.l.','Bar Dario s.r.l.',1),(9,'Affari','via Pollini',17,20019,'Milano','azienda','40002455897',NULL,NULL,NULL,'s.r.l.','Bar Carlo s.r.l.',0),(10,'Affari','via Paride',76,64100,'Teramo','azienda','75902453167',NULL,NULL,NULL,'s.n.c.','KitKet Cioccolato s.n.c.',1),(11,'Affari','via Vittoria',95,10122,'Torino','azienda','78446952000',NULL,NULL,NULL,'s.n.c.','Katy Fashion s.n.c.',2),(12,'Affari','via Boccaccio',88,67123,'Firenze','azienda','42645589605',NULL,NULL,NULL,'s.a.s.','Macrosoft s.a.s.',1),(13,'Alta','via Zara',59,61121,'Pesaro','azienda','49856321569',NULL,NULL,NULL,'s.p.a.','StampaPlus s.p.a.',0),(14,'Alta','via Primi',44,35121,'Padova','azienda','44444598756',NULL,NULL,NULL,'s.p.a.','Canod s.p.a.',1),(15,'Alta','via Secondi',98,67801,'Mantova','azienda','44324590811',NULL,NULL,NULL,'s.p.a.','Risparmio Cose s.p.a.',1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrattocliente`
--

DROP TABLE IF EXISTS `contrattocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrattocliente` (
  `Codice` char(10) NOT NULL,
  `Data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FineVincolo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MetodoPag` enum('bollettino','c/c') NOT NULL,
  `TipoCollegamento` enum('ADSL','FTTC','FTTH') NOT NULL,
  `CodiceMigrazione` char(17) NOT NULL,
  `ViaForn` varchar(30) NOT NULL,
  `NcivForn` int NOT NULL,
  `CAPForn` int NOT NULL,
  `CittaForn` varchar(30) NOT NULL,
  `NomeOff` varchar(30) NOT NULL,
  `CodModem` char(11) NOT NULL,
  `CodCliente` int NOT NULL,
  `Stato` enum('attivo','cessato') NOT NULL DEFAULT 'attivo',
  PRIMARY KEY (`Codice`),
  KEY `NomeOff` (`NomeOff`),
  KEY `CodModem` (`CodModem`),
  KEY `CodCliente` (`CodCliente`),
  CONSTRAINT `contrattocliente_ibfk_1` FOREIGN KEY (`NomeOff`) REFERENCES `offerta` (`Nome`) ON UPDATE CASCADE,
  CONSTRAINT `contrattocliente_ibfk_2` FOREIGN KEY (`CodModem`) REFERENCES `modem` (`CSeriale`) ON UPDATE CASCADE,
  CONSTRAINT `contrattocliente_ibfk_3` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`Codice`) ON UPDATE CASCADE,
  CONSTRAINT `contrattocliente_chk_1` CHECK ((`Codice` like _cp850'CC________')),
  CONSTRAINT `contrattocliente_chk_2` CHECK ((`CodiceMigrazione` like _cp850'_________________'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrattocliente`
--

LOCK TABLES `contrattocliente` WRITE;
/*!40000 ALTER TABLE `contrattocliente` DISABLE KEYS */;
INSERT INTO `contrattocliente` VALUES ('CC00000001','2017-12-10 23:00:00','2019-12-10 23:00:00','c/c','FTTC','ACX9583103948271A','via Romani',15,20019,'Milano','Absolute VDSL','HG3452LKJ12',1,'attivo'),('CC00000002','2016-12-10 23:00:00','2018-12-10 23:00:00','bollettino','ADSL','XJE9128374650193Q','via Battisti',25,61121,'Pesaro','Ultra ADSL','AK2098DLK89',2,'cessato'),('CC00000003','2019-02-01 23:00:00','2019-02-01 23:00:00','c/c','FTTC','AKO0294817503294P','via Battisti',25,61121,'Pesaro','Ultrainternet Fibra','AZ6057KOJ23',2,'attivo'),('CC00000004','2018-05-01 22:00:00','2020-05-01 22:00:00','c/c','ADSL','AJW0739217403284Z','via Leotti',21,98754,'Ancona','Absolute ADSL','FD5466OHT23',4,'cessato'),('CC00000005','2020-11-21 23:00:00','2022-11-21 23:00:00','c/c','FTTH','JHY8675935183921E','via Massimi',20,60024,'Milano Marittima','Ultrainternet Fibra','KJ5032WSA18',4,'attivo'),('CC00000006','2019-03-16 23:00:00','2021-03-16 23:00:00','bollettino','ADSL','UHT1946392758103K','via Leopardi',45,60234,'Trieste','Ultra ADSL','LE6784WQO20',5,'attivo'),('CC00000007','2016-12-18 23:00:00','2020-12-18 23:00:00','bollettino','ADSL','SJX9462917300948I','via Rovereto',23,63965,'Genova','Absolute ADSL','LK6087FGE30',6,'cessato'),('CC00000008','2020-12-18 23:00:00','2020-12-18 23:00:00','c/c','FTTC','UHS1958352748192A','via Rovereto',23,63965,'Genova','Super Fibra','OE4578TRE44',6,'attivo'),('CC00000009','2018-11-03 23:00:00','2018-11-03 23:00:00','bollettino','FTTC','SJX9462917300948I','via Costantini',57,35121,'Padova','Absolute VDSL','OT3209LIU11',8,'attivo'),('CC00000010','2020-05-19 22:00:00','2023-05-19 22:00:00','c/c','FTTC','SWD5739281029167G','via Paride',76,64100,'Teramo','Piu Fibra','PL3065ASW13',10,'attivo'),('CC00000011','2016-08-24 22:00:00','2020-08-24 22:00:00','bollettino','ADSL','KYG9563917283649D','via Vittoria',95,10122,'Torino','Absolute ADSL','PO3309KKF66',11,'cessato'),('CC00000012','2020-08-24 22:00:00','2022-08-24 22:00:00','c/c','FTTH','SWD5739281029167G','via Vittoria',95,10122,'Torino','Super Fibra','TU5503EOQ45',11,'attivo'),('CC00000013','2020-04-14 22:00:00','2020-04-14 22:00:00','bollettino','ADSL','EFR9483617302947K','via Boccaccio',88,67123,'Firenze','Absolute ADSL','PT5743QIU02',12,'attivo'),('CC00000014','2015-05-24 22:00:00','2018-05-24 22:00:00','bollettino','ADSL','XHE9674920183922D','via Primi',44,35121,'Padova','Ultra ADSL','AJ2835IYG44',14,'cessato'),('CC00000015','2019-02-10 23:00:00','2022-02-10 23:00:00','c/c','FTTH','DTT9563829154437A','via Secondi',98,67801,'Mantova','Piu Fibra','GT4738AZU47',15,'attivo');
/*!40000 ALTER TABLE `contrattocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrattodipendente`
--

DROP TABLE IF EXISTS `contrattodipendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrattodipendente` (
  `Codice` char(10) NOT NULL,
  `Data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Tipo` enum('determinato','indeterminato') NOT NULL,
  `Durata` tinyint DEFAULT NULL,
  `CodTecnico` int NOT NULL,
  `Stato` enum('attivo','cessato') NOT NULL DEFAULT 'attivo',
  PRIMARY KEY (`Codice`),
  KEY `CodTecnico` (`CodTecnico`),
  CONSTRAINT `contrattodipendente_ibfk_1` FOREIGN KEY (`CodTecnico`) REFERENCES `tecnico` (`Codice`) ON UPDATE CASCADE,
  CONSTRAINT `contrattodipendente_chk_1` CHECK ((`Codice` like _cp850'CD________'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrattodipendente`
--

LOCK TABLES `contrattodipendente` WRITE;
/*!40000 ALTER TABLE `contrattodipendente` DISABLE KEYS */;
INSERT INTO `contrattodipendente` VALUES ('CD00000001','2000-07-12 22:00:00','indeterminato',NULL,1,'attivo'),('CD00000002','2016-05-26 22:00:00','determinato',20,2,'cessato'),('CD00000003','2019-09-10 22:00:00','determinato',24,3,'attivo'),('CD00000004','2020-05-26 22:00:00','determinato',12,4,'attivo'),('CD00000005','2018-06-09 22:00:00','determinato',30,5,'attivo'),('CD00000006','2002-09-10 22:00:00','indeterminato',NULL,6,'attivo'),('CD00000007','2015-11-16 23:00:00','determinato',20,7,'cessato'),('CD00000008','2019-04-27 22:00:00','determinato',24,8,'attivo'),('CD00000009','2020-09-02 22:00:00','determinato',9,9,'attivo'),('CD00000010','2020-12-28 23:00:00','determinato',2,10,'attivo'),('CD00000011','2005-06-20 22:00:00','indeterminato',NULL,11,'attivo'),('CD00000012','2020-10-22 22:00:00','determinato',12,12,'attivo'),('CD00000013','2014-01-22 23:00:00','determinato',24,13,'cessato'),('CD00000014','2018-11-28 23:00:00','indeterminato',NULL,14,'attivo'),('CD00000015','2020-01-08 23:00:00','indeterminato',NULL,15,'attivo');
/*!40000 ALTER TABLE `contrattodipendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email` (
  `Indirizzo` varchar(50) NOT NULL,
  `CodCliente` int NOT NULL,
  PRIMARY KEY (`Indirizzo`),
  KEY `CodCliente` (`CodCliente`),
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`Codice`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES ('m.rossi01@outlook.it',1),('m.rossi80@virgilio.it',1),('mario.rossi@gmail.com',1),('c.bianchi08@outlook.it',2),('cassandra.bianchi96@virgilio.it',2),('cassandrabianchi@alice.it',2),('d.foscari05@outlook.it',3),('foscari.daniele@gmail.com',3),('angela.giuliani11@gmail.com',4),('giuly.angi@poste.com',4),('alessio.gialli@virgilio.it',5),('aleyellow67@alice.it',5),('gialli.ale04@outlook,it',5),('foschi.walter@poste.com',6),('w.foschi@alice.it',6),('puliscirapido@segreteria.com',7),('bardario@alice.it',8),('ilbardidario23@gmail.com',8),('barcarlo@hotmail.it',9),('carlosbar@outlook.it',9),('cioccolatokitket@virgilio.it',10),('kitketciocco@gmail.com',10),('katy.fashion@alice.it',11),('katyfashion@fastwebnet.it',11),('macrosoft.sas@gmail.com',12),('macrosoft@outlook.it',12),('stampaplus@segreteriastampa.it',13),('stampaplus@stampeonline.it',13),('canodspa@spesasemplice.it',14),('canodspa@ufficiosegreteria.it',14),('risparmiocose@risparmio.it',15),('risparmiocose@segreteriamministrativa.it',15);
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guasto`
--

DROP TABLE IF EXISTS `guasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guasto` (
  `Codice` int NOT NULL AUTO_INCREMENT,
  `DataApertura` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DataChiusura` timestamp NULL DEFAULT NULL,
  `Rimborso` decimal(6,2) NOT NULL DEFAULT '0.00',
  `Costo` decimal(6,2) NOT NULL DEFAULT '0.00',
  `GradoPericolo` enum('basso','medio','alto') NOT NULL,
  `Tipo` enum('assistenza','linea utente','centrale') NOT NULL,
  `CodImpianto` int DEFAULT NULL,
  `CodCliente` int DEFAULT NULL,
  `RecapitoCl` char(10) DEFAULT NULL,
  `Descrizione` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Codice`),
  KEY `CodCliente` (`CodCliente`),
  KEY `CodImpianto` (`CodImpianto`),
  CONSTRAINT `guasto_ibfk_1` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`Codice`) ON UPDATE CASCADE,
  CONSTRAINT `guasto_ibfk_2` FOREIGN KEY (`CodImpianto`) REFERENCES `impianto` (`Codice`) ON UPDATE CASCADE,
  CONSTRAINT `guasto_chk_1` CHECK ((`Rimborso` <= 0)),
  CONSTRAINT `guasto_chk_2` CHECK ((`Costo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guasto`
--

LOCK TABLES `guasto` WRITE;
/*!40000 ALTER TABLE `guasto` DISABLE KEYS */;
INSERT INTO `guasto` VALUES (1,'2016-09-13 11:15:11','2016-09-14 08:25:48',0.00,20.00,'basso','assistenza',NULL,11,'3924577889','configurazione NAS'),(2,'2016-12-20 10:02:13','2016-12-23 08:03:45',-7.00,0.00,'basso','linea utente',NULL,2,'3905542440','Il modem non si accende'),(3,'2017-05-28 12:05:33','2017-05-28 14:06:39',0.00,0.00,'medio','linea utente',NULL,14,'3924577889','segnale internet assente'),(4,'2018-02-03 14:03:56','2018-02-03 16:35:46',0.00,0.00,'alto','linea utente',NULL,1,'3795327112','il modem puzza di bruciato'),(5,'2019-06-15 07:56:13','2019-06-15 08:36:53',0.00,10.00,'basso','assistenza',NULL,8,'3452784554','Non riesco a configurare la stampante'),(6,'2019-06-23 09:02:13','2019-06-25 13:03:30',-15.00,0.00,'basso','linea utente',NULL,8,'3452784554','Il wi-fi non funziona'),(7,'2019-11-15 16:15:00','2019-11-15 17:05:46',0.00,0.00,'basso','linea utente',NULL,4,'3694453264','Il modem ha problemi con la accensione'),(8,'2019-12-03 10:17:59','2019-12-04 12:45:06',0.00,0.00,'basso','linea utente',NULL,2,'3905542440','Segnale wi-fi assente'),(9,'2020-02-23 08:14:07','2020-02-23 16:35:40',0.00,0.00,'alto','linea utente',NULL,8,'3452784554','Segnale telefonico assente, avvistamento incendio nei dintorni'),(10,'2020-02-23 09:14:44','2020-02-23 16:15:41',0.00,0.00,'alto','centrale',22,NULL,NULL,NULL),(11,'2020-07-03 06:40:45','2020-07-03 18:15:43',0.00,0.00,'medio','linea utente',NULL,12,'0392445743','Segnale internet e telefonico completamente assenti'),(12,'2020-07-03 07:13:15','2020-07-03 17:30:34',0.00,0.00,'medio','centrale',13,NULL,NULL,NULL),(13,'2020-07-15 14:30:15','2020-07-25 06:06:20',-25.00,0.00,'medio','linea utente',NULL,10,'3493355262','Il telefono non permette di effettuare e ricevere chiamate'),(14,'2020-07-17 07:15:55','2020-07-24 14:45:37',0.00,0.00,'medio','centrale',3,NULL,NULL,NULL),(15,'2020-08-30 12:16:18','2020-08-31 07:05:23',-10.00,0.00,'basso','linea utente',NULL,15,'3375833299','Il modem presenta problemi di incompatibilita con i ripetitori wi-fi'),(16,'2020-10-01 09:10:43','2020-10-02 07:16:25',0.00,0.00,'alto','linea utente',NULL,11,'3924577889','linea isolata'),(17,'2020-10-01 10:34:23','2020-10-02 06:15:47',0.00,0.00,'alto','centrale',8,NULL,NULL,NULL),(18,'2020-12-30 17:30:35',NULL,0.00,0.00,'medio','linea utente',NULL,6,'3795267883','segnale telefonico assente'),(19,'2020-12-31 07:40:35',NULL,0.00,0.00,'medio','centrale',12,NULL,NULL,NULL),(20,'2021-01-02 08:03:12',NULL,0.00,0.00,'medio','linea utente',NULL,4,'3694453264','segnale acustico assente'),(21,'2021-01-03 07:15:31',NULL,0.00,0.00,'medio','centrale',17,NULL,NULL,NULL);
/*!40000 ALTER TABLE `guasto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impianto`
--

DROP TABLE IF EXISTS `impianto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impianto` (
  `Codice` int NOT NULL AUTO_INCREMENT,
  `Stato` enum('attivo','malfunzionante') NOT NULL DEFAULT 'attivo',
  `Tipo` enum('Fibra Ottica','Linea Rame','Piastra Utente') NOT NULL,
  PRIMARY KEY (`Codice`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impianto`
--

LOCK TABLES `impianto` WRITE;
/*!40000 ALTER TABLE `impianto` DISABLE KEYS */;
INSERT INTO `impianto` VALUES (1,'attivo','Fibra Ottica'),(2,'attivo','Fibra Ottica'),(3,'attivo','Linea Rame'),(4,'attivo','Piastra Utente'),(5,'attivo','Linea Rame'),(6,'attivo','Linea Rame'),(7,'attivo','Linea Rame'),(8,'attivo','Piastra Utente'),(9,'attivo','Piastra Utente'),(10,'attivo','Fibra Ottica'),(11,'attivo','Fibra Ottica'),(12,'malfunzionante','Fibra Ottica'),(13,'attivo','Linea Rame'),(14,'attivo','Linea Rame'),(15,'attivo','Piastra Utente'),(16,'attivo','Piastra Utente'),(17,'malfunzionante','Fibra Ottica'),(18,'attivo','Fibra Ottica'),(19,'attivo','Linea Rame'),(20,'attivo','Fibra Ottica'),(21,'attivo','Fibra Ottica'),(22,'attivo','Linea Rame'),(23,'attivo','Fibra Ottica'),(24,'attivo','Linea Rame');
/*!40000 ALTER TABLE `impianto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modem`
--

DROP TABLE IF EXISTS `modem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modem` (
  `CSeriale` char(11) NOT NULL,
  `Numero` char(10) NOT NULL,
  `Tipo` enum('ADSL','VDSL') DEFAULT NULL,
  PRIMARY KEY (`CSeriale`),
  CONSTRAINT `modem_chk_1` CHECK ((`CSeriale` like _cp850'___________'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modem`
--

LOCK TABLES `modem` WRITE;
/*!40000 ALTER TABLE `modem` DISABLE KEYS */;
INSERT INTO `modem` VALUES ('AJ2835IYG44','0955209212','ADSL'),('AK2098DLK89','0987347658','ADSL'),('AZ6057KOJ23','0385573753','VDSL'),('FD5466OHT23','0418342762','ADSL'),('GT4738AZU47','0700287785','VDSL'),('HG3452LKJ12','0665914616','VDSL'),('KJ5032WSA18','0728713830','VDSL'),('LE6784WQO20','0310872921','ADSL'),('LK6087FGE30','0745224825','ADSL'),('OE4578TRE44','0401135926','VDSL'),('OT3209LIU11','0878646306','VDSL'),('PL3065ASW13','0215378460','VDSL'),('PO3309KKF66','0781922649','ADSL'),('PT5743QIU02','0880318625','ADSL'),('TU5503EOQ45','0998095194','VDSL');
/*!40000 ALTER TABLE `modem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offerta`
--

DROP TABLE IF EXISTS `offerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offerta` (
  `Nome` varchar(30) NOT NULL,
  `CostoMens` decimal(4,2) NOT NULL,
  `CostoAtt` decimal(4,2) NOT NULL,
  PRIMARY KEY (`Nome`),
  CONSTRAINT `offerta_chk_1` CHECK ((`CostoMens` > 0)),
  CONSTRAINT `offerta_chk_2` CHECK ((`CostoAtt` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offerta`
--

LOCK TABLES `offerta` WRITE;
/*!40000 ALTER TABLE `offerta` DISABLE KEYS */;
INSERT INTO `offerta` VALUES ('Absolute ADSL',29.90,20.90),('Absolute VDSL',19.90,25.90),('Fibra Unlimited',34.99,40.90),('Piu Fibra',24.99,27.90),('Super Fibra',28.99,25.90),('Ultra ADSL',15.99,18.90),('Ultrainternet Fibra',27.99,25.90);
/*!40000 ALTER TABLE `offerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riparazione`
--

DROP TABLE IF EXISTS `riparazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riparazione` (
  `CodTecnico` int NOT NULL,
  `CodGuasto` int NOT NULL,
  `CodAttrezzatura` varchar(30) DEFAULT NULL,
  `Stato` enum('in corso','effettuata') NOT NULL DEFAULT 'in corso',
  PRIMARY KEY (`CodTecnico`,`CodGuasto`),
  KEY `CodGuasto` (`CodGuasto`),
  KEY `CodAttrezzatura` (`CodAttrezzatura`),
  CONSTRAINT `riparazione_ibfk_1` FOREIGN KEY (`CodTecnico`) REFERENCES `tecnico` (`Codice`) ON UPDATE CASCADE,
  CONSTRAINT `riparazione_ibfk_2` FOREIGN KEY (`CodGuasto`) REFERENCES `guasto` (`Codice`) ON UPDATE CASCADE,
  CONSTRAINT `riparazione_ibfk_3` FOREIGN KEY (`CodAttrezzatura`) REFERENCES `attrezzatura` (`Codice`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riparazione`
--

LOCK TABLES `riparazione` WRITE;
/*!40000 ALTER TABLE `riparazione` DISABLE KEYS */;
INSERT INTO `riparazione` VALUES (1,3,NULL,'effettuata'),(1,4,NULL,'effettuata'),(1,6,NULL,'effettuata'),(1,9,NULL,'effettuata'),(1,11,NULL,'effettuata'),(2,1,NULL,'effettuata'),(2,2,NULL,'effettuata'),(3,7,NULL,'effettuata'),(3,15,NULL,'effettuata'),(3,16,NULL,'effettuata'),(4,13,NULL,'effettuata'),(4,18,NULL,'in corso'),(5,5,NULL,'effettuata'),(5,8,'RicambiModemVDSL','effettuata'),(5,20,NULL,'in corso'),(6,3,'ModemADSL','effettuata'),(6,4,'ModemVDSL','effettuata'),(6,13,NULL,'effettuata'),(6,15,'ModemVDSL','effettuata'),(6,20,NULL,'in corso'),(7,1,NULL,'effettuata'),(7,2,'RicambiModemADSL','effettuata'),(8,6,'RicambiModemVDSL','effettuata'),(8,9,NULL,'effettuata'),(8,11,NULL,'effettuata'),(8,16,NULL,'effettuata'),(8,18,NULL,'in corso'),(9,21,'FibraOttica100mt','in corso'),(10,19,'FibraOttica30mt','in corso'),(11,10,'CavoRame10mt','effettuata'),(11,12,'CavoRame2mt','effettuata'),(11,14,'CavoRame15mt','effettuata'),(15,17,'RicambiPiastraUtente','effettuata');
/*!40000 ALTER TABLE `riparazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico` (
  `Codice` int NOT NULL AUTO_INCREMENT,
  `CF` char(16) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  `DataNasc` date NOT NULL,
  `Ruolo` enum('interno','esterno') NOT NULL,
  `Skill` enum('base','giuntista','centrale telefonica') NOT NULL,
  `Via` varchar(30) NOT NULL,
  `Ncivico` int NOT NULL,
  `Cap` int NOT NULL,
  `Citta` varchar(30) NOT NULL,
  `NguastiRip` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Codice`),
  CONSTRAINT `tecnico_chk_1` CHECK ((`CF` like _cp850'________________'))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico`
--

LOCK TABLES `tecnico` WRITE;
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
INSERT INTO `tecnico` VALUES (1,'SSSNLM70C03G273K','Anselmo','Sassi','1970-03-30','interno','base','via Leopardi',30,23098,'Rovereto',5),(2,'BTTHLN77C47D612H','Helen','Bettini','1977-03-07','interno','base','via Asiaghi',23,94387,'Firenze',2),(3,'BRNVSS65P44F205F','Vanessa','Barone','1965-09-04','interno','base','via Lonelli',87,4392,'Milano',3),(4,'CSTLBN85A28A944T','Albano','Castellani','1985-01-28','interno','base','via Giusti',56,51235,'Torino',1),(5,'MRCDZN62C63C351K','Domiziana','Marchesi','1962-03-23','interno','base','via Orante',26,16537,'Catania',2),(6,'DNILCN78D25L219W','Luciano','Diana','1978-04-25','esterno','base','via Onesti',57,62850,'Torino',4),(7,'LLLRCC72L29H501P','Rocco','Lolli','1972-07-29','esterno','base','via Destri',43,96734,'Roma',2),(8,'DMRNIO94E01A662N','Ione','Demarchi','1994-05-01','esterno','base','via Pantini',55,87564,'Bari',4),(9,'RCCBTN85A26D969U','Ubertino','Ricci','1985-01-26','esterno','giuntista','via Ungaretti',34,86243,'Genova',0),(10,'CTLVVN92L47L736Q','Viviana','Catalano','1992-07-07','esterno','giuntista','via Gireni',19,58329,'Venezia',0),(11,'MGNGNN87T04F839D','Gianni','Magnani','1987-12-04','esterno','giuntista','via Manzoni',85,74632,'Napoli',3),(12,'DPTNNN89L48G273O','Antonina','DiPietro','1989-07-08','esterno','centrale telefonica','via Pirandello',65,27398,'Palermo',0),(13,'PLNGPP83E14L736D','Giuseppe','Paolini','1983-05-14','esterno','centrale telefonica','via Quasimodo',11,34023,'Venezia',0),(14,'RGGSST80P13C351Y','Sebastiano','Ruggeri','1980-09-13','esterno','centrale telefonica','via Parini',20,96312,'Catania',0),(15,'RNLLVI75H02A944G','Livio','Rinaldi','1975-06-02','esterno','centrale telefonica','via Leonardi',21,45025,'Bologna',1);
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-05 17:39:50
