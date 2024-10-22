-- MySQL dump 10.13  Distrib 5.5.48, for Win64 (x86)
--
-- Host: localhost    Database: bd_g12
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add noticia',7,'add_noticia'),(26,'Can change noticia',7,'change_noticia'),(27,'Can delete noticia',7,'delete_noticia'),(28,'Can view noticia',7,'view_noticia'),(29,'Can add categoria',8,'add_categoria'),(30,'Can change categoria',8,'change_categoria'),(31,'Can delete categoria',8,'delete_categoria'),(32,'Can view categoria',8,'view_categoria'),(33,'Can add comentarios',9,'add_comentarios'),(34,'Can change comentarios',9,'change_comentarios'),(35,'Can delete comentarios',9,'delete_comentarios'),(36,'Can view comentarios',9,'view_comentarios'),(37,'Can add contacto',10,'add_contacto'),(38,'Can change contacto',10,'change_contacto'),(39,'Can delete contacto',10,'delete_contacto'),(40,'Can view contacto',10,'view_contacto');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$zmMqhU36lwmoMuneP0KyeO$2bODoO03cn/5liQXZcMiR3wZW/S7o3Ze+9v+Q0DE2JE=','2024-10-09 04:31:02.702401',1,'admin','','','admin@admin.com',1,1,'2024-10-08 23:33:15.361039'),(2,'pbkdf2_sha256$870000$Gn8UciPzIfKKHqlfiA6UZg$16E+qeMeE+afVdFcvVTTyEIldXLyRkzs7Fxt2FdPPA4=','2024-10-21 04:52:06.761730',0,'cm','','','tuki@gmail.com',1,1,'2024-10-15 02:11:26.639219'),(3,'pbkdf2_sha256$870000$lDWcJDM8vJZfobqCiQ5tbL$aGPyIhSAQ4MiZ37vln2h5NWIxfHJdJhW+LdqTx43HtM=','2024-10-19 15:13:56.973051',0,'clau1','','','ccccc@gmail.com',0,1,'2024-10-15 03:08:11.498339');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `comentarios_comentarios`
--

DROP TABLE IF EXISTS `comentarios_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios_comentarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `texto` longtext NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `noticia_id` bigint NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comentarios_comentar_noticia_id_408e08bf_fk_noticias_` (`noticia_id`),
  KEY `comentarios_comentarios_usuario_id_51fe9487_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `comentarios_comentar_noticia_id_408e08bf_fk_noticias_` FOREIGN KEY (`noticia_id`) REFERENCES `noticias_noticia` (`id`),
  CONSTRAINT `comentarios_comentarios_usuario_id_51fe9487_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios_comentarios`
--

LOCK TABLES `comentarios_comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios_comentarios` DISABLE KEYS */;
INSERT INTO `comentarios_comentarios` VALUES (1,'agregar comentario','2024-10-18 23:15:46.415710',3,2),(2,'agregar comentario, agorora si','2024-10-18 23:16:46.807868',3,2),(4,'otro comentario random y necesario','2024-10-20 15:22:41.368245',3,2),(7,'No estoy de Acuerfo','2024-10-20 18:08:10.345349',4,2),(9,'yo si estoy de acuerdo, demasiasdo','2024-10-20 18:56:43.141869',4,2);
/*!40000 ALTER TABLE `comentarios_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto_contacto`
--

DROP TABLE IF EXISTS `contacto_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacto_contacto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `asunto` varchar(100) NOT NULL,
  `mensaje` longtext NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contacto_contacto_usuario_id_baa4c198_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `contacto_contacto_usuario_id_baa4c198_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto_contacto`
--

