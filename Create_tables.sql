-- MySQL dump 10.13  Distrib 5.7.11, for Linux (x86_64)
--
-- Host: localhost    Database: chat
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Table structure for table `chat_user`
--

DROP TABLE IF EXISTS `chat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_user` (
  `user_unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `nick` char(20) NOT NULL,
  `user_password` char(64) NOT NULL,
  `email` tinytext NOT NULL,
  `time_registration` date NOT NULL,
  PRIMARY KEY (`user_unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_user`
--

LOCK TABLES `chat_user` WRITE;
/*!40000 ALTER TABLE `chat_user` DISABLE KEYS */;
INSERT INTO `chat_user` VALUES (1,'admin','33ead09ecb8728f1fc65e8ed0b4e9c7a435b384760bd75076a3e035ba8057cf6','','0000-00-00'),(3,'anon','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','','0000-00-00'),(9,'user_322','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','a@b.com','2016-02-14'),(10,'Deleted User','68a80ee88bc946710a18387dbcc03cf10bfb926b3ab5af7e98550f62e62f6314','a@b.com','2016-02-14');
/*!40000 ALTER TABLE `chat_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chats` (
  `unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_unique_id` int(11) NOT NULL,
  PRIMARY KEY (`unique_id`),
  UNIQUE KEY `chat_unique_id` (`chat_unique_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_1`
--

DROP TABLE IF EXISTS `id_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `id_1` (
  `id_messages_table` int(11) NOT NULL AUTO_INCREMENT,
  `user_unique_id` int(11) NOT NULL,
  `user_text` text,
  `message_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_messages_table`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_1`
--

LOCK TABLES `id_1` WRITE;
/*!40000 ALTER TABLE `id_1` DISABLE KEYS */;
INSERT INTO `id_1` VALUES (1,1,'Hello Chat!','2016-01-28 08:28:40'),(10,1,'test','2016-02-12 13:27:06'),(11,1,'test','2016-02-12 13:44:38'),(12,1,'test','2016-02-12 13:45:01'),(13,3,'askdj%3Baslkd','2016-02-12 19:33:43'),(14,3,'g%3Bkdlfjg%3Bsf','2016-02-12 19:34:11'),(15,3,'%22%22%22%22%22%22%22%22JGfdlkjashfkjsd%22%22%22%22%22%22','2016-02-12 19:37:55'),(16,3,'%3Bdkjslfg%3Blks','2016-02-12 19:56:42'),(17,3,'asdha%3Blk','2016-02-12 19:59:37'),(18,3,'%u0442%u044B%u0432%u0436%u043B%u0434%u0430%u043E%u043F%u0436%u0434%u043B%u0430%u043F','2016-02-12 20:18:18'),(19,3,'sjkfhlkdjfs','2016-02-12 20:50:21'),(20,3,'kjdghlkjfg','2016-02-12 20:52:54'),(21,2,'asdasd','2016-02-13 09:55:38'),(22,2,'lasjdfghlkjasd','2016-02-13 09:57:42'),(23,2,'Hello','2016-02-13 10:14:40'),(24,2,'hello','2016-02-13 10:14:58'),(25,2,'aksdj%3Blkas','2016-02-13 10:16:37'),(26,2,'%3Bdkfsjg%27','2016-02-13 10:16:44'),(27,2,'dsjgh%3Bdf','2016-02-13 10:18:24'),(28,2,'skajfhlksdjfasd','2016-02-13 10:18:29'),(29,2,'jkafhlkjdsf','2016-02-13 10:27:56'),(30,2,'Hello','2016-02-13 10:34:00'),(31,4,'hello','2016-02-13 10:39:06'),(32,2,'Test%201','2016-02-13 10:39:54'),(33,2,'Test%202','2016-02-13 10:40:05'),(34,4,'%u0421%20%u0443%u043C%u0430%20%u043C%u043E%u0436%u043D%u043E%20%u0441%u043E%u0439%u0442%u0438%21','2016-02-13 10:42:31'),(35,2,'%3Bhsfkjd','2016-02-13 10:42:57'),(36,2,'Test_3','2016-02-13 10:50:31'),(37,2,'Hello%20all','2016-02-13 11:06:22'),(38,4,'14.06','2016-02-13 11:06:48'),(39,2,'14.08','2016-02-13 11:09:38'),(40,4,'14.08%0A','2016-02-13 11:09:38'),(41,4,'14.09','2016-02-13 11:10:02'),(42,1,'14.10','2016-02-13 11:10:43'),(43,3,'14.12','2016-02-13 11:12:12'),(44,4,'hello','2016-02-13 11:12:51'),(45,2,'14.12%0A','2016-02-13 11:12:57'),(46,4,'super%20pupper%20mega%20wau','2016-02-13 11:13:09'),(47,9,'akjsd%3Bklasd','2016-02-14 11:22:39'),(48,9,'Hello%20chat%21','2016-02-14 11:22:55'),(49,9,'%u041F%u0440%u0438%u0432%u0435%u0442%20%u043C%u0438%u0440%21','2016-02-14 11:25:09');
/*!40000 ALTER TABLE `id_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages_table`
--

DROP TABLE IF EXISTS `messages_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages_table` (
  `id_messages_table` int(11) NOT NULL AUTO_INCREMENT,
  `user_unique_id` int(11) NOT NULL,
  `user_text` text,
  `message_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_messages_table`),
  UNIQUE KEY `user_unique_id` (`user_unique_id`),
  CONSTRAINT `messages_table_ibfk_1` FOREIGN KEY (`user_unique_id`) REFERENCES `chat_user` (`user_unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages_table`
--

LOCK TABLES `messages_table` WRITE;
/*!40000 ALTER TABLE `messages_table` DISABLE KEYS */;
INSERT INTO `messages_table` VALUES (1,1,'Hello Chat!','2016-01-28 08:12:47');
/*!40000 ALTER TABLE `messages_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_chat`
--

DROP TABLE IF EXISTS `type_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_chat` (
  `chat_unique_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_chat` char(20) NOT NULL,
  `chat_password` char(64) DEFAULT NULL,
  `id_messages_table` int(11) NOT NULL,
  PRIMARY KEY (`chat_unique_id`),
  UNIQUE KEY `id_messages_table` (`id_messages_table`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_chat`
--

LOCK TABLES `type_chat` WRITE;
/*!40000 ALTER TABLE `type_chat` DISABLE KEYS */;
INSERT INTO `type_chat` VALUES (1,'main','e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855',1);
/*!40000 ALTER TABLE `type_chat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-14 14:51:33
