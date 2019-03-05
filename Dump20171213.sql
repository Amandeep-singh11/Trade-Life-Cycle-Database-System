CREATE DATABASE  IF NOT EXISTS `dbfinal` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbfinal`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: dbfinal
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `BookingId` int(11) NOT NULL AUTO_INCREMENT,
  `CounterpartyId` int(11) NOT NULL,
  `DealNo` int(11) NOT NULL,
  `BookedDate` date NOT NULL,
  `RecievedDate` date NOT NULL,
  `BookingAmount` decimal(15,2) NOT NULL,
  `Currency` varchar(45) NOT NULL,
  `RegionId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `SpecialistId` int(11) NOT NULL,
  `Cfactor` float NOT NULL,
  `SettledAmount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`BookingId`),
  UNIQUE KEY `DealNo_UNIQUE` (`DealNo`),
  KEY `counterpartyId_idx` (`CounterpartyId`),
  KEY `regionId_idx` (`RegionId`),
  KEY `productId_idx` (`ProductId`),
  KEY `specialistId_idx` (`SpecialistId`),
  CONSTRAINT `counterpartyId` FOREIGN KEY (`CounterpartyId`) REFERENCES `counterparty` (`ConterpartyId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `productId` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `regionId` FOREIGN KEY (`RegionId`) REFERENCES `region` (`RegionId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `specialistId` FOREIGN KEY (`SpecialistId`) REFERENCES `specialist` (`SpecialistId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,1122,'2017-11-05','2017-11-12',150000.00,'USD',1,1,1,1,150000.00),(2,2,2233,'2017-11-10','2017-11-11',145000.00,'EUR',2,2,2,1.28,140000.00),(3,3,3344,'2017-11-15','2017-11-26',165000.00,'JPY',3,3,3,0.008,165000.00),(4,4,4455,'2017-11-22','2017-11-25',45000.00,'GBP',1,4,4,1.33,45000.00),(5,5,5566,'2017-12-01','2017-12-17',110000.00,'USD',2,1,5,1,100000.00),(6,6,6677,'2017-12-11','2017-12-19',55000.00,'EUR',3,2,6,1.28,55000.00),(7,1,5577,'2017-12-12','2017-12-25',100000.00,'GBP',1,3,1,1.33,95000.00),(8,1,5588,'2017-12-12','2017-12-25',100000.00,'GBP',1,3,1,1.33,95000.00),(9,2,5469,'2017-12-15','2017-12-26',150000.00,'USD',2,2,6,1,120000.00),(10,2,5556,'2017-12-15','2017-12-26',150000.00,'USD',1,1,1,1,120000.00),(11,4,8521,'2017-12-19','2017-12-30',125000.00,'JPY',3,3,2,0.008,120000.00),(12,2,5497,'2017-12-22','2017-12-26',120000.00,'USD',1,1,1,1,119000.00),(13,5,8887,'2017-12-11','2017-12-26',110000.00,'GBP',2,2,2,1.33,100000.00),(14,6,7461,'2017-12-15','2017-12-17',150000.00,'USD',1,2,1,1,140000.00),(15,5,1116,'2017-11-15','2017-11-25',14000.00,'USD',1,1,1,1,12000.00),(16,4,4489,'2017-12-13','2017-12-27',100000.00,'GBP',2,3,2,1.33,99000.00),(17,5,1123,'2017-12-13','2017-12-27',100000.00,'USD',2,2,2,1,100000.00),(18,6,3214,'2017-11-11','2017-11-29',172000.00,'GBP',3,3,5,1.33,170000.00);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dbfinal`.`booking_AFTER_INSERT` AFTER INSERT ON `booking` FOR EACH ROW
BEGIN
    CALL `dbfinal`.`proc_age`(new.BookingId);
    CALL proc_usdeq (new.BookingId);
	CALL proc_amountdiff(new.BookingId, new.CounterpartyId);


    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `buss`
--

DROP TABLE IF EXISTS `buss`;
/*!50001 DROP VIEW IF EXISTS `buss`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `buss` AS SELECT 
 1 AS `SpecialistId`,
 1 AS `business`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cassreport`
