-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 192.168.1.12    Database: M702Pizzeria
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
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `cp` varchar(5) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `Poblaciones_idPoblaciones` int unsigned NOT NULL,
  PRIMARY KEY (`idClientes`,`Poblaciones_idPoblaciones`),
  KEY `fk_Clientes_Poblaciones1_idx` (`Poblaciones_idPoblaciones`),
  CONSTRAINT `fk_Clientes_Poblaciones1` FOREIGN KEY (`Poblaciones_idPoblaciones`) REFERENCES `Poblaciones` (`idPoblaciones`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES (1,'Jorge','Rodriguez','Diagonal','08001','931234567',1),(2,'Antonio','Garcia','Constitucion','08002','931234567',2),(3,'Maria','Gonzalez','Entenza','08003','931234567',3),(4,'Carmen','Fernandez','Diagonal','08004','931234567',4),(5,'Julia','Lopez','Paso de Gracia','08005','931234567',5);
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
  `apellidos` varchar(50) NOT NULL,
  `nif` varchar(50) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `tipo_trabajo` set('cocinero','repartidor') DEFAULT NULL,
  `Tiendas_idTiendas` int unsigned NOT NULL,
  PRIMARY KEY (`idEmpleados`),
  KEY `fk_Empleados_Tiendas1_idx` (`Tiendas_idTiendas`),
  CONSTRAINT `fk_Empleados_Tiendas1` FOREIGN KEY (`Tiendas_idTiendas`) REFERENCES `Tiendas` (`idTiendas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados`
--

LOCK TABLES `Empleados` WRITE;
/*!40000 ALTER TABLE `Empleados` DISABLE KEYS */;
INSERT INTO `Empleados` VALUES (1,'Antonio','Fernandez','12345678A','931234567','repartidor',1),(2,'Jose','Lopez','12345678B','931234567','cocinero',1),(3,'Maria','Bonilla','12345678C','931234567','repartidor',2),(4,'Antonia','Sanz','12345678D','931234567','cocinero',2),(5,'Fernando','Solas','12345678E','931234567','repartidor',3);
/*!40000 ALTER TABLE `Empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedidos`
--

DROP TABLE IF EXISTS `Pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedidos` (
  `idPedidos` int unsigned NOT NULL AUTO_INCREMENT,
  `fechaHoraCreacion` timestamp NULL DEFAULT NULL,
  `domicilio_tienda` set('domicilio','tienda') DEFAULT NULL,
  `num_productos` int DEFAULT NULL,
  `tipo_pizza` int unsigned DEFAULT NULL,
  `tipo_hamburguesa` int unsigned DEFAULT NULL,
  `tipo_bebida` int unsigned DEFAULT NULL,
  `precio_total` float DEFAULT NULL,
  `idCliente` int unsigned DEFAULT NULL,
  `idTienda` int unsigned DEFAULT NULL,
  `Empleados_idEmpleados` int unsigned DEFAULT NULL,
  PRIMARY KEY (`idPedidos`),
  KEY `inx_cliente` (`idCliente`),
  KEY `inx_tienda` (`idTienda`),
  KEY `fk_Pedidos_Empleados1_idx` (`Empleados_idEmpleados`),
  CONSTRAINT `fk_clientes` FOREIGN KEY (`idCliente`) REFERENCES `Clientes` (`idClientes`),
  CONSTRAINT `fk_Pedidos_Empleados1` FOREIGN KEY (`Empleados_idEmpleados`) REFERENCES `Empleados` (`idEmpleados`),
  CONSTRAINT `fk_tienda` FOREIGN KEY (`idTienda`) REFERENCES `Tiendas` (`idTiendas`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedidos`
--

LOCK TABLES `Pedidos` WRITE;
/*!40000 ALTER TABLE `Pedidos` DISABLE KEYS */;
INSERT INTO `Pedidos` VALUES (1,'2021-02-28 22:00:00','domicilio',2,1,0,1,10,1,1,1),(8,'2021-03-01 22:00:00','tienda',4,2,1,1,20,2,1,1),(9,'2021-03-02 22:00:00','domicilio',2,2,0,0,8,3,2,2),(10,'2021-03-03 22:00:00','tienda',3,2,2,4,25,4,2,2),(11,'2021-03-04 22:00:00','domicilio',3,1,2,0,20,5,3,3);
/*!40000 ALTER TABLE `Pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PedidosDetalle`
--

DROP TABLE IF EXISTS `PedidosDetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PedidosDetalle` (
  `idPedidosDetalle` int NOT NULL AUTO_INCREMENT,
  `idPedido` int unsigned DEFAULT NULL,
  `articulo` int unsigned DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precioUnitario` decimal(5,2) DEFAULT NULL,
  `precioTotal` decimal(5,3) DEFAULT NULL,
  PRIMARY KEY (`idPedidosDetalle`),
  KEY `inx_articulo` (`articulo`),
  KEY `inx_pedido` (`idPedido`),
  CONSTRAINT `fk_idArticulo` FOREIGN KEY (`articulo`) REFERENCES `Productos` (`idProductos`),
  CONSTRAINT `fk_idPedido` FOREIGN KEY (`idPedido`) REFERENCES `Pedidos` (`idPedidos`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PedidosDetalle`
--

LOCK TABLES `PedidosDetalle` WRITE;
/*!40000 ALTER TABLE `PedidosDetalle` DISABLE KEYS */;
INSERT INTO `PedidosDetalle` VALUES (1,1,1,2,5.00,10.000),(2,1,2,1,1.50,3.000),(7,1,3,1,3.51,3.500),(8,8,4,1,3.00,3.000),(9,8,6,2,1.50,3.000),(10,8,7,2,5.00,10.000);
/*!40000 ALTER TABLE `PedidosDetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pizzas`
--

DROP TABLE IF EXISTS `Pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pizzas` (
  `idPizzas` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `categoria` int unsigned DEFAULT NULL,
  `estado` set('activa','desactivada') NOT NULL COMMENT 'si la pizza esta activa o desactivada.',
  `PizzasCategorias_idPizzasCategorias` int unsigned NOT NULL,
  PRIMARY KEY (`idPizzas`,`estado`),
  KEY `fk_Pizzas_PizzasCategorias1_idx` (`PizzasCategorias_idPizzasCategorias`),
  CONSTRAINT `fk_Pizzas_PizzasCategorias1` FOREIGN KEY (`PizzasCategorias_idPizzasCategorias`) REFERENCES `PizzasCategorias` (`idPizzasCategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pizzas`
--

LOCK TABLES `Pizzas` WRITE;
/*!40000 ALTER TABLE `Pizzas` DISABLE KEYS */;
INSERT INTO `Pizzas` VALUES (1,'Carbonara','carbonara',2,'activa',2),(2,'4 estaciones','4 estaciones',2,'activa',2),(3,'4 quesos','4 quesos',2,'activa',3),(4,'6 quesos','6 quesos',3,'activa',3),(5,'Hawaiana','Hawaiana',3,'activa',1),(7,'Barbacoa','Barbacoa',3,'activa',4),(8,'Mexicana','Mexicana',4,'desactivada',4),(9,'Vegi','Vegetariana',1,'activa',5);
/*!40000 ALTER TABLE `Pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PizzasCategorias`
--

DROP TABLE IF EXISTS `PizzasCategorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PizzasCategorias` (
  `idPizzasCategorias` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPizzasCategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PizzasCategorias`
--

LOCK TABLES `PizzasCategorias` WRITE;
/*!40000 ALTER TABLE `PizzasCategorias` DISABLE KEYS */;
INSERT INTO `PizzasCategorias` VALUES (1,'vegetaria'),(2,'2 ingredientes Grande'),(3,'3 ingredientes Grande'),(4,'2 ingredientes Mediana'),(5,'3 ingredientes Mediana');
/*!40000 ALTER TABLE `PizzasCategorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Poblaciones`
--

DROP TABLE IF EXISTS `Poblaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Poblaciones` (
  `idPoblaciones` int unsigned NOT NULL AUTO_INCREMENT,
  `poblacion` varchar(50) DEFAULT NULL,
  `idProvincia` int unsigned DEFAULT NULL,
  PRIMARY KEY (`idPoblaciones`),
  KEY `inx_provincias` (`idProvincia`),
  CONSTRAINT `fk_provincias` FOREIGN KEY (`idProvincia`) REFERENCES `Provincias` (`idProvincias`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Poblaciones`
--

LOCK TABLES `Poblaciones` WRITE;
/*!40000 ALTER TABLE `Poblaciones` DISABLE KEYS */;
INSERT INTO `Poblaciones` VALUES (1,'Barcelona',1),(2,'Hospitalet',1),(3,'Sant Feliu',1),(4,'Santa Coloma',1),(5,'Cornella',1);
/*!40000 ALTER TABLE `Poblaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Productos` (
  `idProductos` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `tipo` set('pizza','hamburguesa','bebida') DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `imagen_url` varchar(100) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  PRIMARY KEY (`idProductos`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES (1,'Hawaiana','pizza','pizza hawaiana','/etc/www/img/pizza1.jpg',5),(2,'Cocacola','bebida','lata cocacola','/etc/www/img/coca1.jpg',1.5),(3,'Hamburguesa grande','hamburguesa','hamburguesa grande','/etc/www/img/hamG.jpg',3.5),(4,'Hamburguesa mediana','hamburguesa','hamburguesa mediana','/etc/www/img/hamM.jpg',3),(5,'Hamburguesa pequeña','hamburguesa','hamburguesa pequeña','/etc/www/img/hamP.jpg',2.5),(6,'Fanta Naranja','bebida','lata fanta','/etc/www/img/fanta.jpg',1.5),(7,'Mexicana','pizza','pizza Mejicana','/etc/www/img/pizza2.jpg',5),(8,'Fanta Limon','bebida','lata fanta','/etc/www/img/fanta1.jpt',1.5);
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provincias`
--

DROP TABLE IF EXISTS `Provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Provincias` (
  `idProvincias` int unsigned NOT NULL AUTO_INCREMENT,
  `provincia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProvincias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provincias`
--

LOCK TABLES `Provincias` WRITE;
/*!40000 ALTER TABLE `Provincias` DISABLE KEYS */;
INSERT INTO `Provincias` VALUES (1,'Barcelona'),(2,'Tarragona'),(3,'Leridad'),(4,'Gerona');
/*!40000 ALTER TABLE `Provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Repartos_a_domicilio`
--

DROP TABLE IF EXISTS `Repartos_a_domicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Repartos_a_domicilio` (
  `idRepartos_a_domicilio` int unsigned NOT NULL AUTO_INCREMENT,
  `FechaHora_entrega` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idRepartos_a_domicilio`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Repartos_a_domicilio`
--

LOCK TABLES `Repartos_a_domicilio` WRITE;
/*!40000 ALTER TABLE `Repartos_a_domicilio` DISABLE KEYS */;
INSERT INTO `Repartos_a_domicilio` VALUES (1,'2021-03-01 12:13:59'),(2,'2021-03-02 12:14:52'),(3,'2021-03-03 12:15:52'),(4,'2021-03-04 12:16:52'),(5,'2021-03-05 12:17:52'),(6,'2021-03-06 12:18:52'),(7,'2021-03-06 12:18:52'),(8,'2021-03-06 12:18:52');
/*!40000 ALTER TABLE `Repartos_a_domicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tiendas`
--

DROP TABLE IF EXISTS `Tiendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tiendas` (
  `idTiendas` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `cp` varchar(5) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `Poblaciones_idPoblaciones` int unsigned NOT NULL,
  PRIMARY KEY (`idTiendas`),
  KEY `fk_Tiendas_Poblaciones1_idx` (`Poblaciones_idPoblaciones`),
  CONSTRAINT `fk_Tiendas_Poblaciones1` FOREIGN KEY (`Poblaciones_idPoblaciones`) REFERENCES `Poblaciones` (`idPoblaciones`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tiendas`
--

LOCK TABLES `Tiendas` WRITE;
/*!40000 ALTER TABLE `Tiendas` DISABLE KEYS */;
INSERT INTO `Tiendas` VALUES (1,'Barcelona centro','Plaza Cataluña','08001','931234567',1),(2,'Hospitalet','Plaza del Ayuntamiento','08002','931234567',2),(3,'Santa Coloma cntro Comer','Plaza Mayor','08003','931234567',4),(4,'Sant Feliu calle','Sant Feliu','08004','931234567',3),(5,'Cornella terraza','Sant Ildefonso','08005','931234567',5);
/*!40000 ALTER TABLE `Tiendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-17 10:51:30
