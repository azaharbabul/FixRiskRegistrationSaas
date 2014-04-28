-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: fixrisk
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.12.04.1

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
-- Table structure for table `CVSS_scoring`
--

DROP TABLE IF EXISTS `CVSS_scoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CVSS_scoring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metric_name` varchar(30) NOT NULL,
  `abrv_metric_name` varchar(3) NOT NULL,
  `metric_value` varchar(30) NOT NULL,
  `abrv_metric_value` varchar(3) NOT NULL,
  `numeric_value` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CVSS_scoring`
--

LOCK TABLES `CVSS_scoring` WRITE;
/*!40000 ALTER TABLE `CVSS_scoring` DISABLE KEYS */;
INSERT INTO `CVSS_scoring` VALUES (1,'AccessComplexity','AC','High','H',0.35),(2,'AccessComplexity','AC','Medium','M',0.61),(3,'AccessComplexity','AC','Low','L',0.71),(4,'AccessVector','AV','Local','L',0.395),(5,'AccessVector','AV','Adjacent Network','A',0.646),(6,'AccessVector','AV','Network','N',1),(7,'Authentication','Au','None','N',0.704),(8,'Authentication','Au','Single Instance','S',0.56),(9,'Authentication','Au','Multiple Instances','M',0.45),(10,'AvailabilityRequirement','AR','Undefined','ND',1),(11,'AvailabilityRequirement','AR','Low','L',0.5),(12,'AvailabilityRequirement','AR','Medium','M',1),(13,'AvailabilityRequirement','AR','High','H',1.51),(14,'AvailImpact','A','None','N',0),(15,'AvailImpact','A','Partial','P',0.275),(16,'AvailImpact','A','Complete','C',0.66),(17,'CollateralDamagePotential','CDP','Undefined','ND',0),(18,'CollateralDamagePotential','CDP','None','N',0),(19,'CollateralDamagePotential','CDP','Low (light loss)','L',0.1),(20,'CollateralDamagePotential','CDP','Low-Medium','LM',0.3),(21,'CollateralDamagePotential','CDP','Medium-High','MH',0.4),(22,'CollateralDamagePotential','CDP','High','H',0.5),(23,'ConfidentialityRequirement','CR','Undefined','ND',1),(24,'ConfidentialityRequirement','CR','Low','L',0.5),(25,'ConfidentialityRequirement','CR','Medium','M',1),(26,'ConfidentialityRequirement','CR','High','H',1.51),(27,'ConfImpact','C','None','N',0),(28,'ConfImpact','C','Partial','P',0.275),(29,'ConfImpact','C','Complete','C',0.66),(30,'Exploitability','E','Undefined','ND',1),(31,'Exploitability','E','Unproven that exploit exists','U',0.85),(32,'Exploitability','E','Proof of concept code','POC',0.9),(33,'Exploitability','E','Functional exploit exists','F',0.95),(34,'Exploitability','E','Widespread','H',1),(35,'IntegImpact','I','None','N',0),(36,'IntegImpact','I','Partial','P',0.275),(37,'IntegImpact','I','Complete','C',0.66),(38,'IntegrityRequirement','IR','Undefined','ND',1),(39,'IntegrityRequirement','IR','Low','L',0.5),(40,'IntegrityRequirement','IR','Medium','M',1),(41,'IntegrityRequirement','IR','High','H',1.51),(42,'RemediationLevel','RL','Undefined','ND',1),(43,'RemediationLevel','RL','Official fix','OF',0.87),(44,'RemediationLevel','RL','Temporary fix','TF',0.9),(45,'RemediationLevel','RL','Workaround','W',0.95),(46,'RemediationLevel','RL','Unavailable','U',1),(47,'ReportConfidence','RC','Undefined','ND',1),(48,'ReportConfidence','RC','Unconfirmed','UC',0.9),(49,'ReportConfidence','RC','Uncorroborated','UR',0.95),(50,'ReportConfidence','RC','Confirmed','C',1),(51,'TargetDistribution','TD','Undefined','ND',1),(52,'TargetDistribution','TD','None (0%)','N',0),(53,'TargetDistribution','TD','Low (0-25%)','L',0.25),(54,'TargetDistribution','TD','Medium (26-75%)','M',0.75),(55,'TargetDistribution','TD','High (76-100%)','H',1);
/*!40000 ALTER TABLE `CVSS_scoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_log` (
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `risk_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
INSERT INTO `audit_log` VALUES ('2014-03-11 04:57:57',0,1,'Username \"admin\" logged in successfully.'),('2014-03-12 06:57:16',0,1,'Username \"admin\" logged in successfully.'),('2014-03-12 11:21:52',0,1,'Username \"admin\" logged in successfully.'),('2014-03-12 11:22:23',1,1,'A new risk ID \"1001\" was submitted by username \"admin\".'),('2014-03-12 11:22:23',2,1,'A new risk ID \"1002\" was submitted by username \"admin\".'),('2014-03-12 13:08:17',0,1,'Username \"admin\" logged in successfully.'),('2014-03-13 05:07:30',0,1,'Username \"admin\" logged in successfully.'),('2014-03-13 09:24:48',0,1,'Username \"admin\" logged in successfully.'),('2014-03-13 11:13:39',1,1,'A management review was submitted for risk ID \"1001\" by username \"admin\".'),('2014-03-13 11:13:39',1,1,'Risk ID \"1001\" automatically closed when username \"admin\" rejected the risk.'),('2014-03-14 05:24:59',0,1,'Username \"admin\" logged in successfully.'),('2014-03-14 05:48:07',1,1,'A new risk ID \"1001\" was submitted by username \"admin\".'),('2014-03-14 05:57:58',2,1,'A new risk ID \"1002\" was submitted by username \"admin\".'),('2014-03-14 08:43:11',0,1,'Username \"admin\" logged in successfully.'),('2014-03-14 09:35:03',-1000,1,'A mitigation was submitted for risk ID \"\" by username \"admin\".'),('2014-03-14 11:06:13',-999,1,'A mitigation was submitted for risk ID \"1\" by username \"admin\".'),('2014-03-14 11:28:03',-999,1,'A mitigation was submitted for risk ID \"1\" by username \"admin\".'),('2014-03-14 11:28:23',-999,1,'A mitigation was submitted for risk ID \"1\" by username \"admin\".'),('2014-03-14 11:29:11',-999,1,'A mitigation was submitted for risk ID \"1\" by username \"admin\".'),('2014-03-15 06:46:45',0,1,'Username \"admin\" logged in successfully.'),('2014-03-15 10:08:51',0,1,'Username \"admin\" logged in successfully.'),('2014-03-15 10:10:46',0,1,'A new project was added by the \"admin\" user.'),('2014-03-15 10:37:09',2,1,'A management review was submitted for risk ID \"1002\" by username \"admin\".'),('2014-03-24 03:33:31',0,1,'Username \"admin\" logged in successfully.'),('2014-03-24 13:30:50',0,1,'Username \"admin\" logged in successfully.'),('2014-03-25 07:29:23',0,0,'A new signup request was created with username: '),('2014-04-08 10:52:02',0,1,'Username \"admin\" logged in successfully.'),('2014-04-08 11:10:01',3,1,'A new risk ID \"1003\" was submitted by username \"admin\".'),('2014-04-08 11:10:37',2,1,'A mitigation was submitted for risk ID \"1002\" by username \"admin\".'),('2014-04-08 11:11:08',4,1,'A new risk ID \"1004\" was submitted by username \"admin\".'),('2014-04-08 11:11:30',4,1,'A mitigation was submitted for risk ID \"1004\" by username \"admin\".');
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Access Management'),(2,'Environmental Resilience'),(3,'Monitoring'),(4,'Physical Security'),(5,'Policy and Procedure'),(6,'Sensitive Data Management'),(7,'Technical Vulnerability Management'),(8,'Third-Party Management');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `close_reason`
--

