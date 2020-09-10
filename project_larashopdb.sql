-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: project_larashopdb
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Table structure for table `attribute_options`
--

DROP TABLE IF EXISTS `attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_options`
--

LOCK TABLES `attribute_options` WRITE;
/*!40000 ALTER TABLE `attribute_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Kecantikan','kecantikan',0,'2020-08-17 17:06:44','2020-08-17 17:06:44'),(2,'Kesehatan','kesehatan',0,'2020-08-17 20:41:50','2020-08-17 20:41:50'),(3,'Desain','desain',0,'2020-08-23 07:34:05','2020-08-23 07:34:05');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `favorites_product_id_foreign` (`product_id`),
  KEY `favorites_user_id_product_id_index` (`user_id`,`product_id`),
  CONSTRAINT `favorites_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (2,1,1,'2020-08-17 17:26:28','2020-08-17 17:26:28'),(3,3,1,'2020-08-17 19:44:51','2020-08-17 19:44:51'),(5,3,3,'2020-08-18 00:52:12','2020-08-18 00:52:12'),(6,3,2,'2020-08-18 07:08:48','2020-08-18 07:08:48');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (33,'2014_10_12_000000_create_users_table',1),(34,'2014_10_12_100000_create_password_resets_table',1),(35,'2019_08_19_000000_create_failed_jobs_table',1),(36,'2019_10_10_015655_create_categories_table',1),(37,'2019_11_18_153406_create_products_table',1),(38,'2019_11_18_154523_create_attributes_table',1),(39,'2019_11_18_154719_create_product_attribute_values_table',1),(40,'2019_11_18_155326_create_product_inventories_table',1),(41,'2019_11_18_155543_create_product_categories_table',1),(42,'2019_11_18_155703_create_product_images_table',1),(43,'2019_11_28_153532_rename_column_in_products_table',1),(44,'2019_11_28_161330_alter_column_in_products_table',1),(45,'2019_12_17_135909_add_columns_to_attributes_table',1),(46,'2019_12_17_140249_create_attribute_options_table',1),(47,'2020_01_13_170436_remove_column_product_attribute_value_id_in_product_inventories_table',1),(48,'2020_01_13_171015_add_parent_id_and_type_to_products_table',1),(49,'2020_01_13_171423_alter_as_nullable_column_in_products_table',1),(50,'2020_01_13_171602_alter_attribute_relation_in_product_attribute_values_table',1),(51,'2020_01_23_151312_create_permission_tables',1),(52,'2020_04_24_133452_add_full_text_search_index_to_products_table',1),(53,'2020_04_24_142324_add_parent_product_id_to_product_attribute_values_table',1),(54,'2020_05_03_154113_rename_column_and_add_columns_in_users_table',1),(55,'2020_05_09_163433_create_orders_table',1),(56,'2020_05_09_163816_create_order_items_table',1),(57,'2020_05_09_164011_create_payments_table',1),(58,'2020_05_09_164155_create_shipments_table',1),(59,'2020_05_11_163514_create_jobs_table',1),(60,'2020_05_15_155845_add_payment_token_to_orders_table',1),(61,'2020_05_15_155956_add_status_to_payments_table',1),(62,'2020_05_21_221514_add_columns_to_product_images_table',1),(63,'2020_05_26_023857_create_favorites_table',1),(64,'2020_05_28_221605_create_slides_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `base_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `base_total` decimal(16,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `tax_percent` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount_percent` decimal(16,2) NOT NULL DEFAULT '0.00',
  `sub_total` decimal(16,2) NOT NULL DEFAULT '0.00',
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attributes` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_sku_index` (`sku`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,2,2,45000.00,90000.00,0.00,0.00,0.00,0.00,90000.00,'123444','simple','Wardah','12.00','[]','2020-08-18 01:00:55','2020-08-18 01:00:55'),(2,2,2,2,45000.00,90000.00,0.00,0.00,0.00,0.00,90000.00,'123444','simple','Wardah','12.00','[]','2020-08-19 17:30:58','2020-08-19 17:30:58'),(3,3,2,1,45000.00,45000.00,0.00,0.00,0.00,0.00,45000.00,'123444','simple','Wardah','12.00','[]','2020-08-19 17:33:10','2020-08-19 17:33:10'),(4,4,2,1,45000.00,45000.00,0.00,0.00,0.00,0.00,45000.00,'123444','simple','Wardah','12.00','[]','2020-08-19 17:38:44','2020-08-19 17:38:44'),(5,5,2,1,45000.00,45000.00,0.00,0.00,0.00,0.00,45000.00,'123444','simple','Wardah','12.00','[]','2020-08-20 16:06:07','2020-08-20 16:06:07'),(6,6,2,1,45000.00,45000.00,0.00,0.00,0.00,0.00,45000.00,'123444','simple','Wardah','12.00','[]','2020-08-20 16:09:20','2020-08-20 16:09:20'),(7,7,2,1,45000.00,45000.00,0.00,0.00,0.00,0.00,45000.00,'123444','simple','Wardah','12.00','[]','2020-08-20 16:37:54','2020-08-20 16:37:54'),(8,8,2,1,45000.00,45000.00,0.00,0.00,0.00,0.00,45000.00,'123444','simple','Wardah','12.00','[]','2020-08-20 16:45:08','2020-08-20 16:45:08'),(9,9,1,1,50000.00,50000.00,0.00,0.00,0.00,0.00,50000.00,'123333','simple','Kerudung Pasmina','5.00','[]','2020-08-20 16:46:37','2020-08-20 16:46:37'),(10,10,3,1,45000.00,45000.00,0.00,0.00,0.00,0.00,45000.00,'12333','simple','Kaos Kampus Warna Hitam','100.00','[]','2020-08-20 16:47:49','2020-08-20 16:47:49'),(11,11,4,1,3000000.00,3000000.00,0.00,0.00,0.00,0.00,3000000.00,'1234','simple','Kaos Kampus Warna Putih','12.00','[]','2020-08-20 16:48:47','2020-08-20 16:48:47'),(12,12,8,1,45000.00,45000.00,0.00,0.00,0.00,0.00,45000.00,'123337','simple','Madu Murni','12.00','[]','2020-08-20 16:49:44','2020-08-20 16:49:44');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_date` datetime NOT NULL,
  `payment_due` datetime NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_total_price` decimal(16,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `tax_percent` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `discount_percent` decimal(16,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` decimal(16,2) NOT NULL DEFAULT '0.00',
  `grand_total` decimal(16,2) NOT NULL DEFAULT '0.00',
  `note` text COLLATE utf8mb4_unicode_ci,
  `customer_first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_city_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_province_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_postcode` int(11) DEFAULT NULL,
  `shipping_courier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_service_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` bigint(20) unsigned DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_at` datetime DEFAULT NULL,
  `cancellation_note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_code_unique` (`code`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_approved_by_foreign` (`approved_by`),
  KEY `orders_cancelled_by_foreign` (`cancelled_by`),
  KEY `orders_code_index` (`code`),
  KEY `orders_code_order_date_index` (`code`,`order_date`),
  KEY `orders_payment_token_index` (`payment_token`),
  CONSTRAINT `orders_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,3,'INV/20200818/VIII/XVIII/00001','created','2020-08-18 08:00:55','2020-08-25 08:00:55','unpaid','b161e9e5-4a77-454e-954a-8cc472e59196','https://app.sandbox.midtrans.com/snap/v2/vtweb/b161e9e5-4a77-454e-954a-8cc472e59196',90000.00,9000.00,10.00,0.00,0.00,7000.00,106000.00,'di rumh','hangga','k','tepus','tepus','089384287346','hanggakristanto@gmail.com','135','5',55881,'pos','POS - Paket Kilat Khusus',NULL,NULL,NULL,NULL,NULL,NULL,'2020-08-18 01:00:55','2020-08-18 01:01:00'),(2,3,'INV/20200820/VIII/XX/00001','created','2020-08-20 00:30:58','2020-08-27 00:30:58','unpaid','18526ecb-9bfd-44e1-9846-5c712d368b59','https://app.sandbox.midtrans.com/snap/v2/vtweb/18526ecb-9bfd-44e1-9846-5c712d368b59',90000.00,9000.00,10.00,0.00,0.00,10000.00,109000.00,'rumah cat warna hijau,  dekat smp 1 tepus','Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, tepus, gunungkidul, yogyakarta','802394822','hanggakristanto@gmail.com','135','5',55881,'jne','JNE - REG',NULL,NULL,NULL,NULL,NULL,NULL,'2020-08-19 17:30:58','2020-08-19 17:31:00'),(3,3,'INV/20200820/VIII/XX/00002','created','2020-08-20 00:33:10','2020-08-27 00:33:10','unpaid','a269543a-86ea-4291-b6ee-1393e250d4ad','https://app.sandbox.midtrans.com/snap/v2/vtweb/a269543a-86ea-4291-b6ee-1393e250d4ad',45000.00,4500.00,10.00,0.00,0.00,8000.00,57500.00,'f','Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, tepus, gunungkidul, yogyakarta','802394822','hanggakristanto@gmail.com','135','5',55881,'jne','JNE - OKE',NULL,NULL,NULL,NULL,NULL,NULL,'2020-08-19 17:33:10','2020-08-19 17:33:11'),(4,3,'INV/20200820/VIII/XX/00003','created','2020-08-20 00:38:44','2020-08-27 00:38:44','unpaid','5b5fadf8-55ce-4fe9-b261-fa6572d3932d','https://app.sandbox.midtrans.com/snap/v2/vtweb/5b5fadf8-55ce-4fe9-b261-fa6572d3932d',45000.00,4500.00,10.00,0.00,0.00,10000.00,59500.00,'rumah saya berwarna hijau','Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, tepus, gunungkidul, yogyakarta','802394822','hanggakristanto@gmail.com','135','5',55881,'jne','JNE - REG',NULL,NULL,NULL,NULL,NULL,NULL,'2020-08-19 17:38:44','2020-08-19 17:38:44'),(5,3,'INV/20200820/VIII/XX/00004','created','2020-08-20 23:06:07','2020-08-27 23:06:07','unpaid','e3d1fc20-2655-451c-a488-ae66b74cdbd8','https://app.sandbox.midtrans.com/snap/v2/vtweb/e3d1fc20-2655-451c-a488-ae66b74cdbd8',45000.00,4500.00,10.00,0.00,0.00,10000.00,59500.00,'Rumah saya berwarna hijau','Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, teus, gunungkidul','802394822','hanggakristanto@gmail.com','135','5',55881,'jne','JNE - REG',NULL,NULL,NULL,NULL,NULL,NULL,'2020-08-20 16:06:07','2020-08-20 16:06:07'),(6,3,'INV/20200820/VIII/XX/00005','created','2020-08-20 23:09:20','2020-08-27 23:09:20','unpaid','5731c614-cf83-46b5-a2ec-2ddb404a3c26','https://app.sandbox.midtrans.com/snap/v2/vtweb/5731c614-cf83-46b5-a2ec-2ddb404a3c26',45000.00,4500.00,10.00,0.00,0.00,8000.00,57500.00,'Rumah saya berwarna hijau','Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, teus, gunungkidul','0892394822','hanggakristanto@gmail.com','135','5',55881,'jne','JNE - OKE',NULL,NULL,NULL,NULL,NULL,NULL,'2020-08-20 16:09:20','2020-08-20 16:09:25'),(7,3,'INV/20200820/VIII/XX/00006','created','2020-08-20 23:37:54','2020-08-27 23:37:54','unpaid','cbf6a0f7-3e6b-4eac-9fe1-a7d05770f6c0','https://app.sandbox.midtrans.com/snap/v2/vtweb/cbf6a0f7-3e6b-4eac-9fe1-a7d05770f6c0',45000.00,4500.00,10.00,0.00,0.00,14000.00,63500.00,NULL,'Hangga','kristanto','No.2 jalan Jogja',NULL,'802394822','hanggakristanto@gmail.com','135','5',55881,'jne','JNE - YES',NULL,NULL,NULL,NULL,NULL,NULL,'2020-08-20 16:37:54','2020-08-20 16:37:54'),(8,3,'INV/20200820/VIII/XX/00007','completed','2020-08-20 23:45:08','2020-08-27 23:45:08','paid','96385514-1b93-4eaf-827d-8386862ce05a','https://app.sandbox.midtrans.com/snap/v2/vtweb/96385514-1b93-4eaf-827d-8386862ce05a',45000.00,4500.00,10.00,0.00,0.00,7000.00,56500.00,NULL,'Hangga','kristanto','No.2 jalan Jogja',NULL,'802394822','hanggakristanto@gmail.com','135','5',55881,'tiki','TIKI - ECO',1,'2020-08-20 23:53:08',NULL,NULL,NULL,NULL,'2020-08-20 16:45:08','2020-08-20 16:53:08'),(9,3,'INV/20200820/VIII/XX/00008','completed','2020-08-20 23:46:37','2020-08-27 23:46:37','paid','643a7230-de7b-4ca0-b598-fd14cc68d277','https://app.sandbox.midtrans.com/snap/v2/vtweb/643a7230-de7b-4ca0-b598-fd14cc68d277',50000.00,5000.00,10.00,0.00,0.00,8000.00,63000.00,NULL,'Hangga','kristanto','No.2 jalan Jogja',NULL,'802394822','hanggakristanto@gmail.com','135','5',55881,'jne','JNE - OKE',1,'2020-08-20 23:52:46',NULL,NULL,NULL,NULL,'2020-08-20 16:46:37','2020-08-20 16:52:46'),(10,3,'INV/20200820/VIII/XX/00009','completed','2020-08-20 23:47:49','2020-08-27 23:47:49','paid','04825019-b522-43dd-9250-69bd52a0b7a0','https://app.sandbox.midtrans.com/snap/v2/vtweb/04825019-b522-43dd-9250-69bd52a0b7a0',45000.00,4500.00,10.00,0.00,0.00,8000.00,57500.00,NULL,'Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, teus, gunungkidul','802394822','hanggakristanto@gmail.com','135','5',55881,'jne','JNE - OKE',1,'2020-08-20 23:52:24',NULL,NULL,NULL,NULL,'2020-08-20 16:47:49','2020-08-20 16:52:24'),(11,3,'INV/20200820/VIII/XX/00010','completed','2020-08-20 23:48:47','2020-08-27 23:48:47','paid','5dc05cd3-150b-4951-bbe9-bbdc9d8e862e','https://app.sandbox.midtrans.com/snap/v2/vtweb/5dc05cd3-150b-4951-bbe9-bbdc9d8e862e',3000000.00,300000.00,10.00,0.00,0.00,7000.00,3307000.00,NULL,'Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, teus, gunungkidul','802394822','hanggakristanto@gmail.com','135','5',55881,'pos','POS - Paket Kilat Khusus',1,'2020-08-20 23:52:03',NULL,NULL,NULL,NULL,'2020-08-20 16:48:47','2020-08-20 16:52:03'),(12,3,'INV/20200820/VIII/XX/00011','completed','2020-08-20 23:49:44','2020-08-27 23:49:44','paid','1d9266c1-972d-4790-989a-ead31526af35','https://app.sandbox.midtrans.com/snap/v2/vtweb/1d9266c1-972d-4790-989a-ead31526af35',45000.00,4500.00,10.00,0.00,0.00,14000.00,63500.00,NULL,'Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, teus, gunungkidul','802394822','hanggakristanto@gmail.com','135','5',55881,'jne','JNE - YES',1,'2020-08-20 23:51:40',NULL,NULL,NULL,NULL,'2020-08-20 16:49:44','2020-08-20 16:51:40');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT '0.00',
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payloads` json DEFAULT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `va_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biller_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_number_unique` (`number`),
  KEY `payments_order_id_foreign` (`order_id`),
  KEY `payments_number_index` (`number`),
  KEY `payments_method_index` (`method`),
  KEY `payments_token_index` (`token`),
  KEY `payments_payment_type_index` (`payment_type`),
  CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,8,'PAY/20200820/VIII/XX/00001',56500.00,'midtrans','success','cfce5b4f-812a-45b0-a174-9054e6be882c','{\"eci\": \"05\", \"bank\": \"mandiri\", \"currency\": \"IDR\", \"order_id\": \"INV/20200820/VIII/XX/00007\", \"card_type\": \"credit\", \"masked_card\": \"481111-1114\", \"merchant_id\": \"G410297972\", \"status_code\": \"200\", \"fraud_status\": \"accept\", \"gross_amount\": \"56500.00\", \"payment_type\": \"credit_card\", \"approval_code\": \"1597967135089\", \"signature_key\": \"10e74d959d43e986f650d1a8dc2e6f0862c6c03218dafafd66c843cc9370445b9a4e3611d759bacd0437e9e5c9f267d8df67f0f63af12fa4aee3b3add22ff987\", \"status_message\": \"midtrans payment notification\", \"transaction_id\": \"cfce5b4f-812a-45b0-a174-9054e6be882c\", \"transaction_time\": \"2020-08-21 06:45:28\", \"transaction_status\": \"capture\", \"channel_response_code\": \"00\", \"channel_response_message\": \"Approved\"}','credit_card',NULL,NULL,NULL,NULL,NULL,'2020-08-20 16:45:37','2020-08-20 16:45:37'),(2,9,'PAY/20200820/VIII/XX/00002',63000.00,'midtrans','success','f03e12e8-3b94-46ae-8ed3-fde7adac0ea8','{\"eci\": \"05\", \"bank\": \"mandiri\", \"currency\": \"IDR\", \"order_id\": \"INV/20200820/VIII/XX/00008\", \"card_type\": \"credit\", \"masked_card\": \"481111-1114\", \"merchant_id\": \"G410297972\", \"status_code\": \"200\", \"fraud_status\": \"accept\", \"gross_amount\": \"63000.00\", \"payment_type\": \"credit_card\", \"approval_code\": \"1597967227355\", \"signature_key\": \"31cdc68799d022fabe689daeec5123a8d521254361a75ef3886f2b668a053cadbf5c0d2e96a744f9444d764c5f8fc535194ec187083fa10b7620b8e7537fcc45\", \"status_message\": \"midtrans payment notification\", \"transaction_id\": \"f03e12e8-3b94-46ae-8ed3-fde7adac0ea8\", \"transaction_time\": \"2020-08-21 06:46:58\", \"transaction_status\": \"capture\", \"channel_response_code\": \"00\", \"channel_response_message\": \"Approved\"}','credit_card',NULL,NULL,NULL,NULL,NULL,'2020-08-20 16:47:09','2020-08-20 16:47:09'),(3,10,'PAY/20200820/VIII/XX/00003',57500.00,'midtrans','success','538e6124-d0d3-4336-8748-8fc764127b61','{\"eci\": \"05\", \"bank\": \"mandiri\", \"currency\": \"IDR\", \"order_id\": \"INV/20200820/VIII/XX/00009\", \"card_type\": \"credit\", \"masked_card\": \"481111-1114\", \"merchant_id\": \"G410297972\", \"status_code\": \"200\", \"fraud_status\": \"accept\", \"gross_amount\": \"57500.00\", \"payment_type\": \"credit_card\", \"approval_code\": \"1597967299105\", \"signature_key\": \"2affb0c263d918281068be01ea26fe2d9e4e1bf5b45624525b6f960ec0ecf94c6d135860cef5c3ed7b6bf3b75d7793bfd89b37505e75f675e7994a88db7ef0ec\", \"status_message\": \"midtrans payment notification\", \"transaction_id\": \"538e6124-d0d3-4336-8748-8fc764127b61\", \"transaction_time\": \"2020-08-21 06:48:13\", \"transaction_status\": \"capture\", \"channel_response_code\": \"00\", \"channel_response_message\": \"Approved\"}','credit_card',NULL,NULL,NULL,NULL,NULL,'2020-08-20 16:48:20','2020-08-20 16:48:20'),(4,11,'PAY/20200820/VIII/XX/00004',3307000.00,'midtrans','success','d2f2a00b-0f87-453b-a9ae-86664e27b80c','{\"eci\": \"05\", \"bank\": \"mandiri\", \"currency\": \"IDR\", \"order_id\": \"INV/20200820/VIII/XX/00010\", \"card_type\": \"credit\", \"masked_card\": \"481111-1114\", \"merchant_id\": \"G410297972\", \"status_code\": \"200\", \"fraud_status\": \"accept\", \"gross_amount\": \"3307000.00\", \"payment_type\": \"credit_card\", \"approval_code\": \"1597967351080\", \"signature_key\": \"5f0895be5603ee02e26c5510a15af890197dcfad49c94fdb528f4ace8d21da01f0f71bb6786a15d7c4014927cb9f43f5383193f2d2a4579d4e1cdb6e12ec82be\", \"status_message\": \"midtrans payment notification\", \"transaction_id\": \"d2f2a00b-0f87-453b-a9ae-86664e27b80c\", \"transaction_time\": \"2020-08-21 06:49:05\", \"transaction_status\": \"capture\", \"channel_response_code\": \"00\", \"channel_response_message\": \"Approved\"}','credit_card',NULL,NULL,NULL,NULL,NULL,'2020-08-20 16:49:14','2020-08-20 16:49:14'),(5,12,'PAY/20200820/VIII/XX/00005',63500.00,'midtrans','success','88259ddf-4476-44fd-b821-41618c218552','{\"eci\": \"05\", \"bank\": \"mandiri\", \"currency\": \"IDR\", \"order_id\": \"INV/20200820/VIII/XX/00011\", \"card_type\": \"credit\", \"masked_card\": \"481111-1114\", \"merchant_id\": \"G410297972\", \"status_code\": \"200\", \"fraud_status\": \"accept\", \"gross_amount\": \"63500.00\", \"payment_type\": \"credit_card\", \"approval_code\": \"1597967423114\", \"signature_key\": \"2cd248d4d191c762c4dceb9232bd2a4ce351a74a10503d5d690dd92b5902b1dd313be318607bdbaf1e9d8f303153c41f1768e4b41611e088639a3099e139fcf4\", \"status_message\": \"midtrans payment notification\", \"transaction_id\": \"88259ddf-4476-44fd-b821-41618c218552\", \"transaction_time\": \"2020-08-21 06:50:18\", \"transaction_status\": \"capture\", \"channel_response_code\": \"00\", \"channel_response_message\": \"Approved\"}','credit_card',NULL,NULL,NULL,NULL,NULL,'2020-08-20 16:50:25','2020-08-20 16:50:25');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'view_users','web','2020-08-17 17:04:26','2020-08-17 17:04:26'),(2,'add_users','web','2020-08-17 17:04:26','2020-08-17 17:04:26'),(3,'edit_users','web','2020-08-17 17:04:26','2020-08-17 17:04:26'),(4,'delete_users','web','2020-08-17 17:04:27','2020-08-17 17:04:27'),(5,'view_roles','web','2020-08-17 17:04:27','2020-08-17 17:04:27'),(6,'add_roles','web','2020-08-17 17:04:27','2020-08-17 17:04:27'),(7,'edit_roles','web','2020-08-17 17:04:27','2020-08-17 17:04:27'),(8,'delete_roles','web','2020-08-17 17:04:27','2020-08-17 17:04:27'),(9,'view_products','web','2020-08-17 17:04:27','2020-08-17 17:04:27'),(10,'add_products','web','2020-08-17 17:04:27','2020-08-17 17:04:27'),(11,'edit_products','web','2020-08-17 17:04:28','2020-08-17 17:04:28'),(12,'delete_products','web','2020-08-17 17:04:28','2020-08-17 17:04:28'),(13,'view_orders','web','2020-08-17 17:04:28','2020-08-17 17:04:28'),(14,'add_orders','web','2020-08-17 17:04:28','2020-08-17 17:04:28'),(15,'edit_orders','web','2020-08-17 17:04:28','2020-08-17 17:04:28'),(16,'delete_orders','web','2020-08-17 17:04:28','2020-08-17 17:04:28'),(17,'view_categories','web','2020-08-17 17:04:28','2020-08-17 17:04:28'),(18,'add_categories','web','2020-08-17 17:04:28','2020-08-17 17:04:28'),(19,'edit_categories','web','2020-08-17 17:04:28','2020-08-17 17:04:28'),(20,'delete_categories','web','2020-08-17 17:04:29','2020-08-17 17:04:29'),(21,'view_attributes','web','2020-08-17 17:04:29','2020-08-17 17:04:29'),(22,'add_attributes','web','2020-08-17 17:04:29','2020-08-17 17:04:29'),(23,'edit_attributes','web','2020-08-17 17:04:30','2020-08-17 17:04:30'),(24,'delete_attributes','web','2020-08-17 17:04:30','2020-08-17 17:04:30'),(25,'view_shipments','web','2020-08-17 17:04:30','2020-08-17 17:04:30'),(26,'add_shipments','web','2020-08-17 17:04:30','2020-08-17 17:04:30'),(27,'edit_shipments','web','2020-08-17 17:04:30','2020-08-17 17:04:30'),(28,'delete_shipments','web','2020-08-17 17:04:30','2020-08-17 17:04:30'),(29,'view_slides','web','2020-08-17 17:04:30','2020-08-17 17:04:30'),(30,'add_slides','web','2020-08-17 17:04:30','2020-08-17 17:04:30'),(31,'edit_slides','web','2020-08-17 17:04:30','2020-08-17 17:04:30'),(32,'delete_slides','web','2020-08-17 17:04:30','2020-08-17 17:04:30');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_attribute_values`
--

DROP TABLE IF EXISTS `product_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_attribute_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_product_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `attribute_id` bigint(20) unsigned NOT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` decimal(8,2) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_attribute_values_product_id_foreign` (`product_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  KEY `product_attribute_values_parent_product_id_foreign` (`parent_product_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `product_attribute_values_parent_product_id_foreign` FOREIGN KEY (`parent_product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_attribute_values`
--

LOCK TABLES `product_attribute_values` WRITE;
/*!40000 ALTER TABLE `product_attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_categories_product_id_foreign` (`product_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (2,2,1),(3,8,2),(4,9,2),(5,10,2),(6,11,2),(8,1,1),(9,12,3);
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_large` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `large` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `small` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (3,2,'uploads/images/original/wardah_1597722236.png','uploads/images/xlarge/wardah_1597722236.png','uploads/images/large/wardah_1597722236.png','uploads/images/medium/wardah_1597722236.png','uploads/images/small/wardah_1597722236.png','2020-08-17 20:43:58','2020-08-17 20:43:58'),(4,3,'uploads/images/original/kaos-kampus_1597722429.jpg','uploads/images/xlarge/kaos-kampus_1597722429.jpg','uploads/images/large/kaos-kampus_1597722429.jpg','uploads/images/medium/kaos-kampus_1597722429.jpg','uploads/images/small/kaos-kampus_1597722429.jpg','2020-08-17 20:47:09','2020-08-17 20:47:09'),(5,4,'uploads/images/original/kaos-kampus-warna-putih_1597722495.jpg','uploads/images/xlarge/kaos-kampus-warna-putih_1597722495.jpg','uploads/images/large/kaos-kampus-warna-putih_1597722495.jpg','uploads/images/medium/kaos-kampus-warna-putih_1597722495.jpg','uploads/images/small/kaos-kampus-warna-putih_1597722495.jpg','2020-08-17 20:48:15','2020-08-17 20:48:15'),(6,5,'uploads/images/original/kaos-wanita-warna-putih_1597722676.jpg','uploads/images/xlarge/kaos-wanita-warna-putih_1597722676.jpg','uploads/images/large/kaos-wanita-warna-putih_1597722676.jpg','uploads/images/medium/kaos-wanita-warna-putih_1597722676.jpg','uploads/images/small/kaos-wanita-warna-putih_1597722676.jpg','2020-08-17 20:51:16','2020-08-17 20:51:16'),(7,6,'uploads/images/original/kaos-palestina_1597722752.jpg','uploads/images/xlarge/kaos-palestina_1597722752.jpg','uploads/images/large/kaos-palestina_1597722752.jpg','uploads/images/medium/kaos-palestina_1597722752.jpg','uploads/images/small/kaos-palestina_1597722752.jpg','2020-08-17 20:52:33','2020-08-17 20:52:33'),(8,7,'uploads/images/original/batik-anak_1597722883.jpg','uploads/images/xlarge/batik-anak_1597722883.jpg','uploads/images/large/batik-anak_1597722883.jpg','uploads/images/medium/batik-anak_1597722883.jpg','uploads/images/small/batik-anak_1597722883.jpg','2020-08-17 20:54:44','2020-08-17 20:54:44'),(9,8,'uploads/images/original/madu-murni_1597723183.png','uploads/images/xlarge/madu-murni_1597723183.png','uploads/images/large/madu-murni_1597723183.png','uploads/images/medium/madu-murni_1597723183.png','uploads/images/small/madu-murni_1597723183.png','2020-08-17 20:59:44','2020-08-17 20:59:44'),(10,9,'uploads/images/original/madu-kalindra_1597723353.png','uploads/images/xlarge/madu-kalindra_1597723353.png','uploads/images/large/madu-kalindra_1597723353.png','uploads/images/medium/madu-kalindra_1597723353.png','uploads/images/small/madu-kalindra_1597723353.png','2020-08-17 21:02:34','2020-08-17 21:02:34'),(11,10,'uploads/images/original/madu-kalimantan_1597723402.png','uploads/images/xlarge/madu-kalimantan_1597723402.png','uploads/images/large/madu-kalimantan_1597723402.png','uploads/images/medium/madu-kalimantan_1597723402.png','uploads/images/small/madu-kalimantan_1597723402.png','2020-08-17 21:03:23','2020-08-17 21:03:23'),(12,11,'uploads/images/original/madu-kapas_1597724049.png','uploads/images/xlarge/madu-kapas_1597724049.png','uploads/images/large/madu-kapas_1597724049.png','uploads/images/medium/madu-kapas_1597724049.png','uploads/images/small/madu-kapas_1597724049.png','2020-08-17 21:14:10','2020-08-17 21:14:10'),(13,1,'uploads/images/original/madu-randu_1597750445.jpeg','uploads/images/xlarge/madu-randu_1597750445.jpeg','uploads/images/large/madu-randu_1597750445.jpeg','uploads/images/medium/madu-randu_1597750445.jpeg','uploads/images/small/madu-randu_1597750445.jpeg','2020-08-18 04:34:06','2020-08-18 04:34:06'),(14,12,'uploads/images/original/desain-kaos_1598193352.png','uploads/images/xlarge/desain-kaos_1598193352.png','uploads/images/large/desain-kaos_1598193352.png','uploads/images/medium/desain-kaos_1598193352.png','uploads/images/small/desain-kaos_1598193352.png','2020-08-23 07:35:54','2020-08-23 07:35:54');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_inventories`
--

DROP TABLE IF EXISTS `product_inventories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_inventories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_inventories_product_id_foreign` (`product_id`),
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventories`
--

LOCK TABLES `product_inventories` WRITE;
/*!40000 ALTER TABLE `product_inventories` DISABLE KEYS */;
INSERT INTO `product_inventories` VALUES (1,1,21,'2020-08-17 17:07:57','2020-08-20 16:46:37'),(2,2,89,'2020-08-17 20:43:41','2020-08-20 16:45:08'),(3,3,98,'2020-08-17 20:46:41','2020-08-20 16:47:49'),(4,4,65,'2020-08-17 20:48:52','2020-08-20 16:48:47'),(5,5,99,'2020-08-17 20:51:49','2020-08-17 20:51:49'),(6,6,99,'2020-08-17 20:52:56','2020-08-17 20:52:56'),(7,7,99,'2020-08-17 20:53:57','2020-08-17 20:53:57'),(8,8,98,'2020-08-17 21:00:21','2020-08-20 16:49:44'),(9,9,99,'2020-08-17 21:02:09','2020-08-17 21:02:09'),(10,10,99,'2020-08-17 21:03:46','2020-08-17 21:03:46'),(11,11,99,'2020-08-17 21:05:27','2020-08-17 21:05:27'),(12,12,99,'2020-08-23 07:35:27','2020-08-23 07:35:27');
/*!40000 ALTER TABLE `product_inventories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `weight` decimal(15,2) DEFAULT NULL,
  `width` decimal(10,2) DEFAULT NULL,
  `height` decimal(10,2) DEFAULT NULL,
  `length` decimal(10,2) DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_user_id_foreign` (`user_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  FULLTEXT KEY `search` (`name`,`slug`,`short_description`,`description`),
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`),
  CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,NULL,1,'123333','simple','Kerudung Pasmina','kerudung-pasmina',50000.00,5.00,12.00,22.00,20.00,'s','d',1,'2020-08-17 17:07:06','2020-08-20 01:09:34'),(2,NULL,1,'123444','simple','Wardah','wardah',45000.00,12.00,12.00,33.00,20.00,'Wardah Acne Derm Face Powder memang sangat direkomendasi, karena satu-satu bedak keluaran Wardah yang dirancang untuk kulit berjerawat  Bedak tersebut memiliki kandungan asam salisilat dan ekstrak kedalai. Gunanya bisa mengontrol jerawat pada wajah.','Tampil cantik dan terhindar dari permasalahan kulit, seperti jerawat adalah dambaan para wanita. Sebab, jika terjadi jerawat sangat merusak pesona dan kecantikan mereka. Akan tetapi, permasalahan jerawat tidak lagi menjadi momok menakutkan untuk para wanita. Sebab, dapat dituntaskan dengan menggunakan Wardah Acne Derm Face Powder.\r\nWardah Acne Derm Face Powder memang sangat direkomendasi, karena satu-satu bedak keluaran Wardah yang dirancang untuk kulit berjerawat  Bedak tersebut memiliki kandungan asam salisilat dan ekstrak kedalai. Gunanya bisa mengontrol jerawat pada wajah.\r\nAsam itu termasuk ke dalam jenis beta hydroxy acids (BHAs), yakni bagian hidroksi dari molekul ini, dipisahkan dua atom karbon. Sehingga, asam salisilat memang sangat jitu mengatasi jerawat dan komedo.\r\nAsam salisilat juga berguna untuk mengurangi produksi minyak berlebih, angkat sel kulit mati, dan menyamarkan luka.\r\nSedangkan, kedelai punya kandubgan senyawa isoflavon, manfaatnya sangat bagus untuk kecantikan. \r\nTidak hanya itu, antioksidan yang ada dalam kedelai bisa berfungsi untuk memperbaiki sel dan cegah efek radikal bebas. Wardah Acne Derm Face Powder yang sangat cocok untuk semua jenis kulit dan harga sangat terjangkau. Sebab, hanya dibanderol Rp 50.000.(*)',1,'2020-08-17 20:42:11','2020-08-17 20:43:40'),(3,NULL,1,'12333','simple','Kaos Kampus Warna Hitam','kaos-kampus-warna-hitam',45000.00,100.00,33.00,33.00,90.00,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',1,'2020-08-17 20:45:25','2020-08-17 20:47:46'),(4,NULL,1,'1234','simple','Kaos Kampus Warna Putih','kaos-kampus-warna-putih',3000000.00,12.00,22.00,22.00,90.00,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',1,'2020-08-17 20:48:02','2020-08-17 20:48:52'),(5,NULL,1,'123412','simple','Kaos Wanita Warna Putih','kaos-wanita-warna-putih',45000.00,88.00,33.00,22.00,23.00,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',1,'2020-08-17 20:50:59','2020-08-17 20:51:49'),(6,NULL,1,'123332','simple','Kaos Palestina','kaos-palestina',3000000.00,88.00,33.00,33.00,90.00,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',1,'2020-08-17 20:52:15','2020-08-17 20:52:56'),(7,NULL,1,'123339','simple','Batik Anak','batik-anak',45000.00,22.00,33.00,33.00,20.00,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',1,'2020-08-17 20:53:34','2020-08-17 20:53:57'),(8,NULL,1,'123337','simple','Madu Murni','madu-murni',45000.00,12.00,33.00,22.00,20.00,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',1,'2020-08-17 20:59:30','2020-08-17 21:00:21'),(9,NULL,1,'123445','simple','Madu Kalindra','madu-kalindra',45000.00,12.00,23.00,33.00,23.00,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',1,'2020-08-17 21:01:46','2020-08-17 21:02:09'),(10,NULL,1,'123336','simple','Madu Kalimantan','madu-kalimantan',45000.00,12.00,33.00,33.00,22.00,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',1,'2020-08-17 21:03:13','2020-08-17 21:03:46'),(11,NULL,1,'123455','simple','Madu Kapas','madu-kapas',45000.00,12.00,12.00,22.00,20.00,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',1,'2020-08-17 21:05:08','2020-08-17 21:05:27'),(12,NULL,1,'123338','simple','Desain kaos','desain-kaos',45000.00,12.00,33.00,22.00,90.00,'s','d',1,'2020-08-23 07:34:31','2020-08-23 07:35:27');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(1,2),(5,2),(9,2),(13,2),(17,2),(21,2),(25,2),(29,2);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','web','2020-08-17 17:04:45','2020-08-17 17:04:45'),(2,'User','web','2020-08-17 17:04:47','2020-08-17 17:04:47');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned NOT NULL,
  `track_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_qty` int(11) NOT NULL,
  `total_weight` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `shipped_by` bigint(20) unsigned DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_user_id_foreign` (`user_id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_shipped_by_foreign` (`shipped_by`),
  KEY `shipments_track_number_index` (`track_number`),
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `shipments_shipped_by_foreign` FOREIGN KEY (`shipped_by`) REFERENCES `users` (`id`),
  CONSTRAINT `shipments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
INSERT INTO `shipments` VALUES (1,3,1,NULL,'pending',2,24,'hangga','k','tepus','tepus','089384287346','hanggakristanto@gmail.com','135','5',55881,NULL,NULL,NULL,'2020-08-18 01:01:00','2020-08-18 01:01:00'),(2,3,2,NULL,'pending',2,24,'Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, tepus, gunungkidul, yogyakarta','802394822','hanggakristanto@gmail.com','135','5',55881,NULL,NULL,NULL,'2020-08-19 17:31:00','2020-08-19 17:31:00'),(3,3,3,NULL,'pending',1,12,'Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, tepus, gunungkidul, yogyakarta','802394822','hanggakristanto@gmail.com','135','5',55881,NULL,NULL,NULL,'2020-08-19 17:33:11','2020-08-19 17:33:11'),(4,3,4,NULL,'pending',1,12,'Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, tepus, gunungkidul, yogyakarta','802394822','hanggakristanto@gmail.com','135','5',55881,NULL,NULL,NULL,'2020-08-19 17:38:45','2020-08-19 17:38:45'),(5,3,5,NULL,'pending',1,12,'Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, teus, gunungkidul','802394822','hanggakristanto@gmail.com','135','5',55881,NULL,NULL,NULL,'2020-08-20 16:06:07','2020-08-20 16:06:07'),(6,3,6,NULL,'pending',1,12,'Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, teus, gunungkidul','0892394822','hanggakristanto@gmail.com','135','5',55881,NULL,NULL,NULL,'2020-08-20 16:09:25','2020-08-20 16:09:25'),(7,3,7,NULL,'pending',1,12,'Hangga','kristanto','No.2 jalan Jogja',NULL,'802394822','hanggakristanto@gmail.com','135','5',55881,NULL,NULL,NULL,'2020-08-20 16:37:54','2020-08-20 16:37:54'),(8,3,8,'4811 1111 1111 1114','shipped',1,12,'Hangga','kristanto','No.2 jalan Jogja',NULL,'802394822','hanggakristanto@gmail.com','135','5',55881,1,'2020-08-20 23:53:00',NULL,'2020-08-20 16:45:08','2020-08-20 16:53:00'),(9,3,9,'4811 1111 1111 1114','shipped',1,5,'Hangga','kristanto','No.2 jalan Jogja',NULL,'802394822','hanggakristanto@gmail.com','135','5',55881,1,'2020-08-20 23:52:38',NULL,'2020-08-20 16:46:37','2020-08-20 16:52:38'),(10,3,10,'4811 1111 1111 1114','shipped',1,100,'Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, teus, gunungkidul','802394822','hanggakristanto@gmail.com','135','5',55881,1,'2020-08-20 23:52:16',NULL,'2020-08-20 16:47:49','2020-08-20 16:52:16'),(11,3,11,'4811 1111 1111 1114','shipped',1,12,'Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, teus, gunungkidul','802394822','hanggakristanto@gmail.com','135','5',55881,1,'2020-08-20 23:51:52',NULL,'2020-08-20 16:48:47','2020-08-20 16:51:52'),(12,3,12,'4811 1111 1111 1114','shipped',1,12,'Hangga','kristanto','No.2 jalan Jogja','Puleireng, sidoharjo, teus, gunungkidul','802394822','hanggakristanto@gmail.com','135','5',55881,1,'2020-08-20 23:51:26',NULL,'2020-08-20 16:49:44','2020-08-20 16:51:26');
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `original` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_large` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `small` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slides_user_id_index` (`user_id`),
  CONSTRAINT `slides_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` VALUES (1,1,'q','a',1,'active',NULL,'uploads/images/original/q_1597709160.png','uploads/images/xlarge/q_1597709160.png','uploads/images/small/q_1597709160.png','2020-08-17 17:06:00','2020-08-17 17:06:00');
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jackson','Smitham','zachariah52@example.net',NULL,'2020-08-17 17:04:47','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','pEpaYxgZFVMS3ySnQKO2Z53jTjr3yxIOdfoomuOPvvSb8T7BcQ87yzjrGczu',NULL,NULL,NULL,NULL,NULL,NULL,'2020-08-17 17:04:47','2020-08-17 17:04:47'),(2,'Claudie','Davis','shanny.gerlach@example.net',NULL,'2020-08-17 17:04:49','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','mVWGihxZol',NULL,NULL,NULL,NULL,NULL,NULL,'2020-08-17 17:04:49','2020-08-17 17:04:49'),(3,'Hangga','kristanto','hanggakristanto@gmail.com','802394822',NULL,'$2y$10$XiNEv5QFb3XLfleIFQQ1Ye9OEQy3JzO8QapG5G.rDVIJYTlMGCcyy',NULL,'indonesia','No.2 jalan Jogja',NULL,5,135,55881,'2020-08-17 19:43:35','2020-08-18 19:23:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-24 23:01:21
