CREATE DATABASE  IF NOT EXISTS `joby_jobs` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `joby_jobs`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: joby_jobs
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
-- Table structure for table `admin_person_settings`
--

DROP TABLE IF EXISTS `admin_person_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_person_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_person_id` int(11) NOT NULL,
  `setting_key` varchar(150) NOT NULL,
  `settings_value` varchar(500) NOT NULL,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`),
  UNIQUE KEY `admin_person_id_UNIQUE` (`admin_person_id`),
  CONSTRAINT `admin_person_id_FK` FOREIGN KEY (`admin_person_id`) REFERENCES `admin_persons` (`admin_person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_person_settings`
--

LOCK TABLES `admin_person_settings` WRITE;
/*!40000 ALTER TABLE `admin_person_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_person_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_persons`
--

DROP TABLE IF EXISTS `admin_persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_persons` (
  `admin_person_id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_user_id` varchar(128) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `register_date` datetime NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_person_id`),
  UNIQUE KEY `identity_user_id_UNIQUE` (`identity_user_id`),
  CONSTRAINT `user_id_1` FOREIGN KEY (`identity_user_id`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_persons`
--

LOCK TABLES `admin_persons` WRITE;
/*!40000 ALTER TABLE `admin_persons` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_statuses`
--

DROP TABLE IF EXISTS `application_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_statuses` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `visual_name` varchar(150) NOT NULL,
  `active` varchar(45) NOT NULL DEFAULT 'b''1''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_statuses`
--

LOCK TABLES `application_statuses` WRITE;
/*!40000 ALTER TABLE `application_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `application_start_date` datetime NOT NULL,
  `story` longtext NOT NULL COMMENT 'The story around the current application',
  `last_updated` datetime DEFAULT CURRENT_TIMESTAMP,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `position_id4_idx` (`position_id`),
  KEY `worker_id4_idx` (`worker_id`),
  CONSTRAINT `position_id4` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `worker_id4` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`worker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `address` varchar(500) NOT NULL,
  `phone_number` varchar(150) NOT NULL,
  `contact_person_name` varchar(150) NOT NULL,
  `contact_person_phone_number` varchar(150) NOT NULL,
  `join_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logo` varchar(500) NOT NULL COMMENT 'relative url to the company logo',
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_person_settings`
--

DROP TABLE IF EXISTS `company_person_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_person_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_person_id` int(11) NOT NULL,
  `setting_key` varchar(150) NOT NULL,
  `settings_value` varchar(500) NOT NULL,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`),
  KEY `company_person_id_FK_idx` (`company_person_id`),
  CONSTRAINT `company_person_id_FK` FOREIGN KEY (`company_person_id`) REFERENCES `company_persons` (`company_person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_person_settings`
--

LOCK TABLES `company_person_settings` WRITE;
/*!40000 ALTER TABLE `company_person_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_person_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_persons`
--

DROP TABLE IF EXISTS `company_persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_persons` (
  `company_person_id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_user_id` varchar(128) NOT NULL,
  `company_id` int(11) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `id_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `register_date` datetime NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`company_person_id`),
  UNIQUE KEY `identity_user_id_UNIQUE` (`identity_user_id`),
  KEY `company_id_idx` (`company_id`),
  CONSTRAINT `company_id_FK` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id_3` FOREIGN KEY (`identity_user_id`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_persons`
--

LOCK TABLES `company_persons` WRITE;
/*!40000 ALTER TABLE `company_persons` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_messages`
--

DROP TABLE IF EXISTS `conversation_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversation_messages` (
  `message_id` int(11) NOT NULL,
  `message_uid` varchar(38) DEFAULT NULL,
  `message_type` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `company_person_id` int(11) NOT NULL,
  `header` varchar(300) DEFAULT NULL,
  `content` longtext,
  `date` datetime NOT NULL,
  `is_read` bit(1) NOT NULL COMMENT 'is read by the other side',
  PRIMARY KEY (`message_id`),
  KEY `worker_id_5_idx` (`worker_id`),
  KEY `company_person_id_6_idx` (`company_person_id`),
  KEY `company_id_idx` (`company_id`),
  CONSTRAINT `company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `company_person_id_6` FOREIGN KEY (`company_person_id`) REFERENCES `company_persons` (`company_person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `worker_id_5` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`worker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds conversation (chat) messages between company and worker';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_messages`
--

LOCK TABLES `conversation_messages` WRITE;
/*!40000 ALTER TABLE `conversation_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `filed_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`filed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_settings`
--

DROP TABLE IF EXISTS `global_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_settings` (
  `global_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `global_settings_key` varchar(150) NOT NULL,
  `value` text,
  PRIMARY KEY (`global_setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='global settings and data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_settings`
--

LOCK TABLES `global_settings` WRITE;
/*!40000 ALTER TABLE `global_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `global_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interviews`
--

DROP TABLE IF EXISTS `interviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interviews` (
  `interview_id` int(11) NOT NULL AUTO_INCREMENT,
  `interview_uid` varchar(38) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `location` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `notes` varchar(9999) DEFAULT NULL,
  `is_cancelled` bit(1) DEFAULT b'0',
  `cancel_reason` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`interview_id`),
  KEY `worker_id6_idx` (`worker_id`),
  KEY `company_id6_idx` (`company_id`),
  CONSTRAINT `company_id6` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `worker_id6` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`worker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interviews`
--

LOCK TABLES `interviews` WRITE;
/*!40000 ALTER TABLE `interviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `interviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_tags`
--

DROP TABLE IF EXISTS `position_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position_id` int(11) NOT NULL,
  `tag_id` varchar(38) NOT NULL COMMENT 'a unique tag id',
  `precedence` int(11) DEFAULT NULL COMMENT 'the precedence of the current position in the current tag (1-based); null is 1;',
  PRIMARY KEY (`id`),
  KEY `position_id1_idx` (`position_id`),
  CONSTRAINT `position_id1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`position_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='holds all tags for a specific position';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_tags`
--

LOCK TABLES `position_tags` WRITE;
/*!40000 ALTER TABLE `position_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `position_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `position_id` int(11) NOT NULL,
  `position_uid` varchar(38) COLLATE armscii8_bin DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `position_type` varchar(150) CHARACTER SET utf8 DEFAULT NULL COMMENT 'The position type (full time, part time, shifts)',
  `title` varchar(150) CHARACTER SET utf8 NOT NULL,
  `profession_id` int(11) NOT NULL,
  `subprofession_id` int(11) NOT NULL,
  `salary_min` int(11) NOT NULL,
  `salary_max` int(11) NOT NULL,
  `location` varchar(150) CHARACTER SET utf8 NOT NULL,
  `description` longtext CHARACTER SET utf8 NOT NULL,
  `status_id` int(11) NOT NULL COMMENT 'the status of the position: active, frozen, filled,',
  `internal_precedence` int(11) DEFAULT NULL COMMENT 'holds the precedence in the current company (1-based); null is 1;',
  `draft` bit(1) NOT NULL DEFAULT b'0' COMMENT 'specifies whether the position is not yet to be published (draft)',
  `frozen` bit(1) NOT NULL DEFAULT b'0' COMMENT 'specifies whether the position is frozen (that is not active for searches)',
  `active` bit(1) NOT NULL DEFAULT b'1' COMMENT 'specifies whether the position was deleted (logically)',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professions`
--

DROP TABLE IF EXISTS `professions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professions` (
  `profession_id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `tag_id` varchar(38) NOT NULL COMMENT 'a unique tag id for search purposes',
  `active` bit(1) NOT NULL DEFAULT b'1',
  `professionscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`profession_id`),
  KEY `field_id1_idx` (`field_id`),
  CONSTRAINT `field_id1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`filed_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professions`
--

LOCK TABLES `professions` WRITE;
/*!40000 ALTER TABLE `professions` DISABLE KEYS */;
/*!40000 ALTER TABLE `professions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reaction_types`
--

DROP TABLE IF EXISTS `reaction_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reaction_types` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reaction_types`
--

LOCK TABLES `reaction_types` WRITE;
/*!40000 ALTER TABLE `reaction_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `reaction_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `reaction_type_id` int(11) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `worker_id9_idx` (`worker_id`),
  KEY `company_id_idx` (`company_id`),
  CONSTRAINT `company_id17` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `worker_id9` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`worker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='reactions: worker likes, company likes, mutual matches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reactions`
--

LOCK TABLES `reactions` WRITE;
/*!40000 ALTER TABLE `reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `Id` varchar(128) NOT NULL,
  `Name` varchar(256) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='identity table- roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subprofessions`
--

DROP TABLE IF EXISTS `subprofessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subprofessions` (
  `subprofession_id` int(11) NOT NULL AUTO_INCREMENT,
  `profession_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `tag_id` varchar(38) NOT NULL COMMENT 'a unique tag id for search purposes',
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`subprofession_id`),
  KEY `profession_id_idx` (`profession_id`),
  CONSTRAINT `profession_id` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`profession_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subprofessions`
--

LOCK TABLES `subprofessions` WRITE;
/*!40000 ALTER TABLE `subprofessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subprofessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userclaims`
--

DROP TABLE IF EXISTS `userclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(128) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `ApplicationUser_Claims` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='identity table- userclaims';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userclaims`
--

LOCK TABLES `userclaims` WRITE;
/*!40000 ALTER TABLE `userclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `userclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogins`
--

DROP TABLE IF EXISTS `userlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlogins` (
  `LoginProvider` varchar(128) NOT NULL,
  `ProviderKey` varchar(128) NOT NULL,
  `UserId` varchar(128) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`,`UserId`),
  KEY `ApplicationUser_Logins` (`UserId`),
  CONSTRAINT `ApplicationUser_Logins` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='identity table- userlogins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogins`
--

LOCK TABLES `userlogins` WRITE;
/*!40000 ALTER TABLE `userlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `userlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userroles` (
  `UserId` varchar(128) NOT NULL,
  `RoleId` varchar(128) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IdentityRole_Users` (`RoleId`),
  CONSTRAINT `ApplicationUser_Roles` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `IdentityRole_Users` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='identity table- userroles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userroles`
--

LOCK TABLES `userroles` WRITE;
/*!40000 ALTER TABLE `userroles` DISABLE KEYS */;
/*!40000 ALTER TABLE `userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `Id` varchar(128) NOT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEndDateUtc` datetime DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `UserName` varchar(256) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='identity table- users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_job_interests`
--

DROP TABLE IF EXISTS `worker_job_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_job_interests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) NOT NULL,
  `salary_min` int(11) DEFAULT NULL,
  `salary_max` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL COMMENT 'Holds the distance (in km) from home',
  PRIMARY KEY (`id`),
  KEY `worker_id7_idx` (`worker_id`),
  CONSTRAINT `worker_id7` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`worker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_job_interests`
--

LOCK TABLES `worker_job_interests` WRITE;
/*!40000 ALTER TABLE `worker_job_interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_job_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_resumes`
--

DROP TABLE IF EXISTS `worker_resumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_resumes` (
  `id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  `file` varchar(500) NOT NULL,
  `date` datetime NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Represents the physical files of a worker''s resume';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_resumes`
--

LOCK TABLES `worker_resumes` WRITE;
/*!40000 ALTER TABLE `worker_resumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_resumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_settings`
--

DROP TABLE IF EXISTS `worker_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) NOT NULL,
  `setting_key` varchar(150) NOT NULL,
  `settings_value` varchar(500) NOT NULL,
  `last_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`setting_id`),
  KEY `worker_id_fk1_idx` (`worker_id`),
  CONSTRAINT `worker_id_fk1` FOREIGN KEY (`worker_id`) REFERENCES `workers` (`worker_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='worker(candidate)  settings: that includes worker preferences, job requirements, and general info.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_settings`
--

LOCK TABLES `worker_settings` WRITE;
/*!40000 ALTER TABLE `worker_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workers` (
  `worker_id` int(11) NOT NULL AUTO_INCREMENT,
  `identity_user_id` varchar(128) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `phone_number` varchar(50) NOT NULL COMMENT 'NOT RELEVANT; identical column in users table.',
  `id_number` varchar(50) DEFAULT NULL,
  `register_date` datetime NOT NULL,
  `gender` int(11) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`worker_id`),
  KEY `User_Id_idx` (`identity_user_id`),
  CONSTRAINT `User_Id` FOREIGN KEY (`identity_user_id`) REFERENCES `users` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='workers(candidates)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-11  0:16:11
