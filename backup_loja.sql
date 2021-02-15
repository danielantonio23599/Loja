-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: banco_loja
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admicao`
--

DROP TABLE IF EXISTS `admicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admicao` (
  `admDataAdmicao` date DEFAULT NULL,
  `admDataSaida` date DEFAULT NULL,
  `admUniforme` int(11) DEFAULT NULL,
  `admNumCartao` int(11) DEFAULT NULL,
  `admSalario` float DEFAULT NULL,
  `adm_empCodigo` int(11) NOT NULL,
  `adm_funCodigo` int(11) NOT NULL,
  `adm_carCodigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`adm_empCodigo`,`adm_funCodigo`),
  KEY `fk_admicao_funcionario1_idx` (`adm_funCodigo`),
  KEY `fk_admicao_cargo` (`adm_carCodigo`),
  CONSTRAINT `fk_admicao_cargo1` FOREIGN KEY (`adm_carCodigo`) REFERENCES `cargo` (`carCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_admicao_empresa1` FOREIGN KEY (`adm_empCodigo`) REFERENCES `empresa` (`empCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_admicao_funcionario1` FOREIGN KEY (`adm_funCodigo`) REFERENCES `funcionario` (`funCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admicao`
--

LOCK TABLES `admicao` WRITE;
/*!40000 ALTER TABLE `admicao` DISABLE KEYS */;
INSERT INTO `admicao` VALUES (NULL,NULL,NULL,NULL,NULL,1,1,1);
/*!40000 ALTER TABLE `admicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa`
--

DROP TABLE IF EXISTS `caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixa` (
  `caiCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `caiData` date DEFAULT NULL,
  `caiIn` time DEFAULT NULL,
  `caiOut` time DEFAULT NULL,
  `caiTrocoIn` float DEFAULT NULL,
  `caiTrocoFin` float DEFAULT NULL,
  `caiStatus` varchar(45) DEFAULT NULL,
  `cai_funCodigo` int(11) DEFAULT NULL,
  `cai_empCodigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`caiCodigo`),
  KEY `fk_caixa_funcionario1_idx` (`cai_funCodigo`),
  KEY `fk_caixa_empresa1_idx` (`cai_empCodigo`),
  CONSTRAINT `fk_caixa_empresa1` FOREIGN KEY (`cai_empCodigo`) REFERENCES `empresa` (`empCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_caixa_funcionario1` FOREIGN KEY (`cai_funCodigo`) REFERENCES `funcionario` (`funCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `carCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `carNome` varchar(45) DEFAULT NULL,
  `carAtribuicao` text DEFAULT NULL,
  `carRequisitos` text DEFAULT NULL,
  `carPermicao` text DEFAULT NULL,
  PRIMARY KEY (`carCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'ADM','Socio','DONO','ADM');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cliCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `cliNome` text NOT NULL,
  `cliEmail` text NOT NULL,
  `cliProfissao` text DEFAULT NULL,
  `cliDataNascimento` date DEFAULT NULL,
  `cliDataCadastro` date DEFAULT NULL,
  `cliCPF` varchar(14) NOT NULL,
  `cliTelefone` varchar(14) NOT NULL,
  `cliFoto` longblob DEFAULT NULL,
  `cliSenha` text NOT NULL,
  PRIMARY KEY (`cliCodigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despesa`
--

DROP TABLE IF EXISTS `despesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despesa` (
  `disCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `disNome` text DEFAULT NULL,
  `disDescricao` text DEFAULT NULL,
  `disPreco` float DEFAULT NULL,
  `dis_caiCodigo` int(11) NOT NULL,
  PRIMARY KEY (`disCodigo`),
  KEY `fk_despesa_caixa1_idx` (`dis_caiCodigo`),
  CONSTRAINT `fk_despesa_caixa1` FOREIGN KEY (`dis_caiCodigo`) REFERENCES `caixa` (`caiCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesa`
--

LOCK TABLES `despesa` WRITE;
/*!40000 ALTER TABLE `despesa` DISABLE KEYS */;
/*!40000 ALTER TABLE `despesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucao`
--

DROP TABLE IF EXISTS `devolucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devolucao` (
  `devCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `devMotivo` text NOT NULL,
  `devTime` time NOT NULL,
  `devQTD` float DEFAULT NULL,
  `devValor` float DEFAULT NULL,
  `dev_caiCodigo` int(11) NOT NULL,
  PRIMARY KEY (`devCodigo`),
  KEY `fk_devolucao_caixa1_idx` (`dev_caiCodigo`),
  CONSTRAINT `fk_devolucao_caixa1` FOREIGN KEY (`dev_caiCodigo`) REFERENCES `caixa` (`caiCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao`
--

LOCK TABLES `devolucao` WRITE;
/*!40000 ALTER TABLE `devolucao` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `empCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `empRazaoSocial` text DEFAULT NULL,
  `empNomeFantazia` text DEFAULT NULL,
  `empCNPJ` text DEFAULT NULL,
  `empInsEstadual` text DEFAULT NULL,
  `empEmail` text DEFAULT NULL,
  `empTelefone` varchar(14) DEFAULT NULL,
  `empSenha` text DEFAULT NULL,
  `empDataCadastro` date DEFAULT NULL,
  `empExpiraLicenca` date DEFAULT NULL,
  `empLogradouro` text DEFAULT NULL,
  `empNumero` text DEFAULT NULL,
  `empBairro` text DEFAULT NULL,
  `empComplemento` text DEFAULT NULL,
  `empCidade` text DEFAULT NULL,
  `empUF` varchar(2) DEFAULT NULL,
  `empCEP` varchar(9) DEFAULT NULL,
  `empLogo` longblob DEFAULT NULL,
  `empDataFundacao` date DEFAULT NULL,
  `empNomeResp` text DEFAULT NULL,
  `empTipo` text DEFAULT NULL,
  PRIMARY KEY (`empCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'Ctrl Tech Informatica LTDA','CTRL TECH INFO','111.111.111/1111-11','1','ctrltechinformatica25@gmail.com','(37)99807-0898','C4CA4238A0B923820DCC509A6F75849B','2020-10-12','2020-11-12','rua antonio marinho da costa','55','serra verde','casa','formiga','mg','35570-730',NULL,'2020-10-12','','');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `endCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `endCEP` varchar(45) NOT NULL,
  `endCidade` varchar(45) NOT NULL,
  `endUF` varchar(2) DEFAULT NULL,
  `endBairro` text DEFAULT NULL,
  `endEndereco` text NOT NULL,
  `endNumero` int(11) NOT NULL,
  `endComplemento` text DEFAULT NULL,
  `endLatitude` float DEFAULT NULL,
  `endLongitude` float DEFAULT NULL,
  `end_cliCodigo` int(11) NOT NULL,
  PRIMARY KEY (`endCodigo`),
  KEY `fk_endereco_cliente1_idx` (`end_cliCodigo`),
  CONSTRAINT `fk_endereco_cliente1` FOREIGN KEY (`end_cliCodigo`) REFERENCES `cliente` (`cliCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `funCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `funDataNascimento` date DEFAULT NULL,
  `funTelefone` varchar(14) DEFAULT NULL,
  `funNome` varchar(45) DEFAULT NULL,
  `funFoto` blob DEFAULT NULL,
  `funEmail` text DEFAULT NULL,
  `funCPF` varchar(14) DEFAULT NULL,
  `funRG` varchar(14) DEFAULT NULL,
  `funSenha` text DEFAULT NULL,
  `funLogradouro` text DEFAULT NULL,
  `funNumero` text DEFAULT NULL,
  `funBairro` text DEFAULT NULL,
  `funComplemento` text DEFAULT NULL,
  `funCidade` text DEFAULT NULL,
  `funUF` varchar(2) DEFAULT NULL,
  `funCEP` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`funCodigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,NULL,NULL,NULL,NULL,'ctrltechinformatica25@gmail.com',NULL,NULL,'C4CA4238A0B923820DCC509A6F75849B','rua antonio marinho da costa','55','serra verde','casa','formiga','mg','35570-730');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico`
--

DROP TABLE IF EXISTS `ordem_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_servico` (
  `osCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `osNome` text NOT NULL,
  `osDescricao` text NOT NULL,
  `osData` date NOT NULL,
  `osHora` time NOT NULL,
  `osStatus` text NOT NULL,
  `osEndereco` text DEFAULT NULL,
  `osValor` float DEFAULT NULL,
  `os_funCodigo` int(11) NOT NULL,
  `os_empCodigo` int(11) NOT NULL,
  `os_venCodigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`osCodigo`),
  KEY `fk_ordem_servico_funcionario1_idx` (`os_funCodigo`),
  KEY `fk_ordem_servico_empresa1_idx` (`os_empCodigo`),
  KEY `fk_ordem_servico_venda1_idx` (`os_venCodigo`),
  CONSTRAINT `fk_ordem_servico_empresa1` FOREIGN KEY (`os_empCodigo`) REFERENCES `empresa` (`empCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_funcionario1` FOREIGN KEY (`os_funCodigo`) REFERENCES `funcionario` (`funCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordem_servico_venda1` FOREIGN KEY (`os_venCodigo`) REFERENCES `venda` (`venCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico`
--

LOCK TABLES `ordem_servico` WRITE;
/*!40000 ALTER TABLE `ordem_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordem_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `pedCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `pedQTD` float DEFAULT NULL,
  `pedObs` text DEFAULT NULL,
  `pedStatus` text DEFAULT NULL,
  `ped_devCodigo` int(11) DEFAULT NULL,
  `ped_venCodigo` int(11) NOT NULL,
  `ped_proCodigo` int(11) NOT NULL,
  PRIMARY KEY (`pedCodigo`),
  KEY `fk_pedido_exclusao1_idx` (`ped_devCodigo`),
  KEY `fk_pedido_venda1_idx` (`ped_venCodigo`),
  KEY `fk_pedido_produto1_idx` (`ped_proCodigo`),
  CONSTRAINT `fk_pedido_exclusao1` FOREIGN KEY (`ped_devCodigo`) REFERENCES `devolucao` (`devCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_produto1` FOREIGN KEY (`ped_proCodigo`) REFERENCES `produto` (`proCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_venda1` FOREIGN KEY (`ped_venCodigo`) REFERENCES `venda` (`venCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `proCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `proNome` text NOT NULL,
  `proPreco` float NOT NULL,
  `proCusto` float DEFAULT NULL,
  `proQuantidade` float DEFAULT NULL,
  `proDescricao` text DEFAULT NULL,
  `proTipo` text DEFAULT NULL,
  `proFoto` longblob DEFAULT NULL,
  `proQR` text DEFAULT NULL,
  `proNCM` int(11) DEFAULT NULL,
  `proTributacao` float DEFAULT NULL,
  `proGarantia` int(11) DEFAULT NULL,
  `pro_empCodigo` int(11) NOT NULL,
  PRIMARY KEY (`proCodigo`),
  KEY `fk_produto_empresa1_idx` (`pro_empCodigo`),
  CONSTRAINT `fk_produto_empresa1` FOREIGN KEY (`pro_empCodigo`) REFERENCES `empresa` (`empCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sangria`
--

DROP TABLE IF EXISTS `sangria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sangria` (
  `sanCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `sanValor` float NOT NULL,
  `sanTime` time NOT NULL,
  `san_caiCodigo` int(11) NOT NULL,
  PRIMARY KEY (`sanCodigo`),
  KEY `fk_sangria_caixa1_idx` (`san_caiCodigo`),
  CONSTRAINT `fk_sangria_caixa1` FOREIGN KEY (`san_caiCodigo`) REFERENCES `caixa` (`caiCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sangria`
--

LOCK TABLES `sangria` WRITE;
/*!40000 ALTER TABLE `sangria` DISABLE KEYS */;
/*!40000 ALTER TABLE `sangria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `venCodigo` int(11) NOT NULL AUTO_INCREMENT,
  `venQRcode` text DEFAULT NULL,
  `venTime` time DEFAULT NULL,
  `venValor` float DEFAULT NULL,
  `venCusto` float DEFAULT NULL,
  `venStatus` text NOT NULL,
  `venPagamento` text DEFAULT NULL,
  `venDesconto` float DEFAULT NULL,
  `venFrete` float DEFAULT NULL,
  `ven_caiCodigo` int(11) NOT NULL,
  `ven_cliCodigo` int(11) DEFAULT NULL,
  `ven_entCodigo` int(11) DEFAULT NULL,
  `venValorFin` float DEFAULT NULL,
  PRIMARY KEY (`venCodigo`),
  KEY `fk_venda_caixa1_idx` (`ven_caiCodigo`),
  KEY `fk_venda_cliente1_idx` (`ven_cliCodigo`),
  CONSTRAINT `fk_venda_caixa1` FOREIGN KEY (`ven_caiCodigo`) REFERENCES `caixa` (`caiCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_cliente1` FOREIGN KEY (`ven_cliCodigo`) REFERENCES `cliente` (`cliCodigo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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

-- Dump completed on 2020-10-12 11:04:55
