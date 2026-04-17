-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: pizza_shop
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loyalty_points` int DEFAULT '0',
  `is_vip` tinyint(1) DEFAULT '0',
  `favorite_payment_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `has_card_consent` tinyint(1) DEFAULT '0',
  `masked_card_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_81398E09A76ED395` (`user_id`),
  CONSTRAINT `FK_81398E09A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1,'12 rue de la Pizza','75001','Paris',150,1,NULL,'2026-04-17 10:05:49',0,NULL),(2,2,'45 av des Pignons','69001','Lyon',75,0,NULL,'2026-04-17 10:05:49',0,NULL),(5,6,'49 rue victor Hugo','83300','Draguignan',35,0,'especes','2026-04-17 10:05:49',0,NULL),(9,10,'123 Test Street','83000','Toulon',167,0,NULL,'2026-04-17 10:05:49',0,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `is_allergen` tinyint(1) NOT NULL DEFAULT '0',
  `allergen_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Sauce tomate',0.80,0,NULL,1),(2,'Mozzarella',1.50,1,'lait',2),(3,'Jambon',1.80,0,NULL,3),(4,'Champignons',1.20,0,NULL,4),(5,'Poivrons',1.10,0,NULL,5),(6,'Olives noires',1.00,0,NULL,6),(7,'Oignons',0.90,0,NULL,7),(8,'Ananas',1.50,0,NULL,8),(9,'Merguez',2.20,0,NULL,9),(10,'Gorgonzola',2.00,1,'lait',10),(11,'Poivre blanc',0.90,0,NULL,11),(12,'Parmesan',2.00,1,NULL,12),(13,'Taleggio',2.50,1,NULL,13),(14,'Pepperoni',2.00,0,NULL,14),(15,'Saucisse calabraise',2.20,0,NULL,15),(16,'Piments',0.50,0,NULL,16),(17,'Courgettes',1.20,0,NULL,17),(18,'Aubergines',1.20,0,NULL,18),(19,'Basilic frais',0.50,0,NULL,19);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyalty_transaction`
--

