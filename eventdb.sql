-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (x86_64)
--
-- Host: localhost    Database: eventdb
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `useremail` varchar(255) DEFAULT NULL,
  `Eventid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_1_idx` (`useremail`),
  KEY `fk_cart_2_idx` (`Eventid`),
  CONSTRAINT `fk_cart_1` FOREIGN KEY (`useremail`) REFERENCES `user` (`email`),
  CONSTRAINT `fk_cart_2` FOREIGN KEY (`Eventid`) REFERENCES `Event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (35,'admin@flyseum.org',3);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Event`
--

DROP TABLE IF EXISTS `Event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Ename` varchar(45) NOT NULL,
  `Edes` varchar(1000) NOT NULL,
  `venue` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `participants` int NOT NULL DEFAULT '0',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Event`
--

LOCK TABLES `Event` WRITE;
/*!40000 ALTER TABLE `Event` DISABLE KEYS */;
INSERT INTO `Event` VALUES (1,'Event','Wedding','Hotel1','2021-08-15 10:20:00',0,0.00),(2,'Event','Conferences','Hotel2','2021-07-31 12:30:00',0,0.00),(3,'Event','Festival','Hotel4','2021-09-10 06:00:00',0,55555.00),(4,'Event','Symposiums','Hotel6','2021-10-18 20:20:00',0,0.00),(5,'Event','Birthday Parties','Hotel3','2021-09-10 11:20:00',0,0.00),(18,'Event','Film Festivals','Hotel6','2023-10-26 01:57:00',0,6000.00),(19,'Event','Product Launches','Hotel2','2023-10-28 08:58:00',0,33333.00);
/*!40000 ALTER TABLE `Event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `email` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(25) NOT NULL,
  `surname` varchar(25) NOT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `role` varchar(5) DEFAULT 'user',
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin@flyseum.org','Oems123','Oemsadmin','admin','1234567890','admin'),('lasa@gmail.com','lg189899','Lasantha','Gayan',NULL,'user'),('trapanatore@kenya.it','testing123','Giovanni','Paolino',NULL,'user');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usrbooking`
--

DROP TABLE IF EXISTS `usrbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usrbooking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` char(2) NOT NULL DEFAULT 'ar',
  `useremail` varchar(255) NOT NULL,
  `goflightid` int NOT NULL,
  `backflightid` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usrbooking_1_idx` (`useremail`),
  KEY `fk_usrbooking_2_idx` (`goflightid`),
  KEY `fk_usrbooking_3_idx` (`backflightid`),
  CONSTRAINT `fk_usrbooking_1` FOREIGN KEY (`useremail`) REFERENCES `user` (`email`),
  CONSTRAINT `fk_usrbooking_2` FOREIGN KEY (`goflightid`) REFERENCES `Event` (`id`),
  CONSTRAINT `fk_usrbooking_3` FOREIGN KEY (`backflightid`) REFERENCES `Event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usrbooking`
--

LOCK TABLES `usrbooking` WRITE;
/*!40000 ALTER TABLE `usrbooking` DISABLE KEYS */;
INSERT INTO `usrbooking` VALUES (1,'ao','admin@flyseum.org',1,1);
/*!40000 ALTER TABLE `usrbooking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-24 12:24:48
