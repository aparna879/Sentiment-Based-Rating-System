-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: movie2
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `movie_cast`
--

DROP TABLE IF EXISTS `movie_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_cast` (
  `cast_id` int(11) NOT NULL AUTO_INCREMENT,
  `mov_id` int(11) NOT NULL,
  `actor_name` varchar(100) NOT NULL,
  `alternate_name` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  PRIMARY KEY (`cast_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_cast`
--

LOCK TABLES `movie_cast` WRITE;
/*!40000 ALTER TABLE `movie_cast` DISABLE KEYS */;
INSERT INTO `movie_cast` VALUES (1,1,'Alia Bhatt','Sehmat Khan','/static/images/dbimages/aliaa.jpg'),(2,1,'Vickey kaushal','Iqbal Sayed','/static/images/dbimages/vickyyy.jpg'),(3,2,'Aamir Khan','Rancho','/static/images/dbimages/aamir.jpeg'),(4,2,'Kareena Kapoor','Pia','/static/images/dbimages/kareena.jpg'),(5,2,'R. Madhvan','Farhan','/static/images/dbimages/madhvan.jpg'),(6,2,'Sharman Joshi','Raju Rastogi','/static/images/dbimages/rastogi.jpg'),(7,2,'Boman Irani','Virushasterbuddhe','/static/images/dbimages/boman.jpg'),(8,3,'Ayushmaan Khurana','Rahul','/static/images/dbimages/ayush.jpg'),(9,3,'Radhika Apte','Sofie','/static/images/dbimages/rradhika.jpg'),(10,3,'Tabu','Simi','/static/images/dbimages/tabu.jpeg'),(11,4,'Amitabh Bachan','Jai','/static/images/dbimages/AB.jpeg'),(12,4,'Dharmendra','Veeru','/static/images/dbimages/dharamm.jpg'),(13,4,'Hema Malini','Basanti','/static/images/dbimages/hemaa.jpg'),(14,4,'Jaya Bachan','Radha','/static/images/dbimages/jjjaya.jpeg'),(15,4,'Amjad Khan','Gabbar Singh','/static/images/dbimages/gabbar.jpeg'),(16,4,'Sanjeev Kumar','Thakur','/static/images/dbimages/thakur.jpeg'),(17,5,'Shahrukh Khan','Om','/static/images/dbimages/shahrukh.jpg'),(18,5,'Deepika Padukone','Shanti','/static/images/dbimages/deepikaa.jpg'),(19,5,'Arjun Rampal','Mukesh','/static/images/dbimages/aarjun.jpg'),(20,1,'Soni Razdan','Teji','/static/images/dbimages/soni.jpeg'),(21,6,'Sandra Bullock','Ryan Stone','/static/images/dbimages/21.jpg'),(22,6,'George Clooney','Matt Kowalski','/static/images/dbimages/22.jpg'),(23,6,'Ed Harris','Mission Control (voice)','/static/images/dbimages/23.jpg'),(24,7,'Chris Hemsworth','Thor','/static/images/dbimages/24.jpg'),(25,7,'Natalie Portman','Jane Foster','/static/images/dbimages/25.jpg'),(26,7,'Tom Hiddleston','Loki','/static/images/dbimages/26.jpg'),(27,7,'Anthony Hopkins','Odin','/static/images/dbimages/27.jpg'),(28,7,'Stellan Skarsgård','Erik Selvig','/static/images/dbimages/28.jpg'),(29,8,'Chadwick Boseman','T Challa / Black Panther','/static/images/dbimages/29.jpg'),(30,8,'Michael B. Jordan','Erik Killmonger','/static/images/dbimages/30.jpg'),(31,8,'Lupita Nyong o','Nakia','/static/images/dbimages/31.jpg'),(32,8,'Danai Gurira','Okoye','/static/images/dbimages/32.jpg'),(33,9,'Ryan Reynolds','Wade / Deadpool','/static/images/dbimages/33.jpg'),(34,9,'Karan Soni','Dopinder','/static/images/dbimages/34.jpg'),(35,9,'Ed Skrein','Ajax','/static/images/dbimages/35.jpg'),(36,9,'Michael Benyaer','Warlord','/static/images/dbimages/36.jpg'),(37,10,'Annabelle Wallis','Mia','/static/images/dbimages/37.jpg'),(38,10,'Ward Horton','John','/static/images/dbimages/38.jpg'),(39,10,'Tony Amendola','Father Perez','/static/images/dbimages/39.jpg'),(40,10,'Alfre Woodard','Evelyn','/static/images/dbimages/40.jpg'),(41,10,'Kerry O Malley','Sharon Higgins','/static/images/dbimages/41.jpg'),(42,10,'Brian Howe','Pete Higgins','/static/images/dbimages/42.jpg');
/*!40000 ALTER TABLE `movie_cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_details`
--

DROP TABLE IF EXISTS `movie_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_details` (
  `mov_id` int(11) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `director` varchar(100) NOT NULL,
  `writer` varchar(100) NOT NULL,
  `release_date` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `running_time` varchar(20) NOT NULL,
  `link` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_details`
--

LOCK TABLES `movie_details` WRITE;
/*!40000 ALTER TABLE `movie_details` DISABLE KEYS */;
INSERT INTO `movie_details` VALUES (1,'Drama, Thriller','Meghna Gulzar','Meghna Gulzar','11 May 2018 (India)','A Kashmiri woman agrees to marry a Pakistani army officer in order to spy on Pakistan during the Indo-Pakistan War of 1971.','140 minutes','/static/images/dbimages/raazi.jpeg'),(2,'Drama, Bollywood','Rajkumar Hirani','Rajkumar Hirani, Vidhu Vinod Chopra, Abhijat Joshi','25 December 2009 (India)','Two friends are searching for their long lost companion. They revisit their college days and recall the memories of their friend who inspired them to think differently, even as the rest of the world called them \"idiots\".','150.6 minutes','/static/images/dbimages/3 idiots.jpg'),(3,'Thriller, Mystery','Sriram Raghavan','Sriram Raghavan, Hemanth Rao','5 October 2018 (India)','A series of mysterious events changes the life of a blind pianist who now must report a crime that was actually never witnessed by him.','138 minutes','/static/images/dbimages/andhadhun.jpeg'),(4,'Drama, Bollywood','Ramesh Sippy','Javed Akhtar, Salim Khan','15 August 1975 (India)','After his family is murdered by a notorious and ruthless bandit, a former police officer enlists the services of two outlaws to capture the bandit.','204 minutes','/static/images/dbimages/sholay.jpg'),(5,'Drama, Thriller',' Farah Khan','Farah Khan, Mushtaq Sheikh, Mayur Puri',' 9 November 2007 (India)','In the 1970s, Om, an aspiring actor, is murdered, but is immediately reincarnated into the present day. He attempts to discover the mystery of his demise and find Shanti, the love of his previous life.','167 minutes','/static/images/dbimages/om shanti om.jpg'),(10,'Mystery, Thriller','John R. Leonetti','Gary Dauberman','26 September 2014 (Russia)','A couple begins to experience terrifying supernatural occurrences involving a vintage doll shortly after their home is invaded by satanic cultists.','1h 39m','/static/images/dbimages/annabelle.jpg'),(9,'Action, Adventure, Comedy','Tim Miller','Rhett Reese, Paul Wernick','12 February 2016 (USA)','A fast-talking mercenary with a morbid sense of humor is subjected to a rogue experiment that leaves him with accelerated healing powers and a quest for revenge.','1h 48min','/static/images/dbimages/deadpool.jpeg'),(8,'Action, Adventure, Sci-Fi ','Ryan Coogler','Ryan Coogler, Joe Robert Cole ',' 16 February 2018 (USA)','After the death of his father, Prince T Challa ascends to the throne of the small African country of Wakanda. T Challa is also Black Panther, superhero. Now not only must he govern his country but defeat a dangerous adversary.',' 2h 14min','/static/images/dbimages/panther.jpg'),(7,' Action, Adventure, Fantasy ',' Kenneth Branagh','Ashley Miller,Zack Stentz,Don Payne','6 May 2011 (USA)','The powerful, but arrogant god Thor, is cast out of Asgard to live amongst humans in Midgard (Earth), where he soon becomes one of their finest defenders.','1h 55min','/static/images/dbimages/thor.jpg'),(6,'Drama, Sci-Fi, Thriller ','  Alfonso Cuarón','Alfonso Cuarón, Jonás Cuarón','4 October 2013 (USA)','Two astronauts work together to survive after an accident which leaves them stranded in space.',' 1h 31min','/static/images/dbimages/gravity.jpg');
/*!40000 ALTER TABLE `movie_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_review`
--

DROP TABLE IF EXISTS `movie_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_review` (
  `rev_id` int(11) NOT NULL AUTO_INCREMENT,
  `mov_id` int(11) NOT NULL,
  `content` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`rev_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_review`
--

LOCK TABLES `movie_review` WRITE;
/*!40000 ALTER TABLE `movie_review` DISABLE KEYS */;
INSERT INTO `movie_review` VALUES (1,1,'interesting movie......'),(2,2,'interesting movie......'),(3,3,'interesting movie......'),(4,4,'interesting movie......'),(5,5,'interesting movie......'),(6,6,'interesting movie......'),(7,7,'interesting movie......'),(8,8,'interesting movie......'),(9,9,'interesting movie......'),(10,10,'interesting movie......');
/*!40000 ALTER TABLE `movie_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trig
     BEFORE INSERT ON movie_review FOR EACH ROW
     BEGIN
          IF (SELECT LENGTH(NEW.content)) < 5
          THEN
               SIGNAL SQLSTATE '45800'
                    SET MESSAGE_TEXT = 'OOPS!! Too short to Analyse';
          END IF;
     END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `mov_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`mov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'raazi'),(2,'3 idiots'),(3,'andhadhun'),(4,'sholay'),(5,'om shanti om'),(6,'gravity'),(7,'thor'),(8,'black panther'),(9,'deadpool'),(10,'annabelle');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `rev_id` int(11) NOT NULL,
  `mov_id` int(11) NOT NULL,
  `polarity` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,1,7.5),(2,2,7.5),(3,3,7.5),(4,4,7.5),(5,5,7.5),(6,6,7.5),(7,7,7.5),(8,8,7.5),(9,9,7.5),(10,10,7.5);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-02 19:34:17
