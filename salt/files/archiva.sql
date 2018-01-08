-- MySQL dump 10.13  Distrib 5.5.58, for Linux (x86_64)
--
-- Host: localhost    Database: archiva
-- ------------------------------------------------------
-- Server version	5.5.58

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
-- Table structure for table `JDOAUTHENTICATIONKEY`
--

DROP TABLE IF EXISTS `JDOAUTHENTICATIONKEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JDOAUTHENTICATIONKEY` (
  `AUTHKEY` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `DATE_CREATED` datetime DEFAULT NULL,
  `DATE_EXPIRES` datetime DEFAULT NULL,
  `FOR_PRINCIPAL` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `PURPOSE` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`AUTHKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JDOAUTHENTICATIONKEY`
--

LOCK TABLES `JDOAUTHENTICATIONKEY` WRITE;
/*!40000 ALTER TABLE `JDOAUTHENTICATIONKEY` DISABLE KEYS */;
INSERT INTO `JDOAUTHENTICATIONKEY` VALUES ('4cfeeb5016b04920b72be548880068a0','2017-12-20 00:25:13','2017-12-22 00:25:13','tlian','Password Reset Request'),('56d4f710a52b4d028aea03a07827c7d5','2017-12-20 00:25:49','2017-12-22 00:25:49','tlian','Password Reset Request'),('81154328b5cd4f25b39676953a177f88','2017-12-21 10:14:55','2017-12-23 10:14:55','holder','Password Reset Request'),('c82e86478f674a44a4610b2ca7654cbd','2017-12-21 09:44:36','2017-12-23 09:44:36','holder','Password Reset Request'),('ee8399f54af844259d92e0bb2df54e50','2017-12-22 06:50:04','2017-12-24 06:50:04','tlian','Password Reset Request');
/*!40000 ALTER TABLE `JDOAUTHENTICATIONKEY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JDOUSER`
--

DROP TABLE IF EXISTS `JDOUSER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JDOUSER` (
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ACCOUNT_CREATION_DATE` datetime DEFAULT NULL,
  `COUNT_FAILED_LOGIN_ATTEMPTS` int(11) NOT NULL,
  `EMAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ENCODED_PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `FULL_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LAST_LOGIN_DATE` datetime DEFAULT NULL,
  `LAST_PASSWORD_CHANGE` datetime DEFAULT NULL,
  `LOCKED` bit(1) NOT NULL,
  `USER_PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_CHANGE_REQUIRED` bit(1) NOT NULL,
  `PERMANENT` bit(1) NOT NULL,
  `VALIDATED` bit(1) NOT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `JDOUSER_PREVIOUSENCODEDPASSWORDS`
--

DROP TABLE IF EXISTS `JDOUSER_PREVIOUSENCODEDPASSWORDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JDOUSER_PREVIOUSENCODEDPASSWORDS` (
  `USERNAME_OID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `STRING_ELE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`USERNAME_OID`,`INTEGER_IDX`),
  CONSTRAINT `JDOUSER_PREVIOUSENCODEDPASSWORDS_FK1` FOREIGN KEY (`USERNAME_OID`) REFERENCES `JDOUSER` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SECURITY_OPERATIONS`
--

DROP TABLE IF EXISTS `SECURITY_OPERATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SECURITY_OPERATIONS` (
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PERMANENT` bit(1) NOT NULL,
  `RESOURCE_REQUIRED` bit(1) NOT NULL,
  PRIMARY KEY (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SECURITY_OPERATIONS`
--

LOCK TABLES `SECURITY_OPERATIONS` WRITE;
/*!40000 ALTER TABLE `SECURITY_OPERATIONS` DISABLE KEYS */;
INSERT INTO `SECURITY_OPERATIONS` VALUES ('archiva-access-reports','Access Archiva Reports','\0','\0'),('archiva-access-repository','Access Archiva Repository','\0','\0'),('archiva-add-metadata','Add Repository Metadata','\0','\0'),('archiva-add-repository','Add Archiva Repository','\0','\0'),('archiva-delete-artifact','Delete Artifact','\0','\0'),('archiva-delete-metadata','Delete Repository Metadata','\0','\0'),('archiva-delete-repository','Delete Archiva Repository','\0','\0'),('archiva-edit-repository','Edit Archiva Repository','\0','\0'),('archiva-guest','Active Archiva Guest','\0','\0'),('archiva-manage-configuration','Manage Archiva Configuration','\0','\0'),('archiva-manage-users','Manage Archiva Users','\0','\0'),('archiva-merge-repository','Archiva Merge Repository','\0','\0'),('archiva-read-repository','Read Archiva Repository','\0','\0'),('archiva-regenerate-index','Regenerate Archiva Index','\0','\0'),('archiva-run-indexer','Run Archiva Indexer','\0','\0'),('archiva-upload-repository','Upload Archiva Repository','\0','\0'),('archiva-view-audit-logs','View Archiva Audit Logs','\0','\0'),('configuration-edit','edit configuration','','\0'),('guest-access','access guest','','\0'),('user-management-manage-data','manage data','','\0'),('user-management-rbac-admin','administer rbac','','\0'),('user-management-role-drop','drop role','','\0'),('user-management-role-grant','grant role','','\0'),('user-management-user-create','create user','','\0'),('user-management-user-delete','delete user','','\0'),('user-management-user-edit','edit user','','\0'),('user-management-user-list','list users','','\0'),('user-management-user-role','user roles','','\0');
/*!40000 ALTER TABLE `SECURITY_OPERATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SECURITY_PERMISSIONS`
--

DROP TABLE IF EXISTS `SECURITY_PERMISSIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SECURITY_PERMISSIONS` (
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `OPERATION_NAME_OID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PERMANENT` bit(1) NOT NULL,
  `RESOURCE_IDENTIFIER_OID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`NAME`),
  KEY `SECURITY_PERMISSIONS_N50` (`RESOURCE_IDENTIFIER_OID`),
  KEY `SECURITY_PERMISSIONS_N49` (`OPERATION_NAME_OID`),
  CONSTRAINT `SECURITY_PERMISSIONS_FK1` FOREIGN KEY (`OPERATION_NAME_OID`) REFERENCES `SECURITY_OPERATIONS` (`NAME`),
  CONSTRAINT `SECURITY_PERMISSIONS_FK2` FOREIGN KEY (`RESOURCE_IDENTIFIER_OID`) REFERENCES `SECURITY_RESOURCES` (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SECURITY_PERMISSIONS`
--

LOCK TABLES `SECURITY_PERMISSIONS` WRITE;
/*!40000 ALTER TABLE `SECURITY_PERMISSIONS` DISABLE KEYS */;
INSERT INTO `SECURITY_PERMISSIONS` VALUES ('Access User List',NULL,'user-management-user-list','','*'),('Access Users Roles',NULL,'user-management-user-role','','*'),('Archiva Add Repository',NULL,'archiva-add-repository','','*'),('Archiva Add Repository Metadata - BLIlluminationDiscriminationCalcs',NULL,'archiva-add-metadata','\0','BLIlluminationDiscriminationCalcs'),('Archiva Add Repository Metadata - BLprojects',NULL,'archiva-add-metadata','\0','BLprojects'),('Archiva Add Repository Metadata - IBIOColorDetect',NULL,'archiva-add-metadata','\0','IBIOColorDetect'),('Archiva Add Repository Metadata - RenderToolbox',NULL,'archiva-add-metadata','\0','RenderToolbox'),('Archiva Add Repository Metadata - demo-repository',NULL,'archiva-add-metadata','\0','demo-repository'),('Archiva Add Repository Metadata - internal',NULL,'archiva-add-metadata','\0','internal'),('Archiva Add Repository Metadata - isetbio',NULL,'archiva-add-metadata','\0','isetbio'),('Archiva Add Repository Metadata - isetbio-test',NULL,'archiva-add-metadata','\0','isetbio-test'),('Archiva Add Repository Metadata - scien',NULL,'archiva-add-metadata','\0','scien'),('Archiva Add Repository Metadata - snapshots',NULL,'archiva-add-metadata','\0','snapshots'),('Archiva Add Repository Metadata - temporalFittingEngine',NULL,'archiva-add-metadata','\0','temporalFittingEngine'),('Archiva Add Repository Metadata - test-repository',NULL,'archiva-add-metadata','\0','test-repository'),('Archiva Add Repository Metadata - vistasoft',NULL,'archiva-add-metadata','\0','vistasoft'),('Archiva Delete Repository - BLIlluminationDiscriminationCalcs',NULL,'archiva-delete-repository','\0','BLIlluminationDiscriminationCalcs'),('Archiva Delete Repository - BLprojects',NULL,'archiva-delete-repository','\0','BLprojects'),('Archiva Delete Repository - IBIOColorDetect',NULL,'archiva-delete-repository','\0','IBIOColorDetect'),('Archiva Delete Repository - RenderToolbox',NULL,'archiva-delete-repository','\0','RenderToolbox'),('Archiva Delete Repository - demo-repository',NULL,'archiva-delete-repository','\0','demo-repository'),('Archiva Delete Repository - internal',NULL,'archiva-delete-repository','\0','internal'),('Archiva Delete Repository - isetbio',NULL,'archiva-delete-repository','\0','isetbio'),('Archiva Delete Repository - isetbio-test',NULL,'archiva-delete-repository','\0','isetbio-test'),('Archiva Delete Repository - scien',NULL,'archiva-delete-repository','\0','scien'),('Archiva Delete Repository - snapshots',NULL,'archiva-delete-repository','\0','snapshots'),('Archiva Delete Repository - temporalFittingEngine',NULL,'archiva-delete-repository','\0','temporalFittingEngine'),('Archiva Delete Repository - test-repository',NULL,'archiva-delete-repository','\0','test-repository'),('Archiva Delete Repository - vistasoft',NULL,'archiva-delete-repository','\0','vistasoft'),('Archiva Delete Repository Metadata - BLIlluminationDiscriminationCalcs',NULL,'archiva-delete-metadata','\0','BLIlluminationDiscriminationCalcs'),('Archiva Delete Repository Metadata - BLprojects',NULL,'archiva-delete-metadata','\0','BLprojects'),('Archiva Delete Repository Metadata - IBIOColorDetect',NULL,'archiva-delete-metadata','\0','IBIOColorDetect'),('Archiva Delete Repository Metadata - RenderToolbox',NULL,'archiva-delete-metadata','\0','RenderToolbox'),('Archiva Delete Repository Metadata - demo-repository',NULL,'archiva-delete-metadata','\0','demo-repository'),('Archiva Delete Repository Metadata - internal',NULL,'archiva-delete-metadata','\0','internal'),('Archiva Delete Repository Metadata - isetbio',NULL,'archiva-delete-metadata','\0','isetbio'),('Archiva Delete Repository Metadata - isetbio-test',NULL,'archiva-delete-metadata','\0','isetbio-test'),('Archiva Delete Repository Metadata - scien',NULL,'archiva-delete-metadata','\0','scien'),('Archiva Delete Repository Metadata - snapshots',NULL,'archiva-delete-metadata','\0','snapshots'),('Archiva Delete Repository Metadata - temporalFittingEngine',NULL,'archiva-delete-metadata','\0','temporalFittingEngine'),('Archiva Delete Repository Metadata - test-repository',NULL,'archiva-delete-metadata','\0','test-repository'),('Archiva Delete Repository Metadata - vistasoft',NULL,'archiva-delete-metadata','\0','vistasoft'),('Archiva Edit Repository - BLIlluminationDiscriminationCalcs',NULL,'archiva-edit-repository','\0','BLIlluminationDiscriminationCalcs'),('Archiva Edit Repository - BLprojects',NULL,'archiva-edit-repository','\0','BLprojects'),('Archiva Edit Repository - IBIOColorDetect',NULL,'archiva-edit-repository','\0','IBIOColorDetect'),('Archiva Edit Repository - RenderToolbox',NULL,'archiva-edit-repository','\0','RenderToolbox'),('Archiva Edit Repository - demo-repository',NULL,'archiva-edit-repository','\0','demo-repository'),('Archiva Edit Repository - internal',NULL,'archiva-edit-repository','\0','internal'),('Archiva Edit Repository - isetbio',NULL,'archiva-edit-repository','\0','isetbio'),('Archiva Edit Repository - isetbio-test',NULL,'archiva-edit-repository','\0','isetbio-test'),('Archiva Edit Repository - scien',NULL,'archiva-edit-repository','\0','scien'),('Archiva Edit Repository - snapshots',NULL,'archiva-edit-repository','\0','snapshots'),('Archiva Edit Repository - temporalFittingEngine',NULL,'archiva-edit-repository','\0','temporalFittingEngine'),('Archiva Edit Repository - test-repository',NULL,'archiva-edit-repository','\0','test-repository'),('Archiva Edit Repository - vistasoft',NULL,'archiva-edit-repository','\0','vistasoft'),('Archiva Guest Permission',NULL,'archiva-guest','','*'),('Archiva Merge Repository - BLIlluminationDiscriminationCalcs',NULL,'archiva-merge-repository','\0','BLIlluminationDiscriminationCalcs'),('Archiva Merge Repository - BLprojects',NULL,'archiva-merge-repository','\0','BLprojects'),('Archiva Merge Repository - IBIOColorDetect',NULL,'archiva-merge-repository','\0','IBIOColorDetect'),('Archiva Merge Repository - RenderToolbox',NULL,'archiva-merge-repository','\0','RenderToolbox'),('Archiva Merge Repository - demo-repository',NULL,'archiva-merge-repository','\0','demo-repository'),('Archiva Merge Repository - internal',NULL,'archiva-merge-repository','\0','internal'),('Archiva Merge Repository - isetbio',NULL,'archiva-merge-repository','\0','isetbio'),('Archiva Merge Repository - isetbio-test',NULL,'archiva-merge-repository','\0','isetbio-test'),('Archiva Merge Repository - scien',NULL,'archiva-merge-repository','\0','scien'),('Archiva Merge Repository - snapshots',NULL,'archiva-merge-repository','\0','snapshots'),('Archiva Merge Repository - temporalFittingEngine',NULL,'archiva-merge-repository','\0','temporalFittingEngine'),('Archiva Merge Repository - test-repository',NULL,'archiva-merge-repository','\0','test-repository'),('Archiva Merge Repository - vistasoft',NULL,'archiva-merge-repository','\0','vistasoft'),('Archiva Read Repository - BLIlluminationDiscriminationCalcs',NULL,'archiva-read-repository','\0','BLIlluminationDiscriminationCalcs'),('Archiva Read Repository - BLprojects',NULL,'archiva-read-repository','\0','BLprojects'),('Archiva Read Repository - IBIOColorDetect',NULL,'archiva-read-repository','\0','IBIOColorDetect'),('Archiva Read Repository - RenderToolbox',NULL,'archiva-read-repository','\0','RenderToolbox'),('Archiva Read Repository - demo-repository',NULL,'archiva-read-repository','\0','demo-repository'),('Archiva Read Repository - internal',NULL,'archiva-read-repository','\0','internal'),('Archiva Read Repository - isetbio',NULL,'archiva-read-repository','\0','isetbio'),('Archiva Read Repository - isetbio-test',NULL,'archiva-read-repository','\0','isetbio-test'),('Archiva Read Repository - scien',NULL,'archiva-read-repository','\0','scien'),('Archiva Read Repository - snapshots',NULL,'archiva-read-repository','\0','snapshots'),('Archiva Read Repository - temporalFittingEngine',NULL,'archiva-read-repository','\0','temporalFittingEngine'),('Archiva Read Repository - test-repository',NULL,'archiva-read-repository','\0','test-repository'),('Archiva Read Repository - vistasoft',NULL,'archiva-read-repository','\0','vistasoft'),('Archiva Upload to Repository - BLIlluminationDiscriminationCalcs',NULL,'archiva-upload-repository','\0','BLIlluminationDiscriminationCalcs'),('Archiva Upload to Repository - BLprojects',NULL,'archiva-upload-repository','\0','BLprojects'),('Archiva Upload to Repository - IBIOColorDetect',NULL,'archiva-upload-repository','\0','IBIOColorDetect'),('Archiva Upload to Repository - RenderToolbox',NULL,'archiva-upload-repository','\0','RenderToolbox'),('Archiva Upload to Repository - demo-repository',NULL,'archiva-upload-repository','\0','demo-repository'),('Archiva Upload to Repository - internal',NULL,'archiva-upload-repository','\0','internal'),('Archiva Upload to Repository - isetbio',NULL,'archiva-upload-repository','\0','isetbio'),('Archiva Upload to Repository - isetbio-test',NULL,'archiva-upload-repository','\0','isetbio-test'),('Archiva Upload to Repository - scien',NULL,'archiva-upload-repository','\0','scien'),('Archiva Upload to Repository - snapshots',NULL,'archiva-upload-repository','\0','snapshots'),('Archiva Upload to Repository - temporalFittingEngine',NULL,'archiva-upload-repository','\0','temporalFittingEngine'),('Archiva Upload to Repository - test-repository',NULL,'archiva-upload-repository','\0','test-repository'),('Archiva Upload to Repository - vistasoft',NULL,'archiva-upload-repository','\0','vistasoft'),('Archiva View Audit Logs - BLIlluminationDiscriminationCalcs',NULL,'archiva-view-audit-logs','\0','BLIlluminationDiscriminationCalcs'),('Archiva View Audit Logs - BLprojects',NULL,'archiva-view-audit-logs','\0','BLprojects'),('Archiva View Audit Logs - IBIOColorDetect',NULL,'archiva-view-audit-logs','\0','IBIOColorDetect'),('Archiva View Audit Logs - RenderToolbox',NULL,'archiva-view-audit-logs','\0','RenderToolbox'),('Archiva View Audit Logs - demo-repository',NULL,'archiva-view-audit-logs','\0','demo-repository'),('Archiva View Audit Logs - internal',NULL,'archiva-view-audit-logs','\0','internal'),('Archiva View Audit Logs - isetbio',NULL,'archiva-view-audit-logs','\0','isetbio'),('Archiva View Audit Logs - isetbio-test',NULL,'archiva-view-audit-logs','\0','isetbio-test'),('Archiva View Audit Logs - scien',NULL,'archiva-view-audit-logs','\0','scien'),('Archiva View Audit Logs - snapshots',NULL,'archiva-view-audit-logs','\0','snapshots'),('Archiva View Audit Logs - temporalFittingEngine',NULL,'archiva-view-audit-logs','\0','temporalFittingEngine'),('Archiva View Audit Logs - test-repository',NULL,'archiva-view-audit-logs','\0','test-repository'),('Archiva View Audit Logs - vistasoft',NULL,'archiva-view-audit-logs','\0','vistasoft'),('Create Users',NULL,'user-management-user-create','','*'),('Delete Artifact - BLIlluminationDiscriminationCalcs',NULL,'archiva-delete-artifact','\0','BLIlluminationDiscriminationCalcs'),('Delete Artifact - BLprojects',NULL,'archiva-delete-artifact','\0','BLprojects'),('Delete Artifact - IBIOColorDetect',NULL,'archiva-delete-artifact','\0','IBIOColorDetect'),('Delete Artifact - RenderToolbox',NULL,'archiva-delete-artifact','\0','RenderToolbox'),('Delete Artifact - demo-repository',NULL,'archiva-delete-artifact','\0','demo-repository'),('Delete Artifact - internal',NULL,'archiva-delete-artifact','\0','internal'),('Delete Artifact - isetbio',NULL,'archiva-delete-artifact','\0','isetbio'),('Delete Artifact - isetbio-test',NULL,'archiva-delete-artifact','\0','isetbio-test'),('Delete Artifact - scien',NULL,'archiva-delete-artifact','\0','scien'),('Delete Artifact - snapshots',NULL,'archiva-delete-artifact','\0','snapshots'),('Delete Artifact - temporalFittingEngine',NULL,'archiva-delete-artifact','\0','temporalFittingEngine'),('Delete Artifact - test-repository',NULL,'archiva-delete-artifact','\0','test-repository'),('Delete Artifact - vistasoft',NULL,'archiva-delete-artifact','\0','vistasoft'),('Delete Users',NULL,'user-management-user-delete','','*'),('Drop Roles for Anyone',NULL,'user-management-role-drop','','*'),('Edit Redback Configuration',NULL,'configuration-edit','','*'),('Edit User Data by Username',NULL,'user-management-user-edit','','${username}'),('Edit Users',NULL,'user-management-user-edit','','*'),('Grant Roles for Anyone',NULL,'user-management-role-grant','','*'),('Guest Permission',NULL,'guest-access','','*'),('RBAC Manage Data',NULL,'user-management-manage-data','','*'),('User RBAC Management',NULL,'user-management-rbac-admin','','*'),('archiva-access-reports',NULL,'archiva-access-reports','','*'),('archiva-manage-configuration',NULL,'archiva-manage-configuration','','*'),('archiva-manage-users',NULL,'archiva-manage-users','','*'),('archiva-regenerate-index',NULL,'archiva-regenerate-index','','*'),('archiva-run-indexer',NULL,'archiva-run-indexer','','*');
/*!40000 ALTER TABLE `SECURITY_PERMISSIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SECURITY_RESOURCES`
--

DROP TABLE IF EXISTS `SECURITY_RESOURCES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SECURITY_RESOURCES` (
  `IDENTIFIER` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PATTERN` bit(1) NOT NULL,
  `PERMANENT` bit(1) NOT NULL,
  PRIMARY KEY (`IDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SECURITY_RESOURCES`
--

LOCK TABLES `SECURITY_RESOURCES` WRITE;
/*!40000 ALTER TABLE `SECURITY_RESOURCES` DISABLE KEYS */;
INSERT INTO `SECURITY_RESOURCES` VALUES ('${username}','\0',''),('*','\0',''),('BLIlluminationDiscriminationCalcs','\0','\0'),('BLprojects','\0','\0'),('IBIOColorDetect','\0','\0'),('RenderToolbox','\0','\0'),('demo-repository','\0','\0'),('internal','\0','\0'),('isetbio','\0','\0'),('isetbio-test','\0','\0'),('scien','\0','\0'),('snapshots','\0','\0'),('temporalFittingEngine','\0','\0'),('test-repository','\0','\0'),('vistasoft','\0','\0');
/*!40000 ALTER TABLE `SECURITY_RESOURCES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SECURITY_ROLES`
--

DROP TABLE IF EXISTS `SECURITY_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SECURITY_ROLES` (
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ASSIGNABLE` bit(1) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PERMANENT` bit(1) NOT NULL,
  PRIMARY KEY (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SECURITY_ROLES`
--

LOCK TABLES `SECURITY_ROLES` WRITE;
/*!40000 ALTER TABLE `SECURITY_ROLES` DISABLE KEYS */;
INSERT INTO `SECURITY_ROLES` VALUES ('Archiva Guest','\0',NULL,''),('Archiva System Administrator','\0',NULL,''),('Archiva User Administrator','\0',NULL,''),('Global Repository Manager','',NULL,''),('Global Repository Observer','',NULL,''),('Guest','',NULL,''),('Registered User','',NULL,''),('Repository Manager - BLIlluminationDiscriminationCalcs','',NULL,'\0'),('Repository Manager - BLprojects','',NULL,'\0'),('Repository Manager - IBIOColorDetect','',NULL,'\0'),('Repository Manager - RenderToolbox','',NULL,'\0'),('Repository Manager - demo-repository','',NULL,'\0'),('Repository Manager - internal','',NULL,'\0'),('Repository Manager - isetbio','',NULL,'\0'),('Repository Manager - isetbio-test','',NULL,'\0'),('Repository Manager - scien','',NULL,'\0'),('Repository Manager - snapshots','',NULL,'\0'),('Repository Manager - temporalFittingEngine','',NULL,'\0'),('Repository Manager - test-repository','',NULL,'\0'),('Repository Manager - vistasoft','',NULL,'\0'),('Repository Observer - BLIlluminationDiscriminationCalcs','',NULL,'\0'),('Repository Observer - BLprojects','',NULL,'\0'),('Repository Observer - IBIOColorDetect','',NULL,'\0'),('Repository Observer - RenderToolbox','',NULL,'\0'),('Repository Observer - demo-repository','',NULL,'\0'),('Repository Observer - internal','',NULL,'\0'),('Repository Observer - isetbio','',NULL,'\0'),('Repository Observer - isetbio-test','',NULL,'\0'),('Repository Observer - scien','',NULL,'\0'),('Repository Observer - snapshots','',NULL,'\0'),('Repository Observer - temporalFittingEngine','',NULL,'\0'),('Repository Observer - test-repository','',NULL,'\0'),('Repository Observer - vistasoft','',NULL,'\0'),('System Administrator','',NULL,''),('User Administrator','',NULL,'');
/*!40000 ALTER TABLE `SECURITY_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SECURITY_ROLE_CHILDROLE_MAP`
--

DROP TABLE IF EXISTS `SECURITY_ROLE_CHILDROLE_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SECURITY_ROLE_CHILDROLE_MAP` (
  `NAME_OID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `STRING_ELE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`NAME_OID`,`INTEGER_IDX`),
  CONSTRAINT `SECURITY_ROLE_CHILDROLE_MAP_FK1` FOREIGN KEY (`NAME_OID`) REFERENCES `SECURITY_ROLES` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SECURITY_ROLE_CHILDROLE_MAP`
--

LOCK TABLES `SECURITY_ROLE_CHILDROLE_MAP` WRITE;
/*!40000 ALTER TABLE `SECURITY_ROLE_CHILDROLE_MAP` DISABLE KEYS */;
INSERT INTO `SECURITY_ROLE_CHILDROLE_MAP` VALUES ('Archiva System Administrator','Global Repository Manager',0),('Global Repository Manager','Global Repository Observer',0),('Global Repository Manager','Repository Manager - internal',1),('Global Repository Manager','Repository Manager - snapshots',2),('Global Repository Manager','Repository Manager - test-repository',3),('Global Repository Manager','Repository Manager - demo-repository',4),('Global Repository Manager','Repository Manager - isetbio',5),('Global Repository Manager','Repository Manager - isetbio-test',6),('Global Repository Manager','Repository Manager - scien',7),('Global Repository Manager','Repository Manager - vistasoft',8),('Global Repository Manager','Repository Manager - BLprojects',9),('Global Repository Manager','Repository Manager - temporalFittingEngine',10),('Global Repository Manager','Repository Manager - IBIOColorDetect',11),('Global Repository Manager','Repository Manager - RenderToolbox',12),('Global Repository Manager','Repository Manager - BLIlluminationDiscriminationCalcs',13),('Global Repository Observer','Repository Observer - internal',0),('Global Repository Observer','Repository Observer - snapshots',1),('Global Repository Observer','Repository Observer - test-repository',2),('Global Repository Observer','Repository Observer - demo-repository',3),('Global Repository Observer','Repository Observer - isetbio',4),('Global Repository Observer','Repository Observer - isetbio-test',5),('Global Repository Observer','Repository Observer - scien',6),('Global Repository Observer','Repository Observer - vistasoft',7),('Global Repository Observer','Repository Observer - BLprojects',8),('Global Repository Observer','Repository Observer - temporalFittingEngine',9),('Global Repository Observer','Repository Observer - IBIOColorDetect',10),('Global Repository Observer','Repository Observer - RenderToolbox',11),('Global Repository Observer','Repository Observer - BLIlluminationDiscriminationCalcs',12),('Guest','Archiva Guest',0),('Repository Manager - BLIlluminationDiscriminationCalcs','Repository Observer - BLIlluminationDiscriminationCalcs',0),('Repository Manager - BLprojects','Repository Observer - BLprojects',0),('Repository Manager - IBIOColorDetect','Repository Observer - IBIOColorDetect',0),('Repository Manager - RenderToolbox','Repository Observer - RenderToolbox',0),('Repository Manager - demo-repository','Repository Observer - demo-repository',0),('Repository Manager - internal','Repository Observer - internal',0),('Repository Manager - isetbio','Repository Observer - isetbio',0),('Repository Manager - isetbio-test','Repository Observer - isetbio-test',0),('Repository Manager - scien','Repository Observer - scien',0),('Repository Manager - snapshots','Repository Observer - snapshots',0),('Repository Manager - temporalFittingEngine','Repository Observer - temporalFittingEngine',0),('Repository Manager - test-repository','Repository Observer - test-repository',0),('Repository Manager - vistasoft','Repository Observer - vistasoft',0),('System Administrator','User Administrator',0),('System Administrator','Archiva System Administrator',1),('User Administrator','Archiva User Administrator',0);
/*!40000 ALTER TABLE `SECURITY_ROLE_CHILDROLE_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SECURITY_ROLE_PERMISSION_MAP`
--

DROP TABLE IF EXISTS `SECURITY_ROLE_PERMISSION_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SECURITY_ROLE_PERMISSION_MAP` (
  `NAME_OID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NAME_EID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`NAME_OID`,`INTEGER_IDX`),
  KEY `SECURITY_ROLE_PERMISSION_MAP_N49` (`NAME_EID`),
  CONSTRAINT `SECURITY_ROLE_PERMISSION_MAP_FK1` FOREIGN KEY (`NAME_OID`) REFERENCES `SECURITY_ROLES` (`NAME`),
  CONSTRAINT `SECURITY_ROLE_PERMISSION_MAP_FK2` FOREIGN KEY (`NAME_EID`) REFERENCES `SECURITY_PERMISSIONS` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SECURITY_ROLE_PERMISSION_MAP`
--

LOCK TABLES `SECURITY_ROLE_PERMISSION_MAP` WRITE;
/*!40000 ALTER TABLE `SECURITY_ROLE_PERMISSION_MAP` DISABLE KEYS */;
INSERT INTO `SECURITY_ROLE_PERMISSION_MAP` VALUES ('User Administrator','Access User List',6),('User Administrator','Access Users Roles',5),('Global Repository Manager','Archiva Add Repository',0),('Repository Manager - BLIlluminationDiscriminationCalcs','Archiva Add Repository Metadata - BLIlluminationDiscriminationCalcs',5),('Repository Manager - BLprojects','Archiva Add Repository Metadata - BLprojects',5),('Repository Manager - IBIOColorDetect','Archiva Add Repository Metadata - IBIOColorDetect',5),('Repository Manager - RenderToolbox','Archiva Add Repository Metadata - RenderToolbox',5),('Repository Manager - demo-repository','Archiva Add Repository Metadata - demo-repository',5),('Repository Manager - internal','Archiva Add Repository Metadata - internal',5),('Repository Manager - isetbio','Archiva Add Repository Metadata - isetbio',5),('Repository Manager - isetbio-test','Archiva Add Repository Metadata - isetbio-test',5),('Repository Manager - scien','Archiva Add Repository Metadata - scien',5),('Repository Manager - snapshots','Archiva Add Repository Metadata - snapshots',5),('Repository Manager - temporalFittingEngine','Archiva Add Repository Metadata - temporalFittingEngine',5),('Repository Manager - test-repository','Archiva Add Repository Metadata - test-repository',5),('Repository Manager - vistasoft','Archiva Add Repository Metadata - vistasoft',5),('Repository Manager - BLIlluminationDiscriminationCalcs','Archiva Delete Repository - BLIlluminationDiscriminationCalcs',2),('Repository Manager - BLprojects','Archiva Delete Repository - BLprojects',2),('Repository Manager - IBIOColorDetect','Archiva Delete Repository - IBIOColorDetect',2),('Repository Manager - RenderToolbox','Archiva Delete Repository - RenderToolbox',2),('Repository Manager - demo-repository','Archiva Delete Repository - demo-repository',2),('Repository Manager - internal','Archiva Delete Repository - internal',2),('Repository Manager - isetbio','Archiva Delete Repository - isetbio',2),('Repository Manager - isetbio-test','Archiva Delete Repository - isetbio-test',2),('Repository Manager - scien','Archiva Delete Repository - scien',2),('Repository Manager - snapshots','Archiva Delete Repository - snapshots',2),('Repository Manager - temporalFittingEngine','Archiva Delete Repository - temporalFittingEngine',2),('Repository Manager - test-repository','Archiva Delete Repository - test-repository',2),('Repository Manager - vistasoft','Archiva Delete Repository - vistasoft',2),('Repository Manager - BLIlluminationDiscriminationCalcs','Archiva Delete Repository Metadata - BLIlluminationDiscriminationCalcs',6),('Repository Manager - BLprojects','Archiva Delete Repository Metadata - BLprojects',6),('Repository Manager - IBIOColorDetect','Archiva Delete Repository Metadata - IBIOColorDetect',6),('Repository Manager - RenderToolbox','Archiva Delete Repository Metadata - RenderToolbox',6),('Repository Manager - demo-repository','Archiva Delete Repository Metadata - demo-repository',6),('Repository Manager - internal','Archiva Delete Repository Metadata - internal',6),('Repository Manager - isetbio','Archiva Delete Repository Metadata - isetbio',6),('Repository Manager - isetbio-test','Archiva Delete Repository Metadata - isetbio-test',6),('Repository Manager - scien','Archiva Delete Repository Metadata - scien',6),('Repository Manager - snapshots','Archiva Delete Repository Metadata - snapshots',6),('Repository Manager - temporalFittingEngine','Archiva Delete Repository Metadata - temporalFittingEngine',6),('Repository Manager - test-repository','Archiva Delete Repository Metadata - test-repository',6),('Repository Manager - vistasoft','Archiva Delete Repository Metadata - vistasoft',6),('Repository Manager - BLIlluminationDiscriminationCalcs','Archiva Edit Repository - BLIlluminationDiscriminationCalcs',1),('Repository Manager - BLprojects','Archiva Edit Repository - BLprojects',1),('Repository Manager - IBIOColorDetect','Archiva Edit Repository - IBIOColorDetect',1),('Repository Manager - RenderToolbox','Archiva Edit Repository - RenderToolbox',1),('Repository Manager - demo-repository','Archiva Edit Repository - demo-repository',1),('Repository Manager - internal','Archiva Edit Repository - internal',1),('Repository Manager - isetbio','Archiva Edit Repository - isetbio',1),('Repository Manager - isetbio-test','Archiva Edit Repository - isetbio-test',1),('Repository Manager - scien','Archiva Edit Repository - scien',1),('Repository Manager - snapshots','Archiva Edit Repository - snapshots',1),('Repository Manager - temporalFittingEngine','Archiva Edit Repository - temporalFittingEngine',1),('Repository Manager - test-repository','Archiva Edit Repository - test-repository',1),('Repository Manager - vistasoft','Archiva Edit Repository - vistasoft',1),('Archiva Guest','Archiva Guest Permission',0),('Archiva User Administrator','Archiva Guest Permission',0),('Repository Manager - BLIlluminationDiscriminationCalcs','Archiva Merge Repository - BLIlluminationDiscriminationCalcs',7),('Repository Manager - BLprojects','Archiva Merge Repository - BLprojects',7),('Repository Manager - IBIOColorDetect','Archiva Merge Repository - IBIOColorDetect',7),('Repository Manager - RenderToolbox','Archiva Merge Repository - RenderToolbox',7),('Repository Manager - demo-repository','Archiva Merge Repository - demo-repository',7),('Repository Manager - internal','Archiva Merge Repository - internal',7),('Repository Manager - isetbio','Archiva Merge Repository - isetbio',7),('Repository Manager - isetbio-test','Archiva Merge Repository - isetbio-test',7),('Repository Manager - scien','Archiva Merge Repository - scien',7),('Repository Manager - snapshots','Archiva Merge Repository - snapshots',7),('Repository Manager - temporalFittingEngine','Archiva Merge Repository - temporalFittingEngine',7),('Repository Manager - test-repository','Archiva Merge Repository - test-repository',7),('Repository Manager - vistasoft','Archiva Merge Repository - vistasoft',7),('Repository Observer - BLIlluminationDiscriminationCalcs','Archiva Read Repository - BLIlluminationDiscriminationCalcs',0),('Repository Observer - BLprojects','Archiva Read Repository - BLprojects',0),('Repository Observer - IBIOColorDetect','Archiva Read Repository - IBIOColorDetect',0),('Repository Observer - RenderToolbox','Archiva Read Repository - RenderToolbox',0),('Repository Observer - demo-repository','Archiva Read Repository - demo-repository',0),('Repository Observer - internal','Archiva Read Repository - internal',0),('Repository Observer - isetbio','Archiva Read Repository - isetbio',0),('Repository Observer - isetbio-test','Archiva Read Repository - isetbio-test',0),('Repository Observer - scien','Archiva Read Repository - scien',0),('Repository Observer - snapshots','Archiva Read Repository - snapshots',0),('Repository Observer - temporalFittingEngine','Archiva Read Repository - temporalFittingEngine',0),('Repository Observer - test-repository','Archiva Read Repository - test-repository',0),('Repository Observer - vistasoft','Archiva Read Repository - vistasoft',0),('Repository Manager - BLIlluminationDiscriminationCalcs','Archiva Upload to Repository - BLIlluminationDiscriminationCalcs',3),('Repository Manager - BLprojects','Archiva Upload to Repository - BLprojects',3),('Repository Manager - IBIOColorDetect','Archiva Upload to Repository - IBIOColorDetect',3),('Repository Manager - RenderToolbox','Archiva Upload to Repository - RenderToolbox',3),('Repository Manager - demo-repository','Archiva Upload to Repository - demo-repository',3),('Repository Manager - internal','Archiva Upload to Repository - internal',3),('Repository Manager - isetbio','Archiva Upload to Repository - isetbio',3),('Repository Manager - isetbio-test','Archiva Upload to Repository - isetbio-test',3),('Repository Manager - scien','Archiva Upload to Repository - scien',3),('Repository Manager - snapshots','Archiva Upload to Repository - snapshots',3),('Repository Manager - temporalFittingEngine','Archiva Upload to Repository - temporalFittingEngine',3),('Repository Manager - test-repository','Archiva Upload to Repository - test-repository',3),('Repository Manager - vistasoft','Archiva Upload to Repository - vistasoft',3),('Repository Manager - BLIlluminationDiscriminationCalcs','Archiva View Audit Logs - BLIlluminationDiscriminationCalcs',4),('Repository Manager - BLprojects','Archiva View Audit Logs - BLprojects',4),('Repository Manager - IBIOColorDetect','Archiva View Audit Logs - IBIOColorDetect',4),('Repository Manager - RenderToolbox','Archiva View Audit Logs - RenderToolbox',4),('Repository Manager - demo-repository','Archiva View Audit Logs - demo-repository',4),('Repository Manager - internal','Archiva View Audit Logs - internal',4),('Repository Manager - isetbio','Archiva View Audit Logs - isetbio',4),('Repository Manager - isetbio-test','Archiva View Audit Logs - isetbio-test',4),('Repository Manager - scien','Archiva View Audit Logs - scien',4),('Repository Manager - snapshots','Archiva View Audit Logs - snapshots',4),('Repository Manager - temporalFittingEngine','Archiva View Audit Logs - temporalFittingEngine',4),('Repository Manager - test-repository','Archiva View Audit Logs - test-repository',4),('Repository Manager - vistasoft','Archiva View Audit Logs - vistasoft',4),('User Administrator','Create Users',2),('Repository Manager - BLIlluminationDiscriminationCalcs','Delete Artifact - BLIlluminationDiscriminationCalcs',0),('Repository Manager - BLprojects','Delete Artifact - BLprojects',0),('Repository Manager - IBIOColorDetect','Delete Artifact - IBIOColorDetect',0),('Repository Manager - RenderToolbox','Delete Artifact - RenderToolbox',0),('Repository Manager - demo-repository','Delete Artifact - demo-repository',0),('Repository Manager - internal','Delete Artifact - internal',0),('Repository Manager - isetbio','Delete Artifact - isetbio',0),('Repository Manager - isetbio-test','Delete Artifact - isetbio-test',0),('Repository Manager - scien','Delete Artifact - scien',0),('Repository Manager - snapshots','Delete Artifact - snapshots',0),('Repository Manager - temporalFittingEngine','Delete Artifact - temporalFittingEngine',0),('Repository Manager - test-repository','Delete Artifact - test-repository',0),('Repository Manager - vistasoft','Delete Artifact - vistasoft',0),('User Administrator','Delete Users',3),('User Administrator','Drop Roles for Anyone',0),('System Administrator','Edit Redback Configuration',0),('Registered User','Edit User Data by Username',0),('User Administrator','Edit Users',4),('User Administrator','Grant Roles for Anyone',1),('Guest','Guest Permission',0),('System Administrator','RBAC Manage Data',2),('System Administrator','User RBAC Management',1),('Archiva System Administrator','archiva-access-reports',4),('Archiva System Administrator','archiva-manage-configuration',0),('Archiva System Administrator','archiva-manage-users',1),('Archiva User Administrator','archiva-manage-users',1),('Archiva System Administrator','archiva-regenerate-index',3),('Archiva System Administrator','archiva-run-indexer',2);
/*!40000 ALTER TABLE `SECURITY_ROLE_PERMISSION_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SECURITY_USERASSIGNMENT_ROLENAMES`
--

DROP TABLE IF EXISTS `SECURITY_USERASSIGNMENT_ROLENAMES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SECURITY_USERASSIGNMENT_ROLENAMES` (
  `PRINCIPAL_OID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `STRING_ELE` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`PRINCIPAL_OID`,`INTEGER_IDX`),
  CONSTRAINT `SECURITY_USERASSIGNMENT_ROLENAMES_FK1` FOREIGN KEY (`PRINCIPAL_OID`) REFERENCES `SECURITY_USER_ASSIGNMENTS` (`PRINCIPAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SECURITY_USERASSIGNMENT_ROLENAMES`
--

LOCK TABLES `SECURITY_USERASSIGNMENT_ROLENAMES` WRITE;
/*!40000 ALTER TABLE `SECURITY_USERASSIGNMENT_ROLENAMES` DISABLE KEYS */;
INSERT INTO `SECURITY_USERASSIGNMENT_ROLENAMES` VALUES ('JamesG','Registered User',0),('JamesG','Repository Manager - isetbio',1),('JamesG','Repository Manager - scien',2),('JamesG','Repository Manager - vistasoft',3),('admin','System Administrator',0),('aguirreg','Registered User',0),('aguirreg','Global Repository Manager',1),('aguirreg','Global Repository Observer',2),('ben','Registered User',0),('ben','System Administrator',1),('ben','User Administrator',2),('ben','Global Repository Manager',3),('ben','Global Repository Observer',4),('cottaris','Global Repository Manager',0),('cottaris','Global Repository Observer',1),('cottaris','Registered User',2),('cottaris','Repository Manager - demo-repository',3),('cottaris','Repository Manager - internal',4),('cottaris','Repository Manager - isetbio',5),('cottaris','Repository Manager - isetbio-test',6),('cottaris','Repository Manager - snapshots',7),('cottaris','Repository Manager - test-repository',8),('cottaris','Repository Observer - demo-repository',9),('cottaris','Repository Observer - internal',10),('cottaris','Repository Observer - isetbio',11),('cottaris','Repository Observer - isetbio-test',12),('cottaris','Repository Observer - snapshots',13),('cottaris','Repository Observer - test-repository',14),('cottaris','System Administrator',15),('cottaris','User Administrator',16),('cottaris','Archiva User Administrator',17),('cottaris','Archiva System Administrator',18),('dhb','Global Repository Manager',0),('dhb','Global Repository Observer',1),('dhb','Registered User',2),('dhb','Repository Manager - demo-repository',3),('dhb','Repository Manager - internal',4),('dhb','Repository Manager - isetbio',5),('dhb','Repository Manager - isetbio-test',6),('dhb','Repository Manager - snapshots',7),('dhb','Repository Manager - test-repository',8),('dhb','Repository Observer - demo-repository',9),('dhb','Repository Observer - internal',10),('dhb','Repository Observer - isetbio',11),('dhb','Repository Observer - isetbio-test',12),('dhb','Repository Observer - snapshots',13),('dhb','Repository Observer - test-repository',14),('dhb','System Administrator',15),('dhb','User Administrator',16),('dhb','Archiva User Administrator',17),('dhb','Archiva System Administrator',18),('ej','Registered User',0),('guest','Guest',0),('guest','Global Repository Observer',1),('hjiang','Registered User',0),('hjiang','Global Repository Manager',1),('hjiang','Global Repository Observer',2),('holder','Registered User',0),('holder','System Administrator',1),('jefarrel','Registered User',0),('jefarrel','Global Repository Manager',1),('jefarrel','Global Repository Observer',2),('jonathan','Registered User',0),('jonathan','Repository Manager - scien',1),('jonathan','Repository Observer - scien',2),('jonathan','Repository Observer - IBIOColorDetect',3),('jonathan','Repository Manager - IBIOColorDetect',4),('jonathan','Repository Manager - isetbio',5),('jonathan','Repository Observer - isetbio',6),('jonathan','Repository Manager - vistasoft',7),('jonathan','Repository Observer - vistasoft',8),('jonathan','Repository Manager - snapshots',9),('jonathan','Repository Observer - snapshots',10),('lmperry','Registered User',0),('lmperry','Global Repository Manager',1),('lmperry','Global Repository Observer',2),('nathan.witthoft','Registered User',0),('rieke','Global Repository Manager',0),('rieke','Global Repository Observer',1),('rieke','Registered User',2),('rieke','Repository Manager - demo-repository',3),('rieke','Repository Manager - internal',4),('rieke','Repository Manager - isetbio',5),('rieke','Repository Manager - isetbio-test',6),('rieke','Repository Manager - scien',7),('rieke','Repository Manager - snapshots',8),('rieke','Repository Manager - test-repository',9),('rieke','Repository Manager - vistasoft',10),('rieke','Repository Observer - demo-repository',11),('rieke','Repository Observer - internal',12),('rieke','Repository Observer - isetbio',13),('rieke','Repository Observer - isetbio-test',14),('rieke','Repository Observer - scien',15),('rieke','Repository Observer - snapshots',16),('rieke','Repository Observer - test-repository',17),('rieke','Repository Observer - vistasoft',18),('rieke','System Administrator',19),('rieke','Archiva System Administrator',20),('test','Global Repository Manager',0),('test','Global Repository Observer',1),('test','Registered User',2),('test','Repository Manager - BLprojects',3),('test','Repository Manager - demo-repository',4),('test','Repository Manager - internal',5),('test','Repository Manager - isetbio',6),('test','Repository Manager - isetbio-test',7),('test','Repository Manager - scien',8),('test','Repository Manager - snapshots',9),('test','Repository Manager - test-repository',10),('test','Repository Manager - vistasoft',11),('test','Repository Observer - BLprojects',12),('test','Repository Observer - demo-repository',13),('test','Repository Observer - internal',14),('test','Repository Observer - isetbio',15),('test','Repository Observer - isetbio-test',16),('test','Repository Observer - scien',17),('test','Repository Observer - snapshots',18),('test','Repository Observer - test-repository',19),('test','Repository Observer - vistasoft',20),('test','System Administrator',21),('test','User Administrator',22),('tlian','Global Repository Manager',0),('tlian','Global Repository Observer',1),('tlian','Registered User',2),('tlian','Repository Manager - RenderToolbox',3),('tlian','Repository Manager - isetbio',4),('tlian','Repository Manager - scien',5),('tlian','Repository Manager - vistasoft',6),('tlian','Repository Observer - BLIlluminationDiscriminationCalcs',7),('tlian','Repository Observer - BLprojects',8),('tlian','Repository Observer - IBIOColorDetect',9),('tlian','Repository Observer - RenderToolbox',10),('tlian','Repository Observer - demo-repository',11),('tlian','Repository Observer - internal',12),('tlian','Repository Observer - isetbio',13),('tlian','Repository Observer - scien',14),('tlian','Repository Observer - snapshots',15),('tlian','Repository Observer - temporalFittingEngine',16),('tlian','Repository Observer - test-repository',17),('tlian','Repository Observer - vistasoft',18),('tlian','System Administrator',19),('tlian','User Administrator',20),('tuyanshuai','Registered User',0),('visitor','Registered User',0),('wandell','Global Repository Manager',0),('wandell','Global Repository Observer',1),('wandell','Registered User',2),('wandell','Repository Manager - demo-repository',3),('wandell','Repository Manager - internal',4),('wandell','Repository Manager - isetbio',5),('wandell','Repository Manager - isetbio-test',6),('wandell','Repository Manager - snapshots',7),('wandell','Repository Manager - test-repository',8),('wandell','Repository Observer - demo-repository',9),('wandell','Repository Observer - internal',10),('wandell','Repository Observer - isetbio',11),('wandell','Repository Observer - isetbio-test',12),('wandell','Repository Observer - snapshots',13),('wandell','Repository Observer - test-repository',14),('wandell','System Administrator',15),('wandell','User Administrator',16),('wandell','Archiva User Administrator',17),('wandell','Archiva System Administrator',18),('xiaomao','Registered User',0),('xiaomao','Repository Manager - BLprojects',1),('xiaomao','Repository Manager - demo-repository',2),('xiaomao','Repository Manager - isetbio',3),('xiaomao','Repository Observer - BLprojects',4),('xiaomao','Repository Observer - demo-repository',5),('xiaomao','Repository Observer - isetbio',6),('xiaomao','Repository Manager - BLIlluminationDiscriminationCalcs',7),('yhori-bg','Registered User',0);
/*!40000 ALTER TABLE `SECURITY_USERASSIGNMENT_ROLENAMES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SECURITY_USER_ASSIGNMENTS`
--

DROP TABLE IF EXISTS `SECURITY_USER_ASSIGNMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SECURITY_USER_ASSIGNMENTS` (
  `PRINCIPAL` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PERMANENT` bit(1) NOT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  PRIMARY KEY (`PRINCIPAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SECURITY_USER_ASSIGNMENTS`
--

LOCK TABLES `SECURITY_USER_ASSIGNMENTS` WRITE;
/*!40000 ALTER TABLE `SECURITY_USER_ASSIGNMENTS` DISABLE KEYS */;
INSERT INTO `SECURITY_USER_ASSIGNMENTS` VALUES ('JamesG','\0',NULL),('admin','\0',NULL),('aguirreg','\0',NULL),('ben','\0',NULL),('cottaris','\0',NULL),('dhb','\0',NULL),('ej','\0',NULL),('guest','\0',NULL),('hjiang','\0',NULL),('holder','\0',NULL),('jefarrel','\0',NULL),('jonathan','\0',NULL),('lmperry','\0',NULL),('nathan.witthoft','\0',NULL),('rieke','\0',NULL),('test','\0',NULL),('tlian','\0',NULL),('tuyanshuai','\0',NULL),('visitor','\0',NULL),('wandell','\0',NULL),('xiaomao','\0',NULL),('yhori-bg','\0',NULL);
/*!40000 ALTER TABLE `SECURITY_USER_ASSIGNMENTS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-08 12:20:48
