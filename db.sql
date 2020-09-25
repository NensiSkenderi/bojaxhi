CREATE DATABASE  IF NOT EXISTS `toner` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `toner`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: toner
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `arketuar`
--

DROP TABLE IF EXISTS `arketuar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arketuar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menyra` varchar(16) NOT NULL,
  `klient_id` int NOT NULL,
  `created_date` date DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  KEY `fk_arketuar_klient_idx` (`klient_id`),
  CONSTRAINT `fk_arketuar_klient` FOREIGN KEY (`klient_id`) REFERENCES `klient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arketuar`
--

LOCK TABLES `arketuar` WRITE;
/*!40000 ALTER TABLE `arketuar` DISABLE KEYS */;
/*!40000 ALTER TABLE `arketuar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bojra`
--

DROP TABLE IF EXISTS `bojra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bojra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emri` text NOT NULL,
  `created_date` date DEFAULT (curdate()),
  `lloji_bojes_id` int DEFAULT NULL,
  `sasia` double DEFAULT '0',
  `cmimi` double DEFAULT '0',
  `vlear` double DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_bojra__idx` (`lloji_bojes_id`),
  CONSTRAINT `bojra_ibfk_1` FOREIGN KEY (`lloji_bojes_id`) REFERENCES `lloji_bojra` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bojra`
--

LOCK TABLES `bojra` WRITE;
/*!40000 ALTER TABLE `bojra` DISABLE KEYS */;
/*!40000 ALTER TABLE `bojra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura`
--

DROP TABLE IF EXISTS `fatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fatura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lloji_fatures` varchar(32) NOT NULL,
  `klient_id` int NOT NULL,
  `created_date` date DEFAULT (curdate()),
  `arketim_id` int DEFAULT NULL,
  `date_likujduar` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `klient_id` (`klient_id`),
  KEY `arketim_id` (`arketim_id`),
  CONSTRAINT `fatura_ibfk_1` FOREIGN KEY (`klient_id`) REFERENCES `klient` (`id`),
  CONSTRAINT `fatura_ibfk_2` FOREIGN KEY (`arketim_id`) REFERENCES `arketuar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura`
--

LOCK TABLES `fatura` WRITE;
/*!40000 ALTER TABLE `fatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `fatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klient`
--

DROP TABLE IF EXISTS `klient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `klienti` text NOT NULL,
  `nipt` varchar(16) DEFAULT NULL,
  `created_date` date DEFAULT (curdate()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klient`
--

LOCK TABLES `klient` WRITE;
/*!40000 ALTER TABLE `klient` DISABLE KEYS */;
/*!40000 ALTER TABLE `klient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lloji_bojra`
--

DROP TABLE IF EXISTS `lloji_bojra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lloji_bojra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lloji_bojes` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lloji_bojra`
--

LOCK TABLES `lloji_bojra` WRITE;
/*!40000 ALTER TABLE `lloji_bojra` DISABLE KEYS */;
/*!40000 ALTER TABLE `lloji_bojra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-25 17:52:13