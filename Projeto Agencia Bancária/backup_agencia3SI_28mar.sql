-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.20-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para agencia3si
DROP DATABASE IF EXISTS `agencia3si`;
CREATE DATABASE IF NOT EXISTS `agencia3si` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `agencia3si`;

-- Copiando estrutura para tabela agencia3si.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `dataNascimento` date NOT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agencia3si.cliente: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idCLIENTE`, `nome`, `cpf`, `rg`, `dataNascimento`, `telefone`) VALUES
	(1, 'Telma Almeida', '123.456.789-10', 'MG 999.999-99', '1980-11-25', '(35)4002-8922'),
	(2, 'Roberto Silva', '035.888.888-24', 'MG 10.100.777', '1975-05-21', NULL),
	(3, 'Amanda Carvalho', '123.456.789-10', NULL, '1980-06-23', NULL),
	(4, 'Rogério Carvalho', '183.358.779-50', NULL, '1979-04-25', NULL),
	(5, 'Lúcia Silviano', '444.036.444-77', NULL, '1989-01-15', NULL),
	(6, 'Fabiana Silva', '999.999.999-99', NULL, '1970-12-02', NULL),
	(7, 'José Reginaldo', '888.888.888-88', NULL, '1964-01-30', NULL),
	(8, 'Afrânio Rosa', '777.777.777-77', NULL, '1958-06-12', NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela agencia3si.conta
DROP TABLE IF EXISTS `conta`;
CREATE TABLE IF NOT EXISTS `conta` (
  `idCONTA` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('Salário','Corrente','Poupança') NOT NULL,
  `saldo` float(10,2) NOT NULL DEFAULT 0.00,
  `senha` char(8) NOT NULL,
  PRIMARY KEY (`idCONTA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agencia3si.conta: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` (`idCONTA`, `tipo`, `saldo`, `senha`) VALUES
	(1, 'Salário', 805.50, 'abc123'),
	(2, 'Poupança', 1250.00, 'teste'),
	(3, 'Poupança', 3020.00, 'senha12'),
	(4, 'Corrente', 125.10, '*23AB*');
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;

-- Copiando estrutura para tabela agencia3si.contavinculada
DROP TABLE IF EXISTS `contavinculada`;
CREATE TABLE IF NOT EXISTS `contavinculada` (
  `CLIENTE_idCLIENTE` int(11) NOT NULL,
  `CONTA_idCONTA` int(11) NOT NULL,
  `dataAbertura` date NOT NULL,
  PRIMARY KEY (`CLIENTE_idCLIENTE`,`CONTA_idCONTA`),
  KEY `fk_CLIENTE_has_CONTA_CONTA1_idx` (`CONTA_idCONTA`),
  KEY `fk_CLIENTE_has_CONTA_CLIENTE_idx` (`CLIENTE_idCLIENTE`),
  CONSTRAINT `fk_CLIENTE_has_CONTA_CLIENTE` FOREIGN KEY (`CLIENTE_idCLIENTE`) REFERENCES `cliente` (`idCLIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENTE_has_CONTA_CONTA1` FOREIGN KEY (`CONTA_idCONTA`) REFERENCES `conta` (`idCONTA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agencia3si.contavinculada: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `contavinculada` DISABLE KEYS */;
INSERT INTO `contavinculada` (`CLIENTE_idCLIENTE`, `CONTA_idCONTA`, `dataAbertura`) VALUES
	(1, 1, '2022-12-20'),
	(2, 3, '2023-01-05');
/*!40000 ALTER TABLE `contavinculada` ENABLE KEYS */;

-- Copiando estrutura para view agencia3si.v_clientesordemcrescente
DROP VIEW IF EXISTS `v_clientesordemcrescente`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_clientesordemcrescente` (
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8_general_ci',
	`cpf` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si.v_clientesordemcrescente
DROP VIEW IF EXISTS `v_clientesordemcrescente`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_clientesordemcrescente`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_clientesordemcrescente` AS (SELECT nome, cpf FROM cliente ORDER BY nome) ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