LOCK TABLES `contacto_contacto` WRITE;
/*!40000 ALTER TABLE `contacto_contacto` DISABLE KEYS */;
INSERT INTO `contacto_contacto` VALUES (1,'prueba','prueba','2024-10-21 00:46:39.080659',2),(2,'prueba','tuki','2024-10-21 02:57:22.728016',2),(3,'prueba','tuki','2024-10-21 03:01:30.657988',2),(4,'prueba','tuki','2024-10-21 03:03:46.417752',2),(5,'prueba','tuki','2024-10-21 03:09:24.087945',2),(6,'prueba','iiiiii','2024-10-21 03:56:40.392117',2),(7,'prueba','ll','2024-10-21 04:04:16.199834',2),(8,'prueba','ll','2024-10-21 04:05:45.263800',2),(9,'sc','c','2024-10-21 04:07:22.195877',2),(10,'s','s','2024-10-21 04:09:29.072123',2),(11,'s','s','2024-10-21 04:10:35.447333',2),(12,'s','s','2024-10-21 04:13:15.848653',2),(13,'s','s','2024-10-21 04:16:48.320056',2),(14,'s','s','2024-10-21 04:22:31.501065',2),(15,'s','s','2024-10-21 04:24:41.085154',2),(16,'s','s','2024-10-21 04:27:52.358312',2),(17,'s','s','2024-10-21 04:32:02.802472',2),(18,'hola mundo','chau mundo','2024-10-21 04:40:04.971715',2);
/*!40000 ALTER TABLE `contacto_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'comentarios','comentarios'),(10,'contacto','contacto'),(5,'contenttypes','contenttype'),(8,'noticias','categoria'),(7,'noticias','noticia'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-10-08 23:24:10.717486'),(2,'auth','0001_initial','2024-10-08 23:24:11.306405'),(3,'admin','0001_initial','2024-10-08 23:24:11.454311'),(4,'admin','0002_logentry_remove_auto_add','2024-10-08 23:24:11.454311'),(5,'admin','0003_logentry_add_action_flag_choices','2024-10-08 23:24:11.484449'),(6,'contenttypes','0002_remove_content_type_name','2024-10-08 23:24:11.599916'),(7,'auth','0002_alter_permission_name_max_length','2024-10-08 23:24:11.668593'),(8,'auth','0003_alter_user_email_max_length','2024-10-08 23:24:11.702111'),(9,'auth','0004_alter_user_username_opts','2024-10-08 23:24:11.713827'),(10,'auth','0005_alter_user_last_login_null','2024-10-08 23:24:11.776135'),(11,'auth','0006_require_contenttypes_0002','2024-10-08 23:24:11.788296'),(12,'auth','0007_alter_validators_add_error_messages','2024-10-08 23:24:11.796944'),(13,'auth','0008_alter_user_username_max_length','2024-10-08 23:24:11.879658'),(14,'auth','0009_alter_user_last_name_max_length','2024-10-08 23:24:11.959441'),(15,'auth','0010_alter_group_name_max_length','2024-10-08 23:24:11.976866'),(16,'auth','0011_update_proxy_permissions','2024-10-08 23:24:11.983978'),(17,'auth','0012_alter_user_first_name_max_length','2024-10-08 23:24:12.053318'),(18,'sessions','0001_initial','2024-10-08 23:24:12.094972'),(19,'noticias','0001_initial','2024-10-16 03:19:14.820830'),(20,'comentarios','0001_initial','2024-10-18 22:24:17.517086'),(21,'contacto','0001_initial','2024-10-21 00:45:54.091255');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `django_session` VALUES ('18ddwgvxr7bsqqqhyi9on9pxb4pnikhn','.eJxVjEEOwiAQRe_C2hCgUAaX7j0DmYFBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXEWRpx-N8L04LaDfMd2m2Wa27pMJHdFHrTL65z5eTncv4OKvX5rssEV6zQwW1cCqqBSSaoMRoN14JEwcDA6DQpyUYU8OBppTAbAemLx_gDgFDfn:1t0v23:nKAvUZ0NK95znw8euiyySg2xzedEV33G8JuiidAtJbg','2024-10-30 03:49:07.942974'),('4ddhx5s7wx5jqgq3qevt4f1jibvtzwst','.eJxVjDEOwjAMRe-SGUW169SUkZ0zRI4dSAG1UtNOiLtDpQ6w_vfef7ko61LiWvMcB3MnB-7wuyXRRx43YHcZb5PXaVzmIflN8Tut_jJZfp539--gSC3fGpu-D8rCQJSvaNIYa1AhNoSeUEObA0JHSkgA2VJI2gEp8pFbZPf-AM2ONwM:1syOLm:ysulyW-4j2AYDyLFWgXaVLHyTUr8jdItwaHTecfzrvs','2024-10-23 04:31:02.718168'),('gggwqzg9ypt5fn4aiizoxqcqsfcuf6zo','.eJxVjEEOwiAQRe_C2hCgUAaX7j0DmYFBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXEWRpx-N8L04LaDfMd2m2Wa27pMJHdFHrTL65z5eTncv4OKvX5rssEV6zQwW1cCqqBSSaoMRoN14JEwcDA6DQpyUYU8OBppTAbAemLx_gDgFDfn:1t2kOk:wKo8HZaKRQmvY1rLZMqhbtxcXJzYiTh5seBmzUAZvqE','2024-11-04 04:52:06.768519');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias_categoria`
--

DROP TABLE IF EXISTS `noticias_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticias_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias_categoria`
--

LOCK TABLES `noticias_categoria` WRITE;
/*!40000 ALTER TABLE `noticias_categoria` DISABLE KEYS */;
INSERT INTO `noticias_categoria` VALUES (2,'Internacionales'),(3,'Nacionales'),(4,'Locales'),(5,'Cotizaciones');
/*!40000 ALTER TABLE `noticias_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias_noticia`
--

DROP TABLE IF EXISTS `noticias_noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `noticias_noticia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(20) NOT NULL,
  `autor` varchar(20) NOT NULL,
  `nota` longtext NOT NULL,
  `fecha_agregado` datetime(6) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `categoria_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `noticias_noticia_categoria_id_7abc6847_fk_noticias_categoria_id` (`categoria_id`),
  CONSTRAINT `noticias_noticia_categoria_id_7abc6847_fk_noticias_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `noticias_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias_noticia`
--

LOCK TABLES `noticias_noticia` WRITE;
/*!40000 ALTER TABLE `noticias_noticia` DISABLE KEYS */;
INSERT INTO `noticias_noticia` VALUES (3,'dolares','p.p','tucu tucu powieroqwn ionwrfn ;anfien cnmoa;skdfjn ncioeownfno cvowief on qiw dvabb; fndfdi a nuarbf al cauwbnefic aw \r\niownergowneoruvnq dwkdnafo','2024-10-17 02:08:28.614034','noticias/noticia_default.jpg',2),(4,'inflacion','caballo','dados los parametros actuuales de inflacion estimada para el sgundo semstre del año se vislumbra un panorama alentador','2024-10-19 21:18:29.343554','noticias/noticia_default.jpg',2),(5,'La sequía asecha','j.perez','En una Argentina necesitada de dólares, que atravesó un 2024 de recuperación tras la brutal sequía de 2023 que afectó gravemente la economía, las previsiones para 2025 no son mejores. El gobierno debería tomar medidas rápidamente para mitigar el impacto.\r\n\r\n   En las últimas horas, el Servicio Meteorológico Nacional (SMN) presentó un nuevo y desalentador informe climático que afecta directamente a la economía argentina. Según el reporte, el trimestre que comenzó en octubre será seco y con altas temperaturas superiores a lo normal en todas las provincias del país. Además, hay un 81% de probabilidad de que el fenómeno climático de La Niña afecte casi todo el territorio nacional. En resumen, octubre, noviembre y diciembre serán meses con mucho calor y poca agua.\r\n\r\nEntre la espada y la pared\r\n   La falta de agua y el calor excesivo proyectados para los últimos meses de 2024 y los primeros de 2025 ponen a la economía argentina en una situación crítica, especialmente por su necesidad de dólares. La falta de lluvias o el retraso de las mismas en las zonas núcleo de la producción agropecuaria podría profundizar la crisis de la cosecha, una realidad que ya se está evidenciando.','2024-10-20 00:24:14.337357','noticias/sequia.jpg',4),(6,'Transferencias chaco','p.p','alksdufb ;asuvn l ajsfv ;o;osadn vooansfdkvcn a;sfn vandsfiv dfkv ak fdskndvbiuerfefb vier vuirvbiebviuabev   erfbviarevbiaercv aerverfib','2024-10-20 18:51:01.756836','noticias/noticia_default.jpg',4);
/*!40000 ALTER TABLE `noticias_noticia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-22  0:58:09
