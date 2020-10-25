CREATE DATABASE  IF NOT EXISTS `contactdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `contactdb`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: contactdb
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add contact',7,'add_contact'),(20,'Can change contact',7,'change_contact'),(21,'Can delete contact',7,'delete_contact');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$dw3VcEJ93vx7$4zeC2rRfSfG4uhc0RPzGOqGHarteW0sNl3Lnun4TsRs=','2020-10-25 16:10:36.345927',0,'admin','','','abhinandangoyal12@gmail.com',0,1,'2020-10-25 12:19:33.816223'),(2,'pbkdf2_sha256$100000$fzTUKKBUBCRV$OE9hHKSnuMrYKiDerGzRruEZ5MHlE8a9KCOu3E5c2Fg=','2020-10-25 15:08:37.244653',1,'superadmin','','','sewak.gdb.001@gmail.com',1,1,'2020-10-25 14:34:19.620340');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `background_task`
--

DROP TABLE IF EXISTS `background_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `background_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_name` varchar(190) NOT NULL,
  `task_params` longtext NOT NULL,
  `task_hash` varchar(40) NOT NULL,
  `verbose_name` varchar(255) DEFAULT NULL,
  `priority` int NOT NULL,
  `run_at` datetime(6) NOT NULL,
  `repeat` bigint NOT NULL,
  `repeat_until` datetime(6) DEFAULT NULL,
  `queue` varchar(190) DEFAULT NULL,
  `attempts` int NOT NULL,
  `failed_at` datetime(6) DEFAULT NULL,
  `last_error` longtext NOT NULL,
  `locked_by` varchar(64) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `creator_object_id` int unsigned DEFAULT NULL,
  `creator_content_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `background_task_creator_content_type_61cc9af3_fk_django_co` (`creator_content_type_id`),
  KEY `background_task_task_name_4562d56a` (`task_name`),
  KEY `background_task_task_hash_d8f233bd` (`task_hash`),
  KEY `background_task_priority_88bdbce9` (`priority`),
  KEY `background_task_run_at_7baca3aa` (`run_at`),
  KEY `background_task_queue_1d5f3a40` (`queue`),
  KEY `background_task_attempts_a9ade23d` (`attempts`),
  KEY `background_task_failed_at_b81bba14` (`failed_at`),
  KEY `background_task_locked_by_db7779e3` (`locked_by`),
  KEY `background_task_locked_at_0fb0f225` (`locked_at`),
  CONSTRAINT `background_task_creator_content_type_61cc9af3_fk_django_co` FOREIGN KEY (`creator_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `background_task`
--

