-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 192.168.1.12    Database: M704Spotify
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `Albumes`
--

DROP TABLE IF EXISTS `Albumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Albumes` (
  `idAlbumes` int unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `idArtista` int unsigned DEFAULT NULL,
  `año_publicacion` year DEFAULT NULL,
  `imagen_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAlbumes`),
  KEY `inx_idArtistas` (`idArtista`),
  CONSTRAINT `fk_Albu_idArtista` FOREIGN KEY (`idArtista`) REFERENCES `Artistas` (`idArtistas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Albumes`
--

LOCK TABLES `Albumes` WRITE;
/*!40000 ALTER TABLE `Albumes` DISABLE KEYS */;
INSERT INTO `Albumes` VALUES (1,'Thriller',1,1995,'/img/thriller.jpg'),(2,'Like a prayer',2,1989,'/img/likeaprayer.jpg'),(3,'baby one more time',3,1999,'/img/baby.jpg'),(4,'Whitney Houston',4,1987,'/img/whitney.jpg'),(5,'BackStreet\'s back',5,1997,'/img/bacstreet.jpg');
/*!40000 ALTER TABLE `Albumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artistas`
--

DROP TABLE IF EXISTS `Artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artistas` (
  `idArtistas` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `imagen_url` varchar(50) DEFAULT NULL,
  `idArtistas_seguimiento` int unsigned DEFAULT NULL,
  PRIMARY KEY (`idArtistas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artistas`
--

LOCK TABLES `Artistas` WRITE;
/*!40000 ALTER TABLE `Artistas` DISABLE KEYS */;
INSERT INTO `Artistas` VALUES (1,'Michael Jackosn','/img/michael.jpg',NULL),(2,'Madonna','/img/madonna.jpg',NULL),(3,'Britney Spears','/img/britney.jpg',NULL),(4,'Whitney Houston','/img/whitney.jpg',NULL),(5,'BackStreet boys','/img/backstreet.jpg',NULL);
/*!40000 ALTER TABLE `Artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artistas_Relacionados`
--

DROP TABLE IF EXISTS `Artistas_Relacionados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artistas_Relacionados` (
  `idArtistasRelacionados` int unsigned NOT NULL AUTO_INCREMENT,
  `artista` int unsigned DEFAULT NULL,
  `artista_relacionado` int unsigned DEFAULT NULL,
  PRIMARY KEY (`idArtistasRelacionados`),
  KEY `inx_idArtistas` (`artista`) /*!80000 INVISIBLE */,
  KEY `inx_idArtistas1` (`artista_relacionado`),
  CONSTRAINT `fk_ArtRel_idArtistaPrin` FOREIGN KEY (`artista`) REFERENCES `Artistas` (`idArtistas`),
  CONSTRAINT `fk_ArtRel_idArtistaRel` FOREIGN KEY (`artista_relacionado`) REFERENCES `Artistas` (`idArtistas`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artistas_Relacionados`
--

LOCK TABLES `Artistas_Relacionados` WRITE;
/*!40000 ALTER TABLE `Artistas_Relacionados` DISABLE KEYS */;
INSERT INTO `Artistas_Relacionados` VALUES (1,1,2),(2,1,3),(3,2,4),(4,2,5);
/*!40000 ALTER TABLE `Artistas_Relacionados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Canciones`
--

DROP TABLE IF EXISTS `Canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Canciones` (
  `idCanciones` int unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `duracion` int unsigned DEFAULT NULL COMMENT 'duracion en minutos.',
  `numero_reproducciones` int unsigned DEFAULT NULL,
  `idAlbumes` int unsigned DEFAULT NULL,
  PRIMARY KEY (`idCanciones`),
  KEY `fk_Can_idAlbumes_idx` (`idAlbumes`),
  CONSTRAINT `fk_Can_idAlbumes` FOREIGN KEY (`idAlbumes`) REFERENCES `Albumes` (`idAlbumes`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Canciones`
--

LOCK TABLES `Canciones` WRITE;
/*!40000 ALTER TABLE `Canciones` DISABLE KEYS */;
INSERT INTO `Canciones` VALUES (1,'Thriller',8,100,1),(2,'Like a prayer',5,101,2),(3,'Baby one more time',4,102,3),(4,'I wanna dance with somebody',6,103,4),(5,'Everybody',4,104,5),(6,'Beat it',4,60,1),(7,'Express yourself',5,88,2);
/*!40000 ALTER TABLE `Canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pagos_Paypal`
--

DROP TABLE IF EXISTS `Pagos_Paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pagos_Paypal` (
  `idPagosPaypal` int unsigned NOT NULL AUTO_INCREMENT,
  `idUsuarios` int unsigned DEFAULT NULL,
  `nombreUsuarioPaypal` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPagosPaypal`),
  KEY `inx_idUsuarios` (`idUsuarios`),
  CONSTRAINT `fk_PagPay_idUsuarios` FOREIGN KEY (`idUsuarios`) REFERENCES `Usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pagos_Paypal`
--

LOCK TABLES `Pagos_Paypal` WRITE;
/*!40000 ALTER TABLE `Pagos_Paypal` DISABLE KEYS */;
INSERT INTO `Pagos_Paypal` VALUES (1,3,'paypalUsu6'),(2,4,'paypalUsu7'),(3,5,'paypalUsu8'),(4,6,'paypalUsu9');
/*!40000 ALTER TABLE `Pagos_Paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pagos_Usuarios_Premium`
--

DROP TABLE IF EXISTS `Pagos_Usuarios_Premium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pagos_Usuarios_Premium` (
  `idPagos` int unsigned NOT NULL AUTO_INCREMENT,
  `idUsuario` int unsigned DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `num_orden` int DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idPagos`),
  UNIQUE KEY `num_orden_UNIQUE` (`num_orden`) /*!80000 INVISIBLE */,
  KEY `inx_idUsuario` (`idUsuario`),
  CONSTRAINT `fk_PagUsuPrem_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pagos_Usuarios_Premium`
--

LOCK TABLES `Pagos_Usuarios_Premium` WRITE;
/*!40000 ALTER TABLE `Pagos_Usuarios_Premium` DISABLE KEYS */;
INSERT INTO `Pagos_Usuarios_Premium` VALUES (1,3,'2021-01-01',1,20.00),(2,4,'2021-01-02',2,24.00),(3,5,'2021-01-03',3,23.00),(4,6,'2021-01-04',4,16.00);
/*!40000 ALTER TABLE `Pagos_Usuarios_Premium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Playlists`
--

DROP TABLE IF EXISTS `Playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Playlists` (
  `idPlaylists` int unsigned NOT NULL AUTO_INCREMENT,
  `idUsuario` int unsigned DEFAULT NULL,
  `titulo` varchar(50) NOT NULL,
  `numero_canciones` int DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `estado` set('activa','eliminada') DEFAULT NULL,
  `fechaEliminada` date DEFAULT NULL,
  PRIMARY KEY (`idPlaylists`),
  KEY `inx_idusuario` (`idUsuario`),
  CONSTRAINT `fk_Play_idUsuarios` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Playlists`
--

LOCK TABLES `Playlists` WRITE;
/*!40000 ALTER TABLE `Playlists` DISABLE KEYS */;
INSERT INTO `Playlists` VALUES (1,1,'clasica',3,'2021-01-01','activa',NULL),(2,2,'rock',3,'2021-01-02','activa',NULL),(5,3,'bandas sonoras',4,'2021-01-03','activa',NULL),(6,4,'instrumental',4,'2021-01-03','eliminada','2021-02-01'),(7,5,'disco',4,'2021-01-04','activa',NULL);
/*!40000 ALTER TABLE `Playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Playlists_Detalle`
--

DROP TABLE IF EXISTS `Playlists_Detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Playlists_Detalle` (
  `idPlaylistsDetalle` int unsigned NOT NULL AUTO_INCREMENT,
  `idPlaylist` int unsigned DEFAULT NULL,
  `idCancion` int unsigned DEFAULT NULL,
  `idUsuario` int unsigned DEFAULT NULL,
  `fecha_añadida` date DEFAULT NULL,
  PRIMARY KEY (`idPlaylistsDetalle`),
  KEY `inx_idPlaylist` (`idPlaylist`),
  KEY `inx_idCancion` (`idCancion`),
  KEY `inx_idUsuario` (`idUsuario`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_PlayDet_idCancion` FOREIGN KEY (`idCancion`) REFERENCES `Canciones` (`idCanciones`),
  CONSTRAINT `fk_PlayDet_idPlaylist` FOREIGN KEY (`idPlaylist`) REFERENCES `Playlists` (`idPlaylists`),
  CONSTRAINT `fk_PlayDet_idUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Playlists_Detalle`
--

LOCK TABLES `Playlists_Detalle` WRITE;
/*!40000 ALTER TABLE `Playlists_Detalle` DISABLE KEYS */;
INSERT INTO `Playlists_Detalle` VALUES (2,1,1,1,'2021-02-01'),(3,1,2,1,'2021-02-02'),(4,1,3,1,'2021-02-03'),(5,1,4,1,'2021-02-04'),(6,1,5,1,'2021-02-05'),(7,2,1,2,'2021-02-01'),(8,2,2,2,'2021-02-02');
/*!40000 ALTER TABLE `Playlists_Detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suscripciones`
--

DROP TABLE IF EXISTS `Suscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Suscripciones` (
  `idSuscripciones` int unsigned NOT NULL AUTO_INCREMENT,
  `idUsuario` int unsigned DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_renovacion` date NOT NULL,
  `forma_de_pago` set('tarjeta','paypal') NOT NULL COMMENT 'Tarjeta o PayPal',
  PRIMARY KEY (`idSuscripciones`),
  KEY `inx_idUsuario` (`idUsuario`),
  CONSTRAINT `fk_Sus_idUsuarios` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suscripciones`
--

LOCK TABLES `Suscripciones` WRITE;
/*!40000 ALTER TABLE `Suscripciones` DISABLE KEYS */;
INSERT INTO `Suscripciones` VALUES (1,3,'2019-01-01','2021-06-01','tarjeta'),(2,4,'2019-01-02','2021-06-02','paypal'),(3,5,'2019-01-03','2021-06-03','tarjeta'),(4,6,'2019-01-04','2021-06-04','paypal');
/*!40000 ALTER TABLE `Suscripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tarjetas_Credito`
--

DROP TABLE IF EXISTS `Tarjetas_Credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tarjetas_Credito` (
  `idTarjetasCredito` int unsigned NOT NULL AUTO_INCREMENT,
  `idUsuario` int unsigned DEFAULT NULL,
  `numero_tarjeta` varchar(19) DEFAULT NULL,
  `año_caducidad` year DEFAULT NULL,
  `mes_caducidad` int DEFAULT NULL,
  `codigo_seguridad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idTarjetasCredito`),
  KEY `inx_idUsuario` (`idUsuario`),
  CONSTRAINT `fk_TarjCre_idUsuarios` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tarjetas_Credito`
--

LOCK TABLES `Tarjetas_Credito` WRITE;
/*!40000 ALTER TABLE `Tarjetas_Credito` DISABLE KEYS */;
INSERT INTO `Tarjetas_Credito` VALUES (1,1,'1234567890',2022,5,'1234'),(2,2,'1234567890',2022,6,'1234'),(3,3,'1234567890',2022,7,'1234'),(4,4,'1234567890',2022,8,'1234'),(5,5,'1234567890',2022,9,'1234');
/*!40000 ALTER TABLE `Tarjetas_Credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `idUsuarios` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo` set('free','premium') DEFAULT NULL COMMENT 'tipo: free o premium',
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nombre_usuario` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` set('hombre','mujer') DEFAULT NULL COMMENT 'sexo: hombre / mujer',
  `pais` varchar(50) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (1,'free','jose@gmail.com','1234','Jose','1980-01-01','hombre','España','08001'),(2,'free','carlos@gmail.com','1234','Carlos','1980-01-02','hombre','España','08002'),(3,'premium','maria@gmail.com','1234','Maria','1980-01-03','mujer','España','08003'),(4,'premium','antonio@gmail.com','1234','Antonio','1980-01-04','hombre','España','08004'),(5,'premium','marisol@gmail.com','1234','Mari Sol','1980-01-05','mujer','España','08005'),(6,'premium','javier@gmail.com','1234','Javier','1980-01-06','hombre','España','08014'),(7,'free','fernando@gmail.com','1234','Fernando','1980-01-17','hombre','España','08015');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios_AlbumesFav`
--

DROP TABLE IF EXISTS `Usuarios_AlbumesFav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios_AlbumesFav` (
  `idFavoritosAlbumes` int unsigned NOT NULL AUTO_INCREMENT,
  `idUsuario` int unsigned DEFAULT NULL,
  `idAlbumes` int unsigned DEFAULT NULL,
  PRIMARY KEY (`idFavoritosAlbumes`),
  KEY `inx_idUsuario` (`idUsuario`) /*!80000 INVISIBLE */,
  KEY `inx_idAlbumes` (`idAlbumes`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_UsuAlbF_idAlbum` FOREIGN KEY (`idAlbumes`) REFERENCES `Albumes` (`idAlbumes`),
  CONSTRAINT `fk_UsuAlbF_idUsuarios` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios_AlbumesFav`
--

LOCK TABLES `Usuarios_AlbumesFav` WRITE;
/*!40000 ALTER TABLE `Usuarios_AlbumesFav` DISABLE KEYS */;
INSERT INTO `Usuarios_AlbumesFav` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
/*!40000 ALTER TABLE `Usuarios_AlbumesFav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios_CancionesFav`
--

DROP TABLE IF EXISTS `Usuarios_CancionesFav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios_CancionesFav` (
  `idFavoritos` int unsigned NOT NULL AUTO_INCREMENT,
  `idUsuario` int unsigned DEFAULT NULL,
  `idCancion` int unsigned DEFAULT NULL,
  PRIMARY KEY (`idFavoritos`),
  KEY `inx_idUsuarios` (`idUsuario`),
  KEY `inx_idCanciones` (`idCancion`),
  CONSTRAINT `fk_UsuCancF_idCanciones` FOREIGN KEY (`idCancion`) REFERENCES `Canciones` (`idCanciones`),
  CONSTRAINT `fk_UsuCancF_idUsuarios` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios_CancionesFav`
--

LOCK TABLES `Usuarios_CancionesFav` WRITE;
/*!40000 ALTER TABLE `Usuarios_CancionesFav` DISABLE KEYS */;
INSERT INTO `Usuarios_CancionesFav` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
/*!40000 ALTER TABLE `Usuarios_CancionesFav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios_Seguimientos_Artistas`
--

DROP TABLE IF EXISTS `Usuarios_Seguimientos_Artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios_Seguimientos_Artistas` (
  `idSeguimientos` int unsigned NOT NULL AUTO_INCREMENT,
  `idUsuario` int unsigned DEFAULT NULL,
  `idArtista` int unsigned DEFAULT NULL,
  PRIMARY KEY (`idSeguimientos`),
  KEY `inx_idUsuarios` (`idUsuario`) /*!80000 INVISIBLE */,
  KEY `inx_idArtistas` (`idArtista`),
  CONSTRAINT `fk_UsuSegu_idArtistas` FOREIGN KEY (`idArtista`) REFERENCES `Artistas` (`idArtistas`),
  CONSTRAINT `fk_UsuSegu_idUsuarios` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios_Seguimientos_Artistas`
--

LOCK TABLES `Usuarios_Seguimientos_Artistas` WRITE;
/*!40000 ALTER TABLE `Usuarios_Seguimientos_Artistas` DISABLE KEYS */;
INSERT INTO `Usuarios_Seguimientos_Artistas` VALUES (1,1,2),(2,1,3),(3,1,4),(4,1,5);
/*!40000 ALTER TABLE `Usuarios_Seguimientos_Artistas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-17 10:52:45
-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 192.168.1.12    Database: M703Youtube
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `Canales`
--

DROP TABLE IF EXISTS `Canales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Canales` (
  `idCanales` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  PRIMARY KEY (`idCanales`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Canales`
--

LOCK TABLES `Canales` WRITE;
/*!40000 ALTER TABLE `Canales` DISABLE KEYS */;
INSERT INTO `Canales` VALUES (1,'Canal info','info general','2021-01-01'),(2,'Canal el tiempo','meteorologia','2021-01-02'),(3,'Canal de viajes','viajes','2021-01-03'),(4,'Canal de aficiones','aficiones','2021-01-04'),(5,'Canal de politica','polictica','2021-01-05');
/*!40000 ALTER TABLE `Canales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comentarios`
--

DROP TABLE IF EXISTS `Comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comentarios` (
  `idComentarios` int unsigned NOT NULL AUTO_INCREMENT,
  `idVideos` int unsigned NOT NULL,
  `comentario` varchar(100) DEFAULT NULL,
  `fechaHora_comentario` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idComentarios`),
  KEY `inx_idVideo2` (`idVideos`),
  CONSTRAINT `fk_idVideos2` FOREIGN KEY (`idVideos`) REFERENCES `Videos` (`idVideos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comentarios`
--

LOCK TABLES `Comentarios` WRITE;
/*!40000 ALTER TABLE `Comentarios` DISABLE KEYS */;
INSERT INTO `Comentarios` VALUES (1,1,'muy bueno, me ha gustado','2021-04-13 12:50:34'),(2,2,'no me gusta nada.','2021-04-13 12:50:34'),(3,3,'esta bien, pero cansa.','2021-04-13 12:51:21'),(4,4,'este tema no me gusta','2021-04-13 12:51:21'),(5,5,'me encanta el motivo del vido','2021-04-13 12:51:21');
/*!40000 ALTER TABLE `Comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ComentariosLikes`
--

DROP TABLE IF EXISTS `ComentariosLikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ComentariosLikes` (
  `idComentariosLikes` int unsigned NOT NULL AUTO_INCREMENT,
  `idComentario` int unsigned DEFAULT NULL,
  `idUsuario` int unsigned DEFAULT NULL,
  `tipo` set('like','dislike') DEFAULT NULL COMMENT 'like o dislike',
  `fechaHora_ComentarioLike` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idComentariosLikes`),
  KEY `inx_idUsuario` (`idUsuario`),
  KEY `inx_idComentario` (`idComentario`),
  CONSTRAINT `fk_idComentario` FOREIGN KEY (`idComentario`) REFERENCES `Comentarios` (`idComentarios`),
  CONSTRAINT `fk_idUsuario3` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ComentariosLikes`
--

LOCK TABLES `ComentariosLikes` WRITE;
/*!40000 ALTER TABLE `ComentariosLikes` DISABLE KEYS */;
INSERT INTO `ComentariosLikes` VALUES (1,1,1,'like','2021-04-13 12:54:19'),(2,2,2,'dislike','2021-04-13 12:57:14'),(3,3,1,'like','2021-04-13 12:57:14'),(4,4,1,'dislike','2021-04-13 12:57:14'),(5,5,3,'dislike','2021-04-13 12:57:14');
/*!40000 ALTER TABLE `ComentariosLikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Etiquetas`
--

DROP TABLE IF EXISTS `Etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Etiquetas` (
  `idEtiquetas` int unsigned NOT NULL AUTO_INCREMENT,
  `idVideos` int unsigned DEFAULT NULL,
  `textoEtiqueta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idEtiquetas`),
  KEY `inx_idVideos` (`idVideos`),
  CONSTRAINT `fk_Eti_idVideos` FOREIGN KEY (`idVideos`) REFERENCES `Videos` (`idVideos`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Etiquetas`
--

LOCK TABLES `Etiquetas` WRITE;
/*!40000 ALTER TABLE `Etiquetas` DISABLE KEYS */;
INSERT INTO `Etiquetas` VALUES (1,1,'me gusta'),(2,2,'no me gusta'),(3,3,'es muy largo'),(4,4,'es muy tonto'),(5,5,'es raro'),(6,5,'la tematica no me gusta');
/*!40000 ALTER TABLE `Etiquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Likes`
--

DROP TABLE IF EXISTS `Likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Likes` (
  `idLikes` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo` set('like','dislike') DEFAULT NULL,
  `fechahora_like` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Usuarios_idUsuarios` int unsigned NOT NULL,
  `Videos_idVideos` int unsigned NOT NULL,
  PRIMARY KEY (`idLikes`,`Usuarios_idUsuarios`,`Videos_idVideos`),
  KEY `fk_Likes_Usuarios1_idx` (`Usuarios_idUsuarios`),
  KEY `fk_Likes_Videos1_idx` (`Videos_idVideos`),
  CONSTRAINT `fk_Likes_Usuarios1` FOREIGN KEY (`Usuarios_idUsuarios`) REFERENCES `Usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Likes`
--

LOCK TABLES `Likes` WRITE;
/*!40000 ALTER TABLE `Likes` DISABLE KEYS */;
INSERT INTO `Likes` VALUES (1,'like','2021-04-13 12:37:06',1,1),(2,'dislike','2021-04-13 12:37:06',1,2),(3,'like','2021-04-13 12:37:06',2,3),(4,'dislike','2021-04-13 12:37:06',2,4),(5,'like','2021-04-13 12:37:06',3,5),(6,'dislike','2021-04-13 12:37:06',3,6);
/*!40000 ALTER TABLE `Likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Playlist_videos`
--

DROP TABLE IF EXISTS `Playlist_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Playlist_videos` (
  `idPlayListVideos` int unsigned NOT NULL AUTO_INCREMENT,
  `idPlayList` int unsigned DEFAULT NULL,
  `idVideos` int unsigned DEFAULT NULL,
  PRIMARY KEY (`idPlayListVideos`),
  KEY `idPlaylist` (`idPlayList`) /*!80000 INVISIBLE */,
  KEY `idVideos` (`idVideos`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_PlayVid_idVideos` FOREIGN KEY (`idVideos`) REFERENCES `Videos` (`idVideos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Playlist_videos`
--

LOCK TABLES `Playlist_videos` WRITE;
/*!40000 ALTER TABLE `Playlist_videos` DISABLE KEYS */;
INSERT INTO `Playlist_videos` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,3,5);
/*!40000 ALTER TABLE `Playlist_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Playlists`
--

DROP TABLE IF EXISTS `Playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Playlists` (
  `idPlaylists` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `estado` set('publica','privada') DEFAULT NULL COMMENT 'publica o privada',
  `idPlayVid` int unsigned NOT NULL,
  PRIMARY KEY (`idPlaylists`),
  KEY `inx_idPlayVid` (`idPlayVid`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_idPlayVid` FOREIGN KEY (`idPlayVid`) REFERENCES `Playlist_videos` (`idPlayListVideos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Playlists`
--

LOCK TABLES `Playlists` WRITE;
/*!40000 ALTER TABLE `Playlists` DISABLE KEYS */;
INSERT INTO `Playlists` VALUES (1,'mi playlist 1','2021-01-01','publica',1),(2,'mi playlist 2','2021-01-02','publica',1),(3,'mi playlist 3','2021-01-03','publica',2);
/*!40000 ALTER TABLE `Playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `idUsuarios` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` set('hombre','mujer') DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL COMMENT 'Zip code',
  `Canales_idCanales` int unsigned NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  KEY `fk_Usuarios_Canales1_idx` (`Canales_idCanales`),
  CONSTRAINT `fk_Usuarios_Canales1` FOREIGN KEY (`Canales_idCanales`) REFERENCES `Canales` (`idCanales`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (1,'Jose','jose@gmail.com','1234','jose1234','1970-01-01','hombre','España','08001',1),(2,'Maria','maraia@gmail.com','1234','maria1234','1970-01-02','mujer','España','08002',2),(3,'Antonio','antonio@gmail.com','1234','antonio1234','1970-01-03','hombre','España','08003',3),(4,'Raquel','raquel@gmail.com','1234','raquel1234','1970-01-04','mujer','España','08004',4),(5,'Juan','juan@gmail.com','1234','juan1234','1970-01-05','hombre','España','08005',5);
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Videos`
--

DROP TABLE IF EXISTS `Videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Videos` (
  `idVideos` int unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `tamaño` int DEFAULT NULL COMMENT 'en Kb',
  `nombre_archivo` varchar(50) DEFAULT NULL,
  `duracion` int DEFAULT NULL COMMENT 'duracion del video en minutos.',
  `miniatura` varchar(100) DEFAULT NULL,
  `num_reproducciones` int unsigned DEFAULT NULL,
  `likes` int unsigned DEFAULT NULL,
  `dislikes` int unsigned DEFAULT NULL,
  `estado` set('publico','oculto','privado') DEFAULT NULL,
  `idEtiquetas` int DEFAULT NULL,
  `idUsuarios` varchar(45) DEFAULT NULL,
  `FechaHoraPublicacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Usuarios_idUsuarios` int unsigned NOT NULL,
  PRIMARY KEY (`idVideos`,`Usuarios_idUsuarios`),
  KEY `fk_Videos_Usuarios1_idx` (`Usuarios_idUsuarios`),
  CONSTRAINT `fk_Videos_Usuarios1` FOREIGN KEY (`Usuarios_idUsuarios`) REFERENCES `Usuarios` (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Videos`
--

LOCK TABLES `Videos` WRITE;
/*!40000 ALTER TABLE `Videos` DISABLE KEYS */;
INSERT INTO `Videos` VALUES (1,'gatito','gatito simpatico',1,'gatito.mp4',2,'/vid/mini/miniGatito.jpg',25,1,1,'publico',NULL,NULL,'2021-04-13 11:54:46',1),(2,'perrito','perrito simpatico',2,'perrito.mp4',2,'/vid/mini/miniPerrito.jpg',30,1,1,'oculto',NULL,NULL,'2021-04-13 11:55:57',1),(3,'caballito','potro simpatico',1,'caballito.mp4',2,'/vid/mini/miniCaballo.jpg',45,1,1,'privado',NULL,NULL,'2021-04-13 12:01:37',2),(4,'peces','peces de colores',1,'peces.mp4',2,'/vid/mini/miniPeces.jpg',64,1,1,'publico',NULL,NULL,'2021-04-13 12:02:51',2),(5,'pajaritos','pajaros cantando',1,'pajaros.mp4',2,'/vid/mini/miniPajaros.jpg',23,1,1,'oculto',NULL,NULL,'2021-04-13 12:03:50',3),(6,'reptiles','reptiles en terrario',1,'araña.mp4',3,'/vid/mini/miniRep.jpg',12,2,1,'publico',NULL,NULL,'2021-04-13 12:04:52',3);
/*!40000 ALTER TABLE `Videos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-17 10:52:46
