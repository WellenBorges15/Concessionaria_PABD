-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `carrinho`
--

DROP TABLE IF EXISTS `carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrinho` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `cpf_cliente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_carrinho_cliente_idx` (`cpf_cliente`),
  CONSTRAINT `fk_carrinho_cliente` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinho`
--

LOCK TABLES `carrinho` WRITE;
/*!40000 ALTER TABLE `carrinho` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrinho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrinhoproduto`
--

DROP TABLE IF EXISTS `carrinhoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrinhoproduto` (
  `id_produto` int NOT NULL,
  `id_carrinho` int NOT NULL,
  `qntd` int NOT NULL,
  PRIMARY KEY (`id_produto`,`id_carrinho`),
  KEY `fk_carrinho_produto_idx` (`id_produto`),
  KEY `fk_produto_carrinho_idx` (`id_carrinho`),
  CONSTRAINT `fk_carrinho_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`ID`),
  CONSTRAINT `fk_produto_carrinho` FOREIGN KEY (`id_carrinho`) REFERENCES `carrinho` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinhoproduto`
--

LOCK TABLES `carrinhoproduto` WRITE;
/*!40000 ALTER TABLE `carrinhoproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrinhoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CPF` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE KEY `CPF_UNIQUE` (`CPF`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('111.222.333-44','Carlos Santos','carlos@email.com','minhasenha'),('123.456.789-09','João Silva','joao@email.com','senha123'),('222.333.444-55','Camila Almeida','camila@email.com','senhacamila'),('333.222.111-00','Julia Mendes','julia@email.com','senha789'),('444.555.666-77','Lucas Lima','lucas@email.com','senhalucas'),('555.666.777-88','Ana Pereira','ana@email.com','senha456'),('666.777.888-99','Fernando Costa','fernando@email.com','senha987'),('888.999.000-11','Amanda Santos','amanda@email.com','senhaamanda'),('987.654.321-00','Maria Oliveira','maria@email.com','senhabcde'),('999.888.777-66','Roberto Souza','roberto@email.com','outrasenha');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecocliente`
--

DROP TABLE IF EXISTS `enderecocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecocliente` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `cidade` varchar(45) NOT NULL,
  `CEP` varchar(45) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `cpf_cliente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idcliente_idx` (`cpf_cliente`),
  CONSTRAINT `idcliente` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecocliente`
--

LOCK TABLES `enderecocliente` WRITE;
/*!40000 ALTER TABLE `enderecocliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `enderecocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecofuncionario`
--

DROP TABLE IF EXISTS `enderecofuncionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecofuncionario` (
  `enderecoID` int NOT NULL AUTO_INCREMENT,
  `cidade` varchar(45) NOT NULL,
  `CEP` varchar(45) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `cpf_funcionario` varchar(45) NOT NULL,
  PRIMARY KEY (`enderecoID`),
  KEY `idfornecedor_idx` (`cpf_funcionario`),
  CONSTRAINT `idfornecedor0` FOREIGN KEY (`cpf_funcionario`) REFERENCES `funcionario` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecofuncionario`
--

LOCK TABLES `enderecofuncionario` WRITE;
/*!40000 ALTER TABLE `enderecofuncionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `enderecofuncionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `CPF` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `id_produto` int DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `CNPJ_UNIQUE` (`CPF`),
  KEY `idproduto_idx` (`id_produto`),
  CONSTRAINT `idproduto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagens`
--

DROP TABLE IF EXISTS `imagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagens` (
  `id` int NOT NULL,
  `diretorio` varchar(80) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `id_produto` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_imagens_produto_idx` (`id_produto`),
  CONSTRAINT `fk_imagens_produto` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagens`
--

LOCK TABLES `imagens` WRITE;
/*!40000 ALTER TABLE `imagens` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `ano` year NOT NULL,
  `marca` varchar(45) NOT NULL,
  `cor` varchar(45) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `preco` float NOT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `estoque` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12350 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Uno',2022,'Fiat','Vermelho','Hatchback',50000,'Compacto e econômico.',10),(2,'Gol',2023,'Volkswagen','Azul','Hatchback',60000,'Versátil e confiável.',15),(3,'C3',2021,'Citroën','Preto','Compacto',45000,'Design moderno e eficiente.',8),(4,'Corolla',2022,'Toyota','Branco','Sedan',70000,'Conforto e tecnologia.',12),(5,'Onix',2023,'Chevrolet','Prata','Hatchback',55000,'Estilo e conectividade.',20),(6,'Renegade',2022,'Jeep','Verde','SUV',75000,'Aventura com estilo.',18),(7,'208',2023,'Peugeot','Cinza','Hatchback',48000,'Elegância urbana.',14),(8,'Tucson',2021,'Hyundai','Marrom','SUV',68000,'Robusto e confortável.',10),(9,'EcoSport',2022,'Ford','Laranja','SUV',62000,'Aventure-se com estilo.',16),(10,'Civic',2023,'Honda','Amarelo','Sedan',72000,'Performance e sofisticação.',13),(12346,'palio',2008,'fiat','preto','hatch',35000,'confortável',5),(12347,'Jeep Compass',2022,'Jeep','Preto','SUV',160000,'elegante e confortável',10),(12348,'fiat toro',2020,'fiat','branco','picape',144000,'Bonito',2),(12349,'Mobi',2023,'Fiat','Branco','Hat',45000,'Fiat Mobi Branco 2023 sljfhlkjdfbSLKJ',1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonecliente`
--

DROP TABLE IF EXISTS `telefonecliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonecliente` (
  `telefone` varchar(15) NOT NULL,
  `cpf_cliente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`telefone`),
  KEY `cliente_idx` (`cpf_cliente`),
  CONSTRAINT `fk_telefone_cliente` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonecliente`
--

LOCK TABLES `telefonecliente` WRITE;
/*!40000 ALTER TABLE `telefonecliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefonecliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefonefuncionario`
--

DROP TABLE IF EXISTS `telefonefuncionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefonefuncionario` (
  `telefone` varchar(15) NOT NULL,
  `CPF_funcionario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`telefone`),
  KEY `fk_telefone_funcinario_idx` (`CPF_funcionario`),
  CONSTRAINT `fk_telefone_funcionario` FOREIGN KEY (`CPF_funcionario`) REFERENCES `funcionario` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonefuncionario`
--

LOCK TABLES `telefonefuncionario` WRITE;
/*!40000 ALTER TABLE `telefonefuncionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefonefuncionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `cpf_cliente` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `id_carrinho` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `cliente_idx` (`cpf_cliente`),
  KEY `fk_venda_carrinho_idx` (`id_carrinho`),
  CONSTRAINT `fk_venda_carrinho` FOREIGN KEY (`id_carrinho`) REFERENCES `carrinho` (`ID`),
  CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-05 14:58:37
