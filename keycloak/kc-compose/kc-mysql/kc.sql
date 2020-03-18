-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: keycloak
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Current Database: `keycloak`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `keycloak` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `keycloak`;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('06a788b4-82ff-4bc1-ae8f-0b37acfe6643',NULL,'auth-otp-form','master','42207a64-8b7a-467e-be17-7ee29d778fa5',0,20,_binary '\0',NULL,NULL),('0ffd3a02-ca37-42d9-97a0-87e8ce929391',NULL,'http-basic-authenticator','master','a73d00ca-80b1-4590-9a3f-920bdb533296',0,10,_binary '\0',NULL,NULL),('11bb3526-9872-49d3-a9bd-606311f7b6b9',NULL,'identity-provider-redirector','master','e5ed1399-37f6-4b1e-8e69-924509cd0c47',2,25,_binary '\0',NULL,NULL),('16c0357b-0a7c-4201-9062-75c374c7e396',NULL,NULL,'master','7c1acb07-433a-41a2-b912-e14ca081ca93',0,20,_binary '','8d563c65-ee95-43b8-b099-a079555b7b53',NULL),('1c878264-8855-4b05-b12a-c23ee3d5c8ec',NULL,NULL,'master','5442f329-9f6e-410e-927a-713e54ac4eb8',1,40,_binary '','1bceff34-cc32-40b2-9cbc-2189dd0e36a5',NULL),('1ca1e766-2cf2-4b65-80ab-b8bc3fb3a54e',NULL,'registration-profile-action','master','e5c4cd73-66f8-4814-80b1-d930da391ec9',0,40,_binary '\0',NULL,NULL),('1e43c405-0b53-4494-b256-e32397984f9f',NULL,'basic-auth-otp','master','14cc01bd-57cc-47db-a26b-37010b73b63a',3,20,_binary '\0',NULL,NULL),('20584914-26d0-4620-a8ac-086a458f98cc',NULL,'registration-recaptcha-action','master','e5c4cd73-66f8-4814-80b1-d930da391ec9',3,60,_binary '\0',NULL,NULL),('24659ecd-0af6-4687-a100-2c0916aacb90',NULL,'idp-confirm-link','master','7c1acb07-433a-41a2-b912-e14ca081ca93',0,10,_binary '\0',NULL,NULL),('25f3e115-f021-4411-aa2c-a2d66ec06f99',NULL,'client-secret-jwt','master','a58b1026-6c79-461b-8173-6167ed59c031',2,30,_binary '\0',NULL,NULL),('2c69a9b1-7b8d-44af-841f-31acefbe738f',NULL,'conditional-user-configured','master','6358f4df-bba2-4329-a240-6a6450a5bb9f',0,10,_binary '\0',NULL,NULL),('2f57621e-bd29-428d-bc04-c6b250eb826a',NULL,'direct-grant-validate-username','master','2bfee9e9-559e-4562-bbb7-3d82340a8f8f',0,10,_binary '\0',NULL,NULL),('32910702-9aaf-40c7-887c-aa44cd041579',NULL,NULL,'master','74d02472-12cb-4fa8-b6f0-982ae4409cac',2,20,_binary '','7c1acb07-433a-41a2-b912-e14ca081ca93',NULL),('371d50c4-ea22-414e-868b-7e9f96622e3f',NULL,'idp-review-profile','master','77bbf21d-605b-4d5c-8f26-5a9f35960eb3',0,10,_binary '\0',NULL,'bebca57f-725c-40ce-a98e-da6f55ce12f2'),('3ae7e500-b024-4567-bf85-4e4eacac8bd8',NULL,'direct-grant-validate-otp','master','6358f4df-bba2-4329-a240-6a6450a5bb9f',0,20,_binary '\0',NULL,NULL),('3bfcb556-0609-4257-a80e-1eebcc427273',NULL,'auth-otp-form','master','d3cee69a-ce81-41f1-9a50-17d858a67d35',0,20,_binary '\0',NULL,NULL),('43b892c2-7f50-4387-972c-9c94fd760117',NULL,NULL,'master','77bbf21d-605b-4d5c-8f26-5a9f35960eb3',0,20,_binary '','74d02472-12cb-4fa8-b6f0-982ae4409cac',NULL),('46515359-8417-4094-a6b0-2c865165c735',NULL,'client-x509','master','a58b1026-6c79-461b-8173-6167ed59c031',2,40,_binary '\0',NULL,NULL),('46acec06-2166-4599-8581-845333253345',NULL,'basic-auth','master','14cc01bd-57cc-47db-a26b-37010b73b63a',0,10,_binary '\0',NULL,NULL),('4bc46b66-1a27-4c18-bd12-789f09a35ef3',NULL,'reset-password','master','5442f329-9f6e-410e-927a-713e54ac4eb8',0,30,_binary '\0',NULL,NULL),('4c113b8f-1805-4b08-9a8f-bff325985f85',NULL,'client-jwt','master','a58b1026-6c79-461b-8173-6167ed59c031',2,20,_binary '\0',NULL,NULL),('50e63b01-4321-4731-93eb-15cb82f42b7c',NULL,'direct-grant-validate-password','master','2bfee9e9-559e-4562-bbb7-3d82340a8f8f',0,20,_binary '\0',NULL,NULL),('54c820e3-3c30-4d02-aee3-e35093453214',NULL,NULL,'master','c2158f5f-3716-40f2-8cd8-47a3c8cf82bb',1,20,_binary '','42207a64-8b7a-467e-be17-7ee29d778fa5',NULL),('569260c0-d9fb-4aab-9d6e-e4a04b212e42',NULL,'client-secret','master','a58b1026-6c79-461b-8173-6167ed59c031',2,10,_binary '\0',NULL,NULL),('580174c6-3626-4316-9bcf-b6a8635ca06f',NULL,NULL,'master','e5ed1399-37f6-4b1e-8e69-924509cd0c47',2,30,_binary '','64d3ec4c-d361-4019-90ba-113d84a9287c',NULL),('604f07cc-1c60-4379-abb9-fa62b2aa188a',NULL,'auth-username-password-form','master','64d3ec4c-d361-4019-90ba-113d84a9287c',0,10,_binary '\0',NULL,NULL),('61fdd5e4-e923-4066-b042-ac4a9aef28a3',NULL,'registration-page-form','master','3152a11f-3924-4734-b85d-20344ac5827c',0,10,_binary '','e5c4cd73-66f8-4814-80b1-d930da391ec9',NULL),('681f9da0-9fd7-4a73-bf2c-da095b1a8d9e',NULL,NULL,'master','2bfee9e9-559e-4562-bbb7-3d82340a8f8f',1,30,_binary '','6358f4df-bba2-4329-a240-6a6450a5bb9f',NULL),('6bc6ffc5-9f6a-433f-b653-c44517cc1872',NULL,'registration-user-creation','master','e5c4cd73-66f8-4814-80b1-d930da391ec9',0,20,_binary '\0',NULL,NULL),('71af620a-d9ee-4c22-b1e7-c4504e6491f8',NULL,'registration-password-action','master','e5c4cd73-66f8-4814-80b1-d930da391ec9',0,50,_binary '\0',NULL,NULL),('7662f651-464f-4405-9ae0-edf0612d7596',NULL,'conditional-user-configured','master','42207a64-8b7a-467e-be17-7ee29d778fa5',0,10,_binary '\0',NULL,NULL),('7875a86b-0ce6-4001-a3c7-b8e88e58a048',NULL,'idp-username-password-form','master','c2158f5f-3716-40f2-8cd8-47a3c8cf82bb',0,10,_binary '\0',NULL,NULL),('7d894144-71e8-4796-b78b-ec3ebf019d86',NULL,'no-cookie-redirect','master','cb8da9fb-2b7f-4d8c-84ac-fc28ed8b5229',0,10,_binary '\0',NULL,NULL),('82dfa636-9e51-4060-8ba6-3755eb7bb0e9',NULL,'auth-spnego','master','e5ed1399-37f6-4b1e-8e69-924509cd0c47',3,20,_binary '\0',NULL,NULL),('8913e9d4-25c1-47c3-861a-2f566ee3cd58',NULL,'auth-cookie','master','e5ed1399-37f6-4b1e-8e69-924509cd0c47',2,10,_binary '\0',NULL,NULL),('8b40c590-ae12-4989-8dbf-fee7d645ff1b',NULL,'reset-credentials-choose-user','master','5442f329-9f6e-410e-927a-713e54ac4eb8',0,10,_binary '\0',NULL,NULL),('8c77c3df-109c-4e3a-96cf-fa16708374b4',NULL,'idp-email-verification','master','8d563c65-ee95-43b8-b099-a079555b7b53',2,10,_binary '\0',NULL,NULL),('9fb123d1-748a-4233-ae32-1870eef2c601',NULL,'docker-http-basic-authenticator','master','bc14b93d-7541-44e7-9d05-548a17b2b75f',0,10,_binary '\0',NULL,NULL),('a00cd739-d85b-40e3-a5e2-0595fab8eb2d',NULL,'reset-credential-email','master','5442f329-9f6e-410e-927a-713e54ac4eb8',0,20,_binary '\0',NULL,NULL),('a1cf4f22-1e54-4660-8d5e-707991828bfe',NULL,NULL,'master','cb8da9fb-2b7f-4d8c-84ac-fc28ed8b5229',0,20,_binary '','14cc01bd-57cc-47db-a26b-37010b73b63a',NULL),('a8b28455-411f-4816-add9-c4ee8aa225d5',NULL,NULL,'master','64d3ec4c-d361-4019-90ba-113d84a9287c',1,20,_binary '','d3cee69a-ce81-41f1-9a50-17d858a67d35',NULL),('af1b4703-89ff-482a-8975-27d6d772aef3',NULL,'conditional-user-configured','master','d3cee69a-ce81-41f1-9a50-17d858a67d35',0,10,_binary '\0',NULL,NULL),('c27bd404-abf6-46ed-aecf-44e4d72c3e03',NULL,'idp-create-user-if-unique','master','74d02472-12cb-4fa8-b6f0-982ae4409cac',2,10,_binary '\0',NULL,'65788ebf-6e22-4ed0-bb50-9d3f2690adad'),('dcf984bc-1e07-4ecd-9d56-7c318e1f79cb',NULL,'reset-otp','master','1bceff34-cc32-40b2-9cbc-2189dd0e36a5',0,20,_binary '\0',NULL,NULL),('e3eba02d-9282-4973-8b1e-e383610ee028',NULL,NULL,'master','8d563c65-ee95-43b8-b099-a079555b7b53',2,20,_binary '','c2158f5f-3716-40f2-8cd8-47a3c8cf82bb',NULL),('e9a063ef-3a53-4c6c-a1bb-da5a99e3af5d',NULL,'auth-spnego','master','14cc01bd-57cc-47db-a26b-37010b73b63a',3,30,_binary '\0',NULL,NULL),('eae2c089-aab7-409d-a931-879f2c3911ec',NULL,'conditional-user-configured','master','1bceff34-cc32-40b2-9cbc-2189dd0e36a5',0,10,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('14cc01bd-57cc-47db-a26b-37010b73b63a','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('1bceff34-cc32-40b2-9cbc-2189dd0e36a5','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('2bfee9e9-559e-4562-bbb7-3d82340a8f8f','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('3152a11f-3924-4734-b85d-20344ac5827c','registration','registration flow','master','basic-flow',_binary '',_binary ''),('42207a64-8b7a-467e-be17-7ee29d778fa5','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('5442f329-9f6e-410e-927a-713e54ac4eb8','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('6358f4df-bba2-4329-a240-6a6450a5bb9f','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('64d3ec4c-d361-4019-90ba-113d84a9287c','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('74d02472-12cb-4fa8-b6f0-982ae4409cac','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('77bbf21d-605b-4d5c-8f26-5a9f35960eb3','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('7c1acb07-433a-41a2-b912-e14ca081ca93','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('8d563c65-ee95-43b8-b099-a079555b7b53','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('a58b1026-6c79-461b-8173-6167ed59c031','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('a73d00ca-80b1-4590-9a3f-920bdb533296','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('bc14b93d-7541-44e7-9d05-548a17b2b75f','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('c2158f5f-3716-40f2-8cd8-47a3c8cf82bb','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('cb8da9fb-2b7f-4d8c-84ac-fc28ed8b5229','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('d3cee69a-ce81-41f1-9a50-17d858a67d35','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('e5c4cd73-66f8-4814-80b1-d930da391ec9','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('e5ed1399-37f6-4b1e-8e69-924509cd0c47','browser','browser based authentication','master','basic-flow',_binary '',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('65788ebf-6e22-4ed0-bb50-9d3f2690adad','create unique user config','master'),('bebca57f-725c-40ce-a98e-da6f55ce12f2','review profile config','master');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('65788ebf-6e22-4ed0-bb50-9d3f2690adad','false','require.password.update.after.registration'),('bebca57f-725c-40ce-a98e-da6f55ce12f2','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('3a4f932b-46e8-487d-9852-f0076f765c9b',_binary '',_binary '\0','admin-cli',0,_binary '','446e5636-4bfd-48dd-851b-f89c822b29f8',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('4d9a443c-bb73-4915-a822-410338236e87',_binary '',_binary '\0','security-admin-console',0,_binary '','88aa6f93-f03e-43a7-92ab-50366f0c4e38','/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '',_binary '','master-realm',0,_binary '\0','a722bb8c-ef41-4117-a222-c2fb8a21bfcc',NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('7b6770d5-e66b-44a8-ae99-832e110009c9',_binary '',_binary '\0','broker',0,_binary '\0','e8e9cbf9-9596-45a7-87e3-6a75a94aee97',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('7de18847-fbd2-4d28-b238-5ee97d5bc127',_binary '',_binary '\0','account-console',0,_binary '','64cdc675-f7bf-459f-8a74-1b01134f5f82','/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('f59738ea-6a6f-48e7-9f28-920ea907f145',_binary '',_binary '\0','account',0,_binary '\0','dbec278f-610a-4066-9ce5-5790172b1cec','/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('4d9a443c-bb73-4915-a822-410338236e87','S256','pkce.code.challenge.method'),('7de18847-fbd2-4d28-b238-5ee97d5bc127','S256','pkce.code.challenge.method');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `CLIENT_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_DEFAULT_ROLES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  KEY `IDX_CLIENT_DEF_ROLES_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_DEFAULT_ROLES`
--

LOCK TABLES `CLIENT_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('f59738ea-6a6f-48e7-9f28-920ea907f145','3b5eceb5-6dcf-417e-9f01-3553a50eea88'),('f59738ea-6a6f-48e7-9f28-920ea907f145','cd66cb73-c4c3-4f2e-8bfc-aba899c62269');
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`),
  CONSTRAINT `FK_REALM_CLI_SCOPE` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('222264cc-9153-4abe-ab8a-5e4ea14d2bc7','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('490aafe8-52fa-4d89-b9e1-c6395738bf4b','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('62962785-4dd1-439a-ac20-83f8ad8120f4','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('7530fd9d-ab60-4a33-8a8a-ed287a613a3d','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('7c8584aa-b08e-492c-aa76-4e1583464851','email','master','OpenID Connect built-in scope: email','openid-connect'),('943e97bc-0923-4b20-afbd-b6873bd2f4b1','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('a57017d1-1095-476e-b78e-d38eb1576654','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('b8fd154d-b9bd-4642-84fc-efd0af184f16','address','master','OpenID Connect built-in scope: address','openid-connect'),('e7811144-53ba-4b7e-b24d-cc095a984391','role_list','master','SAML role list','saml');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('222264cc-9153-4abe-ab8a-5e4ea14d2bc7','${phoneScopeConsentText}','consent.screen.text'),('222264cc-9153-4abe-ab8a-5e4ea14d2bc7','true','display.on.consent.screen'),('222264cc-9153-4abe-ab8a-5e4ea14d2bc7','true','include.in.token.scope'),('490aafe8-52fa-4d89-b9e1-c6395738bf4b','${profileScopeConsentText}','consent.screen.text'),('490aafe8-52fa-4d89-b9e1-c6395738bf4b','true','display.on.consent.screen'),('490aafe8-52fa-4d89-b9e1-c6395738bf4b','true','include.in.token.scope'),('62962785-4dd1-439a-ac20-83f8ad8120f4','false','display.on.consent.screen'),('62962785-4dd1-439a-ac20-83f8ad8120f4','true','include.in.token.scope'),('7530fd9d-ab60-4a33-8a8a-ed287a613a3d','${offlineAccessScopeConsentText}','consent.screen.text'),('7530fd9d-ab60-4a33-8a8a-ed287a613a3d','true','display.on.consent.screen'),('7c8584aa-b08e-492c-aa76-4e1583464851','${emailScopeConsentText}','consent.screen.text'),('7c8584aa-b08e-492c-aa76-4e1583464851','true','display.on.consent.screen'),('7c8584aa-b08e-492c-aa76-4e1583464851','true','include.in.token.scope'),('943e97bc-0923-4b20-afbd-b6873bd2f4b1','','consent.screen.text'),('943e97bc-0923-4b20-afbd-b6873bd2f4b1','false','display.on.consent.screen'),('943e97bc-0923-4b20-afbd-b6873bd2f4b1','false','include.in.token.scope'),('a57017d1-1095-476e-b78e-d38eb1576654','${rolesScopeConsentText}','consent.screen.text'),('a57017d1-1095-476e-b78e-d38eb1576654','true','display.on.consent.screen'),('a57017d1-1095-476e-b78e-d38eb1576654','false','include.in.token.scope'),('b8fd154d-b9bd-4642-84fc-efd0af184f16','${addressScopeConsentText}','consent.screen.text'),('b8fd154d-b9bd-4642-84fc-efd0af184f16','true','display.on.consent.screen'),('b8fd154d-b9bd-4642-84fc-efd0af184f16','true','include.in.token.scope'),('e7811144-53ba-4b7e-b24d-cc095a984391','${samlRoleListScopeConsentText}','consent.screen.text'),('e7811144-53ba-4b7e-b24d-cc095a984391','true','display.on.consent.screen');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_C_CLI_SCOPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_C_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('3a4f932b-46e8-487d-9852-f0076f765c9b','222264cc-9153-4abe-ab8a-5e4ea14d2bc7',_binary '\0'),('3a4f932b-46e8-487d-9852-f0076f765c9b','490aafe8-52fa-4d89-b9e1-c6395738bf4b',_binary ''),('3a4f932b-46e8-487d-9852-f0076f765c9b','62962785-4dd1-439a-ac20-83f8ad8120f4',_binary '\0'),('3a4f932b-46e8-487d-9852-f0076f765c9b','7530fd9d-ab60-4a33-8a8a-ed287a613a3d',_binary '\0'),('3a4f932b-46e8-487d-9852-f0076f765c9b','7c8584aa-b08e-492c-aa76-4e1583464851',_binary ''),('3a4f932b-46e8-487d-9852-f0076f765c9b','943e97bc-0923-4b20-afbd-b6873bd2f4b1',_binary ''),('3a4f932b-46e8-487d-9852-f0076f765c9b','a57017d1-1095-476e-b78e-d38eb1576654',_binary ''),('3a4f932b-46e8-487d-9852-f0076f765c9b','b8fd154d-b9bd-4642-84fc-efd0af184f16',_binary '\0'),('3a4f932b-46e8-487d-9852-f0076f765c9b','e7811144-53ba-4b7e-b24d-cc095a984391',_binary ''),('4d9a443c-bb73-4915-a822-410338236e87','222264cc-9153-4abe-ab8a-5e4ea14d2bc7',_binary '\0'),('4d9a443c-bb73-4915-a822-410338236e87','490aafe8-52fa-4d89-b9e1-c6395738bf4b',_binary ''),('4d9a443c-bb73-4915-a822-410338236e87','62962785-4dd1-439a-ac20-83f8ad8120f4',_binary '\0'),('4d9a443c-bb73-4915-a822-410338236e87','7530fd9d-ab60-4a33-8a8a-ed287a613a3d',_binary '\0'),('4d9a443c-bb73-4915-a822-410338236e87','7c8584aa-b08e-492c-aa76-4e1583464851',_binary ''),('4d9a443c-bb73-4915-a822-410338236e87','943e97bc-0923-4b20-afbd-b6873bd2f4b1',_binary ''),('4d9a443c-bb73-4915-a822-410338236e87','a57017d1-1095-476e-b78e-d38eb1576654',_binary ''),('4d9a443c-bb73-4915-a822-410338236e87','b8fd154d-b9bd-4642-84fc-efd0af184f16',_binary '\0'),('4d9a443c-bb73-4915-a822-410338236e87','e7811144-53ba-4b7e-b24d-cc095a984391',_binary ''),('5c72d28f-8af0-4a06-bf35-a6d1896bf9e7','222264cc-9153-4abe-ab8a-5e4ea14d2bc7',_binary '\0'),('5c72d28f-8af0-4a06-bf35-a6d1896bf9e7','490aafe8-52fa-4d89-b9e1-c6395738bf4b',_binary ''),('5c72d28f-8af0-4a06-bf35-a6d1896bf9e7','62962785-4dd1-439a-ac20-83f8ad8120f4',_binary '\0'),('5c72d28f-8af0-4a06-bf35-a6d1896bf9e7','7530fd9d-ab60-4a33-8a8a-ed287a613a3d',_binary '\0'),('5c72d28f-8af0-4a06-bf35-a6d1896bf9e7','7c8584aa-b08e-492c-aa76-4e1583464851',_binary ''),('5c72d28f-8af0-4a06-bf35-a6d1896bf9e7','943e97bc-0923-4b20-afbd-b6873bd2f4b1',_binary ''),('5c72d28f-8af0-4a06-bf35-a6d1896bf9e7','a57017d1-1095-476e-b78e-d38eb1576654',_binary ''),('5c72d28f-8af0-4a06-bf35-a6d1896bf9e7','b8fd154d-b9bd-4642-84fc-efd0af184f16',_binary '\0'),('5c72d28f-8af0-4a06-bf35-a6d1896bf9e7','e7811144-53ba-4b7e-b24d-cc095a984391',_binary ''),('7b6770d5-e66b-44a8-ae99-832e110009c9','222264cc-9153-4abe-ab8a-5e4ea14d2bc7',_binary '\0'),('7b6770d5-e66b-44a8-ae99-832e110009c9','490aafe8-52fa-4d89-b9e1-c6395738bf4b',_binary ''),('7b6770d5-e66b-44a8-ae99-832e110009c9','62962785-4dd1-439a-ac20-83f8ad8120f4',_binary '\0'),('7b6770d5-e66b-44a8-ae99-832e110009c9','7530fd9d-ab60-4a33-8a8a-ed287a613a3d',_binary '\0'),('7b6770d5-e66b-44a8-ae99-832e110009c9','7c8584aa-b08e-492c-aa76-4e1583464851',_binary ''),('7b6770d5-e66b-44a8-ae99-832e110009c9','943e97bc-0923-4b20-afbd-b6873bd2f4b1',_binary ''),('7b6770d5-e66b-44a8-ae99-832e110009c9','a57017d1-1095-476e-b78e-d38eb1576654',_binary ''),('7b6770d5-e66b-44a8-ae99-832e110009c9','b8fd154d-b9bd-4642-84fc-efd0af184f16',_binary '\0'),('7b6770d5-e66b-44a8-ae99-832e110009c9','e7811144-53ba-4b7e-b24d-cc095a984391',_binary ''),('7de18847-fbd2-4d28-b238-5ee97d5bc127','222264cc-9153-4abe-ab8a-5e4ea14d2bc7',_binary '\0'),('7de18847-fbd2-4d28-b238-5ee97d5bc127','490aafe8-52fa-4d89-b9e1-c6395738bf4b',_binary ''),('7de18847-fbd2-4d28-b238-5ee97d5bc127','62962785-4dd1-439a-ac20-83f8ad8120f4',_binary '\0'),('7de18847-fbd2-4d28-b238-5ee97d5bc127','7530fd9d-ab60-4a33-8a8a-ed287a613a3d',_binary '\0'),('7de18847-fbd2-4d28-b238-5ee97d5bc127','7c8584aa-b08e-492c-aa76-4e1583464851',_binary ''),('7de18847-fbd2-4d28-b238-5ee97d5bc127','943e97bc-0923-4b20-afbd-b6873bd2f4b1',_binary ''),('7de18847-fbd2-4d28-b238-5ee97d5bc127','a57017d1-1095-476e-b78e-d38eb1576654',_binary ''),('7de18847-fbd2-4d28-b238-5ee97d5bc127','b8fd154d-b9bd-4642-84fc-efd0af184f16',_binary '\0'),('7de18847-fbd2-4d28-b238-5ee97d5bc127','e7811144-53ba-4b7e-b24d-cc095a984391',_binary ''),('f59738ea-6a6f-48e7-9f28-920ea907f145','222264cc-9153-4abe-ab8a-5e4ea14d2bc7',_binary '\0'),('f59738ea-6a6f-48e7-9f28-920ea907f145','490aafe8-52fa-4d89-b9e1-c6395738bf4b',_binary ''),('f59738ea-6a6f-48e7-9f28-920ea907f145','62962785-4dd1-439a-ac20-83f8ad8120f4',_binary '\0'),('f59738ea-6a6f-48e7-9f28-920ea907f145','7530fd9d-ab60-4a33-8a8a-ed287a613a3d',_binary '\0'),('f59738ea-6a6f-48e7-9f28-920ea907f145','7c8584aa-b08e-492c-aa76-4e1583464851',_binary ''),('f59738ea-6a6f-48e7-9f28-920ea907f145','943e97bc-0923-4b20-afbd-b6873bd2f4b1',_binary ''),('f59738ea-6a6f-48e7-9f28-920ea907f145','a57017d1-1095-476e-b78e-d38eb1576654',_binary ''),('f59738ea-6a6f-48e7-9f28-920ea907f145','b8fd154d-b9bd-4642-84fc-efd0af184f16',_binary '\0'),('f59738ea-6a6f-48e7-9f28-920ea907f145','e7811144-53ba-4b7e-b24d-cc095a984391',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('7530fd9d-ab60-4a33-8a8a-ed287a613a3d','88e1e692-aaa9-47b2-8c66-b16a0a2e5310');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('03dc66cb-f66d-4f2d-8371-d3568eb876a3','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('2ca94e9b-9cee-4d17-b693-de6d7865c82f','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('40f5e30c-60d5-471f-a4d9-a9bbb0763d61','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('7d79e27e-6e00-48ad-8942-c8e014364309','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('94a509d9-1198-440b-9318-e66ba45c5085','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('b5a4c5ac-ec1d-4ca6-9e85-c96c750fd3f4','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('be6342fb-55a0-4cc1-8ae8-4f57efc81430','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('dcd92587-1693-410b-9899-c301d560f360','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('f97b0c39-6fcf-4a3d-9bff-b56d3d361f53','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('fa59272e-1499-4383-b1be-2999b444da48','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('fe0a008f-c183-491a-9c02-6f680d948c39','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL);
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('0332b5c6-1b63-4c46-9798-846a10d56d57','fe0a008f-c183-491a-9c02-6f680d948c39','secret','0BpQlBekSQGs3HsgVfg_fw'),('065d907f-ea17-4f24-b3b8-acd1258c0589','03dc66cb-f66d-4f2d-8371-d3568eb876a3','max-clients','200'),('13b6a6ce-1310-4edb-a45b-3eeebae4442c','f97b0c39-6fcf-4a3d-9bff-b56d3d361f53','allowed-protocol-mapper-types','saml-user-property-mapper'),('16c9fe39-4049-469d-bbbd-0170ec41f1fa','f97b0c39-6fcf-4a3d-9bff-b56d3d361f53','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('1c0dff03-4515-4ff2-911f-c19bedc8c71f','94a509d9-1198-440b-9318-e66ba45c5085','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('1f7a5f07-cf3f-457e-a58b-8ac4b83b9ed3','94a509d9-1198-440b-9318-e66ba45c5085','allowed-protocol-mapper-types','oidc-full-name-mapper'),('23e624c6-064c-4e55-b670-3fed86444d23','94a509d9-1198-440b-9318-e66ba45c5085','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('25d6ded1-474f-45e7-81fc-7f8d210c1c48','94a509d9-1198-440b-9318-e66ba45c5085','allowed-protocol-mapper-types','saml-role-list-mapper'),('2917895c-a85c-418b-a199-2bbdd8f04967','fe0a008f-c183-491a-9c02-6f680d948c39','kid','0d7a08d1-f8d0-465b-b586-74e40385cd66'),('2a9f94c1-d63b-4390-9a19-079896600447','94a509d9-1198-440b-9318-e66ba45c5085','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('38851a24-07e1-4d70-b3a3-ff5286984b50','fa59272e-1499-4383-b1be-2999b444da48','priority','100'),('4497a944-af5a-4782-adbf-194413f9a2ff','dcd92587-1693-410b-9899-c301d560f360','allow-default-scopes','true'),('47c31db6-a274-4840-9df2-f728b849cc1e','f97b0c39-6fcf-4a3d-9bff-b56d3d361f53','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('4c666161-5ab2-4fbd-baf4-8d22e766d53f','94a509d9-1198-440b-9318-e66ba45c5085','allowed-protocol-mapper-types','oidc-address-mapper'),('4e8935fe-10a0-4576-a372-6462eaadb749','fe0a008f-c183-491a-9c02-6f680d948c39','priority','100'),('55e88618-fb30-4a65-8a1c-ac0a6f588bad','94a509d9-1198-440b-9318-e66ba45c5085','allowed-protocol-mapper-types','saml-user-property-mapper'),('59b4c5c6-2b4b-47aa-a9a0-1392b18000be','f97b0c39-6fcf-4a3d-9bff-b56d3d361f53','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('70dc072c-1b88-43de-8ca5-3fba83401c99','f97b0c39-6fcf-4a3d-9bff-b56d3d361f53','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('76ca01a7-6c43-4293-86a0-db1bff620ce5','fa59272e-1499-4383-b1be-2999b444da48','algorithm','HS256'),('8710eb4e-0d79-4934-887c-30f8600b8b7a','f97b0c39-6fcf-4a3d-9bff-b56d3d361f53','allowed-protocol-mapper-types','saml-role-list-mapper'),('8757bea6-f6e2-4a0e-b357-d0dc1d2e4173','2ca94e9b-9cee-4d17-b693-de6d7865c82f','privateKey','MIIEowIBAAKCAQEAo50u0XpBB3CJjZdBWsXyxnNMiPlPKwFShz+WU573GQsF8imRv3nztUF8keZGIvrrjzRvX4peg1uYp+xLKlk/Fe8SQrGYVijQwKp+Lltms72+JL4r01dNApPU649GwoYwYc5x/DE4IoyWHj72sjBGLtMEH/DFWdVbRTW3yqAmZ7S7XEOX7RddmEk6q+hFbi1AuPcTrFUTlr9ozO9v7u2OyTDEPO/+0SCNe1H5mLTZiycE88cu8o/KKEm5qDB9kOAh2Mv6DgencnQRcutpUZ+rUYQl2EPqGoIUG26nt8cmcY5yTTPkoRjl5QR+d6d8glw5DqhbfOXpiVE1QR/dhWVpvwIDAQABAoIBAEDxvYnM+08WrqMTbQ+5DzsSvUiJnZE2fynMZcFfkjnQlFWhhob4w3IpQmcvfpuX+jTn3WWRKR7/FsNhGhz/O/la4may1AMvRF2Vz2xbP5MNOBKhogfL2XeycovmXXINjdrk9X3jk6KzJ0tuNsJYQyOHA1YiXlPgStBYGFJH67ax8vFvxPOoMZULx91Gdx6maCpUx+GsT1vhQ90VoGahrT/WgrxX7jj7WbO5mLftMvsSV6B7RXNMmUSm4iuf5vEKsNwk/N0IDM+4BbjDlmtAGgCVavOwiTHZHxctEfztIjv+ENuErgNQSbx1TtW1Q30ZCjo/8GyuZoQNi9EbKCMPItECgYEA+qmyY9gBHt6UhGusg69hC0Z+l0ISfpes3oWmLwiFIA1Ubz84Mwnxq3Ej4qab7gzMsXwDudNfFBXWP6SxIIEI/OO93qNfaU/wGcsSwfXdXJGgTjzzGjAjMLWzr1Z1eamJW10BBV6hx9eJ/qlEHOdtgIvxEXJOsJLfIrEKtteFmwsCgYEApxkA5LEmzgkRnsyy08hPAWG7XMMuH2Bpeg6quO+tYPYe8u2rub2aM1qgR07v0Mhm72XdLqLSMa469luSjDC2ZRyEuAYYJ4rhIF6O9Cr7jKRNTSeXnkZC7lZlj1G4V83m2aJDgfzyUIdlfHNH07Q87D263VpVN8wH6SBcEl2UfJ0CgYBzIQArdanGGOtUCvR4o1PKTv2T0agW9ulSZ0ZV8e7bMuQmGH5iit2yJcwarPWPl9doaZJ4hkn0OrdmEem9CScsqBmsKZOIFkwsPKaH6bpbaxOa+8mYrKVtGPfHv8lDMQhCq2vtoHJkDG54RhxfvjgAQ8Zcggj8duj/0RsfscvO0wKBgGMv7l3R4kzvCSyQKZ6ZCnyxfLxFh31Mh4/SYPjCHNKvhhOBjSwGJiBRrU5mxufR7XgxqSdjsw2WdJ2EIethhwNh+E4cH/5o69WBC65YTVVguhoQZGmpH1XGpyZ5xckpCd0p+pSQh23R0SYccAh0tq0sv11hn7AtRozVjpHARsHpAoGBAPJF8SvNM1wtQTtKXrusgZz3pDPlznKIdk/oyPvKdkb8Myq5qMZGCIEno7jaN9exR9KNknPnCPsaYkTmsUOtNGOXLBLDv/75eTDaL2XDiCXXitkmqBLcxZ0VGiIW5rMf5Se03zBcm0oETnIjOPlVtN0KkwssPf1b+hz881TxkFpy'),('9ae06b72-f9c6-4963-84fa-c2a4b0090853','b5a4c5ac-ec1d-4ca6-9e85-c96c750fd3f4','allow-default-scopes','true'),('a9a78362-bd91-469e-8659-9662ab10a5eb','fa59272e-1499-4383-b1be-2999b444da48','kid','3d0e733d-c5f3-4f9c-962e-a079e7ed3533'),('ada55698-c7d8-46eb-9bb9-8e042e9dc26d','f97b0c39-6fcf-4a3d-9bff-b56d3d361f53','allowed-protocol-mapper-types','oidc-address-mapper'),('bd145d79-8da1-4067-bf17-6ad537e25c1d','2ca94e9b-9cee-4d17-b693-de6d7865c82f','priority','100'),('cdc415ba-b2a3-498b-b261-af8f33d602ad','94a509d9-1198-440b-9318-e66ba45c5085','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('cf08e1ff-f4d6-41f2-9148-b5333f4a0ea5','2ca94e9b-9cee-4d17-b693-de6d7865c82f','certificate','MIICmzCCAYMCBgFw7HfOIzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjAwMzE4MDcwNTM5WhcNMzAwMzE4MDcwNzE5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCjnS7RekEHcImNl0FaxfLGc0yI+U8rAVKHP5ZTnvcZCwXyKZG/efO1QXyR5kYi+uuPNG9fil6DW5in7EsqWT8V7xJCsZhWKNDAqn4uW2azvb4kvivTV00Ck9Trj0bChjBhznH8MTgijJYePvayMEYu0wQf8MVZ1VtFNbfKoCZntLtcQ5ftF12YSTqr6EVuLUC49xOsVROWv2jM72/u7Y7JMMQ87/7RII17UfmYtNmLJwTzxy7yj8ooSbmoMH2Q4CHYy/oOB6dydBFy62lRn6tRhCXYQ+oaghQbbqe3xyZxjnJNM+ShGOXlBH53p3yCXDkOqFt85emJUTVBH92FZWm/AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGXQaaiI5NpBmryrtYgw4v1/A8Nl5hcbqY1S4Tw03CUrVb+9N5adJIpVc7v6SsPsc/K9kMQfIuC92m1jbfKWwp6OiXq52CFPwAtEzhC9mHHwcyIbMAT8p/Dzw7wX8qh4JR7L8xXVcKe/Guplhqt3HEwMYWKgfJ8t3Lo5exulMiatwNhU2Hbx5+T0omm4ihaakfnHFKNMUfRonfMdmtV0fm//fGkICOYLB7e4oIOuLZ8DmAb8WDC0Uu+dxI8+c0KK4ekgVSvAAbbHkrW/eDjnTY2KF0sq2Rts2SpHlYDv8LNtEPxqaM1y1A2JBcwoI5mFMAuwbT3cmRLtFSU90kBa8uM='),('dee10ba5-f86d-46f3-b1c2-7f412f0cadd4','fa59272e-1499-4383-b1be-2999b444da48','secret','6mSG04s7DXEsyoQ5BgZNYrUNgdPM9-5_9SSyZ0m0EQkP1AhKrg8Gxe5XtoSviH7ll16HyuEB_kUWzcfI6y5cxg'),('e21ee217-9098-45c0-9abd-6121e3f2f5a2','f97b0c39-6fcf-4a3d-9bff-b56d3d361f53','allowed-protocol-mapper-types','oidc-full-name-mapper'),('f4901abd-9e5a-42e8-8f5c-42a96f0c1c15','be6342fb-55a0-4cc1-8ae8-4f57efc81430','host-sending-registration-request-must-match','true'),('f7b09337-5e67-41b1-ad9c-419e9a98a37b','be6342fb-55a0-4cc1-8ae8-4f57efc81430','client-uris-must-match','true');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('21f91bbc-7d72-4ce7-a54b-47bb81409a73','bde4705c-a315-4c1e-b1e8-20627dc6008e'),('2cca36f0-caf4-4af0-843c-8469e23e8df6','f6def82b-b616-47ae-8903-7d6a36590443'),('31fbf6bc-a0e6-4994-9dd8-12d5f418ccc5','71c85cef-ff89-4ac1-9b18-5cd6069384f5'),('31fbf6bc-a0e6-4994-9dd8-12d5f418ccc5','745db84d-a103-42b1-abf0-daf31d6a3acd'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','12279eab-f587-47b7-88e7-9c29320a90e2'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','1ddacd28-a16f-4310-bd04-c5cfcf7de8cc'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','21f91bbc-7d72-4ce7-a54b-47bb81409a73'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','2df5ccb6-5210-4c9c-b5bd-467c4da754d1'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','31fbf6bc-a0e6-4994-9dd8-12d5f418ccc5'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','406588e0-ad8a-4efd-b52d-66c3c26dedc3'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','64d788d8-14f3-4028-b88d-4dfac6077114'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','71c85cef-ff89-4ac1-9b18-5cd6069384f5'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','745db84d-a103-42b1-abf0-daf31d6a3acd'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','79a91891-e454-484c-ac79-3b845a93693a'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','7aafc9b9-ad8b-4f1c-9f16-9a0ee46567e7'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','8cdb146b-a8cd-4757-a24c-99d015febcc6'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','8df73107-1dc7-426d-b4c8-d5ed819ec0e5'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','978f66b9-66e5-42a6-9246-20d5b434bfca'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','994c1bed-4dcd-4e47-9e89-e33a3fd3515b'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','bde4705c-a315-4c1e-b1e8-20627dc6008e'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','d13501a8-936f-48dd-9fc6-8f8bea500405'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','d5ea6b50-6cd5-4fc7-acbd-9eeb0cb1f965'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','f1550c07-4552-4fae-b51a-005b6e9b81f2'),('cd66cb73-c4c3-4f2e-8bfc-aba899c62269','88130138-9c30-496a-8f99-f4ff9178d97c');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('16cc1620-6368-42ca-b17d-6a9094b88d71',NULL,'password','1fc9f890-b04e-4656-97e2-4d790f06dd4d',1584515240346,NULL,'{\"value\":\"xoFPTMaTPDbv+YtI40ZyAFNe4Lh1C8dUAmycaYCN0GNs7ghnojkIhun7wclMqagfJ65cGAqoWqyE/HNxgTLIkA==\",\"salt\":\"hj84jcsxOzRowV+uU3lIsQ==\"}','{\"hashIterations\":100000,\"algorithm\":\"pbkdf2-sha256\"}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2020-03-18 07:06:43',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2020-03-18 07:06:43',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2020-03-18 07:06:43',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2020-03-18 07:06:44',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2020-03-18 07:06:46',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2020-03-18 07:06:46',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2020-03-18 07:06:48',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2020-03-18 07:06:48',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2020-03-18 07:06:48',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2020-03-18 07:06:50',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2020-03-18 07:06:51',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2020-03-18 07:06:51',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2020-03-18 07:06:51',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-03-18 07:06:51',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-03-18 07:06:51',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-03-18 07:06:51',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2020-03-18 07:06:51',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2020-03-18 07:06:53',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2020-03-18 07:06:54',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2020-03-18 07:06:54',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2020-03-18 07:06:54',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2020-03-18 07:06:54',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2020-03-18 07:06:54',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2020-03-18 07:06:54',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2020-03-18 07:06:54',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'4515198324'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2020-03-18 07:06:54',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2020-03-18 07:06:56',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2020-03-18 07:06:56',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'4515198324'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2020-03-18 07:06:57',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2020-03-18 07:06:57',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2020-03-18 07:06:58',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2020-03-18 07:06:58',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'4515198324'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-03-18 07:06:58',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'4515198324'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-03-18 07:06:58',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-03-18 07:06:59',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2020-03-18 07:06:59',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'4515198324'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2020-03-18 07:07:00',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'4515198324'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2020-03-18 07:07:00',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'4515198324'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2020-03-18 07:07:00',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'4515198324'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-03-18 07:07:00',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'4515198324'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-03-18 07:07:00',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'4515198324'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2020-03-18 07:07:00',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'4515198324'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2020-03-18 07:07:02',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2020-03-18 07:07:02',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'4515198324'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-03-18 07:07:02',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'4515198324'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-03-18 07:07:02',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'4515198324'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-03-18 07:07:02',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'4515198324'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-03-18 07:07:03',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2020-03-18 07:07:03',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'4515198324'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2020-03-18 07:07:04',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2020-03-18 07:07:04',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2020-03-18 07:07:04',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'4515198324'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2020-03-18 07:07:04',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'4515198324'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2020-03-18 07:07:04',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'4515198324'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-03-18 07:07:05',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'4515198324'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-03-18 07:07:05',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'4515198324'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-03-18 07:07:05',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2020-03-18 07:07:08',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2020-03-18 07:07:08',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2020-03-18 07:07:08',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'4515198324'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2020-03-18 07:07:09',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2020-03-18 07:07:09',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'4515198324'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2020-03-18 07:07:09',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'4515198324'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2020-03-18 07:07:09',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'4515198324'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2020-03-18 07:07:09',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'4515198324'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2020-03-18 07:07:09',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2020-03-18 07:07:09',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'4515198324'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2020-03-18 07:07:09',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'4515198324'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2020-03-18 07:07:09',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2020-03-18 07:07:09',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'4515198324'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2020-03-18 07:07:09',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'4515198324'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-03-18 07:07:09',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'4515198324'),('8.0.0-updating-credential-data-not-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-03-18 07:07:10',73,'EXECUTED','7:03b3f4b264c3c68ba082250a80b74216','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'4515198324'),('8.0.0-updating-credential-data-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-03-18 07:07:10',74,'MARK_RAN','7:64c5728f5ca1f5aa4392217701c4fe23','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'4515198324'),('8.0.0-credential-cleanup','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-03-18 07:07:10',75,'EXECUTED','7:41f3566ac5177459e1ed3ce8f0ad35d2','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2020-03-18 07:07:11',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'4515198324'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-03-18 07:07:11',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'4515198324'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-03-18 07:07:11',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-03-18 07:07:11',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'4515198324'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2020-03-18 07:07:11',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'4515198324');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('master','222264cc-9153-4abe-ab8a-5e4ea14d2bc7',_binary '\0'),('master','490aafe8-52fa-4d89-b9e1-c6395738bf4b',_binary ''),('master','62962785-4dd1-439a-ac20-83f8ad8120f4',_binary '\0'),('master','7530fd9d-ab60-4a33-8a8a-ed287a613a3d',_binary '\0'),('master','7c8584aa-b08e-492c-aa76-4e1583464851',_binary ''),('master','943e97bc-0923-4b20-afbd-b6873bd2f4b1',_binary ''),('master','a57017d1-1095-476e-b78e-d38eb1576654',_binary ''),('master','b8fd154d-b9bd-4642-84fc-efd0af184f16',_binary '\0'),('master','e7811144-53ba-4b7e-b24d-cc095a984391',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` varchar(2024) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  CONSTRAINT `FK_GROUP_ROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PARENT_GROUP` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`),
  CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_KJHO5LE2C0RAL09FL8CM9WFW9` FOREIGN KEY (`CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('12279eab-f587-47b7-88e7-9c29320a90e2','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_manage-authorization}','manage-authorization','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('1ddacd28-a16f-4310-bd04-c5cfcf7de8cc','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,'master'),('21f91bbc-7d72-4ce7-a54b-47bb81409a73','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_view-clients}','view-clients','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('2cca36f0-caf4-4af0-843c-8469e23e8df6','f59738ea-6a6f-48e7-9f28-920ea907f145',_binary '','${role_manage-consent}','manage-consent','master','f59738ea-6a6f-48e7-9f28-920ea907f145',NULL),('2df5ccb6-5210-4c9c-b5bd-467c4da754d1','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_view-events}','view-events','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('31fbf6bc-a0e6-4994-9dd8-12d5f418ccc5','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_view-users}','view-users','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('3ad4a34c-3f1b-48c5-9f6e-f10d99dc0af0','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,'master'),('3b5eceb5-6dcf-417e-9f01-3553a50eea88','f59738ea-6a6f-48e7-9f28-920ea907f145',_binary '','${role_view-profile}','view-profile','master','f59738ea-6a6f-48e7-9f28-920ea907f145',NULL),('406588e0-ad8a-4efd-b52d-66c3c26dedc3','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_impersonation}','impersonation','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('5182fec6-c708-45a7-88ab-7af2b3ca58ed','7b6770d5-e66b-44a8-ae99-832e110009c9',_binary '','${role_read-token}','read-token','master','7b6770d5-e66b-44a8-ae99-832e110009c9',NULL),('64d788d8-14f3-4028-b88d-4dfac6077114','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_create-client}','create-client','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('71c85cef-ff89-4ac1-9b18-5cd6069384f5','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_query-users}','query-users','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('745db84d-a103-42b1-abf0-daf31d6a3acd','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_query-groups}','query-groups','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('79a91891-e454-484c-ac79-3b845a93693a','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_manage-realm}','manage-realm','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('7aafc9b9-ad8b-4f1c-9f16-9a0ee46567e7','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_view-authorization}','view-authorization','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('88130138-9c30-496a-8f99-f4ff9178d97c','f59738ea-6a6f-48e7-9f28-920ea907f145',_binary '','${role_manage-account-links}','manage-account-links','master','f59738ea-6a6f-48e7-9f28-920ea907f145',NULL),('88e1e692-aaa9-47b2-8c66-b16a0a2e5310','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,'master'),('8cdb146b-a8cd-4757-a24c-99d015febcc6','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('8df73107-1dc7-426d-b4c8-d5ed819ec0e5','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_query-realms}','query-realms','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('978f66b9-66e5-42a6-9246-20d5b434bfca','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_view-realm}','view-realm','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('994c1bed-4dcd-4e47-9e89-e33a3fd3515b','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_view-identity-providers}','view-identity-providers','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('bde4705c-a315-4c1e-b1e8-20627dc6008e','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_query-clients}','query-clients','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','master',_binary '\0','${role_admin}','admin','master',NULL,'master'),('cd66cb73-c4c3-4f2e-8bfc-aba899c62269','f59738ea-6a6f-48e7-9f28-920ea907f145',_binary '','${role_manage-account}','manage-account','master','f59738ea-6a6f-48e7-9f28-920ea907f145',NULL),('d13501a8-936f-48dd-9fc6-8f8bea500405','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_manage-events}','manage-events','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('d5ea6b50-6cd5-4fc7-acbd-9eeb0cb1f965','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_manage-users}','manage-users','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('da3e6c4b-01ff-416b-baa7-840ee520f02a','f59738ea-6a6f-48e7-9f28-920ea907f145',_binary '','${role_view-applications}','view-applications','master','f59738ea-6a6f-48e7-9f28-920ea907f145',NULL),('f1550c07-4552-4fae-b51a-005b6e9b81f2','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',_binary '','${role_manage-clients}','manage-clients','master','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',NULL),('f6def82b-b616-47ae-8903-7d6a36590443','f59738ea-6a6f-48e7-9f28-920ea907f145',_binary '','${role_view-consent}','view-consent','master','f59738ea-6a6f-48e7-9f28-920ea907f145',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('62rg4','9.0.0',1584515236);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int(11) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('1191d6c8-e64b-4be2-9afd-931dfde36290','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'a57017d1-1095-476e-b78e-d38eb1576654'),('1395ec2a-04e3-4dbe-a28a-e7d6dc7a1978','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'a57017d1-1095-476e-b78e-d38eb1576654'),('1877c8d4-afc7-4d9d-9bc8-1e10fad4e064','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'490aafe8-52fa-4d89-b9e1-c6395738bf4b'),('2893c587-f546-43e8-83a9-ebac52af2005','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'490aafe8-52fa-4d89-b9e1-c6395738bf4b'),('2bf7c50a-dbf6-4778-9ded-07d4c8e69533','username','openid-connect','oidc-usermodel-property-mapper',NULL,'490aafe8-52fa-4d89-b9e1-c6395738bf4b'),('338a56b5-edd6-49e2-9a4f-e630878d3e7a','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'490aafe8-52fa-4d89-b9e1-c6395738bf4b'),('39192d88-e9da-49b5-ac45-568dd22e577b','role list','saml','saml-role-list-mapper',NULL,'e7811144-53ba-4b7e-b24d-cc095a984391'),('4261731b-a146-45f4-a531-6a6d818e7fc5','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'490aafe8-52fa-4d89-b9e1-c6395738bf4b'),('473bc72f-0571-4160-af78-0cb1b04889ce','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'a57017d1-1095-476e-b78e-d38eb1576654'),('4f050892-eeda-4da3-b1ee-1c05d68041cb','email','openid-connect','oidc-usermodel-property-mapper',NULL,'7c8584aa-b08e-492c-aa76-4e1583464851'),('57e06b1f-d4ce-4801-9c43-c79bbf18e6ab','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'490aafe8-52fa-4d89-b9e1-c6395738bf4b'),('5ba4d064-7f03-43a6-8bde-ec3e1f0fcd9b','locale','openid-connect','oidc-usermodel-attribute-mapper','4d9a443c-bb73-4915-a822-410338236e87',NULL),('70de662a-724d-462f-bc5c-d7ce59f163eb','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'7c8584aa-b08e-492c-aa76-4e1583464851'),('754e7b27-58b0-40a2-bdf7-6bfbe3d404d2','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'490aafe8-52fa-4d89-b9e1-c6395738bf4b'),('7866370e-fa2b-47f7-9ba0-2c7c517a0ec0','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'490aafe8-52fa-4d89-b9e1-c6395738bf4b'),('7ecdad54-e3a5-4141-9db8-aa897c9de374','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'222264cc-9153-4abe-ab8a-5e4ea14d2bc7'),('8fa6e31f-4d40-4527-926d-661107cca1b0','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'490aafe8-52fa-4d89-b9e1-c6395738bf4b'),('98812cc7-68cc-40f6-8797-2f6e3aeefdbd','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'490aafe8-52fa-4d89-b9e1-c6395738bf4b'),('99ff3562-6c68-4ed2-b684-a9a1079d8be3','audience resolve','openid-connect','oidc-audience-resolve-mapper','7de18847-fbd2-4d28-b238-5ee97d5bc127',NULL),('9f2d2d6b-bee4-4612-b36e-f0caf1be2346','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'490aafe8-52fa-4d89-b9e1-c6395738bf4b'),('a9ac7b4b-9ea2-4fb4-820a-97cadd0a40c8','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'62962785-4dd1-439a-ac20-83f8ad8120f4'),('accdf6b3-5e52-4d0c-afea-639e0a176e92','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'490aafe8-52fa-4d89-b9e1-c6395738bf4b'),('b089f7cd-bb10-4567-a44e-8a5c44182815','address','openid-connect','oidc-address-mapper',NULL,'b8fd154d-b9bd-4642-84fc-efd0af184f16'),('b62c80e0-27e5-4634-8db0-fa764fec94eb','full name','openid-connect','oidc-full-name-mapper',NULL,'490aafe8-52fa-4d89-b9e1-c6395738bf4b'),('cdeea89f-098c-4f4e-983a-e8ba2e2a87ac','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'62962785-4dd1-439a-ac20-83f8ad8120f4'),('e94ff08c-ca48-4e17-8d82-1c5a28a065ca','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'943e97bc-0923-4b20-afbd-b6873bd2f4b1'),('f33bf5db-cfca-4758-9566-ae73e8ded939','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'222264cc-9153-4abe-ab8a-5e4ea14d2bc7'),('f9bbfdd3-7482-48a8-aa87-7c7c78cf6ee7','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'490aafe8-52fa-4d89-b9e1-c6395738bf4b');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('1395ec2a-04e3-4dbe-a28a-e7d6dc7a1978','true','access.token.claim'),('1395ec2a-04e3-4dbe-a28a-e7d6dc7a1978','realm_access.roles','claim.name'),('1395ec2a-04e3-4dbe-a28a-e7d6dc7a1978','String','jsonType.label'),('1395ec2a-04e3-4dbe-a28a-e7d6dc7a1978','true','multivalued'),('1395ec2a-04e3-4dbe-a28a-e7d6dc7a1978','foo','user.attribute'),('1877c8d4-afc7-4d9d-9bc8-1e10fad4e064','true','access.token.claim'),('1877c8d4-afc7-4d9d-9bc8-1e10fad4e064','profile','claim.name'),('1877c8d4-afc7-4d9d-9bc8-1e10fad4e064','true','id.token.claim'),('1877c8d4-afc7-4d9d-9bc8-1e10fad4e064','String','jsonType.label'),('1877c8d4-afc7-4d9d-9bc8-1e10fad4e064','profile','user.attribute'),('1877c8d4-afc7-4d9d-9bc8-1e10fad4e064','true','userinfo.token.claim'),('2893c587-f546-43e8-83a9-ebac52af2005','true','access.token.claim'),('2893c587-f546-43e8-83a9-ebac52af2005','zoneinfo','claim.name'),('2893c587-f546-43e8-83a9-ebac52af2005','true','id.token.claim'),('2893c587-f546-43e8-83a9-ebac52af2005','String','jsonType.label'),('2893c587-f546-43e8-83a9-ebac52af2005','zoneinfo','user.attribute'),('2893c587-f546-43e8-83a9-ebac52af2005','true','userinfo.token.claim'),('2bf7c50a-dbf6-4778-9ded-07d4c8e69533','true','access.token.claim'),('2bf7c50a-dbf6-4778-9ded-07d4c8e69533','preferred_username','claim.name'),('2bf7c50a-dbf6-4778-9ded-07d4c8e69533','true','id.token.claim'),('2bf7c50a-dbf6-4778-9ded-07d4c8e69533','String','jsonType.label'),('2bf7c50a-dbf6-4778-9ded-07d4c8e69533','username','user.attribute'),('2bf7c50a-dbf6-4778-9ded-07d4c8e69533','true','userinfo.token.claim'),('338a56b5-edd6-49e2-9a4f-e630878d3e7a','true','access.token.claim'),('338a56b5-edd6-49e2-9a4f-e630878d3e7a','website','claim.name'),('338a56b5-edd6-49e2-9a4f-e630878d3e7a','true','id.token.claim'),('338a56b5-edd6-49e2-9a4f-e630878d3e7a','String','jsonType.label'),('338a56b5-edd6-49e2-9a4f-e630878d3e7a','website','user.attribute'),('338a56b5-edd6-49e2-9a4f-e630878d3e7a','true','userinfo.token.claim'),('39192d88-e9da-49b5-ac45-568dd22e577b','Role','attribute.name'),('39192d88-e9da-49b5-ac45-568dd22e577b','Basic','attribute.nameformat'),('39192d88-e9da-49b5-ac45-568dd22e577b','false','single'),('4261731b-a146-45f4-a531-6a6d818e7fc5','true','access.token.claim'),('4261731b-a146-45f4-a531-6a6d818e7fc5','gender','claim.name'),('4261731b-a146-45f4-a531-6a6d818e7fc5','true','id.token.claim'),('4261731b-a146-45f4-a531-6a6d818e7fc5','String','jsonType.label'),('4261731b-a146-45f4-a531-6a6d818e7fc5','gender','user.attribute'),('4261731b-a146-45f4-a531-6a6d818e7fc5','true','userinfo.token.claim'),('473bc72f-0571-4160-af78-0cb1b04889ce','true','access.token.claim'),('473bc72f-0571-4160-af78-0cb1b04889ce','resource_access.${client_id}.roles','claim.name'),('473bc72f-0571-4160-af78-0cb1b04889ce','String','jsonType.label'),('473bc72f-0571-4160-af78-0cb1b04889ce','true','multivalued'),('473bc72f-0571-4160-af78-0cb1b04889ce','foo','user.attribute'),('4f050892-eeda-4da3-b1ee-1c05d68041cb','true','access.token.claim'),('4f050892-eeda-4da3-b1ee-1c05d68041cb','email','claim.name'),('4f050892-eeda-4da3-b1ee-1c05d68041cb','true','id.token.claim'),('4f050892-eeda-4da3-b1ee-1c05d68041cb','String','jsonType.label'),('4f050892-eeda-4da3-b1ee-1c05d68041cb','email','user.attribute'),('4f050892-eeda-4da3-b1ee-1c05d68041cb','true','userinfo.token.claim'),('57e06b1f-d4ce-4801-9c43-c79bbf18e6ab','true','access.token.claim'),('57e06b1f-d4ce-4801-9c43-c79bbf18e6ab','nickname','claim.name'),('57e06b1f-d4ce-4801-9c43-c79bbf18e6ab','true','id.token.claim'),('57e06b1f-d4ce-4801-9c43-c79bbf18e6ab','String','jsonType.label'),('57e06b1f-d4ce-4801-9c43-c79bbf18e6ab','nickname','user.attribute'),('57e06b1f-d4ce-4801-9c43-c79bbf18e6ab','true','userinfo.token.claim'),('5ba4d064-7f03-43a6-8bde-ec3e1f0fcd9b','true','access.token.claim'),('5ba4d064-7f03-43a6-8bde-ec3e1f0fcd9b','locale','claim.name'),('5ba4d064-7f03-43a6-8bde-ec3e1f0fcd9b','true','id.token.claim'),('5ba4d064-7f03-43a6-8bde-ec3e1f0fcd9b','String','jsonType.label'),('5ba4d064-7f03-43a6-8bde-ec3e1f0fcd9b','locale','user.attribute'),('5ba4d064-7f03-43a6-8bde-ec3e1f0fcd9b','true','userinfo.token.claim'),('70de662a-724d-462f-bc5c-d7ce59f163eb','true','access.token.claim'),('70de662a-724d-462f-bc5c-d7ce59f163eb','email_verified','claim.name'),('70de662a-724d-462f-bc5c-d7ce59f163eb','true','id.token.claim'),('70de662a-724d-462f-bc5c-d7ce59f163eb','boolean','jsonType.label'),('70de662a-724d-462f-bc5c-d7ce59f163eb','emailVerified','user.attribute'),('70de662a-724d-462f-bc5c-d7ce59f163eb','true','userinfo.token.claim'),('754e7b27-58b0-40a2-bdf7-6bfbe3d404d2','true','access.token.claim'),('754e7b27-58b0-40a2-bdf7-6bfbe3d404d2','locale','claim.name'),('754e7b27-58b0-40a2-bdf7-6bfbe3d404d2','true','id.token.claim'),('754e7b27-58b0-40a2-bdf7-6bfbe3d404d2','String','jsonType.label'),('754e7b27-58b0-40a2-bdf7-6bfbe3d404d2','locale','user.attribute'),('754e7b27-58b0-40a2-bdf7-6bfbe3d404d2','true','userinfo.token.claim'),('7866370e-fa2b-47f7-9ba0-2c7c517a0ec0','true','access.token.claim'),('7866370e-fa2b-47f7-9ba0-2c7c517a0ec0','given_name','claim.name'),('7866370e-fa2b-47f7-9ba0-2c7c517a0ec0','true','id.token.claim'),('7866370e-fa2b-47f7-9ba0-2c7c517a0ec0','String','jsonType.label'),('7866370e-fa2b-47f7-9ba0-2c7c517a0ec0','firstName','user.attribute'),('7866370e-fa2b-47f7-9ba0-2c7c517a0ec0','true','userinfo.token.claim'),('7ecdad54-e3a5-4141-9db8-aa897c9de374','true','access.token.claim'),('7ecdad54-e3a5-4141-9db8-aa897c9de374','phone_number','claim.name'),('7ecdad54-e3a5-4141-9db8-aa897c9de374','true','id.token.claim'),('7ecdad54-e3a5-4141-9db8-aa897c9de374','String','jsonType.label'),('7ecdad54-e3a5-4141-9db8-aa897c9de374','phoneNumber','user.attribute'),('7ecdad54-e3a5-4141-9db8-aa897c9de374','true','userinfo.token.claim'),('8fa6e31f-4d40-4527-926d-661107cca1b0','true','access.token.claim'),('8fa6e31f-4d40-4527-926d-661107cca1b0','picture','claim.name'),('8fa6e31f-4d40-4527-926d-661107cca1b0','true','id.token.claim'),('8fa6e31f-4d40-4527-926d-661107cca1b0','String','jsonType.label'),('8fa6e31f-4d40-4527-926d-661107cca1b0','picture','user.attribute'),('8fa6e31f-4d40-4527-926d-661107cca1b0','true','userinfo.token.claim'),('98812cc7-68cc-40f6-8797-2f6e3aeefdbd','true','access.token.claim'),('98812cc7-68cc-40f6-8797-2f6e3aeefdbd','updated_at','claim.name'),('98812cc7-68cc-40f6-8797-2f6e3aeefdbd','true','id.token.claim'),('98812cc7-68cc-40f6-8797-2f6e3aeefdbd','String','jsonType.label'),('98812cc7-68cc-40f6-8797-2f6e3aeefdbd','updatedAt','user.attribute'),('98812cc7-68cc-40f6-8797-2f6e3aeefdbd','true','userinfo.token.claim'),('9f2d2d6b-bee4-4612-b36e-f0caf1be2346','true','access.token.claim'),('9f2d2d6b-bee4-4612-b36e-f0caf1be2346','middle_name','claim.name'),('9f2d2d6b-bee4-4612-b36e-f0caf1be2346','true','id.token.claim'),('9f2d2d6b-bee4-4612-b36e-f0caf1be2346','String','jsonType.label'),('9f2d2d6b-bee4-4612-b36e-f0caf1be2346','middleName','user.attribute'),('9f2d2d6b-bee4-4612-b36e-f0caf1be2346','true','userinfo.token.claim'),('a9ac7b4b-9ea2-4fb4-820a-97cadd0a40c8','true','access.token.claim'),('a9ac7b4b-9ea2-4fb4-820a-97cadd0a40c8','groups','claim.name'),('a9ac7b4b-9ea2-4fb4-820a-97cadd0a40c8','true','id.token.claim'),('a9ac7b4b-9ea2-4fb4-820a-97cadd0a40c8','String','jsonType.label'),('a9ac7b4b-9ea2-4fb4-820a-97cadd0a40c8','true','multivalued'),('a9ac7b4b-9ea2-4fb4-820a-97cadd0a40c8','foo','user.attribute'),('accdf6b3-5e52-4d0c-afea-639e0a176e92','true','access.token.claim'),('accdf6b3-5e52-4d0c-afea-639e0a176e92','family_name','claim.name'),('accdf6b3-5e52-4d0c-afea-639e0a176e92','true','id.token.claim'),('accdf6b3-5e52-4d0c-afea-639e0a176e92','String','jsonType.label'),('accdf6b3-5e52-4d0c-afea-639e0a176e92','lastName','user.attribute'),('accdf6b3-5e52-4d0c-afea-639e0a176e92','true','userinfo.token.claim'),('b089f7cd-bb10-4567-a44e-8a5c44182815','true','access.token.claim'),('b089f7cd-bb10-4567-a44e-8a5c44182815','true','id.token.claim'),('b089f7cd-bb10-4567-a44e-8a5c44182815','country','user.attribute.country'),('b089f7cd-bb10-4567-a44e-8a5c44182815','formatted','user.attribute.formatted'),('b089f7cd-bb10-4567-a44e-8a5c44182815','locality','user.attribute.locality'),('b089f7cd-bb10-4567-a44e-8a5c44182815','postal_code','user.attribute.postal_code'),('b089f7cd-bb10-4567-a44e-8a5c44182815','region','user.attribute.region'),('b089f7cd-bb10-4567-a44e-8a5c44182815','street','user.attribute.street'),('b089f7cd-bb10-4567-a44e-8a5c44182815','true','userinfo.token.claim'),('b62c80e0-27e5-4634-8db0-fa764fec94eb','true','access.token.claim'),('b62c80e0-27e5-4634-8db0-fa764fec94eb','true','id.token.claim'),('b62c80e0-27e5-4634-8db0-fa764fec94eb','true','userinfo.token.claim'),('cdeea89f-098c-4f4e-983a-e8ba2e2a87ac','true','access.token.claim'),('cdeea89f-098c-4f4e-983a-e8ba2e2a87ac','upn','claim.name'),('cdeea89f-098c-4f4e-983a-e8ba2e2a87ac','true','id.token.claim'),('cdeea89f-098c-4f4e-983a-e8ba2e2a87ac','String','jsonType.label'),('cdeea89f-098c-4f4e-983a-e8ba2e2a87ac','username','user.attribute'),('cdeea89f-098c-4f4e-983a-e8ba2e2a87ac','true','userinfo.token.claim'),('f33bf5db-cfca-4758-9566-ae73e8ded939','true','access.token.claim'),('f33bf5db-cfca-4758-9566-ae73e8ded939','phone_number_verified','claim.name'),('f33bf5db-cfca-4758-9566-ae73e8ded939','true','id.token.claim'),('f33bf5db-cfca-4758-9566-ae73e8ded939','boolean','jsonType.label'),('f33bf5db-cfca-4758-9566-ae73e8ded939','phoneNumberVerified','user.attribute'),('f33bf5db-cfca-4758-9566-ae73e8ded939','true','userinfo.token.claim'),('f9bbfdd3-7482-48a8-aa87-7c7c78cf6ee7','true','access.token.claim'),('f9bbfdd3-7482-48a8-aa87-7c7c78cf6ee7','birthdate','claim.name'),('f9bbfdd3-7482-48a8-aa87-7c7c78cf6ee7','true','id.token.claim'),('f9bbfdd3-7482-48a8-aa87-7c7c78cf6ee7','String','jsonType.label'),('f9bbfdd3-7482-48a8-aa87-7c7c78cf6ee7','birthdate','user.attribute'),('f9bbfdd3-7482-48a8-aa87-7c7c78cf6ee7','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT '0',
  `OTP_POLICY_WINDOW` int(11) DEFAULT '1',
  `OTP_POLICY_PERIOD` int(11) DEFAULT '30',
  `OTP_POLICY_DIGITS` int(11) DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`),
  CONSTRAINT `FK_TRAF444KK6QRKMS7N56AIWQ5Y` FOREIGN KEY (`MASTER_ADMIN_CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','5c72d28f-8af0-4a06-bf35-a6d1896bf9e7',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','e5ed1399-37f6-4b1e-8e69-924509cd0c47','3152a11f-3924-4734-b85d-20344ac5827c','2bfee9e9-559e-4562-bbb7-3d82340a8f8f','5442f329-9f6e-410e-927a-713e54ac4eb8','a58b1026-6c79-461b-8173-6167ed59c031',2592000,_binary '\0',900,_binary '',_binary '\0','bc14b93d-7541-44e7-9d05-548a17b2b75f',0,_binary '\0',0,0);
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('bruteForceProtected','false','master'),('displayName','Keycloak','master'),('displayNameHtml','<div class=\"kc-logo-text\"><span>Keycloak</span></div>','master'),('failureFactor','30','master'),('maxDeltaTimeSeconds','43200','master'),('maxFailureWaitSeconds','900','master'),('minimumQuickLoginWaitSeconds','60','master'),('offlineSessionMaxLifespan','5184000','master'),('offlineSessionMaxLifespanEnabled','false','master'),('permanentLockout','false','master'),('quickLoginCheckMilliSeconds','1000','master'),('waitIncrementSeconds','60','master'),('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','master'),('_browser_header.contentSecurityPolicyReportOnly','','master'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','master'),('_browser_header.xContentTypeOptions','nosniff','master'),('_browser_header.xFrameOptions','SAMEORIGIN','master'),('_browser_header.xRobotsTag','none','master'),('_browser_header.xXSSProtection','1; mode=block','master');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_ROLES` (
  `REALM_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  KEY `IDX_REALM_DEF_ROLES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_ROLES`
--

LOCK TABLES `REALM_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('master','3ad4a34c-3f1b-48c5-9f6e-f10d99dc0af0'),('master','88e1e692-aaa9-47b2-8c66-b16a0a2e5310');
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('master','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','master');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('4d9a443c-bb73-4915-a822-410338236e87','/admin/master/console/*'),('7de18847-fbd2-4d28-b238-5ee97d5bc127','/realms/master/account/*'),('f59738ea-6a6f-48e7-9f28-920ea907f145','/realms/master/account/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('3ec43a81-5c86-435a-8dbd-86c2137bb4f8','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('6dd2c143-6eab-46e9-9049-1527cb27ec3d','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('82f3f5d7-6998-469a-8277-78f5afd5d49f','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('95ef12b5-a1c8-4485-8f4a-161a9b6cf0b4','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('bc5f379f-f7a5-42d3-a0e0-18ae1487fcfd','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('eb2022b3-ed46-4ad6-8e3b-d1a7e3b05d74','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('7de18847-fbd2-4d28-b238-5ee97d5bc127','cd66cb73-c4c3-4f2e-8bfc-aba899c62269');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('1fc9f890-b04e-4656-97e2-4d790f06dd4d',NULL,'20dd8a5f-551a-41e3-b41f-56bae3467075',_binary '\0',_binary '',NULL,NULL,NULL,'master','admin',1584515240094,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('3ad4a34c-3f1b-48c5-9f6e-f10d99dc0af0','1fc9f890-b04e-4656-97e2-4d790f06dd4d'),('3b5eceb5-6dcf-417e-9f01-3553a50eea88','1fc9f890-b04e-4656-97e2-4d790f06dd4d'),('88e1e692-aaa9-47b2-8c66-b16a0a2e5310','1fc9f890-b04e-4656-97e2-4d790f06dd4d'),('ca2f1e7c-bc90-4059-a0f1-3751a56f94b0','1fc9f890-b04e-4656-97e2-4d790f06dd4d'),('cd66cb73-c4c3-4f2e-8bfc-aba899c62269','1fc9f890-b04e-4656-97e2-4d790f06dd4d');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('4d9a443c-bb73-4915-a822-410338236e87','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-18  7:12:06