DROP TABLE IF EXISTS `loyalty_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyalty_transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `points` int NOT NULL,
  `type` enum('earned','spent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9362F97EAD25D4B3` (`customer_id`),
  KEY `IDX_9362F97E26D59DE1` (`order_id`),
  CONSTRAINT `FK_9362F97E26D59DE1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `FK_9362F97EAD25D4B3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyalty_transaction`
--

LOCK TABLES `loyalty_transaction` WRITE;
/*!40000 ALTER TABLE `loyalty_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `loyalty_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `customer_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','confirmed','preparing','ready','delivered','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(8,2) NOT NULL,
  `delivery_fee` decimal(6,2) DEFAULT '0.00',
  `discount_amount` decimal(6,2) DEFAULT '0.00',
  `delivery_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_zip_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_notes` text COLLATE utf8mb4_unicode_ci,
  `ordered_at` datetime NOT NULL,
  `delivery_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8A272F1BAD6516B9` (`order_number`),
  KEY `IDX_8A272F1BAD25D4B3` (`customer_id`),
  CONSTRAINT `FK_8A272F1BAD25D4B3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,3,'Test User','testorder@example.com','0612345678','especes','BN20260416181116','confirmed',10.90,0.00,NULL,'123 Test St',NULL,NULL,'','2026-04-16 18:11:16',NULL),(2,NULL,'Test User2','testorder2@example.com','0612345678','especes','BN20260416181134','confirmed',12.90,0.00,NULL,'456 Test St',NULL,NULL,'','2026-04-16 18:11:34',NULL),(4,NULL,'Client','','','carte','BN20260416182159','confirmed',14.90,0.00,NULL,'',NULL,NULL,'','2026-04-16 18:21:59',NULL),(5,NULL,'','','','carte','BN20260416184306','confirmed',12.90,0.00,NULL,'',NULL,NULL,'','2026-04-16 18:43:06',NULL),(6,5,'Jean Berto','mapro@gmail.com','0659982365','carte','BN20260416185702','confirmed',10.90,0.00,NULL,'rue des prez Draguignan',NULL,NULL,'','2026-04-16 18:57:02',NULL),(7,5,'Jean Berto','mapro@gmail.com','0612345678','especes','BN20260416190931740','confirmed',42.66,0.00,0.00,'123 Test Street','83000','Toulon',NULL,'2026-04-16 19:09:31',NULL),(8,5,'Jean Berto','mapro@gmail.com','0612345678','especes','BN20260416191306852','confirmed',42.66,0.00,0.00,'123 Test Street','83000','Toulon',NULL,'2026-04-16 19:13:06',NULL),(14,9,'Robert Berto','robertberto@test.com','0612345678','especes','BN20260416192553505','confirmed',42.66,0.00,0.00,'123 Test Street','83000','Toulon',NULL,'2026-04-16 19:25:53',NULL),(15,5,'Jean Berto','mapro@gmail.com','0659982365','especes','BN20260417043113','confirmed',25.80,0.00,NULL,'rue des prez Draguignan',NULL,NULL,'','2026-04-17 04:31:13',NULL),(16,9,'Robert Berto','robertberto@test.com','0612345678','especes','BN20260417072030','confirmed',167.70,0.00,NULL,'123 Test Street','83000','Toulon','','2026-04-17 07:20:30',NULL);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `pizza_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(6,2) NOT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `size` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pizza_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_52A85E1726D59DE1` (`order_id`),
  KEY `IDX_52A85E172BB4A8A4` (`pizza_id`),
  CONSTRAINT `FK_52A85E1726D59DE1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_52A85E172BB4A8A4` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,2,NULL,1,12.90,12.90,'moyenne','Pepperoni'),(3,4,NULL,1,14.90,14.90,'moyenne','Quattro Formaggi'),(4,5,NULL,1,12.90,12.90,'moyenne','Pepperoni'),(5,6,NULL,1,10.90,10.90,'moyenne','Margherita'),(6,7,NULL,2,10.90,21.80,'moyenne','Margherita'),(7,7,NULL,1,20.86,20.86,'grande','Quattro Formaggi'),(8,8,NULL,2,10.90,21.80,'moyenne','Margherita'),(9,8,NULL,1,20.86,20.86,'grande','Quattro Formaggi'),(20,14,NULL,2,10.90,21.80,'moyenne','Margherita'),(21,14,NULL,1,20.86,20.86,'grande','Quattro Formaggi'),(22,15,NULL,2,12.90,25.80,'moyenne','Pepperoni'),(23,16,NULL,13,12.90,167.70,'moyenne','Pepperoni');
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payment`
--

DROP TABLE IF EXISTS `order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `payment_method_id` int NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `transaction_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','paid','failed','refunded') COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_326C7E1726D59DE1` (`order_id`),
  KEY `IDX_326C7E17657C60D5` (`payment_method_id`),
  CONSTRAINT `FK_326C7E1726D59DE1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `FK_326C7E17657C60D5` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payment`
--