LOCK TABLES `background_task` WRITE;
/*!40000 ALTER TABLE `background_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `background_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `background_task_completedtask`
--

DROP TABLE IF EXISTS `background_task_completedtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `background_task_completedtask` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_name` varchar(190) NOT NULL,
  `task_params` longtext NOT NULL,
  `task_hash` varchar(40) NOT NULL,
  `verbose_name` varchar(255) DEFAULT NULL,
  `priority` int NOT NULL,
  `run_at` datetime(6) NOT NULL,
  `repeat` bigint NOT NULL,
  `repeat_until` datetime(6) DEFAULT NULL,
  `queue` varchar(190) DEFAULT NULL,
  `attempts` int NOT NULL,
  `failed_at` datetime(6) DEFAULT NULL,
  `last_error` longtext NOT NULL,
  `locked_by` varchar(64) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `creator_object_id` int unsigned DEFAULT NULL,
  `creator_content_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `background_task_comp_creator_content_type_21d6a741_fk_django_co` (`creator_content_type_id`),
  KEY `background_task_completedtask_task_name_388dabc2` (`task_name`),
  KEY `background_task_completedtask_task_hash_91187576` (`task_hash`),
  KEY `background_task_completedtask_priority_9080692e` (`priority`),
  KEY `background_task_completedtask_run_at_77c80f34` (`run_at`),
  KEY `background_task_completedtask_queue_61fb0415` (`queue`),
  KEY `background_task_completedtask_attempts_772a6783` (`attempts`),
  KEY `background_task_completedtask_failed_at_3de56618` (`failed_at`),
  KEY `background_task_completedtask_locked_by_edc8a213` (`locked_by`),
  KEY `background_task_completedtask_locked_at_29c62708` (`locked_at`),
  CONSTRAINT `background_task_comp_creator_content_type_21d6a741_fk_django_co` FOREIGN KEY (`creator_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `background_task_completedtask`
--

LOCK TABLES `background_task_completedtask` WRITE;
/*!40000 ALTER TABLE `background_task_completedtask` DISABLE KEYS */;
INSERT INTO `background_task_completedtask` VALUES (1,'createcontact.views.sendMailToUser','[[\"cjgcjchj\"], {\"receiver_address\": \"abhinandangoyal12@gmail.com\", \"sender_address\": \"gursevaksingh11801@gmail.com\", \"sender_pass\": \"9988185813\"}]','1690fcb592142c791dba73f73eebdd9de39e701a',NULL,0,'2020-10-25 09:28:08.909180',0,NULL,NULL,2,NULL,'Traceback (most recent call last):\n  File \"D:\\workshop malout python\\venv\\lib\\site-packages\\background_task\\tasks.py\", line 43, in bg_runner\n    func(*args, **kwargs)\n  File \"D:\\workshop malout python\\contact\\createcontact\\views.py\", line 30, in sendMailToUser\n    sendEmail(fullname, sender_address = sender_address, sender_pass = sender_pass, receiver_address = receiver_address)\nNameError: name \'sendmail\' is not defined\n','19244','2020-10-25 09:28:00.686438',NULL,NULL),(2,'createcontact.views.sendMailToAdminUser','[[\"jvhjvkj\"], {\"receiver_address\": \"sewak.gdb.001@gmail.com\", \"sender_address\": \"gursevaksingh11801@gmail.com\", \"sender_pass\": \"9988185813\"}]','df4ca03da9fb094a8b4426c220830d4d685d7813',NULL,0,'2020-10-25 09:28:12.860258',0,NULL,NULL,5,NULL,'Traceback (most recent call last):\n  File \"D:\\workshop malout python\\venv\\lib\\site-packages\\background_task\\tasks.py\", line 43, in bg_runner\n    func(*args, **kwargs)\n  File \"D:\\workshop malout python\\contact\\createcontact\\views.py\", line 25, in sendMailToAdminUser\n    sendmail(fullname, sender_address = sender_address, sender_pass = sender_pass, receiver_address = receiver_address)\nNameError: name \'sendmail\' is not defined\n','19244','2020-10-25 09:28:08.947230',NULL,NULL),(3,'createcontact.views.sendMailToUser','[[\"jvhjvkj\"], {\"receiver_address\": \"admin@gmail.com\", \"sender_address\": \"gursevaksingh11801@gmail.com\", \"sender_pass\": \"9988185813\"}]','1ae7eb3ab1af0435e18f442e3a461b68411460c2',NULL,0,'2020-10-25 09:28:18.116391',0,NULL,NULL,5,NULL,'Traceback (most recent call last):\n  File \"D:\\workshop malout python\\venv\\lib\\site-packages\\background_task\\tasks.py\", line 43, in bg_runner\n    func(*args, **kwargs)\n  File \"D:\\workshop malout python\\contact\\createcontact\\views.py\", line 30, in sendMailToUser\n    sendmail(fullname, sender_address = sender_address, sender_pass = sender_pass, receiver_address = receiver_address)\nNameError: name \'sendmail\' is not defined\n','19244','2020-10-25 09:28:12.951283',NULL,NULL),(4,'createcontact.views.sendMailToAdminUser','[[\"cjgcjchj\"], {\"receiver_address\": \"sewak.gdb.001@gmail.com\", \"sender_address\": \"gursevaksingh11801@gmail.com\", \"sender_pass\": \"9988185813\"}]','d197f981c0255ec56d727cbcd44209d16a71b8c4',NULL,0,'2020-10-25 09:28:21.804053',0,NULL,NULL,4,NULL,'Traceback (most recent call last):\n  File \"D:\\workshop malout python\\venv\\lib\\site-packages\\background_task\\tasks.py\", line 43, in bg_runner\n    func(*args, **kwargs)\n  File \"D:\\workshop malout python\\contact\\createcontact\\views.py\", line 25, in sendMailToAdminUser\n    sendEmail(fullname, sender_address = sender_address, sender_pass = sender_pass, receiver_address = receiver_address)\nNameError: name \'sendmail\' is not defined\n','19244','2020-10-25 09:28:18.153411',NULL,NULL),(5,'createcontact.views.sendMailToAdminUser','[[\"xcsfdhdf\"], {\"receiver_address\": \"sewak.gdb.001@gmail.com\", \"sender_address\": \"gursevaksingh11801@gmail.com\", \"sender_pass\": \"9988185813\"}]','b7b06fef50af2d5ed9fca3600c76c2c22e694fd6',NULL,0,'2020-10-25 09:29:10.338173',0,NULL,NULL,1,NULL,'','19244','2020-10-25 09:29:06.877741',NULL,NULL),(6,'createcontact.views.sendMailToUser','[[\"xcsfdhdf\"], {\"receiver_address\": \"abhinandangoyal12@gmail.com\", \"sender_address\": \"gursevaksingh11801@gmail.com\", \"sender_pass\": \"9988185813\"}]','b067c2a54971ea9e7ef8772a8a8380f12bdbee60',NULL,0,'2020-10-25 09:29:38.916156',0,NULL,NULL,1,NULL,'','19244','2020-10-25 09:29:35.462935',NULL,NULL),(7,'createcontact.views.sendMailToAdminUser','[[\"bksjdvbkdjb\"], {\"receiver_address\": \"sewak.gdb.001@gmail.com\", \"sendbyusername\": \"admin\", \"sender_address\": \"gursevaksingh11801@gmail.com\", \"sender_pass\": \"9988185813\"}]','10093771ec79a5d7a14fa292877509eae83b82c6',NULL,0,'2020-10-25 09:35:33.910211',0,NULL,NULL,3,NULL,'Traceback (most recent call last):\n  File \"D:\\workshop malout python\\venv\\lib\\site-packages\\background_task\\tasks.py\", line 43, in bg_runner\n    func(*args, **kwargs)\nTypeError: sendMailToAdminUser() got an unexpected keyword argument \'sendbyusername\'\n','17204','2020-10-25 09:35:29.464485',NULL,NULL),(8,'createcontact.views.sendMailToUser','[[\"bksjdvbkdjb\"], {\"receiver_address\": \"abhinandangoyal12@gmail.com\", \"sendbyusername\": \"\", \"sender_address\": \"gursevaksingh11801@gmail.com\", \"sender_pass\": \"9988185813\"}]','cd113a2e0c0dda14020a5e1ddd7156ed8db7dd2e',NULL,0,'2020-10-25 09:35:37.682313',0,NULL,NULL,2,NULL,'Traceback (most recent call last):\n  File \"D:\\workshop malout python\\venv\\lib\\site-packages\\background_task\\tasks.py\", line 43, in bg_runner\n    func(*args, **kwargs)\nTypeError: sendMailToUser() got an unexpected keyword argument \'sendbyusername\'\n','17204','2020-10-25 09:35:33.939218',NULL,NULL),(9,'createcontact.views.sendMailToAdminUser','[[\"vjvjhvhj\"], {\"receiver_address\": \"sewak.gdb.001@gmail.com\", \"sender_address\": \"gursevaksingh11801@gmail.com\", \"sender_pass\": \"9988185813\"}]','351a77b90456119550b3927c4c35393adfac7cb2',NULL,0,'2020-10-25 09:35:41.813170',0,NULL,NULL,6,NULL,'Traceback (most recent call last):\n  File \"D:\\workshop malout python\\venv\\lib\\site-packages\\background_task\\tasks.py\", line 43, in bg_runner\n    func(*args, **kwargs)\n  File \"D:\\workshop malout python\\contact\\createcontact\\views.py\", line 25, in sendMailToAdminUser\n    sendEmail(fullname, sender_address = sender_address, sender_pass = sender_pass, receiver_address = receiver_address)\nNameError: name \'sendmail\' is not defined\n','17204','2020-10-25 09:35:37.716335',NULL,NULL),(10,'createcontact.views.sendMailToUser','[[\"vjvjhvhj\"], {\"receiver_address\": \"admin@gmail.com\", \"sender_address\": \"gursevaksingh11801@gmail.com\", \"sender_pass\": \"9988185813\"}]','bb92d3a8c0d540fec166626177bdf46ccfea9248',NULL,0,'2020-10-25 09:35:45.348802',0,NULL,NULL,6,NULL,'Traceback (most recent call last):\n  File \"D:\\workshop malout python\\venv\\lib\\site-packages\\background_task\\tasks.py\", line 43, in bg_runner\n    func(*args, **kwargs)\n  File \"D:\\workshop malout python\\contact\\createcontact\\views.py\", line 30, in sendMailToUser\n    sendEmail(fullname, sender_address = sender_address, sender_pass = sender_pass, receiver_address = receiver_address)\nNameError: name \'sendmail\' is not defined\n','17204','2020-10-25 09:35:41.857186',NULL,NULL),(11,'createcontact.views.sendMailToAdminUser','[[\"sdgdfg\"], {\"receiver_address\": \"sewak.gdb.001@gmail.com\", \"sendbyusername\": \"admin\", \"sender_address\": \"gursevaksingh11801@gmail.com\", \"sender_pass\": \"9988185813\"}]','579be2ffe97ad357b2aa735b6bd3f2b3a3086d51',NULL,0,'2020-10-25 09:36:29.193316',0,NULL,NULL,1,NULL,'','17204','2020-10-25 09:36:25.499836',NULL,NULL),(12,'createcontact.views.sendMailToUser','[[\"sdgdfg\"], {\"receiver_address\": \"abhinandangoyal12@gmail.com\", \"sendbyusername\": \"\", \"sender_address\": \"gursevaksingh11801@gmail.com\", \"sender_pass\": \"9988185813\"}]','45bacca11d50da6a4f6ae1966bd617a528bdd236',NULL,0,'2020-10-25 09:37:02.951123',0,NULL,NULL,1,NULL,'','17204','2020-10-25 09:36:59.251481',NULL,NULL);
/*!40000 ALTER TABLE `background_task_completedtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(250) DEFAULT NULL,
  `mobileno` varchar(15) DEFAULT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `addedbyuserid` int DEFAULT NULL,
  `addedon` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'createcontact','contact'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-10-25 12:18:49.639645'),(2,'auth','0001_initial','2020-10-25 12:18:50.826913'),(3,'admin','0001_initial','2020-10-25 12:18:51.117962'),(4,'admin','0002_logentry_remove_auto_add','2020-10-25 12:18:51.132981'),(5,'contenttypes','0002_remove_content_type_name','2020-10-25 12:18:51.456038'),(6,'auth','0002_alter_permission_name_max_length','2020-10-25 12:18:51.600078'),(7,'auth','0003_alter_user_email_max_length','2020-10-25 12:18:51.650097'),(8,'auth','0004_alter_user_username_opts','2020-10-25 12:18:51.666085'),(9,'auth','0005_alter_user_last_login_null','2020-10-25 12:18:51.801130'),(10,'auth','0006_require_contenttypes_0002','2020-10-25 12:18:51.806115'),(11,'auth','0007_alter_validators_add_error_messages','2020-10-25 12:18:51.822136'),(12,'auth','0008_alter_user_username_max_length','2020-10-25 12:18:51.937162'),(13,'auth','0009_alter_user_last_name_max_length','2020-10-25 12:18:52.058188'),(14,'sessions','0001_initial','2020-10-25 12:18:52.126203'),(15,'createcontact','0001_initial','2020-10-25 13:43:41.908768'),(16,'createcontact','0002_auto_20201025_0652','2020-10-25 13:52:48.849750'),(17,'background_task','0001_initial','2020-10-25 16:09:49.819992'),(18,'background_task','0002_auto_20170927_1109','2020-10-25 16:09:49.840995'),(19,'createcontact','0003_auto_20201025_0653','2020-10-25 16:09:49.866002'),(20,'createcontact','0004_auto_20201025_0654','2020-10-25 16:09:49.871002'),(21,'createcontact','0005_auto_20201025_0658','2020-10-25 16:09:49.876003'),(22,'createcontact','0006_auto_20201025_0701','2020-10-25 16:09:49.896008');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('to0rsfpbzfa1ikupf6a6dssmfotow3x0','MDQ5ZDI4OGIyMjIyODk5MTc0ZmI0NWQyMzNkYjk4ZmI1MGUxNzc3Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMGYwNjlkYTRiNzQ0ZDI0Y2FlZmJlZDNhNTY2ODQ0OTgxMTk0MzZjIn0=','2020-11-08 16:10:36.349927');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-25  9:48:08