DROP TABLE IF EXISTS `close_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `close_reason` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `close_reason`
--

LOCK TABLES `close_reason` WRITE;
/*!40000 ALTER TABLE `close_reason` DISABLE KEYS */;
INSERT INTO `close_reason` VALUES (1,'Fully Mitigated'),(2,'System Retired'),(3,'Cancelled'),(4,'Too Insignificant');
/*!40000 ALTER TABLE `close_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `closures`
--

DROP TABLE IF EXISTS `closures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `closures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `closure_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `close_reason` int(11) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `closures`
--

LOCK TABLES `closures` WRITE;
/*!40000 ALTER TABLE `closures` DISABLE KEYS */;
INSERT INTO `closures` VALUES (1,1,1,'2014-03-13 11:13:39',0,'Risk was closed automatically when the reviewer rejected the risk.');
/*!40000 ALTER TABLE `closures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` int(11) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliance`
--

DROP TABLE IF EXISTS `compliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compliance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) DEFAULT NULL,
  `control_id` varchar(45) DEFAULT NULL,
  `threat` text NOT NULL,
  `cons_harm` text NOT NULL,
  `effect_measure` int(11) DEFAULT NULL,
  `impact_score` int(11) DEFAULT NULL,
  `likelihood_score` int(11) DEFAULT NULL,
  `control_risk_score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance`
--

LOCK TABLES `compliance` WRITE;
/*!40000 ALTER TABLE `compliance` DISABLE KEYS */;
/*!40000 ALTER TABLE `compliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control`
--

DROP TABLE IF EXISTS `control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(45) DEFAULT NULL,
  `c_description` varchar(200) DEFAULT NULL,
  `c_impl_status` int(11) DEFAULT '0',
  `c_submission_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `c_regulation` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `compliance_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `CONT_IMPL_idx` (`c_impl_status`),
  KEY `CONT_REGU_idx` (`c_regulation`),
  KEY `CONT_DURA` (`duration`),
  CONSTRAINT `CONT_DURA` FOREIGN KEY (`duration`) REFERENCES `duration` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CONT_IMPL` FOREIGN KEY (`c_impl_status`) REFERENCES `impl_status` (`key`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CONT_REGU` FOREIGN KEY (`c_regulation`) REFERENCES `regulation` (`value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control`
--

LOCK TABLES `control` WRITE;
/*!40000 ALTER TABLE `control` DISABLE KEYS */;
INSERT INTO `control` VALUES (1,'USB Control','Port Locking',0,'2014-03-13 10:09:25',2,2,0),(2,'USB Control','abcde',0,'2014-03-13 10:41:19',4,2,0),(3,'USB Control','Port Locking',0,'2014-03-14 05:25:10',3,2,0),(4,'USB Control','abcde',0,'2014-03-14 05:25:20',1,1,0);
/*!40000 ALTER TABLE `control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duration`
--

DROP TABLE IF EXISTS `duration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duration` (
  `id` int(11) NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duration`
--

LOCK TABLES `duration` WRITE;
/*!40000 ALTER TABLE `duration` DISABLE KEYS */;
INSERT INTO `duration` VALUES (1,'Long Term'),(2,'Short Term');
/*!40000 ALTER TABLE `duration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impact`
--

DROP TABLE IF EXISTS `impact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impact` (
  `name` varchar(20) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impact`
--

LOCK TABLES `impact` WRITE;
/*!40000 ALTER TABLE `impact` DISABLE KEYS */;
INSERT INTO `impact` VALUES ('Insignificant',1),('Minor',2),('Moderate',3),('Major',4),('Extreme/Catastrophic',5);
/*!40000 ALTER TABLE `impact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impl_status`
--

DROP TABLE IF EXISTS `impl_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impl_status` (
  `key` int(11) NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impl_status`
--

LOCK TABLES `impl_status` WRITE;
/*!40000 ALTER TABLE `impl_status` DISABLE KEYS */;
INSERT INTO `impl_status` VALUES (0,'Not Implemented'),(1,'Partially Implemented'),(2,'Fully Implemented'),(3,'Not Applicable');
/*!40000 ALTER TABLE `impl_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likelihood`
--

DROP TABLE IF EXISTS `likelihood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likelihood` (
  `name` varchar(20) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likelihood`
--

LOCK TABLES `likelihood` WRITE;
/*!40000 ALTER TABLE `likelihood` DISABLE KEYS */;
INSERT INTO `likelihood` VALUES ('Remote',1),('Unlikely',2),('Credible',3),('Likely',4),('Almost Certain',5);
/*!40000 ALTER TABLE `likelihood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'All Sites');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mgmt_reviews`
--

DROP TABLE IF EXISTS `mgmt_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mgmt_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `review` int(11) NOT NULL,
  `reviewer` int(11) NOT NULL,
  `next_step` int(11) NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mgmt_reviews`
--

LOCK TABLES `mgmt_reviews` WRITE;
/*!40000 ALTER TABLE `mgmt_reviews` DISABLE KEYS */;
INSERT INTO `mgmt_reviews` VALUES (1,1,'2014-03-15 10:28:49',2,1,2,''),(2,2,'2014-03-15 10:37:09',1,1,2,'Consider');
/*!40000 ALTER TABLE `mgmt_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitigation_effort`
--

DROP TABLE IF EXISTS `mitigation_effort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mitigation_effort` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitigation_effort`
--

LOCK TABLES `mitigation_effort` WRITE;
/*!40000 ALTER TABLE `mitigation_effort` DISABLE KEYS */;
INSERT INTO `mitigation_effort` VALUES (1,'Trivial'),(2,'Minor'),(3,'Considerable'),(4,'Significant'),(5,'Exceptional');
/*!40000 ALTER TABLE `mitigation_effort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitigations`
--

DROP TABLE IF EXISTS `mitigations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mitigations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `risk_id` int(11) NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `planning_strategy` int(11) NOT NULL,
  `mitigation_effort` int(11) NOT NULL,
  `current_solution` text NOT NULL,
  `security_requirements` text NOT NULL,
  `security_recommendations` text NOT NULL,
  `submitted_by` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitigations`
--

LOCK TABLES `mitigations` WRITE;
/*!40000 ALTER TABLE `mitigations` DISABLE KEYS */;
INSERT INTO `mitigations` VALUES (1,2,'2014-04-08 11:10:37','0000-00-00 00:00:00',2,0,'','','',1),(2,4,'2014-04-08 11:11:30','0000-00-00 00:00:00',2,0,'','','',1);
/*!40000 ALTER TABLE `mitigations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `next_step`
--

DROP TABLE IF EXISTS `next_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `next_step` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `next_step`
--

LOCK TABLES `next_step` WRITE;
/*!40000 ALTER TABLE `next_step` DISABLE KEYS */;
INSERT INTO `next_step` VALUES (1,'Accept Until Next Review'),(2,'Consider for Project'),(3,'Submit as a Production Issue');
/*!40000 ALTER TABLE `next_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `teamid` int(11) NOT NULL,
  `submitrisks` tinyint(1) NOT NULL,
  `modifyrisks` tinyint(1) NOT NULL,
  `closerisks` tinyint(1) NOT NULL,
  `planmitigation` tinyint(1) NOT NULL,
  PRIMARY KEY (`teamid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,0,0,0,0),(2,0,0,0,0),(3,0,0,0,0),(4,0,0,0,0),(5,0,0,0,0),(6,0,0,0,0),(7,0,0,0,0),(8,0,0,0,0),(9,0,0,0,0),(10,0,0,0,0);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset`
--

DROP TABLE IF EXISTS `password_reset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset` (
  `username` varchar(20) NOT NULL,
  `token` varchar(20) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset`
--

LOCK TABLES `password_reset` WRITE;
/*!40000 ALTER TABLE `password_reset` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planning_strategy`
--

DROP TABLE IF EXISTS `planning_strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planning_strategy` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planning_strategy`
--

LOCK TABLES `planning_strategy` WRITE;
/*!40000 ALTER TABLE `planning_strategy` DISABLE KEYS */;
INSERT INTO `planning_strategy` VALUES (1,'Research'),(2,'Accept'),(3,'Mitigate'),(4,'Watch');
/*!40000 ALTER TABLE `planning_strategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedure`
--

DROP TABLE IF EXISTS `procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedure` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(45) DEFAULT NULL,
  `p_description` varchar(200) DEFAULT NULL,
  `p_impl_status` int(11) DEFAULT '0',
  `p_submission_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `p_regulation` int(11) DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `PROC_IMPL_idx` (`p_impl_status`),
  KEY `PROC_REGU_idx` (`p_regulation`),
  CONSTRAINT `PROC_IMPL` FOREIGN KEY (`p_impl_status`) REFERENCES `impl_status` (`key`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PROC_REGU` FOREIGN KEY (`p_regulation`) REFERENCES `regulation` (`value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedure`
--

LOCK TABLES `procedure` WRITE;
/*!40000 ALTER TABLE `procedure` DISABLE KEYS */;
INSERT INTO `procedure` VALUES (1,'Harsha','12345',0,'2014-03-14 05:48:07',NULL),(2,'Proc1','ProcDes',0,'2014-03-14 05:57:58',2);
/*!40000 ALTER TABLE `procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process` (
  `pr_id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_name` varchar(45) DEFAULT NULL,
  `pr_description` varchar(200) DEFAULT NULL,
  `pr_impl_status` int(11) DEFAULT '0',
  `pr_submission_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pr_regulation` int(11) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  KEY `PRCS_IMPL_idx` (`pr_impl_status`),
  KEY `PRCS_REGU_idx` (`pr_regulation`),
  CONSTRAINT `PRCS_IMPL` FOREIGN KEY (`pr_impl_status`) REFERENCES `impl_status` (`key`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PRCS_REGU` FOREIGN KEY (`pr_regulation`) REFERENCES `regulation` (`value`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
INSERT INTO `process` VALUES (1,'Proc1','ProcessDes',0,'2014-03-14 06:09:51',4),(2,'Proc2','Procss2',0,'2014-03-14 06:10:27',3);
/*!40000 ALTER TABLE `process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '999999',
  PRIMARY KEY (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Unassigned Risks',0),(2,'Test Project',999999);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regulation`
--

DROP TABLE IF EXISTS `regulation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regulation` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regulation`
--

LOCK TABLES `regulation` WRITE;
/*!40000 ALTER TABLE `regulation` DISABLE KEYS */;
INSERT INTO `regulation` VALUES (1,'PCI DSS'),(2,'Sarbanes-Oxley (SOX)'),(3,'HIPAA'),(4,'ISO 27001');
/*!40000 ALTER TABLE `regulation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'Approve Risk'),(2,'Reject Risk');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_levels`
--

DROP TABLE IF EXISTS `review_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_levels` (
  `value` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_levels`
--

LOCK TABLES `review_levels` WRITE;
/*!40000 ALTER TABLE `review_levels` DISABLE KEYS */;
INSERT INTO `review_levels` VALUES (90,'High'),(180,'Medium'),(360,'Low');
/*!40000 ALTER TABLE `review_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_levels`
--

DROP TABLE IF EXISTS `risk_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_levels` (
  `value` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_levels`
--

LOCK TABLES `risk_levels` WRITE;
/*!40000 ALTER TABLE `risk_levels` DISABLE KEYS */;
INSERT INTO `risk_levels` VALUES (7,'High'),(4,'Medium'),(0,'Low');
/*!40000 ALTER TABLE `risk_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_models`
--

DROP TABLE IF EXISTS `risk_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_models` (
  `value` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_models`
--

LOCK TABLES `risk_models` WRITE;
/*!40000 ALTER TABLE `risk_models` DISABLE KEYS */;
INSERT INTO `risk_models` VALUES (1,'Likelihood x Impact + 2(Impact)'),(2,'Likelihood x Impact + Impact'),(3,'Likelihood x Impact'),(4,'Likelihood x Impact + Likelihood'),(5,'Likelihood x Impact + 2(Likelihood)');
/*!40000 ALTER TABLE `risk_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risk_scoring`
--

DROP TABLE IF EXISTS `risk_scoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risk_scoring` (
  `id` int(11) NOT NULL,
  `scoring_method` int(11) NOT NULL,
  `calculated_risk` float NOT NULL,
  `CLASSIC_likelihood` float NOT NULL DEFAULT '5',
  `CLASSIC_impact` float NOT NULL DEFAULT '5',
  `CVSS_AccessVector` varchar(3) NOT NULL DEFAULT 'N',
  `CVSS_AccessComplexity` varchar(3) NOT NULL DEFAULT 'L',
  `CVSS_Authentication` varchar(3) NOT NULL DEFAULT 'N',
  `CVSS_ConfImpact` varchar(3) NOT NULL DEFAULT 'C',
  `CVSS_IntegImpact` varchar(3) NOT NULL DEFAULT 'C',
  `CVSS_AvailImpact` varchar(3) NOT NULL DEFAULT 'C',
  `CVSS_Exploitability` varchar(3) NOT NULL DEFAULT 'ND',
  `CVSS_RemediationLevel` varchar(3) NOT NULL DEFAULT 'ND',
  `CVSS_ReportConfidence` varchar(3) NOT NULL DEFAULT 'ND',
  `CVSS_CollateralDamagePotential` varchar(3) NOT NULL DEFAULT 'ND',
  `CVSS_TargetDistribution` varchar(3) NOT NULL DEFAULT 'ND',
  `CVSS_ConfidentialityRequirement` varchar(3) NOT NULL DEFAULT 'ND',
  `CVSS_IntegrityRequirement` varchar(3) NOT NULL DEFAULT 'ND',
  `CVSS_AvailabilityRequirement` varchar(3) NOT NULL DEFAULT 'ND',
  `DREAD_DamagePotential` int(11) DEFAULT '10',
  `DREAD_Reproducibility` int(11) DEFAULT '10',
  `DREAD_Exploitability` int(11) DEFAULT '10',
  `DREAD_AffectedUsers` int(11) DEFAULT '10',
  `DREAD_Discoverability` int(11) DEFAULT '10',
  `OWASP_SkillLevel` int(11) DEFAULT '10',
  `OWASP_Motive` int(11) DEFAULT '10',
  `OWASP_Opportunity` int(11) DEFAULT '10',
  `OWASP_Size` int(11) DEFAULT '10',
  `OWASP_EaseOfDiscovery` int(11) DEFAULT '10',
  `OWASP_EaseOfExploit` int(11) DEFAULT '10',
  `OWASP_Awareness` int(11) DEFAULT '10',
  `OWASP_IntrusionDetection` int(11) DEFAULT '10',
  `OWASP_LossOfConfidentiality` int(11) DEFAULT '10',
  `OWASP_LossOfIntegrity` int(11) DEFAULT '10',
  `OWASP_LossOfAvailability` int(11) DEFAULT '10',
  `OWASP_LossOfAccountability` int(11) DEFAULT '10',
  `OWASP_FinancialDamage` int(11) DEFAULT '10',
  `OWASP_ReputationDamage` int(11) DEFAULT '10',
  `OWASP_NonCompliance` int(11) DEFAULT '10',
  `OWASP_PrivacyViolation` int(11) DEFAULT '10',
  `Custom` float DEFAULT '10',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risk_scoring`
--

LOCK TABLES `risk_scoring` WRITE;
/*!40000 ALTER TABLE `risk_scoring` DISABLE KEYS */;
INSERT INTO `risk_scoring` VALUES (1,5,10,5,5,'N','L','N','C','C','C','ND','ND','ND','ND','ND','ND','ND','ND',10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10),(2,5,10,5,5,'N','L','N','C','C','C','ND','ND','ND','ND','ND','ND','ND','ND',10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10),(3,1,10,0,0,'N','L','N','C','C','C','ND','ND','ND','ND','ND','ND','ND','ND',10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10),(4,1,10,0,0,'N','L','N','C','C','C','ND','ND','ND','ND','ND','ND','ND','ND',10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10);
/*!40000 ALTER TABLE `risk_scoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `risks`
--

DROP TABLE IF EXISTS `risks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `risks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `reference_id` varchar(20) NOT NULL DEFAULT '',
  `regulation` int(11) DEFAULT NULL,
  `control_number` varchar(20) DEFAULT NULL,
  `location` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `team` int(11) NOT NULL,
  `technology` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `manager` int(11) NOT NULL,
  `assessment` longtext NOT NULL,
  `notes` longtext NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mitigation_id` int(11) NOT NULL,
  `mgmt_review` int(11) NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `close_id` int(11) NOT NULL,
  `submitted_by` int(11) NOT NULL DEFAULT '1',
  `compliance_id` int(11) NOT NULL,
  `control_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `risks`
--

LOCK TABLES `risks` WRITE;
/*!40000 ALTER TABLE `risks` DISABLE KEYS */;
INSERT INTO `risks` VALUES (1,'Closed','risk for test upload 1','risk 1',1,'c1',1,1,1,1,1,1,'1','1','2014-03-12 11:22:23','2014-03-13 06:13:39','2014-03-13 06:13:39',0,1,0,1,1,0,0),(2,'Mitigation Planned','re','risk 1',1,'c1',1,1,1,1,1,1,'1','1','2014-03-12 11:22:23','2014-04-08 06:10:37','2014-03-15 05:37:09',1,2,0,0,1,0,0),(3,'New','123','ISO',0,'',0,0,0,0,0,0,'','','2014-04-08 11:10:01','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,0,1,0,0),(4,'Mitigation Planned','Test','',0,'',0,0,0,0,0,0,'','','2014-04-08 11:11:08','2014-04-08 06:11:30','0000-00-00 00:00:00',2,0,0,0,1,0,0);
/*!40000 ALTER TABLE `risks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(32) NOT NULL,
  `access` int(10) unsigned DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('6uagdgof43alisa955kq3evk75',1394796716,'uid|s:1:\"1\";user|s:5:\"admin\";name|s:5:\"Admin\";admin|s:1:\"1\";review_high|s:1:\"1\";review_medium|s:1:\"1\";review_low|s:1:\"1\";submit_risks|s:1:\"1\";gen_report|s:1:\"0\";modify_risks|s:1:\"1\";close_risks|s:1:\"1\";plan_mitigations|s:1:\"1\";user_type|s:10:\"simplerisk\";access|s:7:\"granted\";LAST_ACTIVITY|i:1394796564;CREATED|i:1394796479;workflow_start|s:43:\"/FixRisk/control/control_implementation.php\";'),('94slf8124neij9pb8in3746aa1',1394514621,'access|s:7:\"granted\";uid|s:1:\"1\";user|s:5:\"admin\";name|s:5:\"Admin\";admin|s:1:\"1\";review_high|s:1:\"1\";review_medium|s:1:\"1\";review_low|s:1:\"1\";submit_risks|s:1:\"1\";gen_report|s:1:\"0\";modify_risks|s:1:\"1\";close_risks|s:1:\"1\";plan_mitigations|s:1:\"1\";user_type|s:10:\"simplerisk\";LAST_ACTIVITY|i:1394514621;CREATED|i:1394514497;workflow_start|s:43:\"/FixRisk/control/control_implementation.php\";'),('9s1b8f7rpnb72h54kr8hbkcvb7',1394712262,'uid|s:1:\"1\";user|s:5:\"admin\";name|s:5:\"Admin\";admin|s:1:\"1\";review_high|s:1:\"1\";review_medium|s:1:\"1\";review_low|s:1:\"1\";submit_risks|s:1:\"1\";gen_report|s:1:\"0\";modify_risks|s:1:\"1\";close_risks|s:1:\"1\";plan_mitigations|s:1:\"1\";user_type|s:10:\"simplerisk\";access|s:7:\"granted\";LAST_ACTIVITY|i:1394712258;CREATED|i:1394711985;workflow_start|s:36:\"/FixRisk/management/review_risks.php\";'),('e5082aqi0a9t8934nt3c3fngs3',1395632011,'uid|s:1:\"1\";user|s:5:\"admin\";name|s:5:\"Admin\";admin|s:1:\"1\";review_high|s:1:\"1\";review_medium|s:1:\"1\";review_low|s:1:\"1\";submit_risks|s:1:\"1\";gen_report|s:1:\"0\";modify_risks|s:1:\"1\";close_risks|s:1:\"1\";plan_mitigations|s:1:\"1\";user_type|s:10:\"simplerisk\";access|s:7:\"granted\";LAST_ACTIVITY|i:1395632011;CREATED|i:1395632011;'),('kevh52m7c47k28jl7vv01nc891',1395667851,'uid|s:1:\"1\";user|s:5:\"admin\";name|s:5:\"Admin\";admin|s:1:\"1\";review_high|s:1:\"1\";review_medium|s:1:\"1\";review_low|s:1:\"1\";submit_risks|s:1:\"1\";gen_report|s:1:\"0\";modify_risks|s:1:\"1\";close_risks|s:1:\"1\";plan_mitigations|s:1:\"1\";user_type|s:10:\"simplerisk\";access|s:7:\"granted\";LAST_ACTIVITY|i:1395667851;CREATED|i:1395667851;'),('ltl3mhkj8om7tg1ok0i7cl5hl6',1395732717,'access|s:6:\"denied\";'),('lu869qrcm6btebj22u94293gt1',1394726954,''),('rjsldonllfek3d65i9eh1m9pt7',1396955585,'uid|s:1:\"1\";user|s:5:\"admin\";name|s:5:\"Admin\";admin|s:1:\"1\";review_high|s:1:\"1\";review_medium|s:1:\"1\";review_low|s:1:\"1\";submit_risks|s:1:\"1\";gen_report|s:1:\"0\";modify_risks|s:1:\"1\";close_risks|s:1:\"1\";plan_mitigations|s:1:\"1\";user_type|s:10:\"simplerisk\";access|s:7:\"granted\";LAST_ACTIVITY|i:1396955585;CREATED|i:1396954998;workflow_start|s:41:\"/FixRisk/management/management_review.php\";'),('rrql1c2o56sieqrapt5fphi373',1394880379,'uid|s:1:\"1\";user|s:5:\"admin\";name|s:5:\"Admin\";admin|s:1:\"1\";review_high|s:1:\"1\";review_medium|s:1:\"1\";review_low|s:1:\"1\";submit_risks|s:1:\"1\";gen_report|s:1:\"0\";modify_risks|s:1:\"1\";close_risks|s:1:\"1\";plan_mitigations|s:1:\"1\";user_type|s:10:\"simplerisk\";access|s:7:\"granted\";LAST_ACTIVITY|i:1394880379;CREATED|i:1394879808;workflow_start|s:41:\"/FixRisk/management/management_review.php\";'),('s3j7po2o42b5h7opuhfotmmus5',1394631708,'LAST_ACTIVITY|i:1394631685;CREATED|i:1394631374;uid|s:1:\"1\";user|s:5:\"admin\";name|s:5:\"Admin\";admin|s:1:\"1\";review_high|s:1:\"1\";review_medium|s:1:\"1\";review_low|s:1:\"1\";submit_risks|s:1:\"1\";gen_report|s:1:\"0\";modify_risks|s:1:\"1\";close_risks|s:1:\"1\";plan_mitigations|s:1:\"1\";user_type|s:10:\"simplerisk\";access|s:7:\"granted\";workflow_start|s:40:\"/FixRisk/management/plan_mitigations.php\";');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `name` varchar(20) NOT NULL,
  `value` varchar(40) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES ('risk_model','3'),('db_version','20140224-001');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Branch Management'),(2,'Collaboration'),(3,'Data Center & Storage'),(4,'Database'),(5,'Information Security'),(6,'IT Systems Management'),(7,'Network'),(8,'Unix'),(9,'Web Systems'),(10,'Windows');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology`
--

DROP TABLE IF EXISTS `technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technology` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology`
--

LOCK TABLES `technology` WRITE;
/*!40000 ALTER TABLE `technology` DISABLE KEYS */;
INSERT INTO `technology` VALUES (1,'All'),(2,'Anti-Virus'),(3,'Backups'),(4,'Blackberry'),(5,'Citrix'),(6,'Datacenter'),(7,'Mail Routing'),(8,'Live Collaboration'),(9,'Messaging'),(10,'Mobile'),(11,'Network'),(12,'Power'),(13,'Remote Access'),(14,'SAN'),(15,'Telecom'),(16,'Unix'),(17,'VMWare'),(18,'Web'),(19,'Windows');
/*!40000 ALTER TABLE `technology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) NOT NULL DEFAULT 'simplerisk',
  `username` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `salt` varchar(20) DEFAULT NULL,
  `password` binary(60) NOT NULL,
  `last_login` datetime NOT NULL,
  `teams` varchar(200) NOT NULL DEFAULT 'none',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `review_high` tinyint(1) NOT NULL DEFAULT '0',
  `review_medium` tinyint(1) NOT NULL DEFAULT '0',
  `review_low` tinyint(1) NOT NULL DEFAULT '0',
  `submit_risks` tinyint(1) NOT NULL DEFAULT '0',
  `modify_risks` tinyint(1) NOT NULL DEFAULT '0',
  `plan_mitigations` tinyint(1) NOT NULL DEFAULT '0',
  `close_risks` tinyint(1) NOT NULL DEFAULT '1',
  `multi_factor` int(11) NOT NULL DEFAULT '1',
  `gen_report` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'simplerisk','admin','Admin','user@example.com','sAbwTbIFywWKcheyQw9a','$2a$15$7b2601b4979b1ad031b2fuqf1XkeSa4iNxsHK27tq5Va2jLhzkShW','2014-04-08 05:52:02','all',1,1,1,1,1,1,1,1,1,0),(2,0,'simplerisk','sriharsha.kappala','Sri Harsha Kappala','sriharsha.kappala@hotmail.com','FUwJ1Fcwfljm0cl9hdi5','$2a$15$0fb300a6cc1dc061004d1OJVbtkhbLeaswGdv9H9TqGrbO/9JfloK','0000-00-00 00:00:00','none',0,0,0,0,0,0,0,0,1,0);
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

-- Dump completed on 2014-04-08 11:29:18
