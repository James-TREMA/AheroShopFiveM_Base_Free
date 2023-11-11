-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ox_server
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.4-MariaDB-1~deb12u1

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
-- Table structure for table `addon_account`
--

DROP TABLE IF EXISTS `addon_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_account`
--

LOCK TABLES `addon_account` WRITE;
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT INTO `addon_account` VALUES ('bank_savings','Savings account',0),('caution','caution',0),('society_ambulance','EMS',1),('society_banker','Bank',1),('society_cardealer','Cardealer',1),('society_mechanic','Mechanic',1),('society_police','Police',1),('society_taxi','Taxi',1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_account_data`
--

DROP TABLE IF EXISTS `addon_account_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_account_data`
--

LOCK TABLES `addon_account_data` WRITE;
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT INTO `addon_account_data` VALUES (1,'society_cardealer',0,NULL),(2,'society_police',0,NULL),(3,'society_ambulance',0,NULL),(4,'society_mechanic',0,NULL),(5,'society_taxi',0,NULL),(9,'society_banker',0,NULL),(10,'bank_savings',0,'4e57d01b00cf67cc86b74ca13c1ba4d27e6201c1'),(11,'caution',0,'4e57d01b00cf67cc86b74ca13c1ba4d27e6201c1');
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_inventory`
--

DROP TABLE IF EXISTS `addon_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_inventory`
--

LOCK TABLES `addon_inventory` WRITE;
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT INTO `addon_inventory` VALUES ('society_ambulance','EMS',1),('society_cardealer','Cardealer',1),('society_mechanic','Mechanic',1),('society_police','Police',1),('society_taxi','Taxi',1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addon_inventory_items`
--

DROP TABLE IF EXISTS `addon_inventory_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_inventory_items`
--

LOCK TABLES `addon_inventory_items` WRITE;
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banking`
--

DROP TABLE IF EXISTS `banking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banking`
--

LOCK TABLES `banking` WRITE;
/*!40000 ALTER TABLE `banking` DISABLE KEYS */;
/*!40000 ALTER TABLE `banking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cardealer_vehicles`
--

DROP TABLE IF EXISTS `cardealer_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardealer_vehicles`
--

LOCK TABLES `cardealer_vehicles` WRITE;
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datastore`
--

DROP TABLE IF EXISTS `datastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datastore`
--

LOCK TABLES `datastore` WRITE;
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT INTO `datastore` VALUES ('property','Property',0),('society_ambulance','EMS',1),('society_mechanic','Mechanic',1),('society_police','Police',1),('society_taxi','Taxi',1),('user_ears','Ears',0),('user_glasses','Glasses',0),('user_helmet','Helmet',0),('user_mask','Mask',0);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datastore_data`
--

DROP TABLE IF EXISTS `datastore_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datastore_data`
--

LOCK TABLES `datastore_data` WRITE;
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT INTO `datastore_data` VALUES (1,'society_police',NULL,'{}'),(2,'society_ambulance',NULL,'{}'),(3,'society_mechanic',NULL,'{}'),(4,'society_taxi',NULL,'{}'),(5,'property',NULL,'{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fine_types`
--

DROP TABLE IF EXISTS `fine_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fine_types`
--

LOCK TABLES `fine_types` WRITE;
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` VALUES (53,'Mauvais usage d\'un klaxon',30,0),(54,'Franchissement illégal d\'une ligne continue',40,0),(55,'Conduite du mauvais côté de la route',250,0),(56,'Demi-tour illégal',250,0),(57,'Conduite hors route illégale',170,0),(58,'Refus d\'obtempérer à un ordre légitime',30,0),(59,'Arrêt illégal d\'un véhicule',150,0),(60,'Stationnement illégal',70,0),(61,'Non-respect de la priorité à droite',70,0),(62,'Défaut de conformité aux informations du véhicule',90,0),(63,'Non-respect de l\'arrêt à un panneau stop',105,0),(64,'Non-respect de l\'arrêt à un feu rouge',130,0),(65,'Dépassement illégal',100,0),(66,'Conduite d\'un véhicule illégal',100,0),(67,'Conduite sans permis',1500,0),(68,'Délit de fuite',800,0),(69,'Excès de vitesse de moins de 5 mph',90,0),(70,'Excès de vitesse de 5 à 15 mph',120,0),(71,'Excès de vitesse de 15 à 30 mph',180,0),(72,'Excès de vitesse de plus de 30 mph',300,0),(73,'Entrave à la circulation',110,1),(74,'Ivresse publique',90,1),(75,'Conduite désordonnée',90,1),(76,'Obstruction à la justice',130,1),(77,'Insultes envers des civils',75,1),(78,'Manque de respect envers un agent de la loi',110,1),(79,'Menace verbale envers un civil',90,1),(80,'Menace verbale envers un agent de la loi',150,1),(81,'Fournir de fausses informations',250,1),(82,'Tentative de corruption',1500,1),(83,'Exhibition d\'une arme en ville',120,2),(84,'Exhibition d\'une arme mortelle en ville',300,2),(85,'Pas de licence d\'armes à feu',600,2),(86,'Possession d\'une arme illégale',700,2),(87,'Possession d\'outils de cambriolage',300,2),(88,'Vol de voiture caractérisé',1800,2),(89,'Intention de vendre/distribuer une substance illégale',1500,2),(90,'Fabrication d\'une substance illégale',1500,2),(91,'Possession d\'une substance illégale',650,2),(92,'Enlèvement d\'un civil',1500,2),(93,'Enlèvement d\'un agent de la loi',2000,2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES ('alive_chicken','Poulet vivant',1,0,1),('bandage','Bandage',2,0,1),('blowpipe','Chalumeau',2,0,1),('bread','Pain',1,0,1),('cannabis','Cannabis',3,0,1),('carokit','Kit carrosserie',3,0,1),('carotool','Outils',2,0,1),('clothe','Vêtement',1,0,1),('copper','Cuivre',1,0,1),('cutted_wood','Bois coupé',1,0,1),('diamond','Diamant',1,0,1),('essence','Essence',1,0,1),('fabric','Tissu',1,0,1),('fish','Poisson',1,0,1),('radio','Radio',1,0,1),('fixkit','Kit de réparation',3,0,1),('fixtool','Outils de réparation',2,0,1),('gazbottle','Bouteille de gaz',2,0,1),('gold','Or',1,0,1),('iron','Fer',1,0,1),('marijuana','Marijuana',2,0,1),('medikit','Trousse de soins',2,0,1),('packaged_chicken','Filet de poulet',1,0,1),('packaged_plank','Bois emballé',1,0,1),('petrol','Pétrole',1,0,1),('petrol_raffin','Huile traitée',1,0,1),('phone','Téléphone',1,0,1),('slaughtered_chicken','Poulet abattu',1,0,1),('stone','Pierre',1,0,1),('washed_stone','Pierre lavée',1,0,1),('water','Eau',1,0,1),('wood','Bois',1,0,1),('wool','Laine',1,0,1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job2_grades`
--

DROP TABLE IF EXISTS `job2_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job2_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job2_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job2_grades`
--

LOCK TABLES `job2_grades` WRITE;
/*!40000 ALTER TABLE `job2_grades` DISABLE KEYS */;
INSERT INTO `job2_grades` VALUES (1,'unemployed2',0,'unemployed2','Aucun',0,'{}','{}'),(18,'ballas',0,'recrue','Novice',12,'{}','{}'),(19,'ballas',1,'novice','Soldat',24,'{}','{}'),(20,'ballas',2,'experimente','Chef',36,'{}','{}'),(21,'ballas',3,'chief','Bras-Droit',48,'{}','{}'),(22,'ballas',4,'boss','Boss',0,'{}','{}');
/*!40000 ALTER TABLE `job2_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_grades`
--

DROP TABLE IF EXISTS `job_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_grades`
--

LOCK TABLES `job_grades` WRITE;
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT INTO `job_grades` VALUES (1,'unemployed',0,'unemployed','Unemployed',200,'{}','{}'),(2,'police',0,'recruit','Recrue',20,'{}','{}'),(3,'police',1,'officer','Officier',40,'{}','{}'),(4,'police',2,'sergeant','Sergent',60,'{}','{}'),(5,'police',3,'lieutenant','Lieutenant',85,'{}','{}'),(6,'police',4,'boss','Capitaine',100,'{}','{}'),(11,'cardealer',0,'recruit','Recrue',10,'{}','{}'),(12,'cardealer',1,'novice','Novice',25,'{}','{}'),(13,'cardealer',2,'experienced','Expérimenté',40,'{}','{}'),(14,'cardealer',3,'boss','Patron',0,'{}','{}'),(15,'lumberjack',0,'employee','Employé',0,'{}','{}'),(16,'fisherman',0,'employee','Employé',0,'{}','{}'),(17,'fueler',0,'employee','Employé',0,'{}','{}'),(18,'reporter',0,'employee','Employé',0,'{}','{}'),(19,'tailor',0,'employee','Employé',0,'{\"mask_1\":0,\"arms\":1,\"glasses_1\":0,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":0,\"torso_1\":24,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":0,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":36,\"tshirt_2\":0,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":48,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}','{\"mask_1\":0,\"arms\":5,\"glasses_1\":5,\"hair_color_2\":4,\"makeup_1\":0,\"face\":19,\"glasses\":0,\"mask_2\":0,\"makeup_3\":0,\"skin\":29,\"helmet_2\":0,\"lipstick_4\":0,\"sex\":1,\"torso_1\":52,\"makeup_2\":0,\"bags_2\":0,\"chain_2\":0,\"ears_1\":-1,\"bags_1\":0,\"bproof_1\":0,\"shoes_2\":1,\"lipstick_2\":0,\"chain_1\":0,\"tshirt_1\":23,\"eyebrows_3\":0,\"pants_2\":0,\"beard_4\":0,\"torso_2\":0,\"beard_2\":6,\"ears_2\":0,\"hair_2\":0,\"shoes_1\":42,\"tshirt_2\":4,\"beard_3\":0,\"hair_1\":2,\"hair_color_1\":0,\"pants_1\":36,\"helmet_1\":-1,\"bproof_2\":0,\"eyebrows_4\":0,\"eyebrows_2\":0,\"decals_1\":0,\"age_2\":0,\"beard_1\":5,\"shoes\":10,\"lipstick_1\":0,\"eyebrows_1\":0,\"glasses_2\":0,\"makeup_4\":0,\"decals_2\":0,\"lipstick_3\":0,\"age_1\":0}'),(20,'miner',0,'employee','Employé',0,'{\"tshirt_2\":1,\"ears_1\":8,\"glasses_1\":15,\"torso_2\":0,\"ears_2\":2,\"glasses_2\":3,\"shoes_2\":1,\"pants_1\":75,\"shoes_1\":51,\"bags_1\":0,\"helmet_2\":0,\"pants_2\":7,\"torso_1\":71,\"tshirt_1\":59,\"arms\":2,\"bags_2\":0,\"helmet_1\":0}','{}'),(21,'slaughterer',0,'employee','Employee',0,'{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":67,\"pants_1\":36,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":0,\"torso_1\":56,\"beard_2\":6,\"shoes_1\":12,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":15,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":0,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}','{\"age_1\":0,\"glasses_2\":0,\"beard_1\":5,\"decals_2\":0,\"beard_4\":0,\"shoes_2\":0,\"tshirt_2\":0,\"lipstick_2\":0,\"hair_2\":0,\"arms\":72,\"pants_1\":45,\"skin\":29,\"eyebrows_2\":0,\"shoes\":10,\"helmet_1\":-1,\"lipstick_1\":0,\"helmet_2\":0,\"hair_color_1\":0,\"glasses\":0,\"makeup_4\":0,\"makeup_1\":0,\"hair_1\":2,\"bproof_1\":0,\"bags_1\":0,\"mask_1\":0,\"lipstick_3\":0,\"chain_1\":0,\"eyebrows_4\":0,\"sex\":1,\"torso_1\":49,\"beard_2\":6,\"shoes_1\":24,\"decals_1\":0,\"face\":19,\"lipstick_4\":0,\"tshirt_1\":9,\"mask_2\":0,\"age_2\":0,\"eyebrows_3\":0,\"chain_2\":0,\"glasses_1\":5,\"ears_1\":-1,\"bags_2\":0,\"ears_2\":0,\"torso_2\":0,\"bproof_2\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"makeup_3\":0,\"pants_2\":0,\"beard_3\":0,\"hair_color_2\":4}'),(22,'ambulance',0,'ambulance','Recrue',20,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(23,'ambulance',1,'doctor','Docteur',40,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(24,'ambulance',2,'chief_doctor','Chef Docteur',60,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(25,'ambulance',3,'boss','Patron',80,'{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"helmet_1\":8,\"helmet_2\":0,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}','{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),(26,'mechanic',0,'recrue','Recrue',12,'{}','{}'),(27,'mechanic',1,'novice','Novice',24,'{}','{}'),(28,'mechanic',2,'experimente','Expérimenté',36,'{}','{}'),(29,'mechanic',3,'chief','Leader',48,'{}','{}'),(30,'mechanic',4,'boss','Patron',0,'{}','{}'),(31,'taxi',0,'recrue','Recrue',12,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),(32,'taxi',1,'novice','Novice',24,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),(33,'taxi',2,'experimente','Expérimenté',36,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),(34,'taxi',3,'uber','Uber',48,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),(35,'taxi',4,'boss','Chef Uber',0,'{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}','{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),(36,'banker',0,'advisor','Consultant',10,'{}','{}'),(37,'banker',1,'banker','Banquier',20,'{}','{}'),(38,'banker',2,'business_banker','Expérimenté',30,'{}','{}'),(39,'banker',3,'trader','Courtier',40,'{}','{}'),(40,'banker',4,'boss','Patron',0,'{}','{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES ('ambulance','EMS',0),('banker','Banquier',0),('cardealer','Concessionnaire',0),('fisherman','Pêcheur',0),('fueler','Ravitailleur',0),('lumberjack','Bûcheron',0),('mechanic','Mecano',0),('miner','Mineur',0),('police','LSPD',0),('reporter','Reporter',0),('slaughterer','Boucher',0),('tailor','Tailleur',0),('taxi','Taxi',0),('unemployed','Chômage',0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs2`
--

DROP TABLE IF EXISTS `jobs2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs2` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs2`
--

LOCK TABLES `jobs2` WRITE;
/*!40000 ALTER TABLE `jobs2` DISABLE KEYS */;
INSERT INTO `jobs2` VALUES ('ballas','Ballas',0),('unemployed2','Organisation',0);
/*!40000 ALTER TABLE `jobs2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES ('boat','Permis bateau'),('dmv','Permis de conduire'),('drive','Permis de conduire'),('drive_bike','Permis moto'),('drive_truck','Permis de conduire commercial'),('weapon','Permis de port d\'arme'),('weed_processing','Licence de traitement des mauvaises herbes');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owned_vehicles`
--

DROP TABLE IF EXISTS `owned_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owned_vehicles` (
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  `parking` varchar(60) DEFAULT NULL,
  `pound` varchar(60) DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owned_vehicles`
--

LOCK TABLES `owned_vehicles` WRITE;
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ox_doorlock`
--

DROP TABLE IF EXISTS `ox_doorlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ox_doorlock`
--

LOCK TABLES `ox_doorlock` WRITE;
/*!40000 ALTER TABLE `ox_doorlock` DISABLE KEYS */;
INSERT INTO `ox_doorlock` VALUES (1,'community_mrpd 1','{\"coords\":{\"x\":434.7478942871094,\"y\":-981.916748046875,\"z\":30.83926963806152},\"groups\":{\"police\":0,\"offpolice\":0},\"maxDistance\":2.5,\"state\":0,\"doors\":[{\"coords\":{\"x\":434.7478942871094,\"y\":-980.618408203125,\"z\":30.83926963806152},\"model\":-1215222675,\"heading\":270},{\"coords\":{\"x\":434.7478942871094,\"y\":-983.215087890625,\"z\":30.83926963806152},\"model\":320433149,\"heading\":270}],\"hideUi\":false}'),(2,'community_mrpd 2','{\"coords\":{\"x\":468.6697998046875,\"y\":-1014.4520263671875,\"z\":26.53623962402343},\"groups\":{\"police\":0},\"maxDistance\":2.5,\"state\":1,\"doors\":[{\"coords\":{\"x\":469.9679870605469,\"y\":-1014.4520263671875,\"z\":26.53623962402343},\"model\":-2023754432,\"heading\":180},{\"coords\":{\"x\":467.3716125488281,\"y\":-1014.4520263671875,\"z\":26.53623962402343},\"model\":-2023754432,\"heading\":0}],\"hideUi\":false}'),(3,'community_mrpd 3','{\"coords\":{\"x\":463.4783020019531,\"y\":-1003.5380249023438,\"z\":25.00598907470703},\"model\":-1033001619,\"groups\":{\"police\":0},\"heading\":0,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(4,'community_mrpd 4','{\"coords\":{\"x\":488.8948059082031,\"y\":-1017.2100219726563,\"z\":27.14863014221191},\"auto\":true,\"lockSound\":\"button-remote\",\"groups\":{\"police\":0},\"heading\":90,\"maxDistance\":5,\"state\":1,\"model\":-1603817716,\"hideUi\":false}'),(5,'community_mrpd 5','{\"coords\":{\"x\":431.4056091308594,\"y\":-1001.1690063476563,\"z\":26.71261024475097},\"auto\":true,\"lockSound\":\"button-remote\",\"groups\":{\"police\":0},\"heading\":0,\"maxDistance\":5,\"state\":1,\"model\":-190780785,\"hideUi\":false}'),(6,'community_mrpd 6','{\"coords\":{\"x\":436.223388671875,\"y\":-1001.1690063476563,\"z\":26.71261024475097},\"auto\":true,\"lockSound\":\"button-remote\",\"groups\":{\"police\":0},\"heading\":0,\"maxDistance\":5,\"state\":1,\"model\":-190780785,\"hideUi\":false}'),(7,'community_mrpd 7','{\"coords\":{\"x\":450.10418701171877,\"y\":-985.7384033203125,\"z\":30.83930969238281},\"model\":1557126584,\"groups\":{\"police\":0,\"offpolice\":0},\"heading\":90,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(8,'community_mrpd 8','{\"coords\":{\"x\":464.15838623046877,\"y\":-1011.260009765625,\"z\":33.01121139526367},\"model\":507213820,\"groups\":{\"police\":0},\"heading\":0,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(9,'community_mrpd 9','{\"coords\":{\"x\":461.2864990234375,\"y\":-985.3206176757813,\"z\":30.83926963806152},\"model\":749848321,\"groups\":{\"police\":0},\"heading\":90,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(10,'community_mrpd 10','{\"coords\":{\"x\":446.57281494140627,\"y\":-980.0106201171875,\"z\":30.83930969238281},\"model\":-1320876379,\"groups\":{\"police\":0},\"heading\":180,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(11,'community_mrpd 11','{\"coords\":{\"x\":453.09381103515627,\"y\":-983.2293701171875,\"z\":30.83926963806152},\"model\":-1033001619,\"groups\":{\"police\":0},\"heading\":91,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(12,'community_mrpd 12','{\"coords\":{\"x\":464.36138916015627,\"y\":-984.677978515625,\"z\":43.83443832397461},\"model\":-340230128,\"groups\":{\"police\":0},\"heading\":90,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(13,'community_mrpd 13','{\"coords\":{\"x\":442.6625061035156,\"y\":-988.2412719726563,\"z\":26.81977081298828},\"model\":-131296141,\"groups\":{\"police\":0},\"heading\":179,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(14,'community_mrpd 14','{\"coords\":{\"x\":471.3153991699219,\"y\":-986.1090698242188,\"z\":25.05794906616211},\"model\":-131296141,\"groups\":{\"police\":0},\"heading\":270,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(15,'community_mrpd 15','{\"coords\":{\"x\":467.5935974121094,\"y\":-977.9932861328125,\"z\":25.05794906616211},\"model\":-131296141,\"groups\":{\"police\":0},\"heading\":180,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(16,'community_mrpd 16','{\"coords\":{\"x\":463.6145935058594,\"y\":-980.5814208984375,\"z\":25.05794906616211},\"model\":-131296141,\"groups\":{\"police\":0},\"heading\":90,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(17,'community_mrpd 17','{\"coords\":{\"x\":464.5701904296875,\"y\":-992.6641235351563,\"z\":25.0644302368164},\"model\":631614199,\"lockSound\":\"metal-locker\",\"groups\":{\"police\":0},\"heading\":0,\"maxDistance\":2,\"state\":1,\"unlockSound\":\"metallic-creak\",\"hideUi\":false}'),(18,'community_mrpd 18','{\"coords\":{\"x\":461.8064880371094,\"y\":-994.4086303710938,\"z\":25.0644302368164},\"model\":631614199,\"lockSound\":\"metal-locker\",\"groups\":{\"police\":0},\"heading\":270,\"maxDistance\":2,\"state\":1,\"unlockSound\":\"metallic-creak\",\"hideUi\":false}'),(19,'community_mrpd 19','{\"coords\":{\"x\":461.8064880371094,\"y\":-997.6583862304688,\"z\":25.0644302368164},\"model\":631614199,\"lockSound\":\"metal-locker\",\"groups\":{\"police\":0},\"heading\":90,\"maxDistance\":2,\"state\":1,\"unlockSound\":\"metallic-creak\",\"hideUi\":false}'),(20,'community_mrpd 20','{\"coords\":{\"x\":461.8064880371094,\"y\":-1001.302001953125,\"z\":25.0644302368164},\"model\":631614199,\"lockSound\":\"metal-locker\",\"groups\":{\"police\":0},\"heading\":90,\"maxDistance\":2,\"state\":1,\"unlockSound\":\"metallic-creak\",\"hideUi\":false}'),(21,'community_mrpd 21','{\"coords\":{\"x\":467.19219970703127,\"y\":-996.4594116210938,\"z\":25.00598907470703},\"model\":-1033001619,\"groups\":{\"police\":0},\"heading\":0,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(22,'community_mrpd 22','{\"coords\":{\"x\":471.4754943847656,\"y\":-996.4594116210938,\"z\":25.00598907470703},\"model\":-1033001619,\"groups\":{\"police\":0},\"heading\":0,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(23,'community_mrpd 23','{\"coords\":{\"x\":475.7543029785156,\"y\":-996.4594116210938,\"z\":25.00598907470703},\"model\":-1033001619,\"groups\":{\"police\":0},\"heading\":0,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(24,'community_mrpd 24','{\"coords\":{\"x\":480.03009033203127,\"y\":-996.4594116210938,\"z\":25.00598907470703},\"model\":-1033001619,\"groups\":{\"police\":0},\"heading\":0,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(25,'community_mrpd 25','{\"coords\":{\"x\":468.4872131347656,\"y\":-1003.5479736328125,\"z\":25.01313972473144},\"model\":-1033001619,\"groups\":{\"police\":0},\"heading\":180,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(26,'community_mrpd 26','{\"coords\":{\"x\":471.4747009277344,\"y\":-1003.5380249023438,\"z\":25.01222991943359},\"model\":-1033001619,\"groups\":{\"police\":0},\"heading\":0,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(27,'community_mrpd 27','{\"coords\":{\"x\":477.0495910644531,\"y\":-1003.552001953125,\"z\":25.01203918457031},\"auto\":false,\"groups\":{\"police\":0},\"heading\":179,\"lockpick\":false,\"maxDistance\":2,\"state\":1,\"model\":-1033001619,\"hideUi\":false}'),(28,'community_mrpd 28','{\"coords\":{\"x\":480.03009033203127,\"y\":-1003.5380249023438,\"z\":25.00598907470703},\"model\":-1033001619,\"groups\":{\"police\":0},\"heading\":0,\"maxDistance\":2,\"state\":1,\"hideUi\":false}'),(29,'community_mrpd 29','{\"coords\":{\"x\":444.7078857421875,\"y\":-989.4453735351563,\"z\":30.83930969238281},\"groups\":{\"police\":0},\"maxDistance\":2.5,\"state\":1,\"doors\":[{\"coords\":{\"x\":443.4078063964844,\"y\":-989.4453735351563,\"z\":30.83930969238281},\"model\":185711165,\"heading\":180},{\"coords\":{\"x\":446.00799560546877,\"y\":-989.4453735351563,\"z\":30.83930969238281},\"model\":185711165,\"heading\":0}],\"hideUi\":false}'),(30,'community_mrpd 30','{\"coords\":{\"x\":445.9197998046875,\"y\":-999.0016479492188,\"z\":30.7890396118164},\"groups\":{\"police\":0},\"maxDistance\":2.5,\"state\":1,\"doors\":[{\"coords\":{\"x\":447.2184143066406,\"y\":-999.0023193359375,\"z\":30.78941917419433},\"model\":-1033001619,\"heading\":180},{\"coords\":{\"x\":444.6211853027344,\"y\":-999.0009765625,\"z\":30.78866004943847},\"model\":-1033001619,\"heading\":0}],\"hideUi\":false}'),(31,'community_mrpd 31','{\"coords\":{\"x\":445.9298400878906,\"y\":-997.044677734375,\"z\":30.84351921081543},\"groups\":{\"police\":0},\"maxDistance\":2.5,\"state\":0,\"doors\":[{\"coords\":{\"x\":444.62939453125,\"y\":-997.044677734375,\"z\":30.84351921081543},\"model\":-2023754432,\"heading\":0},{\"coords\":{\"x\":447.23028564453127,\"y\":-997.044677734375,\"z\":30.84351921081543},\"model\":-2023754432,\"heading\":180}],\"hideUi\":false}'),(32,'mrpd locker rooms','{\"maxDistance\":2,\"heading\":90,\"coords\":{\"x\":450.1041259765625,\"y\":-985.7384033203125,\"z\":30.83930206298828},\"groups\":{\"police\":0},\"state\":1,\"model\":1557126584,\"hideUi\":false}'),(33,'mrpd cells/briefing','{\"maxDistance\":2,\"coords\":{\"x\":444.7078552246094,\"y\":-989.4454345703125,\"z\":30.83930206298828},\"doors\":[{\"model\":185711165,\"coords\":{\"x\":446.0079345703125,\"y\":-989.4454345703125,\"z\":30.83930206298828},\"heading\":0},{\"model\":185711165,\"coords\":{\"x\":443.40777587890627,\"y\":-989.4454345703125,\"z\":30.83930206298828},\"heading\":180}],\"groups\":{\"police\":0},\"state\":1,\"hideUi\":false}'),(34,'mrpd cell 3','{\"maxDistance\":2,\"heading\":90,\"coords\":{\"x\":461.8065185546875,\"y\":-1001.9515380859375,\"z\":25.06442832946777},\"lockSound\":\"metal-locker\",\"groups\":{\"police\":0},\"state\":1,\"unlockSound\":\"metallic-creak\",\"model\":631614199,\"hideUi\":false}'),(35,'mrpd back entrance','{\"maxDistance\":2,\"coords\":{\"x\":468.6697692871094,\"y\":-1014.4520263671875,\"z\":26.5362319946289},\"doors\":[{\"model\":-2023754432,\"coords\":{\"x\":467.37164306640627,\"y\":-1014.4520263671875,\"z\":26.5362319946289},\"heading\":0},{\"model\":-2023754432,\"coords\":{\"x\":469.9678955078125,\"y\":-1014.4520263671875,\"z\":26.5362319946289},\"heading\":180}],\"groups\":{\"police\":0},\"state\":1,\"hideUi\":false}'),(36,'mrpd cells security door','{\"maxDistance\":2,\"heading\":0,\"coords\":{\"x\":464.1282958984375,\"y\":-1003.5386962890625,\"z\":25.00598907470703},\"autolock\":5,\"groups\":{\"police\":0},\"state\":1,\"model\":-1033001619,\"hideUi\":false}'),(37,'mrpd cell 2','{\"maxDistance\":2,\"heading\":90,\"coords\":{\"x\":461.8064880371094,\"y\":-998.3082885742188,\"z\":25.06442832946777},\"lockSound\":\"metal-locker\",\"groups\":{\"police\":0},\"state\":1,\"unlockSound\":\"metallic-creak\",\"model\":631614199,\"hideUi\":false}'),(38,'mrpd captain\'s office','{\"maxDistance\":2,\"heading\":180,\"coords\":{\"x\":446.57281494140627,\"y\":-980.0105590820313,\"z\":30.83930206298828},\"groups\":{\"police\":0},\"state\":1,\"model\":-1320876379,\"hideUi\":false}'),(39,'mrpd gate','{\"maxDistance\":6,\"heading\":90,\"coords\":{\"x\":488.894775390625,\"y\":-1017.2102661132813,\"z\":27.14714050292968},\"groups\":{\"police\":0},\"auto\":true,\"state\":1,\"model\":-1603817716,\"hideUi\":false}'),(40,'mrpd cell 1','{\"maxDistance\":2,\"heading\":270,\"coords\":{\"x\":461.8065185546875,\"y\":-993.7586059570313,\"z\":25.06442832946777},\"lockSound\":\"metal-locker\",\"groups\":{\"police\":0},\"state\":1,\"unlockSound\":\"metallic-creak\",\"model\":631614199,\"hideUi\":false}'),(41,'mrpd cells main','{\"maxDistance\":2,\"heading\":360,\"coords\":{\"x\":463.92010498046877,\"y\":-992.6640625,\"z\":25.06442832946777},\"lockSound\":\"metal-locker\",\"groups\":{\"police\":0},\"state\":1,\"unlockSound\":\"metallic-creak\",\"model\":631614199,\"hideUi\":false}'),(42,'mrpd armoury','{\"maxDistance\":2,\"heading\":270,\"coords\":{\"x\":453.08428955078127,\"y\":-982.5794677734375,\"z\":30.81926536560058},\"autolock\":5,\"groups\":{\"police\":0},\"state\":1,\"model\":749848321,\"hideUi\":false}');
/*!40000 ALTER TABLE `ox_doorlock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ox_inventory`
--

DROP TABLE IF EXISTS `ox_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ox_inventory` (
  `owner` varchar(46) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ox_inventory`
--

LOCK TABLES `ox_inventory` WRITE;
/*!40000 ALTER TABLE `ox_inventory` DISABLE KEYS */;
INSERT INTO `ox_inventory` VALUES ('','evidence-1','[{\"count\":1,\"slot\":1,\"name\":\"cola\"}]','2023-11-11 01:30:00');
/*!40000 ALTER TABLE `ox_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rented_vehicles`
--

DROP TABLE IF EXISTS `rented_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rented_vehicles`
--

LOCK TABLES `rented_vehicles` WRITE;
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `society_moneywash`
--

DROP TABLE IF EXISTS `society_moneywash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `society_moneywash`
--

LOCK TABLES `society_moneywash` WRITE;
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_licenses`
--

DROP TABLE IF EXISTS `user_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_licenses`
--

LOCK TABLES `user_licenses` WRITE;
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
INSERT INTO `user_licenses` VALUES (1,'weapon','4e57d01b00cf67cc86b74ca13c1ba4d27e6201c1');
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `identifier` varchar(46) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job2` varchar(20) DEFAULT 'unemployed2',
  `job2_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `position` longtext DEFAULT NULL,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) DEFAULT 0,
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `phone_number` varchar(20) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('4e57d01b00cf67cc86b74ca13c1ba4d27e6201c1','{\"black_money\":0,\"money\":13398,\"bank\":71005}','admin','[{\"metadata\":{\"ammo\":0,\"serial\":\"672709POL515088\",\"registered\":\"James Trema\",\"durability\":100,\"components\":[]},\"slot\":1,\"name\":\"WEAPON_PISTOL\",\"count\":1},{\"metadata\":{\"components\":[],\"durability\":100},\"slot\":2,\"name\":\"WEAPON_NIGHTSTICK\",\"count\":1},{\"metadata\":{\"components\":[],\"durability\":99.9},\"slot\":3,\"name\":\"WEAPON_FLASHLIGHT\",\"count\":1},{\"metadata\":{\"registered\":\"James Trema\",\"components\":[],\"durability\":100,\"serial\":\"893877POL490023\"},\"slot\":4,\"name\":\"WEAPON_STUNGUN\",\"count\":1},{\"metadata\":{\"ammo\":30,\"serial\":\"338427POL138895\",\"registered\":\"James Trema\",\"durability\":99.85,\"components\":[]},\"slot\":5,\"name\":\"WEAPON_CARBINERIFLE\",\"count\":1},{\"metadata\":{\"components\":[],\"ammo\":0,\"durability\":0},\"slot\":11,\"name\":\"WEAPON_PETROLCAN\",\"count\":1},{\"slot\":12,\"name\":\"ammo-9\",\"count\":1},{\"metadata\":{\"components\":[],\"durability\":100},\"slot\":13,\"name\":\"WEAPON_KNIFE\",\"count\":1},{\"metadata\":{\"components\":[],\"durability\":100},\"slot\":14,\"name\":\"WEAPON_BAT\",\"count\":1},{\"slot\":15,\"name\":\"money\",\"count\":13398},{\"metadata\":{\"ammo\":0,\"serial\":\"798807CKU194541\",\"registered\":\"James Trema\",\"durability\":100,\"components\":[]},\"slot\":16,\"name\":\"WEAPON_PISTOL\",\"count\":1},{\"slot\":24,\"name\":\"ammo-9\",\"count\":4},{\"slot\":19,\"name\":\"lockpick\",\"count\":6},{\"slot\":25,\"name\":\"ammo-rifle\",\"count\":119}]','police',3,'ballas',0,'[]','{\"health\":200,\"armor\":0}','{\"x\":161.27471923828126,\"z\":31.1669921875,\"y\":-791.6043701171875}','James','Trema','01/12/1996','m',180,'{\"headOverlays\":{\"sunDamage\":{\"opacity\":0,\"color\":0,\"style\":0},\"eyebrows\":{\"opacity\":0,\"color\":0,\"style\":0},\"makeUp\":{\"opacity\":0,\"color\":0,\"style\":0},\"complexion\":{\"opacity\":0,\"color\":0,\"style\":0},\"ageing\":{\"opacity\":0,\"color\":0,\"style\":0},\"moleAndFreckles\":{\"opacity\":0,\"color\":0,\"style\":0},\"bodyBlemishes\":{\"opacity\":0,\"color\":0,\"style\":0},\"chestHair\":{\"opacity\":0,\"color\":0,\"style\":0},\"blush\":{\"opacity\":0,\"color\":0,\"style\":0},\"beard\":{\"opacity\":0,\"color\":0,\"style\":0},\"blemishes\":{\"opacity\":0,\"color\":0,\"style\":0},\"lipstick\":{\"opacity\":0,\"color\":0,\"style\":0}},\"tattoos\":[],\"hair\":{\"highlight\":0,\"color\":14,\"style\":11},\"faceFeatures\":{\"nosePeakSize\":0,\"jawBoneBackSize\":0,\"noseBoneTwist\":0,\"eyesOpening\":0,\"cheeksWidth\":0,\"noseBoneHigh\":0,\"cheeksBoneHigh\":0,\"chinBoneSize\":0,\"jawBoneWidth\":0,\"nosePeakHigh\":0,\"eyeBrownForward\":0,\"chinBoneLenght\":0,\"neckThickness\":0,\"eyeBrownHigh\":0,\"lipsThickness\":0,\"chinBoneLowering\":0,\"noseWidth\":0,\"chinHole\":0,\"nosePeakLowering\":0,\"cheeksBoneWidth\":0},\"components\":[{\"drawable\":0,\"component_id\":0,\"texture\":0},{\"drawable\":0,\"component_id\":1,\"texture\":0},{\"drawable\":0,\"component_id\":2,\"texture\":0},{\"drawable\":0,\"component_id\":3,\"texture\":0},{\"drawable\":12,\"component_id\":4,\"texture\":0},{\"drawable\":0,\"component_id\":5,\"texture\":0},{\"drawable\":1,\"component_id\":6,\"texture\":0},{\"drawable\":0,\"component_id\":7,\"texture\":0},{\"drawable\":0,\"component_id\":8,\"texture\":0},{\"drawable\":0,\"component_id\":9,\"texture\":0},{\"drawable\":0,\"component_id\":10,\"texture\":0},{\"drawable\":22,\"component_id\":11,\"texture\":0}],\"model\":\"mp_m_freemode_01\",\"headBlend\":{\"shapeSecond\":0,\"skinSecond\":0,\"shapeFirst\":0,\"shapeMix\":0,\"skinFirst\":0,\"skinMix\":0},\"props\":[{\"drawable\":-1,\"prop_id\":0,\"texture\":-1},{\"drawable\":-1,\"prop_id\":1,\"texture\":-1},{\"drawable\":-1,\"prop_id\":2,\"texture\":-1},{\"drawable\":-1,\"prop_id\":6,\"texture\":-1},{\"drawable\":-1,\"prop_id\":7,\"texture\":-1}],\"eyeColor\":-1}','[]',0,18,0,NULL,'2023-11-09 08:59:14','2023-11-11 20:17:16',NULL,NULL),('5dde096fa5968a9ff063085cc97f915625552277','{\"money\":0,\"bank\":52400,\"black_money\":0}','admin','[]','unemployed',0,'unemployed2',0,'[]','{\"armor\":0,\"health\":200}','{\"x\":850.6681518554688,\"z\":359.5869140625,\"y\":1274.1494140625}','Second','Perso','01/12/1996','m',180,'{\"chin_3\":0,\"torso_2\":0,\"nose_4\":0,\"chest_1\":0,\"jaw_1\":0,\"beard_2\":0,\"age_1\":0,\"blush_3\":0,\"nose_6\":0,\"bracelets_1\":-1,\"mask_1\":0,\"eyebrows_5\":0,\"chain_2\":0,\"chin_4\":0,\"arms_2\":0,\"makeup_3\":0,\"shoes_2\":0,\"mask_2\":0,\"hair_2\":0,\"cheeks_1\":0,\"jaw_2\":0,\"torso_1\":0,\"watches_2\":0,\"eyebrows_3\":0,\"chin_2\":0,\"neck_thickness\":0,\"decals_2\":0,\"ears_2\":0,\"bodyb_1\":-1,\"chin_1\":0,\"nose_2\":0,\"glasses_1\":0,\"eye_color\":0,\"chest_2\":0,\"bracelets_2\":0,\"nose_5\":0,\"blemishes_2\":0,\"ears_1\":-1,\"sun_1\":0,\"beard_1\":0,\"watches_1\":-1,\"sun_2\":0,\"makeup_1\":0,\"tshirt_1\":0,\"bodyb_3\":-1,\"face_md_weight\":50,\"chest_3\":0,\"eyebrows_2\":0,\"blemishes_1\":0,\"lip_thickness\":0,\"bproof_2\":0,\"bodyb_4\":0,\"tshirt_2\":0,\"helmet_1\":-1,\"chain_1\":0,\"hair_1\":0,\"blush_2\":0,\"hair_color_2\":0,\"makeup_4\":0,\"cheeks_2\":0,\"moles_2\":0,\"blush_1\":0,\"complexion_1\":0,\"bags_2\":0,\"helmet_2\":0,\"eyebrows_4\":0,\"eyebrows_1\":0,\"cheeks_3\":0,\"eyebrows_6\":0,\"age_2\":0,\"complexion_2\":0,\"lipstick_3\":0,\"sex\":0,\"lipstick_4\":0,\"pants_1\":0,\"pants_2\":0,\"beard_4\":0,\"lipstick_2\":0,\"bproof_1\":0,\"moles_1\":0,\"bodyb_2\":0,\"hair_color_1\":0,\"nose_3\":0,\"mom\":21,\"nose_1\":0,\"shoes_1\":0,\"bags_1\":0,\"decals_1\":0,\"dad\":0,\"glasses_2\":0,\"lipstick_1\":0,\"skin_md_weight\":50,\"makeup_2\":0,\"arms\":0,\"beard_3\":0,\"eye_squint\":0}',NULL,0,20,0,NULL,'2023-11-10 09:07:34','2023-11-10 14:04:56',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_categories`
--

DROP TABLE IF EXISTS `vehicle_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_categories`
--

LOCK TABLES `vehicle_categories` WRITE;
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT INTO `vehicle_categories` VALUES ('compacts','Compacts'),('coupes','Coupés'),('motorcycles','Motos'),('muscle','Muscle'),('offroad','Off Road'),('sedans','Sedans'),('sports','Sports'),('sportsclassics','Sports Classics'),('super','Super'),('suvs','SUVs'),('vans','Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_sold`
--

DROP TABLE IF EXISTS `vehicle_sold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_sold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_sold`
--

LOCK TABLES `vehicle_sold` WRITE;
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES ('Adder','adder',900000,'super'),('Akuma','AKUMA',7500,'motorcycles'),('Alpha','alpha',60000,'sports'),('Ardent','ardent',1150000,'sportsclassics'),('Asea','asea',5500,'sedans'),('Autarch','autarch',1955000,'super'),('Avarus','avarus',18000,'motorcycles'),('Bagger','bagger',13500,'motorcycles'),('Baller','baller2',40000,'suvs'),('Baller Sport','baller3',60000,'suvs'),('Banshee','banshee',70000,'sports'),('Banshee 900R','banshee2',255000,'super'),('Bati 801','bati',12000,'motorcycles'),('Bati 801RR','bati2',19000,'motorcycles'),('Bestia GTS','bestiagts',55000,'sports'),('BF400','bf400',6500,'motorcycles'),('Bf Injection','bfinjection',16000,'offroad'),('Bifta','bifta',12000,'offroad'),('Bison','bison',45000,'vans'),('Blade','blade',15000,'muscle'),('Blazer','blazer',6500,'offroad'),('Blazer Sport','blazer4',8500,'offroad'),('blazer5','blazer5',1755600,'offroad'),('Blista','blista',8000,'compacts'),('BMX (velo)','bmx',160,'motorcycles'),('Bobcat XL','bobcatxl',32000,'vans'),('Brawler','brawler',45000,'offroad'),('Brioso R/A','brioso',18000,'compacts'),('Btype','btype',62000,'sportsclassics'),('Btype Hotroad','btype2',155000,'sportsclassics'),('Btype Luxe','btype3',85000,'sportsclassics'),('Buccaneer','buccaneer',18000,'muscle'),('Buccaneer Rider','buccaneer2',24000,'muscle'),('Buffalo','buffalo',12000,'sports'),('Buffalo S','buffalo2',20000,'sports'),('Bullet','bullet',90000,'super'),('Burrito','burrito3',19000,'vans'),('Camper','camper',42000,'vans'),('Carbonizzare','carbonizzare',75000,'sports'),('Carbon RS','carbonrs',18000,'motorcycles'),('Casco','casco',30000,'sportsclassics'),('Cavalcade','cavalcade2',55000,'suvs'),('Cheetah','cheetah',375000,'super'),('Chimera','chimera',38000,'motorcycles'),('Chino','chino',15000,'muscle'),('Chino Luxe','chino2',19000,'muscle'),('Cliffhanger','cliffhanger',9500,'motorcycles'),('Cognoscenti Cabrio','cogcabrio',55000,'coupes'),('Cognoscenti','cognoscenti',55000,'sedans'),('Comet','comet2',65000,'sports'),('Comet 5','comet5',1145000,'sports'),('Contender','contender',70000,'suvs'),('Coquette','coquette',65000,'sports'),('Coquette Classic','coquette2',40000,'sportsclassics'),('Coquette BlackFin','coquette3',55000,'muscle'),('Cruiser (velo)','cruiser',510,'motorcycles'),('Cyclone','cyclone',1890000,'super'),('Daemon','daemon',11500,'motorcycles'),('Daemon High','daemon2',13500,'motorcycles'),('Defiler','defiler',9800,'motorcycles'),('Deluxo','deluxo',4721500,'sportsclassics'),('Dominator','dominator',35000,'muscle'),('Double T','double',28000,'motorcycles'),('Dubsta','dubsta',45000,'suvs'),('Dubsta Luxuary','dubsta2',60000,'suvs'),('Bubsta 6x6','dubsta3',120000,'offroad'),('Dukes','dukes',28000,'muscle'),('Dune Buggy','dune',8000,'offroad'),('Elegy','elegy2',38500,'sports'),('Emperor','emperor',8500,'sedans'),('Enduro','enduro',5500,'motorcycles'),('Entity XF','entityxf',425000,'super'),('Esskey','esskey',4200,'motorcycles'),('Exemplar','exemplar',32000,'coupes'),('F620','f620',40000,'coupes'),('Faction','faction',20000,'muscle'),('Faction Rider','faction2',30000,'muscle'),('Faction XL','faction3',40000,'muscle'),('Faggio','faggio',1900,'motorcycles'),('Vespa','faggio2',2800,'motorcycles'),('Felon','felon',42000,'coupes'),('Felon GT','felon2',55000,'coupes'),('Feltzer','feltzer2',55000,'sports'),('Stirling GT','feltzer3',65000,'sportsclassics'),('Fixter (velo)','fixter',225,'motorcycles'),('FMJ','fmj',185000,'super'),('Fhantom','fq2',17000,'suvs'),('Fugitive','fugitive',12000,'sedans'),('Furore GT','furoregt',45000,'sports'),('Fusilade','fusilade',40000,'sports'),('Gargoyle','gargoyle',16500,'motorcycles'),('Gauntlet','gauntlet',30000,'muscle'),('Gang Burrito','gburrito',45000,'vans'),('Burrito','gburrito2',29000,'vans'),('Glendale','glendale',6500,'sedans'),('Grabger','granger',50000,'suvs'),('Gresley','gresley',47500,'suvs'),('GT 500','gt500',785000,'sportsclassics'),('Guardian','guardian',45000,'offroad'),('Hakuchou','hakuchou',31000,'motorcycles'),('Hakuchou Sport','hakuchou2',55000,'motorcycles'),('Hermes','hermes',535000,'muscle'),('Hexer','hexer',12000,'motorcycles'),('Hotknife','hotknife',125000,'muscle'),('Huntley S','huntley',40000,'suvs'),('Hustler','hustler',625000,'muscle'),('Infernus','infernus',180000,'super'),('Innovation','innovation',23500,'motorcycles'),('Intruder','intruder',7500,'sedans'),('Issi','issi2',10000,'compacts'),('Jackal','jackal',38000,'coupes'),('Jester','jester',65000,'sports'),('Jester(Racecar)','jester2',135000,'sports'),('Journey','journey',6500,'vans'),('Kamacho','kamacho',345000,'offroad'),('Khamelion','khamelion',38000,'sports'),('Kuruma','kuruma',30000,'sports'),('Landstalker','landstalker',35000,'suvs'),('RE-7B','le7b',325000,'super'),('Lynx','lynx',40000,'sports'),('Mamba','mamba',70000,'sports'),('Manana','manana',12800,'sportsclassics'),('Manchez','manchez',5300,'motorcycles'),('Massacro','massacro',65000,'sports'),('Massacro(Racecar)','massacro2',130000,'sports'),('Mesa','mesa',16000,'suvs'),('Mesa Trail','mesa3',40000,'suvs'),('Minivan','minivan',13000,'vans'),('Monroe','monroe',55000,'sportsclassics'),('The Liberator','monster',210000,'offroad'),('Moonbeam','moonbeam',18000,'vans'),('Moonbeam Rider','moonbeam2',35000,'vans'),('Nemesis','nemesis',5800,'motorcycles'),('Neon','neon',1500000,'sports'),('Nightblade','nightblade',35000,'motorcycles'),('Nightshade','nightshade',65000,'muscle'),('9F','ninef',65000,'sports'),('9F Cabrio','ninef2',80000,'sports'),('Omnis','omnis',35000,'sports'),('Oppressor','oppressor',3524500,'super'),('Oracle XS','oracle2',35000,'coupes'),('Osiris','osiris',160000,'super'),('Panto','panto',10000,'compacts'),('Paradise','paradise',19000,'vans'),('Pariah','pariah',1420000,'sports'),('Patriot','patriot',55000,'suvs'),('PCJ-600','pcj',6200,'motorcycles'),('Penumbra','penumbra',28000,'sports'),('Pfister','pfister811',85000,'super'),('Phoenix','phoenix',12500,'muscle'),('Picador','picador',18000,'muscle'),('Pigalle','pigalle',20000,'sportsclassics'),('Prairie','prairie',12000,'compacts'),('Premier','premier',8000,'sedans'),('Primo Custom','primo2',14000,'sedans'),('X80 Proto','prototipo',2500000,'super'),('Radius','radi',29000,'suvs'),('raiden','raiden',1375000,'sports'),('Rapid GT','rapidgt',35000,'sports'),('Rapid GT Convertible','rapidgt2',45000,'sports'),('Rapid GT3','rapidgt3',885000,'sportsclassics'),('Reaper','reaper',150000,'super'),('Rebel','rebel2',35000,'offroad'),('Regina','regina',5000,'sedans'),('Retinue','retinue',615000,'sportsclassics'),('Revolter','revolter',1610000,'sports'),('riata','riata',380000,'offroad'),('Rocoto','rocoto',45000,'suvs'),('Ruffian','ruffian',6800,'motorcycles'),('Ruiner 2','ruiner2',5745600,'muscle'),('Rumpo','rumpo',15000,'vans'),('Rumpo Trail','rumpo3',19500,'vans'),('Sabre Turbo','sabregt',20000,'muscle'),('Sabre GT','sabregt2',25000,'muscle'),('Sanchez','sanchez',5300,'motorcycles'),('Sanchez Sport','sanchez2',5300,'motorcycles'),('Sanctus','sanctus',25000,'motorcycles'),('Sandking','sandking',55000,'offroad'),('Savestra','savestra',990000,'sportsclassics'),('SC 1','sc1',1603000,'super'),('Schafter','schafter2',25000,'sedans'),('Schafter V12','schafter3',50000,'sports'),('Scorcher (velo)','scorcher',280,'motorcycles'),('Seminole','seminole',25000,'suvs'),('Sentinel','sentinel',32000,'coupes'),('Sentinel XS','sentinel2',40000,'coupes'),('Sentinel3','sentinel3',650000,'sports'),('Seven 70','seven70',39500,'sports'),('ETR1','sheava',220000,'super'),('Shotaro Concept','shotaro',320000,'motorcycles'),('Slam Van','slamvan3',11500,'muscle'),('Sovereign','sovereign',22000,'motorcycles'),('Stinger','stinger',80000,'sportsclassics'),('Stinger GT','stingergt',75000,'sportsclassics'),('Streiter','streiter',500000,'sports'),('Stretch','stretch',90000,'sedans'),('Stromberg','stromberg',3185350,'sports'),('Sultan','sultan',15000,'sports'),('Sultan RS','sultanrs',65000,'super'),('Super Diamond','superd',130000,'sedans'),('Surano','surano',50000,'sports'),('Surfer','surfer',12000,'vans'),('T20','t20',300000,'super'),('Tailgater','tailgater',30000,'sedans'),('Tampa','tampa',16000,'muscle'),('Drift Tampa','tampa2',80000,'sports'),('Thrust','thrust',24000,'motorcycles'),('Tri bike (velo)','tribike3',520,'motorcycles'),('Trophy Truck','trophytruck',60000,'offroad'),('Trophy Truck Limited','trophytruck2',80000,'offroad'),('Tropos','tropos',40000,'sports'),('Turismo R','turismor',350000,'super'),('Tyrus','tyrus',600000,'super'),('Vacca','vacca',120000,'super'),('Vader','vader',7200,'motorcycles'),('Verlierer','verlierer2',70000,'sports'),('Vigero','vigero',12500,'muscle'),('Virgo','virgo',14000,'muscle'),('Viseris','viseris',875000,'sportsclassics'),('Visione','visione',2250000,'super'),('Voltic','voltic',90000,'super'),('Voltic 2','voltic2',3830400,'super'),('Voodoo','voodoo',7200,'muscle'),('Vortex','vortex',9800,'motorcycles'),('Warrener','warrener',4000,'sedans'),('Washington','washington',9000,'sedans'),('Windsor','windsor',95000,'coupes'),('Windsor Drop','windsor2',125000,'coupes'),('Woflsbane','wolfsbane',9000,'motorcycles'),('XLS','xls',32000,'suvs'),('Yosemite','yosemite',485000,'muscle'),('Youga','youga',10800,'vans'),('Youga Luxuary','youga2',14500,'vans'),('Z190','z190',900000,'sportsclassics'),('Zentorno','zentorno',1500000,'super'),('Zion','zion',36000,'coupes'),('Zion Cabrio','zion2',45000,'coupes'),('Zombie','zombiea',9500,'motorcycles'),('Zombie Luxuary','zombieb',12000,'motorcycles'),('Z-Type','ztype',220000,'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whitelist`
--

DROP TABLE IF EXISTS `whitelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `whitelist` (
  `identifier` varchar(46) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whitelist`
--

LOCK TABLES `whitelist` WRITE;
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ox_server'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-11 21:18:35
