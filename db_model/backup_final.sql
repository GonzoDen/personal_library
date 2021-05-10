-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: localhost    Database: personal_library
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `Authors`
--

DROP TABLE IF EXISTS `Authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Authors` (
  `author_id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `gender_id` smallint DEFAULT NULL,
  `years` year DEFAULT NULL,
  `country_id` smallint DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `gender_id` (`gender_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `authors_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `Genders` (`gender_id`) ON DELETE SET NULL,
  CONSTRAINT `authors_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `Countries` (`country_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authors`
--

LOCK TABLES `Authors` WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;
INSERT INTO `Authors` VALUES (1,'Jean-Paul Sartre',2,NULL,1),(2,'Franz Kafka',2,NULL,4),(3,'Chingiz Aitmatov',2,NULL,5),(4,'Simone de Beauvoir',1,NULL,1),(5,'Thomas More',2,NULL,2),(6,'Tomasso Campanella',2,NULL,7),(7,'Francis Bacon',2,NULL,2),(8,'George Orwell',2,NULL,2),(9,'Karl Marx',2,NULL,3);
/*!40000 ALTER TABLE `Authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorsbooks`
--

DROP TABLE IF EXISTS `authorsbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorsbooks` (
  `relationship_id` smallint NOT NULL AUTO_INCREMENT,
  `author_id` smallint DEFAULT NULL,
  `book_id` smallint DEFAULT NULL,
  PRIMARY KEY (`relationship_id`),
  KEY `book_id` (`book_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `authorsbooks_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`) ON DELETE SET NULL,
  CONSTRAINT `authorsbooks_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorsbooks`
--

LOCK TABLES `authorsbooks` WRITE;
/*!40000 ALTER TABLE `authorsbooks` DISABLE KEYS */;
INSERT INTO `authorsbooks` VALUES (1,1,3),(2,1,6),(3,2,10),(4,3,7),(5,4,9),(6,5,8),(7,6,8),(8,7,8),(9,8,5),(11,9,4);
/*!40000 ALTER TABLE `authorsbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `availabilities`
--

DROP TABLE IF EXISTS `availabilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `availabilities` (
  `availability_id` smallint NOT NULL AUTO_INCREMENT,
  `availability` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`availability_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availabilities`
--

LOCK TABLES `availabilities` WRITE;
/*!40000 ALTER TABLE `availabilities` DISABLE KEYS */;
INSERT INTO `availabilities` VALUES (1,'available'),(2,'taken'),(3,'family only'),(4,'close friends only');
/*!40000 ALTER TABLE `availabilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` smallint NOT NULL AUTO_INCREMENT,
  `title` varchar(70) DEFAULT NULL,
  `location_id` smallint DEFAULT NULL,
  `status_id` smallint DEFAULT NULL,
  `availability_id` smallint DEFAULT NULL,
  `series_id` smallint DEFAULT NULL,
  `language_id` smallint DEFAULT NULL,
  `orig_language_id` smallint DEFAULT NULL,
  `genre_id` smallint DEFAULT NULL,
  `format_id` smallint DEFAULT NULL,
  `date_added` year DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `status_id` (`status_id`),
  KEY `availability_id` (`availability_id`),
  KEY `series_id` (`series_id`),
  KEY `language_id` (`language_id`),
  KEY `orig_language_id` (`orig_language_id`),
  KEY `genre_id` (`genre_id`),
  KEY `format_id` (`format_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `Statuses` (`status_id`) ON DELETE SET NULL,
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`availability_id`) REFERENCES `Availabilities` (`availability_id`) ON DELETE SET NULL,
  CONSTRAINT `books_ibfk_3` FOREIGN KEY (`series_id`) REFERENCES `Series` (`series_id`) ON DELETE SET NULL,
  CONSTRAINT `books_ibfk_4` FOREIGN KEY (`language_id`) REFERENCES `Languages` (`language_id`) ON DELETE SET NULL,
  CONSTRAINT `books_ibfk_5` FOREIGN KEY (`orig_language_id`) REFERENCES `Languages` (`language_id`) ON DELETE SET NULL,
  CONSTRAINT `books_ibfk_6` FOREIGN KEY (`genre_id`) REFERENCES `Genres` (`genre_id`) ON DELETE SET NULL,
  CONSTRAINT `books_ibfk_7` FOREIGN KEY (`format_id`) REFERENCES `Formats` (`format_id`) ON DELETE SET NULL,
  CONSTRAINT `books_ibfk_8` FOREIGN KEY (`location_id`) REFERENCES `Locations` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (3,'Nausea',3,2,2,1,1,3,1,1,NULL),(4,'Capital',3,1,3,6,1,4,2,1,2011),(5,'1984',3,1,3,5,2,2,1,1,2019),(6,'Почтительная потаскушка. За закрытыми дверями. Грязными руками',3,2,1,3,1,3,1,2,2019),(7,'Плаха',2,1,1,2,1,1,1,1,2020),(8,'Утопия. Город Солнца. Новая Атлантида',3,1,1,7,1,NULL,1,1,NULL),(9,'Второй пол',3,3,3,4,1,3,2,1,2019),(10,'Малое собрание сочинений',3,3,3,4,1,4,1,1,2014);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Borrowers`
--

DROP TABLE IF EXISTS `Borrowers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Borrowers` (
  `borrower_id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `privilege_id` smallint DEFAULT NULL,
  PRIMARY KEY (`borrower_id`),
  KEY `privilege_id` (`privilege_id`),
  CONSTRAINT `borrowers_ibfk_1` FOREIGN KEY (`privilege_id`) REFERENCES `Privileges` (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Borrowers`
--

LOCK TABLES `Borrowers` WRITE;
/*!40000 ALTER TABLE `Borrowers` DISABLE KEYS */;
INSERT INTO `Borrowers` VALUES (1,'Davlet',2),(2,'Adele',2);
/*!40000 ALTER TABLE `Borrowers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Borrowings`
--

DROP TABLE IF EXISTS `Borrowings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Borrowings` (
  `borrowing_id` smallint NOT NULL AUTO_INCREMENT,
  `book_id` smallint DEFAULT NULL,
  `borrower_id` smallint DEFAULT NULL,
  `date_taken` date DEFAULT NULL,
  `date_returned` date DEFAULT NULL,
  PRIMARY KEY (`borrowing_id`),
  KEY `book_id` (`book_id`),
  KEY `fk_borrowing_borrowers` (`borrower_id`),
  CONSTRAINT `borrowings_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_borrowing_borrowers` FOREIGN KEY (`borrower_id`) REFERENCES `Borrowers` (`borrower_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Borrowings`
--

LOCK TABLES `Borrowings` WRITE;
/*!40000 ALTER TABLE `Borrowings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Borrowings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment_Types`
--

DROP TABLE IF EXISTS `Comment_Types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comment_Types` (
  `comment_type_id` smallint NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`comment_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment_Types`
--

LOCK TABLES `Comment_Types` WRITE;
/*!40000 ALTER TABLE `Comment_Types` DISABLE KEYS */;
INSERT INTO `Comment_Types` VALUES (1,'quote'),(2,'opinion'),(3,'note');
/*!40000 ALTER TABLE `Comment_Types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comments` (
  `comment_id` smallint NOT NULL AUTO_INCREMENT,
  `book_id` smallint DEFAULT NULL,
  `comment_type_id` smallint DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`comment_id`),
  KEY `comment_type_id` (`comment_type_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`comment_type_id`) REFERENCES `Comment_Types` (`comment_type_id`) ON DELETE SET NULL,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Countries`
--

DROP TABLE IF EXISTS `Countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Countries` (
  `country_id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countries`
--

LOCK TABLES `Countries` WRITE;
/*!40000 ALTER TABLE `Countries` DISABLE KEYS */;
INSERT INTO `Countries` VALUES (1,'France'),(2,'United Kingdom'),(3,'Germany'),(4,'Prague'),(5,'Kyrgyzstan'),(6,'Russia'),(7,'Italy');
/*!40000 ALTER TABLE `Countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Formats`
--

DROP TABLE IF EXISTS `Formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Formats` (
  `format_id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`format_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Formats`
--

LOCK TABLES `Formats` WRITE;
/*!40000 ALTER TABLE `Formats` DISABLE KEYS */;
INSERT INTO `Formats` VALUES (1,'prose'),(2,'play');
/*!40000 ALTER TABLE `Formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genders`
--

DROP TABLE IF EXISTS `Genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genders` (
  `gender_id` smallint NOT NULL AUTO_INCREMENT,
  `gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genders`
--

LOCK TABLES `Genders` WRITE;
/*!40000 ALTER TABLE `Genders` DISABLE KEYS */;
INSERT INTO `Genders` VALUES (1,'F'),(2,'M');
/*!40000 ALTER TABLE `Genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'philosophical fiction'),(2,'philosophical non-fiction');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Languages`
--

DROP TABLE IF EXISTS `Languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Languages` (
  `language_id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Languages`
--

LOCK TABLES `Languages` WRITE;
/*!40000 ALTER TABLE `Languages` DISABLE KEYS */;
INSERT INTO `Languages` VALUES (1,'Russian'),(2,'English'),(3,'French'),(4,'German');
/*!40000 ALTER TABLE `Languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locations`
--

DROP TABLE IF EXISTS `Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Locations` (
  `location_id` smallint NOT NULL AUTO_INCREMENT,
  `shelf` varchar(1) DEFAULT NULL,
  `cell` varchar(1) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locations`
--

LOCK TABLES `Locations` WRITE;
/*!40000 ALTER TABLE `Locations` DISABLE KEYS */;
INSERT INTO `Locations` VALUES (1,'B','A','detectives'),(2,'B','B','fiction'),(3,'C','B','philosophy');
/*!40000 ALTER TABLE `Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privileges` (
  `privilege_id` smallint NOT NULL AUTO_INCREMENT,
  `privilege` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`privilege_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privileges`
--

LOCK TABLES `privileges` WRITE;
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
INSERT INTO `privileges` VALUES (1,'family'),(2,'close friend'),(3,'ordinary');
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publishers`
--

DROP TABLE IF EXISTS `Publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Publishers` (
  `publisher_id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publishers`
--

LOCK TABLES `Publishers` WRITE;
/*!40000 ALTER TABLE `Publishers` DISABLE KEYS */;
INSERT INTO `Publishers` VALUES (1,'Азбука'),(2,'Signet Classics'),(3,'Издательство АСТ');
/*!40000 ALTER TABLE `Publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `series_id` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `publisher_id` smallint DEFAULT NULL,
  PRIMARY KEY (`series_id`),
  KEY `fk_publishers_series` (`publisher_id`),
  CONSTRAINT `series_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `Publishers` (`publisher_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,'Зарубежная Классика',3),(2,'Эксклюзив: Русская классика',3),(3,'Эксклюзивная классика',3),(4,'standalone',1),(5,'standalone',2),(6,'standalone',3),(7,'Азбука-классика. Non-Fiction',1);
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Statuses`
--

DROP TABLE IF EXISTS `Statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Statuses` (
  `status_id` smallint NOT NULL AUTO_INCREMENT,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Statuses`
--

LOCK TABLES `Statuses` WRITE;
/*!40000 ALTER TABLE `Statuses` DISABLE KEYS */;
INSERT INTO `Statuses` VALUES (1,'not read'),(2,'read'),(3,'read next');
/*!40000 ALTER TABLE `Statuses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-03 12:36:18