--

DROP TABLE IF EXISTS `cassreport`;
/*!50001 DROP VIEW IF EXISTS `cassreport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cassreport` AS SELECT 
 1 AS `name`,
 1 AS `BookingId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `counterparty`
--

DROP TABLE IF EXISTS `counterparty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counterparty` (
  `ConterpartyId` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `TypeId` int(11) NOT NULL,
  PRIMARY KEY (`ConterpartyId`),
  KEY `typeId_idx` (`TypeId`),
  CONSTRAINT `typeId` FOREIGN KEY (`TypeId`) REFERENCES `counterpartytype` (`TypeId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counterparty`
--

LOCK TABLES `counterparty` WRITE;
/*!40000 ALTER TABLE `counterparty` DISABLE KEYS */;
INSERT INTO `counterparty` VALUES (1,'CITI',3),(2,'JP MORGAN',1),(3,'GOLDMAN SACHS',2),(4,'BNP PARIBAS',1),(5,'STATE STREET',3),(6,'WELLS FARGO',2);
/*!40000 ALTER TABLE `counterparty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counterpartytype`
--

DROP TABLE IF EXISTS `counterpartytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counterpartytype` (
  `TypeId` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(45) NOT NULL,
  `Descripation` varchar(85) NOT NULL,
  PRIMARY KEY (`TypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counterpartytype`
--

LOCK TABLES `counterpartytype` WRITE;
/*!40000 ALTER TABLE `counterpartytype` DISABLE KEYS */;
INSERT INTO `counterpartytype` VALUES (1,'Broker Dealer','Brokers Clients'),(2,'Non Broker','Nonbroker clients'),(3,'Premium Clients','Premium Clients');
/*!40000 ALTER TABLE `counterpartytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencyconverter`
--

DROP TABLE IF EXISTS `currencyconverter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencyconverter` (
  `Currency` varchar(45) NOT NULL,
  `Cfactor` float NOT NULL,
  PRIMARY KEY (`Cfactor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencyconverter`
--

LOCK TABLES `currencyconverter` WRITE;
/*!40000 ALTER TABLE `currencyconverter` DISABLE KEYS */;
INSERT INTO `currencyconverter` VALUES ('JPY',0.008),('USD',1),('EUR',1.28),('GBP',1.33);
/*!40000 ALTER TABLE `currencyconverter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `defaulterscount`
--

DROP TABLE IF EXISTS `defaulterscount`;
/*!50001 DROP VIEW IF EXISTS `defaulterscount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `defaulterscount` AS SELECT 
 1 AS `no`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `due`
--

DROP TABLE IF EXISTS `due`;
/*!50001 DROP VIEW IF EXISTS `due`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `due` AS SELECT 
 1 AS `sum(tradestatus.AmountDiff)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `failreport`
--

DROP TABLE IF EXISTS `failreport`;
/*!50001 DROP VIEW IF EXISTS `failreport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `failreport` AS SELECT 
 1 AS `name`,
 1 AS `BookingId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `highvalue1`
--

DROP TABLE IF EXISTS `highvalue1`;
/*!50001 DROP VIEW IF EXISTS `highvalue1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `highvalue1` AS SELECT 
 1 AS `name`,
 1 AS `BookingId`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `highvaluereport`
--

DROP TABLE IF EXISTS `highvaluereport`;
/*!50001 DROP VIEW IF EXISTS `highvaluereport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `highvaluereport` AS SELECT 
 1 AS `name`,
 1 AS `BookingId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `LoginId` int(11) NOT NULL,
  `Time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LoginId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,NULL),(2,NULL),(3,NULL),(4,NULL),(5,NULL),(6,NULL),(7,'2017-12-13 15:43:38');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `marginfails`
--

DROP TABLE IF EXISTS `marginfails`;
/*!50001 DROP VIEW IF EXISTS `marginfails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `marginfails` AS SELECT 
 1 AS `name`,
 1 AS `BookingId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `ProductId` int(11) NOT NULL AUTO_INCREMENT,
  `Product Type` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Swaps','Trades of swaps products'),(2,'Margins','Trades of margin products'),(3,'Broker Fee','Trades related to broker fee'),(4,'Coupons','Trades for coupons');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `RegionId` int(11) NOT NULL AUTO_INCREMENT,
  `RegionName` varchar(45) NOT NULL,
  `Description` varchar(95) NOT NULL,
  PRIMARY KEY (`RegionId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'SSB','Asian market products'),(2,'OA','London region products'),(3,'NY','Newyork region products');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `regionbooking`
--

DROP TABLE IF EXISTS `regionbooking`;
/*!50001 DROP VIEW IF EXISTS `regionbooking`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `regionbooking` AS SELECT 
 1 AS `RegionName`,
 1 AS `count(booking.BookingId)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `specialist`
--

DROP TABLE IF EXISTS `specialist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialist` (
  `SpecialistId` int(11) NOT NULL AUTO_INCREMENT,
  `LoginId` int(11) NOT NULL,
  `TypeId` int(11) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Active` varchar(45) NOT NULL,
  `GroupId` int(11) NOT NULL,
  PRIMARY KEY (`SpecialistId`),
  KEY `loginId_idx` (`LoginId`),
  KEY `typeId_idx` (`TypeId`),
  KEY `groupid_idx` (`GroupId`),
  CONSTRAINT `loginId` FOREIGN KEY (`LoginId`) REFERENCES `login` (`LoginId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialist`
--

LOCK TABLES `specialist` WRITE;
/*!40000 ALTER TABLE `specialist` DISABLE KEYS */;
INSERT INTO `specialist` VALUES (1,1,2,'aman@husky.com','aman','aman','Active',1),(2,2,1,'shreya@husky.com','shreya','shreya','Active',2),(3,3,2,'sreerag@husky.com','sreerag','sreerag','Active',1),(4,4,1,'aahana@husky.com','aahana','aahana','Non Active',2),(5,5,2,'eklavya@husky.com','eklavya','eklavya','Active',1),(6,6,1,'ankur@husky.com','ankur','ankur','Non Active',2);
/*!40000 ALTER TABLE `specialist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `specialistbusiness`
--

DROP TABLE IF EXISTS `specialistbusiness`;
/*!50001 DROP VIEW IF EXISTS `specialistbusiness`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `specialistbusiness` AS SELECT 
 1 AS `username`,
 1 AS `Active`,
 1 AS `business`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `specialistgroup`
--

DROP TABLE IF EXISTS `specialistgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialistgroup` (
  `GroupId` int(11) NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(45) NOT NULL,
  PRIMARY KEY (`GroupId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialistgroup`
--

LOCK TABLES `specialistgroup` WRITE;
/*!40000 ALTER TABLE `specialistgroup` DISABLE KEYS */;
INSERT INTO `specialistgroup` VALUES (1,'Broker Dealer Settlement'),(2,'Non Broker Settlement');
/*!40000 ALTER TABLE `specialistgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialisttype`
--

DROP TABLE IF EXISTS `specialisttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialisttype` (
  `TypeId` int(11) NOT NULL,
  `SpecialistType` varchar(45) NOT NULL,
  `Description` varchar(105) NOT NULL,
  PRIMARY KEY (`TypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialisttype`
--

LOCK TABLES `specialisttype` WRITE;
/*!40000 ALTER TABLE `specialisttype` DISABLE KEYS */;
INSERT INTO `specialisttype` VALUES (1,'Swap Specialist','Specilist that settles trades  of Swap products'),(2,'Margin Specialist','Specilist that settles trades for margin product'),(3,'Broker fee Specialist','Specilist that settles trades for broker fee');
/*!40000 ALTER TABLE `specialisttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BookingId` int(11) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `CounterpartyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Bid_idx` (`BookingId`),
  KEY `Cid_idx` (`CounterpartyId`),
  CONSTRAINT `Bid` FOREIGN KEY (`BookingId`) REFERENCES `booking` (`BookingId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Cid` FOREIGN KEY (`CounterpartyId`) REFERENCES `counterparty` (`ConterpartyId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,1,'Confirmed',1),(2,2,'Exclude Confirmed',2),(3,3,'Confirmed',3),(4,4,'Confirmed',4),(5,5,'Exclude Confirmed',5),(6,6,'Confirmed',6),(7,7,'Exclude Confirmed',1),(8,8,'Exclude Confirmed',1),(9,9,'Exclude Confirmed',2),(10,10,'Exclude Confirmed',2),(11,11,'Exclude Confirmed',4),(12,12,'Exclude Confirmed',2),(13,13,'Exclude Confirmed',5),(14,14,'Exclude Confirmed',6),(15,15,'Exclude Confirmed',5),(16,16,'Exclude Confirmed',4),(17,17,'Confirmed',5),(18,18,'Exclude Confirmed',6);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `dbfinal`.`status_AFTER_INSERT` AFTER INSERT ON `status` FOR EACH ROW
BEGIN

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `temp`
--

DROP TABLE IF EXISTS `temp`;
/*!50001 DROP VIEW IF EXISTS `temp`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `temp` AS SELECT 
 1 AS `username`,
 1 AS `GroupId`,
 1 AS `business`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `temp2`
--

DROP TABLE IF EXISTS `temp2`;
/*!50001 DROP VIEW IF EXISTS `temp2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `temp2` AS SELECT 
 1 AS `GroupId`,
 1 AS `sum(temp.business)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `totalbookedamount`
--

DROP TABLE IF EXISTS `totalbookedamount`;
/*!50001 DROP VIEW IF EXISTS `totalbookedamount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `totalbookedamount` AS SELECT 
 1 AS `TotalBooking`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `totalsettledamount`
--

DROP TABLE IF EXISTS `totalsettledamount`;
/*!50001 DROP VIEW IF EXISTS `totalsettledamount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `totalsettledamount` AS SELECT 
 1 AS `TotalSettled`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tradelevel`
--

DROP TABLE IF EXISTS `tradelevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tradelevel` (
  `TradeId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BookingId` int(11) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `USDEquivalent` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`TradeId`),
  KEY `BookingId_idx` (`BookingId`),
  CONSTRAINT `BookingId` FOREIGN KEY (`BookingId`) REFERENCES `booking` (`BookingId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tradelevel`
--

LOCK TABLES `tradelevel` WRITE;
/*!40000 ALTER TABLE `tradelevel` DISABLE KEYS */;
INSERT INTO `tradelevel` VALUES (1,1,7,150000.00),(2,2,1,185600.00),(3,3,11,1320.00),(4,4,3,59850.00),(5,5,16,110000.00),(6,6,8,70400.00),(7,7,13,133000.00),(8,8,13,133000.00),(9,9,11,150000.00),(10,10,11,150000.00),(11,11,11,1000.00),(12,12,4,120000.00),(13,13,15,146300.00),(14,14,2,150000.00),(15,15,10,14000.00),(16,16,14,133000.00),(17,17,14,100000.00),(18,18,18,228760.00);
/*!40000 ALTER TABLE `tradelevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tradestatus`
--

DROP TABLE IF EXISTS `tradestatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tradestatus` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BookingId` int(11) NOT NULL,
  `AmountDiff` decimal(15,2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `BookingId_idx` (`BookingId`),
  CONSTRAINT `bookingid_status` FOREIGN KEY (`BookingId`) REFERENCES `booking` (`BookingId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tradestatus`
--

LOCK TABLES `tradestatus` WRITE;
/*!40000 ALTER TABLE `tradestatus` DISABLE KEYS */;
INSERT INTO `tradestatus` VALUES (1,1,0.00),(2,2,5000.00),(3,3,0.00),(4,4,0.00),(5,5,10000.00),(6,6,0.00),(7,7,5000.00),(8,8,5000.00),(9,9,30000.00),(10,10,30000.00),(11,11,5000.00),(12,12,1000.00),(13,13,10000.00),(14,14,10000.00),(15,15,2000.00),(16,16,-890000.00),(17,17,0.00),(18,18,2000.00);
/*!40000 ALTER TABLE `tradestatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbfinal'
--

--
-- Dumping routines for database 'dbfinal'
--
/*!50003 DROP PROCEDURE IF EXISTS `proc_age` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_age`(IN par_bookingId int)
BEGIN
DECLARE var_age int ;
DECLARE var_receiveddate date;
DECLARE var_bookeddate date;

select booking.RecievedDate into var_receiveddate from booking where booking.BookingId = par_bookingId;
select booking.BookedDate into var_bookeddate from booking where booking.BookingId = par_bookingId;

set var_age = var_receiveddate - var_bookeddate;

INSERT INTO `dbfinal`.`tradelevel` (`Age`,`Bookingid`) VALUES (var_age,par_bookingId);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_amountdiff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_amountdiff`(IN par_bookingId int, IN par_counterID int)
BEGIN
DECLARE var_difference decimal;
DECLARE var_bookedamount decimal;
DECLARE var_settledamount decimal;


select booking.BookingAmount into var_bookedamount from booking where booking.BookingId = par_bookingId;
select booking.SettledAmount into var_settledamount from booking where booking.BookingId = par_bookingId;

set var_difference = var_bookedamount - var_settledamount;

INSERT INTO `dbfinal`.`tradestatus` (`AmountDiff`,`Bookingid`) VALUES (var_difference,par_bookingId);

INSERT INTO `dbfinal`.`status` (`BookingId`, `Status`, `CounterpartyId`) VALUES (par_bookingId
		, IF(var_difference=0,'Confirmed','Exclude Confirmed'), par_counterID);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_cc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_cc`(IN par_Currency varchar(45))
BEGIN

DECLARE var_factor float;

select case
when par_currency = 'USD' then var_factor=1
when par_currency = 'EUR' then var_factor=1.28
when par_currency = 'GBP' then var_factor=1.33
else var_factor = 0.008

end;

INSERT INTO `dbfinal`.`Booking` (`Cfactor`) VALUES (var_factor);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_status`(IN par_difference decimal)
BEGIN

DECLARE var_status varchar(45);

select case
when par_difference = 0 then var_status='Confirmed'
else var_status = 'Exclude Confirmed' 
end;

INSERT INTO `dbfinal`.`status` (`Status`) VALUES (var_status);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_usdeq` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_usdeq`(IN par_bookingId int)
BEGIN
DECLARE var_usdeq decimal ;
DECLARE var_bookingamount decimal ;
DECLARE var_cfator float;

select booking.bookingAmount into var_bookingamount from booking where booking.BookingId = par_bookingId;
select booking.Cfactor into var_cfator from booking where booking.BookingId = par_bookingId;

set var_usdeq = var_bookingamount * var_cfator;

update `dbfinal`.`tradelevel` SET `USDEquivalent` = (var_usdeq) WHERE tradelevel.BookingId = par_bookingId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `buss`
--

/*!50001 DROP VIEW IF EXISTS `buss`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `buss` AS select `booking`.`SpecialistId` AS `SpecialistId`,sum(`tradelevel`.`USDEquivalent`) AS `business` from (`booking` join `tradelevel` on((`booking`.`BookingId` = `tradelevel`.`BookingId`))) group by `booking`.`SpecialistId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cassreport`
--

/*!50001 DROP VIEW IF EXISTS `cassreport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cassreport` AS select `counterparty`.`Name` AS `name`,`booking`.`BookingId` AS `BookingId` from ((`counterparty` join `booking` on((`counterparty`.`ConterpartyId` = `booking`.`CounterpartyId`))) join `tradelevel` on(((`booking`.`BookingId` = `tradelevel`.`BookingId`) and (`tradelevel`.`Age` > 10)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `defaulterscount`
--

/*!50001 DROP VIEW IF EXISTS `defaulterscount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `defaulterscount` AS select count(`failreport`.`name`) AS `no`,`failreport`.`name` AS `name` from `failreport` group by `failreport`.`name` having (`no` > 0) order by `no` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `due`
--

/*!50001 DROP VIEW IF EXISTS `due`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `due` AS select sum(`tradestatus`.`AmountDiff`) AS `sum(tradestatus.AmountDiff)` from `tradestatus` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `failreport`
--

/*!50001 DROP VIEW IF EXISTS `failreport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `failreport` AS select `counterparty`.`Name` AS `name`,`booking`.`BookingId` AS `BookingId` from ((`counterparty` join `booking` on((`counterparty`.`ConterpartyId` = `booking`.`CounterpartyId`))) join `status` on(((`booking`.`BookingId` = `status`.`BookingId`) and (`status`.`Status` = 'Exclude Confirmed')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `highvalue1`
--

/*!50001 DROP VIEW IF EXISTS `highvalue1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `highvalue1` AS select `counterparty`.`Name` AS `name`,`booking`.`BookingId` AS `BookingId` from ((`counterparty` join `booking` on((`counterparty`.`ConterpartyId` = `booking`.`CounterpartyId`))) join `tradelevel` on(((`booking`.`BookingId` = `tradelevel`.`BookingId`) and (`tradelevel`.`USDEquivalent` > 100000)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `highvaluereport`
--

/*!50001 DROP VIEW IF EXISTS `highvaluereport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `highvaluereport` AS select `counterparty`.`Name` AS `name`,`booking`.`BookingId` AS `BookingId` from ((`counterparty` join `booking` on((`counterparty`.`ConterpartyId` = `booking`.`CounterpartyId`))) join `tradelevel` on(((`booking`.`BookingId` = `tradelevel`.`BookingId`) and (`tradelevel`.`USDEquivalent` > 100000)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `marginfails`
--

/*!50001 DROP VIEW IF EXISTS `marginfails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `marginfails` AS select `failreport`.`name` AS `name`,`booking`.`BookingId` AS `BookingId` from (`failreport` join `booking` on((`failreport`.`BookingId` = `booking`.`BookingId`))) where (`booking`.`ProductId` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `regionbooking`
--

/*!50001 DROP VIEW IF EXISTS `regionbooking`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `regionbooking` AS select `region`.`RegionName` AS `RegionName`,count(`booking`.`BookingId`) AS `count(booking.BookingId)` from (`region` join `booking` on((`region`.`RegionId` = `booking`.`RegionId`))) group by `region`.`RegionName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `specialistbusiness`
--

/*!50001 DROP VIEW IF EXISTS `specialistbusiness`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `specialistbusiness` AS select `specialist`.`username` AS `username`,`specialist`.`Active` AS `Active`,`buss`.`business` AS `business` from (`specialist` join `buss` on((`specialist`.`SpecialistId` = `buss`.`SpecialistId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `temp`
--

/*!50001 DROP VIEW IF EXISTS `temp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `temp` AS select `specialist`.`username` AS `username`,`specialist`.`GroupId` AS `GroupId`,`buss`.`business` AS `business` from (`specialist` join `buss` on((`specialist`.`SpecialistId` = `buss`.`SpecialistId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `temp2`
--

/*!50001 DROP VIEW IF EXISTS `temp2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `temp2` AS select `specialist`.`GroupId` AS `GroupId`,sum(`temp`.`business`) AS `sum(temp.business)` from (`specialist` join `temp` on((`specialist`.`GroupId` = `temp`.`GroupId`))) group by `specialist`.`GroupId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalbookedamount`
--

/*!50001 DROP VIEW IF EXISTS `totalbookedamount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalbookedamount` AS select sum(`tradelevel`.`USDEquivalent`) AS `TotalBooking` from `tradelevel` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalsettledamount`
--

/*!50001 DROP VIEW IF EXISTS `totalsettledamount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `totalsettledamount` AS select sum(`booking`.`SettledAmount`) AS `TotalSettled` from `booking` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-13 23:36:14
