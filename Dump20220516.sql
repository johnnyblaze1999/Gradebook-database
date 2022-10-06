-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: cs332t24
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.34-MariaDB-0ubuntu0.20.04.1

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `cNum` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `book` varchar(100) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `preReq` varchar(50) DEFAULT NULL,
  `dNum` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cNum`),
  KEY `dNum` (`dNum`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dNum`) REFERENCES `department` (`dNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('BUAD201','Business Writing','Public Relations Writing and Media Techniques','3',NULL,'MGMT'),('CPSC120','Introduction to Programming Lecture','Introduction to Programming','3',NULL,'CPSC'),('CPSC131','Data Structures','Data Structures and Algorithms Made Easy: Data Structures and Algorithmic Puzzles','3','CPSC112','CPSC'),('MGMT246','Business and Its Legal Environment','Business and Its Legal Environment','3',NULL,'MGMT'),('MGMT339','Managing Operations','Operations Management: Processes and Supply Chains ','3','BUAD202','MGMT');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dNum` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `chair` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dNum`),
  KEY `department_ibfk_1` (`chair`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`chair`) REFERENCES `professor` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('CPSC','Computer Science','6572783700','5th floor of the Computer Science Building','651057089'),('MGMT','Management','6572782251','Business and Economics Building','338708617');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `ssn` varchar(9) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sex` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `salary` float(12,2) DEFAULT NULL,
  `degrees` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` char(5) DEFAULT NULL,
  `area_code` char(3) DEFAULT NULL,
  `digits` char(7) DEFAULT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES ('338708617','Jennifer Wolfe','Female','Dr.',125000.00,'Doctorate in Business Management','2158 Fraggle Dr','Chicago','IL','60607','630','3205735'),('651057089','Arron Sanchez','Male','Mr.',130000.00,'Master in Computer Science','2262 River Rd','Simla','CO','80835','719','5417831'),('680621132','Gene Vanwinkle','Male','Dr.',135000.00,'Doctorate in Computer Science','2336 Sunrise Rd','Las Vegas','NV','89102','702','8711061'),('690011133','Matthew Pugh','Male','Mr.',120000.00,'Master in Business Management','3232 Red Dog Rd','Charlotte','NC','28209','704','3521824');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `cNum` varchar(50) DEFAULT NULL,
  `sNum` varchar(50) DEFAULT NULL,
  `cwid` varchar(9) DEFAULT NULL,
  `grade` varchar(50) DEFAULT NULL,
  KEY `cNum` (`cNum`),
  KEY `sNum` (`sNum`),
  KEY `cwid` (`cwid`),
  CONSTRAINT `record_ibfk_1` FOREIGN KEY (`cNum`) REFERENCES `course` (`cNum`),
  CONSTRAINT `record_ibfk_2` FOREIGN KEY (`sNum`) REFERENCES `section` (`sNum`),
  CONSTRAINT `record_ibfk_3` FOREIGN KEY (`cwid`) REFERENCES `student` (`cwid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES ('CPSC120','13702','886750932','A'),('CPSC120','13703','886451984','A'),('BUAD201','15432','886750932','B'),('MGMT246','16104','886750932','B'),('MGMT246','16104','886451984','C'),('BUAD201','15432','886451984','C'),('CPSC120','13703','886100704','B'),('CPSC120','13702','886213549','A'),('CPSC120','13703','886374883','A'),('CPSC120','13702','886667650','B'),('CPSC120','13703','886707713','A'),('CPSC120','13702','886951514','C'),('BUAD201','15432','886100704','B'),('BUAD201','15433','886213549','C'),('BUAD201','15432','886374883','C'),('BUAD201','15432','886707713','A'),('BUAD201','15433','886951514','C'),('CPSC131','14515','886100704','B'),('CPSC131','14515','886667650','B'),('CPSC131','14515','886374883','B'),('CPSC131','14515','886374883','C'),('CPSC131','14515','886374883','B'),('CPSC131','14515','886374883','A');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `sNum` varchar(50) NOT NULL,
  `room` varchar(50) DEFAULT NULL,
  `numSeat` int(10) unsigned DEFAULT NULL,
  `meetDay` varchar(20) DEFAULT NULL,
  `begTime` varchar(16) DEFAULT NULL,
  `endTime` varchar(16) DEFAULT NULL,
  `cNum` varchar(50) DEFAULT NULL,
  `pSsn` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`sNum`),
  KEY `cNum` (`cNum`),
  KEY `pSsn` (`pSsn`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`cNum`) REFERENCES `course` (`cNum`),
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`pSsn`) REFERENCES `professor` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES ('13702','07-LEC',55,'M W','10:00 AM','11:15 AM','CPSC120','651057089'),('13703','08-ACT',45,'M W','08:30 AM','09:45 PM','CPSC120','680621132'),('14515','23-ECS',35,'T TH','10:00 AM','11:15 PM','CPSC131','680621132'),('15432','12-BAT',30,'T TH','01:00 PM','02:15 PM','BUAD201','690011133'),('15433','15-BAT',35,'M W','11:30 AM','12:45 PM','BUAD201','338708617'),('16104','03-LEC',50,'T TH','02:30 PM','03:45 PM','MGMT246','690011133'),('16317','12-ACT',40,'M W','02:30 PM','03:45 PM','MGMT339','338708617');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `cwid` varchar(9) NOT NULL,
  `fName` varchar(50) DEFAULT NULL,
  `lName` varchar(50) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  `minor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cwid`),
  KEY `dNum` (`major`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('886100704','Christine','Wright','212 Raintree Blvd','7652149628','Computer Science',NULL),('886213549','Sarah','King','3934 Edwards St','2527918730','Business Management','Economics, Sociology'),('886374883','Julie','Howard','799 Coal St','8143721039','Software Engineer','Mathematics'),('886451984','Juanita','Green','1737 Rollins Rd','3089381300','Politican Science','Public Administration'),('886667650','James','Kinard','3177 Rose St','7082126592','Information Science','Systems Science'),('886707713','Tara','Petree','1653 Tyler Ave','3053372845','Artificial Intelligence',NULL),('886750932','Clifton','Crawford','4526 Jett Ln','3107239522','Accounting','Anthropology, Earth Sciences'),('886951514','Ramona','Lewis','3299 Elk City Rd','3179337853','Statistics','Linguistics');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-16  0:14:04
