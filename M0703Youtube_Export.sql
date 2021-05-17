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

-- Dump completed on 2021-05-17 10:52:09
