-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 192.168.1.12    Database: M701Optica
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
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clientes` (
  `idClientes` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `direccion_postal` varchar(50) DEFAULT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cliente_recomendado` int unsigned DEFAULT NULL,
  PRIMARY KEY (`idClientes`),
  KEY `fk_Clientes_Clientes1_idx` (`cliente_recomendado`),
  CONSTRAINT `fk_Clientes_Clientes1` FOREIGN KEY (`cliente_recomendado`) REFERENCES `Clientes` (`idClientes`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (16,'María Carmen','C Granvia','931231231','correo1@correo.com','2019-12-31 22:00:00',NULL),(17,'José Luis ','C Entenza','931231232','correo2@correo.com','2020-01-01 22:00:00',NULL),(18,'Daniel','C Bailen','931231233','correo3@correo.com','2020-01-02 22:00:00',NULL),(19,'Isabel','C Constitucion','931231234','correo4@correo.com','2020-01-03 22:00:00',NULL),(20,'Javier','Las Ramblas','931231235','correo5@correo.com','2020-04-04 20:00:00',NULL);
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados`
--

DROP TABLE IF EXISTS `Empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleados` (
  `idEmpleados` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  PRIMARY KEY (`idEmpleados`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados`
--

LOCK TABLES `Empleados` WRITE;
/*!40000 ALTER TABLE `Empleados` DISABLE KEYS */;
INSERT INTO `Empleados` VALUES (30,'Antonio','Empleado'),(31,'José ','Empleado'),(32,'Francisco ','Empleado'),(33,'David','Responsable'),(34,'Javier','Empleado');
/*!40000 ALTER TABLE `Empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gafas`
--

DROP TABLE IF EXISTS `Gafas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gafas` (
  `idGafas` int unsigned NOT NULL AUTO_INCREMENT,
  `modelo` varchar(50) NOT NULL,
  `graduacion_der` float NOT NULL,
  `graducacion_izq` float NOT NULL,
  `tipo_de_montura` enum('flotante','pasta','metalica') DEFAULT NULL,
  `color_de_la_montura` varchar(50) DEFAULT NULL,
  `color_vidrio_der` varchar(50) DEFAULT NULL,
  `color_vidrio_izq` varchar(50) DEFAULT NULL,
  `precio` float NOT NULL,
  `idEmpleado` int unsigned DEFAULT NULL,
  `idClientes` int unsigned DEFAULT NULL,
  `Marcas_idMarcas` int(10) unsigned zerofill NOT NULL,
  `Marcas_Proveedores_idProveedores` int unsigned NOT NULL,
  PRIMARY KEY (`idGafas`),
  KEY `idx_empleados` (`idEmpleado`),
  KEY `inx_clientes` (`idClientes`),
  KEY `fk_Gafas_Marcas1_idx` (`Marcas_idMarcas`,`Marcas_Proveedores_idProveedores`),
  CONSTRAINT `fk_clientes` FOREIGN KEY (`idClientes`) REFERENCES `Clientes` (`idClientes`),
  CONSTRAINT `fk_empleados` FOREIGN KEY (`idEmpleado`) REFERENCES `Empleados` (`idEmpleados`),
  CONSTRAINT `fk_Gafas_Marcas1` FOREIGN KEY (`Marcas_idMarcas`, `Marcas_Proveedores_idProveedores`) REFERENCES `Marcas` (`idMarcas`, `Proveedores_idProveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gafas`
--

LOCK TABLES `Gafas` WRITE;
/*!40000 ALTER TABLE `Gafas` DISABLE KEYS */;
INSERT INTO `Gafas` VALUES (26,'Modelo 1',1,0,'flotante','azul metalizado','azulado','azulado',150,30,16,0000000000,0),(27,'Modelo 2',0,1,'flotante','verde','sin color','sin color',110,30,17,0000000000,0),(28,'Modelo 1',1,1.5,'pasta','pulimentado','espejado','espejado',200,31,18,0000000000,0),(29,'Modelo 2',1,1.5,'pasta','pulido','sin color','sin color',100,31,19,0000000000,0),(30,'Modelo 25',0,1.75,'metalica','titanio','espejado','espejado',250,32,20,0000000000,0);
/*!40000 ALTER TABLE `Gafas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marcas`
--

DROP TABLE IF EXISTS `Marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Marcas` (
  `idMarcas` int(10) unsigned zerofill NOT NULL,
  `Descricion` varchar(50) DEFAULT NULL,
  `Proveedores_idProveedores` int unsigned NOT NULL,
  PRIMARY KEY (`idMarcas`,`Proveedores_idProveedores`),
  KEY `fk_Marcas_Proveedores1_idx` (`Proveedores_idProveedores`),
  CONSTRAINT `fk_Marcas_Proveedores1` FOREIGN KEY (`Proveedores_idProveedores`) REFERENCES `Proveedores` (`idProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marcas`
--

LOCK TABLES `Marcas` WRITE;
/*!40000 ALTER TABLE `Marcas` DISABLE KEYS */;
INSERT INTO `Marcas` VALUES (0000000001,'Ray-Ban',22),(0000000002,'Oakley',23),(0000000003,'Carrera',24),(0000000004,'Arnette',25),(0000000005,'Police',26);
/*!40000 ALTER TABLE `Marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proveedores` (
  `idProveedores` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numero` int DEFAULT NULL,
  `piso` varchar(5) DEFAULT NULL,
  `puerta` varchar(5) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `codigo_postal` varchar(5) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `fax` varchar(9) DEFAULT NULL,
  `nif` varchar(9) NOT NULL,
  PRIMARY KEY (`idProveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES (22,'Ray-Ban','Paseo de Gracia',12,'1','1','Barcelona','08014','España','931231231','931231231','12345678A'),(23,'Oakley','Avd. Diagonal',13,'1','1','Barcelona','08015','España','931231232','931231232','12345678A'),(24,'Carrera','Gran Via',14,'1','1','Barcelona','08016','España','931231233','931231233','12345678A'),(25,'Arnette','Rbla Cataluña',15,'1','1','Barcelona','08017','España','931231234','931231234','12345678A'),(26,'Police','Crta. Santas',16,'1','1','Barcelona','08018','España','931231235','931231235','12345678A');
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ventas`
--

DROP TABLE IF EXISTS `Ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ventas` (
  `idVentas` int unsigned NOT NULL AUTO_INCREMENT,
  `Gafas_idGafas` int unsigned NOT NULL,
  `Empleados_idEmpleados` int unsigned NOT NULL,
  `Clientes_idClientes` int unsigned NOT NULL,
  PRIMARY KEY (`idVentas`),
  KEY `fk_Ventas_Gafas1_idx` (`Gafas_idGafas`),
  KEY `fk_Ventas_Empleados1_idx` (`Empleados_idEmpleados`),
  KEY `fk_Ventas_Clientes1_idx` (`Clientes_idClientes`),
  CONSTRAINT `fk_Ventas_Clientes1` FOREIGN KEY (`Clientes_idClientes`) REFERENCES `Clientes` (`idClientes`),
  CONSTRAINT `fk_Ventas_Empleados1` FOREIGN KEY (`Empleados_idEmpleados`) REFERENCES `Empleados` (`idEmpleados`),
  CONSTRAINT `fk_Ventas_Gafas1` FOREIGN KEY (`Gafas_idGafas`) REFERENCES `Gafas` (`idGafas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ventas`
--

LOCK TABLES `Ventas` WRITE;
/*!40000 ALTER TABLE `Ventas` DISABLE KEYS */;
INSERT INTO `Ventas` VALUES (1,26,30,16),(2,27,31,17),(3,28,32,18),(4,29,33,19),(5,30,34,20);
/*!40000 ALTER TABLE `Ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-17 10:50:50
