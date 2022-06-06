CREATE DATABASE  IF NOT EXISTS `eokul` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `eokul`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: eokul
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `ders`
--

DROP TABLE IF EXISTS `ders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ders` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DersKodu` varchar(5) NOT NULL,
  `DersAdi` varchar(45) NOT NULL,
  `DersSaati` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `DersKodu_UNIQUE` (`DersKodu`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ders`
--

LOCK TABLES `ders` WRITE;
/*!40000 ALTER TABLE `ders` DISABLE KEYS */;
INSERT INTO `ders` VALUES (1,'MAT10','Matematik',12),(3,'NTP10','Nesne Tabanlı Programlama',10),(4,'PRT09','Programlama Temelleri',4),(5,'FİZ10','Fizik',10),(6,'NTP12','Nesne Tabanlı Programlama1',5),(9,'TAR10','Tarih',2),(10,'RES11','Resim',4);
/*!40000 ALTER TABLE `ders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogrenci`
--

DROP TABLE IF EXISTS `ogrenci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ogrenci` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Ad` varchar(45) NOT NULL,
  `Soyad` varchar(45) NOT NULL,
  `OkulNo` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `OkulNo_UNIQUE` (`OkulNo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogrenci`
--

LOCK TABLES `ogrenci` WRITE;
/*!40000 ALTER TABLE `ogrenci` DISABLE KEYS */;
INSERT INTO `ogrenci` VALUES (2,'Sezgin','ACAR',98),(3,'Elif','EKİN',65);
/*!40000 ALTER TABLE `ogrenci` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ogrencipuan`
--

DROP TABLE IF EXISTS `ogrencipuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ogrencipuan` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `OgrenciId` int NOT NULL,
  `DersId` int NOT NULL,
  `Yazili1` int DEFAULT NULL,
  `Yazili2` int DEFAULT NULL,
  `Performans1` int DEFAULT NULL,
  `Performans2` int DEFAULT NULL,
  `Ortalama` double DEFAULT NULL,
  `Durum` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ogrencipuan`
--

LOCK TABLES `ogrencipuan` WRITE;
/*!40000 ALTER TABLE `ogrencipuan` DISABLE KEYS */;
INSERT INTO `ogrencipuan` VALUES (8,3,1,56,56,7,77,49,'Kaldı'),(9,2,2,6,66,6,66,36,'Kaldı'),(11,3,3,99,99,99,99,99,'Geçti'),(12,2,5,56,56,7,77,49,'Kaldı'),(13,2,4,77,77,66,55,68.75,'Geçti'),(14,2,9,87,87,66,66,76.5,'Geçti'),(15,2,6,85,85,66,44,70,'Geçti');
/*!40000 ALTER TABLE `ogrencipuan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-26 12:54:12