LOCK TABLES `order_payment` WRITE;
/*!40000 ALTER TABLE `order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `position` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_657C60D5771A4D29` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'Carte bancaire','card',1,1),(2,'Paypal','paypal',1,2),(3,'Virement','transfer',1,3),(4,'Espèces à la livraison','cash',1,4);
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `base_id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(6,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `position` int DEFAULT '0',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2BB4A8A412469DE2` (`category_id`),
  KEY `IDX_2BB4A8A4F3A056C` (`base_id`),
  CONSTRAINT `FK_2BB4A8A412469DE2` FOREIGN KEY (`category_id`) REFERENCES `pizza_category` (`id`),
  CONSTRAINT `FK_2BB4A8A4F3A056C` FOREIGN KEY (`base_id`) REFERENCES `pizza_base` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (1,1,1,'Margherita','Sauce tomate San Marzano, mozzarella di bufala, basilic frais',10.90,'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400',1,1,'2026-04-16 10:27:17'),(2,1,1,'Pepperoni','Sauce tomate, mozzarella, pepperoni épicé',12.90,'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=400',1,2,'2026-04-16 10:27:17'),(3,1,1,'Quattro Formaggi','Mozzarella, gorgonzola, parmesan, taleggio',14.90,'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400',1,3,'2026-04-16 10:27:17'),(4,1,1,'Diavola','Saucisse calabraise épicée, piments forts',13.90,'https://images.unsplash.com/photo-1604382355076-af4b0eb60143?w=400',1,4,'2026-04-16 10:27:17'),(5,2,1,'Calzone','Jambon, champignons, œuf',15.90,'https://images.unsplash.com/photo-1571407970349-bc81e7e96d47?w=400',1,5,'2026-04-16 10:27:17'),(6,1,1,'Végétarienne','Courgettes, aubergines, poivrons, olives',13.90,'https://images.unsplash.com/photo-1511689660979-10d2b1aada49?w=400',1,6,'2026-04-16 10:27:17'),(7,NULL,1,'Gluten Free','Farine de sarrazin, riz et de millet. sauce tomate, mozarella, olives et oignons',19.00,'./images/free-gluten-pizza.jpg',1,3,'2026-04-17 09:53:19');
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_base`
--

DROP TABLE IF EXISTS `pizza_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_base` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_gluten_free` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(6,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_base`
--

LOCK TABLES `pizza_base` WRITE;
/*!40000 ALTER TABLE `pizza_base` DISABLE KEYS */;
INSERT INTO `pizza_base` VALUES (1,'Classique',0,2.50,'Pâte moelleuse traditionnelle'),(2,'Fine et croustillante',0,3.00,'Pâte fine et dorée'),(3,'Sans gluten',1,4.50,'Farine de riz et sarrasin'),(4,'Double pâte',0,3.50,'Pâte épaisse garnie');
/*!40000 ALTER TABLE `pizza_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_category`
--

DROP TABLE IF EXISTS `pizza_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_category`
--

LOCK TABLES `pizza_category` WRITE;
/*!40000 ALTER TABLE `pizza_category` DISABLE KEYS */;
INSERT INTO `pizza_category` VALUES (1,'Classiques','Nos pizzas traditionnelles',1),(2,'Sans Gluten','Adaptées aux intolérants',2),(3,'Gourmandes','Pour les gros appétits',3),(4,'Végétariennes','100% végétales',4);
/*!40000 ALTER TABLE `pizza_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_ingredient`
--

DROP TABLE IF EXISTS `pizza_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_ingredient` (
  `pizza_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `quantity` decimal(5,2) DEFAULT '1.00',
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pizza_id`,`ingredient_id`),
  KEY `IDX_34D763DF2BB4A8A4` (`pizza_id`),
  KEY `IDX_34D763DFF2C56650` (`ingredient_id`),
  CONSTRAINT `FK_34D763DF2BB4A8A4` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_34D763DFF2C56650` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_ingredient`
--

LOCK TABLES `pizza_ingredient` WRITE;
/*!40000 ALTER TABLE `pizza_ingredient` DISABLE KEYS */;
INSERT INTO `pizza_ingredient` VALUES (1,1,1.00,1),(1,2,1.00,1),(1,11,1.00,1),(2,1,1.00,1),(2,2,1.00,1),(2,14,1.00,1),(3,2,1.00,1),(3,10,1.00,1),(3,12,1.00,1),(3,13,1.00,1),(4,1,1.00,1),(4,2,1.00,1),(4,15,1.00,1),(4,16,1.00,1),(5,1,1.00,1),(5,2,1.00,1),(5,3,1.00,1),(5,4,1.00,1),(6,1,1.00,1),(6,2,1.00,1),(6,5,1.00,1),(6,6,1.00,1),(6,17,1.00,1),(6,18,1.00,1);
/*!40000 ALTER TABLE `pizza_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT 'ingredient',
  `description` text,
  `contact_name` varchar(100) DEFAULT NULL,
  `email` varchar(180) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text,
  `postal_code` varchar(10) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `rating` decimal(10,2) DEFAULT NULL,
  `notes` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'Raymondo','ingredient',NULL,'Claudio Bologni','claudiob@raymondo.it','00396532652','3 via girasole 8523','45695','corropoli',1,NULL,'','2026-04-17 11:53:05');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_order`
--

DROP TABLE IF EXISTS `provider_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) NOT NULL,
  `provider_id` int NOT NULL,
  `status` varchar(20) DEFAULT 'draft',
  `total_amount` decimal(10,2) DEFAULT NULL,
  `notes` text,
  `expected_delivery_date` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number` (`order_number`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `provider_order_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_order`
--

LOCK TABLES `provider_order` WRITE;
/*!40000 ALTER TABLE `provider_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_order_item`
--

DROP TABLE IF EXISTS `provider_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider_order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider_order_id` int DEFAULT NULL,
  `item_type` varchar(20) DEFAULT 'ingredient',
  `name` varchar(100) NOT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `quantity` decimal(10,2) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `delivered_quantity` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provider_order_id` (`provider_order_id`),
  CONSTRAINT `provider_order_item_ibfk_1` FOREIGN KEY (`provider_order_id`) REFERENCES `provider_order` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_order_item`
--

LOCK TABLES `provider_order_item` WRITE;
/*!40000 ALTER TABLE `provider_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8fb63e1ce4d1244a` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'marc','client1@test.com','[\"ROLE_USER\"]','$2y$13$A/5hQfV9IUJDhQxN7tdrK.GL6id0ZeFDSO.s3cNi8hQjxtaC7OFrq','Marie','DUPONT','0612345678',NULL,'2026-02-05 11:36:11'),(2,'anna','client2@test.com','[\"ROLE_USER\"]','$2y$13$A/5hQfV9IUJDhQxN7tdrK.GL6id0ZeFDSO.s3cNi8hQjxtaC7OFrq','Jean','MARTIN','0698765432',NULL,'2026-02-05 11:36:11'),(3,'ma','admin@bellanapoli.fr','[\"ROLE_ADMIN\"]','$2y$13$A/5hQfV9IUJDhQxN7tdrK.GL6id0ZeFDSO.s3cNi8hQjxtaC7OFrq','Giorgio','Napoletano','003998659865',NULL,'2026-04-16 10:53:10'),(4,'roland','testorder@example.com','[\"ROLE_USER\"]','$2y$13$A/5hQfV9IUJDhQxN7tdrK.GL6id0ZeFDSO.s3cNi8hQjxtaC7OFrq','Test','User','0612345678',NULL,'2026-04-16 18:11:15'),(6,'jean','mapro@gmail.com','[\"ROLE_USER\"]','$2y$13$A/5hQfV9IUJDhQxN7tdrK.GL6id0ZeFDSO.s3cNi8hQjxtaC7OFrq','Jean','Bertoo','0659982365',NULL,'2026-04-16 18:57:01'),(10,'robert','robertberto@test.com','[\"ROLE_USER\"]','$2y$13$A/5hQfV9IUJDhQxN7tdrK.GL6id0ZeFDSO.s3cNi8hQjxtaC7OFrq','Robert','Berto','0612345678',NULL,'2026-04-16 19:25:52'),(11,'admin','admin@test.com','[\"ROLE_ADMIN\"]','$2y$13$A/5hQfV9IUJDhQxN7tdrK.GL6id0ZeFDSO.s3cNi8hQjxtaC7OFrq','Test','User',NULL,NULL,'2026-04-16 21:19:36'),(12,'vincent','test@test.com','[\"ROLE_USER\"]','$2y$13$A/5hQfV9IUJDhQxN7tdrK.GL6id0ZeFDSO.s3cNi8hQjxtaC7OFrq','Test','User',NULL,NULL,'2026-04-16 21:25:02');
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

-- Dump completed on 2026-04-17 14:26:16
