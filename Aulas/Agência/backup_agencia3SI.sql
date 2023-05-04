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

-- Copiando estrutura para tabela agencia3si.auditoria
DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE IF NOT EXISTS `auditoria` (
  `idAuditoria` int(11) NOT NULL AUTO_INCREMENT,
  `acao` varchar(400) DEFAULT NULL,
  `tabela` varchar(50) DEFAULT NULL,
  `dataHora` datetime DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAuditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Registra as principais alterações neste BD.';

-- Copiando dados para a tabela agencia3si.auditoria: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` (`idAuditoria`, `acao`, `tabela`, `dataHora`, `usuario`) VALUES
	(1, 'Exclusão de conta do cliente: Afrânio Rosa', 'contavinculada', '2023-04-18 10:46:38', 'root@localhost'),
	(2, 'CPF do Cliente: Afrânio Rosa foi alterado para 086.178.039-04. CPF antigo era: 777.777.777-77', 'cliente', '2023-04-19 08:08:30', 'root@localhost'),
	(3, 'Código da conta: 5, Tipo de Conta: Corrente, Saldo inicial: R$2500.00', 'conta', '2023-04-19 08:19:54', 'root@localhost'),
	(4, 'Exclusão de conta do cliente: ROBERTO SILVA', 'contavinculada', '2023-04-25 10:50:59', 'root@localhost'),
	(5, 'Código da conta: 6, Tipo de Conta: Poupança, Saldo inicial: R$0.01', 'conta', '2023-04-27 10:05:26', 'root@localhost'),
	(11, 'CPF do Cliente: ARYANE CASSIMIRO MACHADO foi alterado para 470.548.028-51. CPF antigo era: 820.548.028-51', 'cliente', '2023-04-27 10:51:32', 'root@localhost'),
	(12, 'CPF do Cliente: ARYANE CASSIMIRO MACHADO foi alterado para 380.548.028-51. CPF antigo era: 470.548.028-51', 'cliente', '2023-04-27 10:51:48', 'root@localhost');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agencia3si.cliente: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idCLIENTE`, `nome`, `cpf`, `rg`, `dataNascimento`, `telefone`) VALUES
	(1, 'TELMA ALMEIDA', '123.456.789-10', 'MG 999.999-99', '1980-11-25', '(35)4002-8922'),
	(2, 'ROBERTO SILVA', '035.888.888-24', 'MG 10.100.777', '1975-05-21', '(35)3295-1234'),
	(3, 'Amanda Carvalho', '123.456.789-10', NULL, '1980-06-23', NULL),
	(4, 'Rogério Carvalho', '183.358.779-50', NULL, '1979-04-25', NULL),
	(5, 'Lúcia Silviano', '444.036.444-77', NULL, '1989-01-15', NULL),
	(6, 'Fabiana Silva', '999.999.999-99', NULL, '1970-12-02', NULL),
	(7, 'José Reginaldo', '888.888.888-88', NULL, '1964-01-30', NULL),
	(8, 'Afrânio Rosa', '086.178.039-04', NULL, '1958-06-12', NULL),
	(12, 'FERNANDO TELLES', '444.555.666-77', 'MG 17.235.901', '1975-05-12', '(35)3295-1111'),
	(13, 'ALESSANDRA SILVA TELLES', '555.666.777-88', 'MG 11.245.981', '1985-05-22', '(35)3002-4922'),
	(14, 'FERNANDO TELLES', '666.777.888-99', 'MG 10.214.957', '1979-03-19', '(35)3295-6666'),
	(15, 'Claudio Alexandre', '192.360.997-20', NULL, '1954-11-30', NULL),
	(16, 'MARIA FERNANDA', '892.692.486-20', NULL, '1999-05-14', NULL),
	(17, 'ARYANE CASSIMIRO MACHADO', '380.548.028-51', NULL, '2003-09-03', NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela agencia3si.conta
DROP TABLE IF EXISTS `conta`;
CREATE TABLE IF NOT EXISTS `conta` (
  `idCONTA` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('Salário','Corrente','Poupança') NOT NULL,
  `saldo` float(10,2) NOT NULL DEFAULT 0.00,
  `senha` char(8) NOT NULL,
  PRIMARY KEY (`idCONTA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agencia3si.conta: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
INSERT INTO `conta` (`idCONTA`, `tipo`, `saldo`, `senha`) VALUES
	(2, 'Poupança', 275.10, 'teste'),
	(3, 'Poupança', 3322.10, 'senha123'),
	(4, 'Corrente', 125.10, '*23ABC*'),
	(5, 'Corrente', 2500.00, '081900PO'),
	(6, 'Poupança', 0.01, 'abc');
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
  CONSTRAINT `FK_contavinculada_cliente` FOREIGN KEY (`CLIENTE_idCLIENTE`) REFERENCES `cliente` (`idCLIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_contavinculada_conta` FOREIGN KEY (`CONTA_idCONTA`) REFERENCES `conta` (`idCONTA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela agencia3si.contavinculada: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `contavinculada` DISABLE KEYS */;
INSERT INTO `contavinculada` (`CLIENTE_idCLIENTE`, `CONTA_idCONTA`, `dataAbertura`) VALUES
	(17, 6, '2023-04-27');
/*!40000 ALTER TABLE `contavinculada` ENABLE KEYS */;

-- Copiando estrutura para view agencia3si.v_agenda
DROP VIEW IF EXISTS `v_agenda`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_agenda` (
	`idCliente` INT(11) NOT NULL,
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8_general_ci',
	`telefone` VARCHAR(45) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si.v_clientesordemcrescente
DROP VIEW IF EXISTS `v_clientesordemcrescente`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_clientesordemcrescente` (
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8_general_ci',
	`cpf` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si.v_contasclientes
DROP VIEW IF EXISTS `v_contasclientes`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_contasclientes` (
	`nome` VARCHAR(150) NOT NULL COLLATE 'utf8_general_ci',
	`tipo` ENUM('Salário','Corrente','Poupança') NOT NULL COLLATE 'utf8_general_ci',
	`saldo` FLOAT(10,2) NOT NULL
) ENGINE=MyISAM;

-- Copiando estrutura para view agencia3si.v_totalfinanceiro
DROP VIEW IF EXISTS `v_totalfinanceiro`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_totalfinanceiro` (
	`SUM(saldo)` DOUBLE(19,2) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para trigger agencia3si.tri_alteraDataAberturaConta
DROP TRIGGER IF EXISTS `tri_alteraDataAberturaConta`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_alteraDataAberturaConta` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN	
	IF(NEW.cpf != OLD.cpf) 
	THEN
		UPDATE contavinculada 
		SET dataAbertura = NOW()
		WHERE CLIENTE_idCliente = NEW.idCLIENTE;
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si.tri_apagaVinculoConta
DROP TRIGGER IF EXISTS `tri_apagaVinculoConta`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_apagaVinculoConta` BEFORE DELETE ON `conta` FOR EACH ROW BEGIN
	DELETE FROM contavinculada
	WHERE contavinculada.CONTA_idCONTA = OLD.idCONTA;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si.tri_atualizaSenhaSaldo
DROP TRIGGER IF EXISTS `tri_atualizaSenhaSaldo`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_atualizaSenhaSaldo` BEFORE UPDATE ON `conta` FOR EACH ROW BEGIN
	IF(OLD.senha != NEW.senha)
		THEN IF(NEW.tipo = "Poupança")
			THEN
			SET @saldoAntigo = OLD.saldo;
			SET NEW.saldo = @saldoAntigo + 0.10;
		END IF;
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si.tri_FormataNomeCliente
DROP TRIGGER IF EXISTS `tri_FormataNomeCliente`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_FormataNomeCliente` BEFORE INSERT ON `cliente` FOR EACH ROW BEGIN
	SET NEW.nome = TRIM(UPPER(NEW.nome));
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si.tri_insereClientePoupanca
DROP TRIGGER IF EXISTS `tri_insereClientePoupanca`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_insereClientePoupanca` AFTER INSERT ON `cliente` FOR EACH ROW BEGIN
	INSERT INTO conta
	VALUES(NULL, "Poupança", 0.01, "abc");
	
	SET @novoCliente = (SELECT idCliente FROM cliente ORDER BY idCliente DESC LIMIT 1);
	SET @novaConta = (SELECT idConta FROM conta ORDER BY idConta DESC LIMIT 1);
	
	INSERT INTO contavinculada
	VALUES
	(
		@novoCliente, 
		@novaConta, 
		NOW()
	);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si.tri_LogApagaContaVinculada
DROP TRIGGER IF EXISTS `tri_LogApagaContaVinculada`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER tri_LogApagaContaVinculada
AFTER DELETE
ON contavinculada
FOR EACH ROW
BEGIN

	SELECT nome INTO @nomeCliente FROM cliente
	WHERE idCliente = OLD.CLIENTE_idCliente;
	
	SET @mensagem = CONCAT("Exclusão de conta do cliente: ", @nomeCliente);

	INSERT INTO auditoria 
	VALUES(NULL, @mensagem, "contavinculada", NOW(), USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si.tri_LogFiscalizaCPF
DROP TRIGGER IF EXISTS `tri_LogFiscalizaCPF`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER tri_LogFiscalizaCPF 
AFTER UPDATE ON cliente
FOR EACH ROW
BEGIN
	
	SET @mensagem = CONCAT("CPF do Cliente: ", NEW.nome, " foi alterado para ", NEW.cpf, ". CPF antigo era: ", OLD.cpf);
	INSERT INTO auditoria
	VALUES(NULL, @mensagem, "cliente", NOW(), USER());
	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger agencia3si.tri_LogInsereConta
DROP TRIGGER IF EXISTS `tri_LogInsereConta`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER tri_LogInsereConta
AFTER INSERT ON conta
FOR EACH ROW
BEGIN
	
	SET @mensagem = CONCAT("Código da conta: ", NEW.idConta, ", Tipo de Conta: ", NEW.tipo
	, ", Saldo inicial: R$", NEW.saldo);
	INSERT INTO auditoria
	VALUES(NULL, @mensagem, "conta", NOW(), USER());
	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para view agencia3si.v_agenda
DROP VIEW IF EXISTS `v_agenda`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_agenda`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_agenda` AS (select `cli`.`idCLIENTE` AS `idCliente`,`cli`.`nome` AS `nome`,`cli`.`telefone` AS `telefone` from `cliente` `cli` where `cli`.`telefone` is not null);

-- Copiando estrutura para view agencia3si.v_clientesordemcrescente
DROP VIEW IF EXISTS `v_clientesordemcrescente`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_clientesordemcrescente`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_clientesordemcrescente` AS (select `cliente`.`nome` AS `nome`,`cliente`.`cpf` AS `cpf` from `cliente` order by `cliente`.`nome`);

-- Copiando estrutura para view agencia3si.v_contasclientes
DROP VIEW IF EXISTS `v_contasclientes`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_contasclientes`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_contasclientes` AS select `cli`.`nome` AS `nome`,`con`.`tipo` AS `tipo`,`con`.`saldo` AS `saldo` from ((`cliente` `cli` join `conta` `con`) join `contavinculada` `cv` on(`cli`.`idCLIENTE` = `cv`.`CLIENTE_idCLIENTE` and `con`.`idCONTA` = `cv`.`CONTA_idCONTA`));

-- Copiando estrutura para view agencia3si.v_totalfinanceiro
DROP VIEW IF EXISTS `v_totalfinanceiro`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_totalfinanceiro`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_totalfinanceiro` AS (select sum(`conta`.`saldo`) AS `SUM(saldo)` from `conta`);

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
