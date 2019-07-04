-- MySQL dump 10.13  Distrib 5.5.46, for Win32 (x86)
--
-- Host: localhost    Database: beatrix
-- ------------------------------------------------------
-- Server version	5.5.46

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
-- Table structure for table `critics_rank`
--

DROP TABLE IF EXISTS `critics_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `critics_rank` (
  `song_id` int(11) NOT NULL,
  `c1_rank` int(11) DEFAULT '0',
  `c2_rank` int(11) DEFAULT '0',
  `c3_rank` int(11) DEFAULT '0',
  `c4_rank` int(11) DEFAULT '0',
  `c5_rank` int(11) DEFAULT '0',
  `total_rtg` float DEFAULT '0',
  `temp_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `critics_rank`
--

LOCK TABLES `critics_rank` WRITE;
/*!40000 ALTER TABLE `critics_rank` DISABLE KEYS */;
INSERT INTO `critics_rank` VALUES (1,0,0,0,0,0,0,1),(8,0,0,0,0,0,0,9),(9,0,0,0,0,0,0,8),(10,0,0,0,0,0,0,7),(11,0,0,0,0,0,0,6),(12,0,0,0,0,0,0,5),(13,0,0,0,0,0,0,4),(14,0,0,0,0,0,0,3),(15,0,0,0,0,0,0,2),(16,0,0,0,0,0,0,10);
/*!40000 ALTER TABLE `critics_rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletion`
--

DROP TABLE IF EXISTS `deletion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deletion` (
  `song_id` int(11) NOT NULL,
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletion`
--

LOCK TABLES `deletion` WRITE;
/*!40000 ALTER TABLE `deletion` DISABLE KEYS */;
INSERT INTO `deletion` VALUES (3),(17);
/*!40000 ALTER TABLE `deletion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank_calculate`
--

DROP TABLE IF EXISTS `rank_calculate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank_calculate` (
  `song_id` int(11) NOT NULL,
  `counter` int(11) DEFAULT NULL,
  `w1_rank` int(11) DEFAULT NULL,
  `w2_rank` int(11) DEFAULT NULL,
  `w3_rank` int(11) DEFAULT NULL,
  `w4_rank` int(11) DEFAULT NULL,
  `w5_rank` int(11) DEFAULT NULL,
  `total_rtg` float DEFAULT NULL,
  `cumm_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank_calculate`
--

LOCK TABLES `rank_calculate` WRITE;
/*!40000 ALTER TABLE `rank_calculate` DISABLE KEYS */;
INSERT INTO `rank_calculate` VALUES (1,0,1,1,1,1,1,100,1),(8,0,10,10,10,10,9,13.6,10),(9,0,9,9,9,9,8,23.6,9),(10,0,8,8,8,8,7,33.6,8),(11,0,7,7,7,7,6,43.6,7),(12,0,6,6,6,6,5,53.6,6),(13,0,5,5,5,5,4,63.6,4),(14,0,4,4,4,4,3,73.6,3),(15,0,3,3,3,3,2,83.6,2),(16,0,2,2,2,2,10,61.2,5);
/*!40000 ALTER TABLE `rank_calculate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_display`
--

DROP TABLE IF EXISTS `song_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `song_display` (
  `song_id` int(11) NOT NULL AUTO_INCREMENT,
  `song_name` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `album` varchar(255) DEFAULT NULL,
  `album_cover` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `counter` int(10) DEFAULT NULL,
  `artist` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_display`
--

LOCK TABLES `song_display` WRITE;
/*!40000 ALTER TABLE `song_display` DISABLE KEYS */;
INSERT INTO `song_display` VALUES (1,'1.mp3','2017-04-15','Sarkar 3','1.jpg',1,'Angry Mix',0,'Milkha Singh'),(8,'8.mp3','2017-05-01','Baahubali 2','8.jpg',10,'Sahoore Baahubali',0,'Daler Mahendi'),(9,'9.mp3','2017-05-01','Baahubali 2','9.jpg',9,'Humsa Navaa',0,'Sony,Deepu'),(10,'10.mp3','2017-05-01','Baahubali 2','10.jpg',8,'Kannaa Nidurinchara',0,'Sreenidhi'),(11,'11.mp3','2017-05-01','Baahubali 2','11.jpg',7,'Dandaalayyaa',0,'Kaala Bhairava'),(12,'12.mp3','2017-05-01','Baahubali 2','12.jpg',6,' Oka Praanam',0,'Kaala Bhairava'),(13,'13.mp3','2017-05-10','Half Girlfriend','13.jpg',4,'Baarish',0,'Ash King'),(14,'14.mp3','2017-05-10','Half Girlfriend','14.jpg',3,'Fir Bhi Tumko Chaahunga',0,'Arijit Singh'),(15,'15.mp3','2017-05-10','Half Girlfriend','15.jpg',2,'Lost Without You',0,'Ami Mishra'),(16,'16.mp3','2017-05-10','Half Girlfriend','16.jpg',5,'Tu Hi Hai',0,'Rahul Mishra');
/*!40000 ALTER TABLE `song_display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `rank_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `rank_id` (`rank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@admin.com','admin','Admin','admin','0'),(2,'critics@critics.com','critics','critics','critics','2'),(3,'cc@ccc.com','critics','critics','critics','3'),(4,'nikhil.srivastava944@gmail.com','nnnnnnn','Nikhil','critics','4'),(5,'bhatnagarpalash@gmail.com','pppppppp','Pallu','critics','1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-23  6:34:22
