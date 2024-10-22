-- MySQL dump 10.13  Distrib 9.0.1, for Linux (x86_64)
--
-- Host: localhost    Database: teste
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!50503 SET NAMES utf8mb4 */
;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;
/*!40103 SET TIME_ZONE='+00:00' */
;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;

--
-- Table structure for table `auditoria_salario`
--

DROP TABLE IF EXISTS `auditoria_salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `auditoria_salario` (
    `func_codigo` int NOT NULL,
    `salario_inicial` float NOT NULL,
    `salario_alterado` float NOT NULL,
    `data_alteracao` date NOT NULL,
    `nome_usuario` varchar(60) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `auditoria_salario`
--

LOCK TABLES `auditoria_salario` WRITE;
/*!40000 ALTER TABLE `auditoria_salario` DISABLE KEYS */
;
/*!40000 ALTER TABLE `auditoria_salario` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `cliente` (
    `cod_cliente` int NOT NULL,
    `nome_cliente` varchar(40) NOT NULL,
    `endereco_cliente` varchar(40) NOT NULL,
    `cidade_cliente` varchar(40) NOT NULL,
    `cidade_cep` int NOT NULL,
    `uf_cliente` varchar(2) NOT NULL,
    `cgc_cliente` varchar(30) NOT NULL,
    `ie_cliente` varchar(4) DEFAULT NULL,
    PRIMARY KEY (`cod_cliente`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */
;

INSERT INTO
    `cliente`
VALUES (
        20,
        'Beth',
        'Av. Climério n. 45',
        'São Paulo',
        25679300,
        'sp',
        '32485126/7326-8',
        '9280'
    ),
    (
        110,
        'Jorge',
        'Rua Caiapo 131',
        'Curitiba',
        30078500,
        'pr',
        '14512764/9834-8',
        '0'
    ),
    (
        130,
        'Edmar',
        'Rua da Praia sn/',
        'Salvador',
        30079300,
        'ba',
        '23463284/234-9',
        '7121'
    ),
    (
        157,
        'Paulo',
        'Tv. Moraes c/3',
        'Lodrina',
        573857834,
        'pr',
        '32848223/324-2',
        '1923'
    ),
    (
        180,
        'Lívio',
        'Av. Beira Mar n. 1256',
        'Florianópolis',
        30077500,
        'sc',
        '12736571/2147-4',
        '0'
    ),
    (
        222,
        'Lúcia',
        'Rua Itabira 123 Loja 9',
        'Belo Horizonte',
        22124391,
        'mg',
        '28315213/9348-8',
        '2985'
    ),
    (
        260,
        'Susana',
        'Rua Lopes Mendes 12',
        'Niterói',
        30046500,
        'rj',
        '21763571/232-9',
        '2530'
    ),
    (
        290,
        'Renato',
        'Rua Meireles n. 123 bl.2 sl.245',
        'São Paulo',
        30225900,
        'sp',
        '13276571/1231-4',
        '1820'
    ),
    (
        390,
        'Sebastião',
        'Rua da Igreja n. 10',
        'Uberaba',
        30438700,
        'mg',
        '32176547/213-3',
        '9071'
    ),
    (
        410,
        'Rodolfo',
        'Largo da Lapa 27 sobrado',
        'Rio de Janeiro',
        30078900,
        'rj',
        '12835128/2346-6',
        '7431'
    ),
    (
        720,
        'Ana',
        'Rua 17 n. 19',
        'Niterói',
        24358310,
        'rj',
        '12113231/0001-24',
        '2134'
    ),
    (
        830,
        'Maurício',
        'Av.  Paulista 1236 sl/2345',
        'São Paulo',
        3012683,
        'sp',
        '2316985/7465-6',
        '9343'
    ),
    (
        870,
        'Flávio',
        'Av. Pres. Vargas 10',
        'São Paulo',
        22763931,
        'sp',
        '22534126/9387-9',
        '4631'
    );
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `item_pedido` (
    `cod_pedido` int NOT NULL,
    `cod_produto` int NOT NULL,
    `qtd_pedido` int NOT NULL,
    PRIMARY KEY (`cod_pedido`, `cod_produto`),
    KEY `cod_produto` (`cod_produto`),
    CONSTRAINT `fk_cod_pedido` FOREIGN KEY (`cod_pedido`) REFERENCES `pedido` (`cod_pedido`),
    CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`cod_produto`) REFERENCES `produto` (`cod_produto`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `item_pedido`
--

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */
;

INSERT INTO
    `item_pedido`
VALUES (91, 77, 40),
    (97, 77, 20),
    (98, 77, 5),
    (101, 13, 5),
    (101, 31, 9),
    (101, 78, 18),
    (103, 53, 37),
    (104, 53, 32),
    (105, 78, 10),
    (108, 13, 17),
    (111, 25, 10),
    (111, 78, 70),
    (119, 13, 6),
    (119, 53, 43),
    (119, 77, 40),
    (121, 25, 10),
    (121, 31, 35),
    (137, 13, 8),
    (138, 53, 18),
    (138, 77, 35),
    (143, 31, 20),
    (143, 78, 10),
    (148, 25, 10),
    (148, 31, 7),
    (148, 45, 8),
    (148, 77, 3),
    (148, 78, 30),
    (189, 78, 45),
    (203, 31, 6);
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `pedido` (
    `cod_pedido` int NOT NULL,
    `prazo_entrega` int NOT NULL,
    `cod_cliente` int NOT NULL,
    `cod_vendedor` int NOT NULL,
    PRIMARY KEY (`cod_pedido`),
    KEY `fk_cod_cliente` (`cod_cliente`),
    KEY `fk_cod_vendedor` (`cod_vendedor`),
    CONSTRAINT `fk_cod_cliente` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`),
    CONSTRAINT `fk_cod_vendedor` FOREIGN KEY (`cod_vendedor`) REFERENCES `vendedor` (`cod_vendedor`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */
;

INSERT INTO
    `pedido`
VALUES (91, 20, 260, 11),
    (97, 20, 720, 101),
    (98, 20, 410, 209),
    (101, 15, 720, 101),
    (103, 20, 260, 11),
    (104, 30, 110, 101),
    (105, 15, 180, 240),
    (108, 15, 290, 310),
    (111, 20, 260, 11),
    (119, 30, 390, 250),
    (121, 20, 410, 209),
    (127, 10, 410, 11),
    (137, 20, 720, 720),
    (138, 20, 260, 11),
    (143, 30, 20, 111),
    (148, 20, 720, 101),
    (189, 15, 870, 213),
    (203, 30, 830, 250);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `produto` (
    `cod_produto` int NOT NULL,
    `unidade_produto` varchar(3) NOT NULL,
    `desc_produto` varchar(40) NOT NULL,
    `valor_unitario` int NOT NULL,
    PRIMARY KEY (`cod_produto`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */
;

INSERT INTO
    `produto`
VALUES (13, 'G', 'Ouro', 6),
    (23, 'TES', 'AAAAAAAAA', 524),
    (25, 'KG', 'Queijo', 1),
    (30, 'SAC', 'Açúcar', 0),
    (31, 'BAR', 'Chocolate', 1),
    (45, 'M', 'Madeira', 0),
    (53, 'M', 'Linha', 2),
    (77, 'M', 'Papel', 1),
    (78, 'L', 'Vinho', 2),
    (87, 'M', 'Cano', 2);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `vendedor` (
    `cod_vendedor` int NOT NULL,
    `nome_vendedor` varchar(40) NOT NULL,
    `salario_vendedor` float NOT NULL,
    `comissao_vendedor` char(1) NOT NULL,
    PRIMARY KEY (`cod_vendedor`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */
;

INSERT INTO
    `vendedor`
VALUES (11, 'João', 2780, 'C'),
    (101, 'João', 2650, 'C'),
    (111, 'Carlos', 2490, 'A'),
    (209, 'José', 1800, 'C'),
    (213, 'Jonas', 2300, 'A'),
    (240, 'Antônio', 9500, 'C'),
    (250, 'Maurício', 2930, 'B'),
    (310, 'Josias', 870, 'B'),
    (720, 'Felipe', 4600, 'A');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */
;

UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */
;
/*!50003 SET @saved_cs_results     = @@character_set_results */
;
/*!50003 SET @saved_col_connection = @@collation_connection */
;
/*!50003 SET character_set_client  = utf8mb4 */
;
/*!50003 SET character_set_results = utf8mb4 */
;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */
;
/*!50003 SET @saved_sql_mode       = @@sql_mode */
;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */
;

DELIMITER; ;
/*!50003 CREATE*/
/*!50017 DEFINER=`root`@`%`*/
/*!50003 TRIGGER `update_salario` AFTER UPDATE ON `vendedor` FOR EACH ROW BEGIN
INSERT INTO auditoria_salario (cod_vendedor, old_salario, new_salario, data_atualizacao, usuario)
VALUES (NEW.cod_vendedor, OLD.salario_vendedor, NEW.salario_vendedor, CURDATE(), USER());
END */
;

;

DELIMITER;
/*!50003 SET sql_mode              = @saved_sql_mode */
;
/*!50003 SET character_set_client  = @saved_cs_client */
;
/*!50003 SET character_set_results = @saved_cs_results */
;
/*!50003 SET collation_connection  = @saved_col_connection */
;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;

-- Dump completed on 2024-10-22 18:28:04