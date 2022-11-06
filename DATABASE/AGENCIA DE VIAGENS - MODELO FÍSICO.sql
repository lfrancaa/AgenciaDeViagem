-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: agenciadeviagens
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `destino`
--

DROP TABLE IF EXISTS `destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destino` (
  `id_destino` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `imagem` longblob,
  `local_viagem` varchar(255) NOT NULL,
  `valor_viagem` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id_destino`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destino`
--

LOCK TABLES `destino` WRITE;
/*!40000 ALTER TABLE `destino` DISABLE KEYS */;
/*!40000 ALTER TABLE `destino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `id_hotel` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `imagem` longblob,
  `local_hotel` varchar(255) NOT NULL,
  `valor_hospedagem` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id_hotel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passageiro`
--

DROP TABLE IF EXISTS `passageiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passageiro` (
  `id_passageiro` bigint NOT NULL AUTO_INCREMENT,
  `cep` varchar(255) NOT NULL,
  `complemento` varchar(255) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `data_nascimento` date NOT NULL,
  `email` varchar(80) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `rg` varchar(15) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  PRIMARY KEY (`id_passageiro`),
  UNIQUE KEY `UK_mrh5vr5dg67o5rj2hvc7i6mmq` (`cpf`),
  UNIQUE KEY `UK_rdsa7xdljp8s1nmdxe581ry80` (`email`),
  UNIQUE KEY `UK_6wwd7nut79o5r6pinfu09eb0q` (`rg`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passageiro`
--

LOCK TABLES `passageiro` WRITE;
/*!40000 ALTER TABLE `passageiro` DISABLE KEYS */;
INSERT INTO `passageiro` VALUES (1,'12346-353','Recanto dos Humildes','1234567890','2001-06-10','luciano@gmail.com','11111-111','Rua Joao,São Paulo','Luciano','12345678','abc123','11123456789');
/*!40000 ALTER TABLE `passageiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passagem`
--

DROP TABLE IF EXISTS `passagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passagem` (
  `id_passagem` bigint NOT NULL AUTO_INCREMENT,
  `data_viagem_ida` date NOT NULL,
  `data_viagem_volta` date NOT NULL,
  `nome` varchar(255) NOT NULL,
  `nome_local_destino` varchar(255) NOT NULL,
  `nome_local_origem` varchar(255) NOT NULL,
  `id_destino_fk` bigint NOT NULL,
  `id_hotel_fk` bigint NOT NULL,
  `id_passageiro_fk` bigint NOT NULL,
  `id_promocao_fk` bigint NOT NULL,
  `id_voo_fk` bigint NOT NULL,
  PRIMARY KEY (`id_passagem`),
  KEY `FK3gaitmxqeavaqe0oxlg63jjk2` (`id_destino_fk`),
  KEY `FKnfadu6lpv4pcsppm829mr5iep` (`id_hotel_fk`),
  KEY `FK34h0l6uy8ntgbudrn9gs8k5yw` (`id_passageiro_fk`),
  KEY `FKpvdlntjl43unyu6eaqk6ydwch` (`id_promocao_fk`),
  KEY `FKif091oxmq0dn56b4ryxiwj5s8` (`id_voo_fk`),
	CONSTRAINT `FK3gaitmxqeavaqe0oxlg63jjk2` FOREIGN KEY (`id_destino_fk`) REFERENCES `destino` (`id_destino`),
	CONSTRAINT `FKnfadu6lpv4pcsppm829mr5iep` FOREIGN KEY (`id_hotel_fk`) REFERENCES `hotel` (`id_hotel`),
    CONSTRAINT `FK34h0l6uy8ntgbudrn9gs8k5yw` FOREIGN KEY (`id_passageiro_fk`) REFERENCES `passageiro` (`id_passageiro`),
    CONSTRAINT `FKpvdlntjl43unyu6eaqk6ydwch` FOREIGN KEY (`id_promocao_fk`) REFERENCES `promocao` (`id_promocao`),
    CONSTRAINT `FKif091oxmq0dn56b4ryxiwj5s8` FOREIGN KEY (`id_voo_fk`) REFERENCES `voo` (`id_voo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passagem`
--

LOCK TABLES `passagem` WRITE;
/*!40000 ALTER TABLE `passagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `passagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocao`
--

DROP TABLE IF EXISTS `promocao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promocao` (
  `id_promocao` bigint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `imagem` longblob,
  `local_viagem` varchar(255) NOT NULL,
  `valor_viagem` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id_promocao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocao`
--

LOCK TABLES `promocao` WRITE;
/*!40000 ALTER TABLE `promocao` DISABLE KEYS */;
/*!40000 ALTER TABLE `promocao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voo`
--

DROP TABLE IF EXISTS `voo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voo` (
  `id_voo` bigint NOT NULL AUTO_INCREMENT,
  `chegada` date NOT NULL,
  `destino` varchar(255) NOT NULL,
  `imagem` longblob,
  `origem` varchar(255) NOT NULL,
  `paradas` int NOT NULL,
  `partida` date NOT NULL,
  `valor_voo` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id_voo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voo`
--

LOCK TABLES `voo` WRITE;
/*!40000 ALTER TABLE `voo` DISABLE KEYS */;
/*!40000 ALTER TABLE `voo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-23 21:42:25
