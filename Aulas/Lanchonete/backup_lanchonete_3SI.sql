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


-- Copiando estrutura do banco de dados para lanchonete3si_2023
DROP DATABASE IF EXISTS `lanchonete3si_2023`;
CREATE DATABASE IF NOT EXISTS `lanchonete3si_2023` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lanchonete3si_2023`;

-- Copiando estrutura para tabela lanchonete3si_2023.auditoria
DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE IF NOT EXISTS `auditoria` (
  `idAuditoria` int(11) NOT NULL AUTO_INCREMENT,
  `acao` varchar(400) DEFAULT NULL,
  `tabela` varchar(50) DEFAULT NULL,
  `dataHora` datetime DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAuditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Registra as principais alterações neste BD.';

-- Copiando dados para a tabela lanchonete3si_2023.auditoria: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` (`idAuditoria`, `acao`, `tabela`, `dataHora`, `usuario`) VALUES
	(1, 'Produto vendido = Empada de Palmito, Quantidade = 5, para a venda = 2', 'itemvenda', '2023-05-16 09:55:15', 'luiz@localhost'),
	(2, 'Produto devolvido = Empada de Palmito, Quantidade = 5, pela venda = 2', 'itemvenda', '2023-05-16 10:02:13', 'luiz@localhost');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;

-- Copiando estrutura para tabela lanchonete3si_2023.categoria
DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `codCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`codCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete3si_2023.categoria: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`codCategoria`, `nome`) VALUES
	(1, 'Salgados de fabricação própria'),
	(2, 'Sucos Naturais'),
	(3, 'Sucos industrializados'),
	(4, 'Refrigerantes'),
	(5, 'Bebidas quentes'),
	(6, 'Sobremesas'),
	(7, 'Ticket Alimentação');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela lanchonete3si_2023.cliente
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `codCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT 'Machado',
  `cep` varchar(20) DEFAULT '37.750-000',
  `uf` char(2) DEFAULT 'MG',
  `dataNascimento` date DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete3si_2023.cliente: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`codCliente`, `nome`, `endereco`, `bairro`, `cidade`, `cep`, `uf`, `dataNascimento`, `cpf`, `email`) VALUES
	(1, 'Carlos Telles Silva', NULL, NULL, 'Machado', '37.750-000', 'MG', '1980-09-21', NULL, 'carlos2022@gmail.com'),
	(2, 'Ana Paula Teixeira', NULL, NULL, 'Machado', '37.750-000', 'MG', '1985-11-04', NULL, 'teste@gmail.com'),
	(3, 'João Victor Telles', NULL, NULL, 'Machado', '37.750-000', 'MG', '1974-04-29', NULL, NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para tabela lanchonete3si_2023.itemvenda
DROP TABLE IF EXISTS `itemvenda`;
CREATE TABLE IF NOT EXISTS `itemvenda` (
  `VENDA_codVenda` int(11) NOT NULL,
  `PRODUTO_codProduto` int(11) NOT NULL,
  `quantidade` decimal(10,0) NOT NULL,
  PRIMARY KEY (`VENDA_codVenda`,`PRODUTO_codProduto`),
  KEY `fk_PRODUTO_has_VENDA_VENDA1_idx` (`VENDA_codVenda`),
  KEY `fk_PRODUTO_has_VENDA_PRODUTO1_idx` (`PRODUTO_codProduto`),
  CONSTRAINT `fk_PRODUTO_has_VENDA_PRODUTO1` FOREIGN KEY (`PRODUTO_codProduto`) REFERENCES `produto` (`codProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUTO_has_VENDA_VENDA1` FOREIGN KEY (`VENDA_codVenda`) REFERENCES `venda` (`codVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete3si_2023.itemvenda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `itemvenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemvenda` ENABLE KEYS */;

-- Copiando estrutura para tabela lanchonete3si_2023.marca
DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `codMarca` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`codMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete3si_2023.marca: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`codMarca`, `nome`) VALUES
	(1, 'Nestlé'),
	(2, 'Garoto'),
	(4, 'Dolly'),
	(5, 'Frutty'),
	(6, 'Coetagri'),
	(7, 'Coca-Cola');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Copiando estrutura para tabela lanchonete3si_2023.produto
DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `codProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `precoCusto` decimal(10,2) NOT NULL,
  `precoVenda` decimal(10,2) NOT NULL,
  `margemLucro` decimal(5,2) DEFAULT NULL,
  `dataValidade` date DEFAULT NULL,
  `quantidadeEstoque` decimal(10,2) DEFAULT NULL,
  `quantidadeMinima` decimal(10,2) DEFAULT NULL,
  `CATEGORIA_codCategoria` int(11) NOT NULL,
  `MARCA_codMarca` int(11) NOT NULL,
  PRIMARY KEY (`codProduto`,`CATEGORIA_codCategoria`,`MARCA_codMarca`),
  KEY `fk_PRODUTO_CATEGORIA_idx` (`CATEGORIA_codCategoria`),
  KEY `fk_PRODUTO_MARCA1_idx` (`MARCA_codMarca`),
  CONSTRAINT `fk_PRODUTO_CATEGORIA` FOREIGN KEY (`CATEGORIA_codCategoria`) REFERENCES `categoria` (`codCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUTO_MARCA1` FOREIGN KEY (`MARCA_codMarca`) REFERENCES `marca` (`codMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete3si_2023.produto: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`codProduto`, `nome`, `precoCusto`, `precoVenda`, `margemLucro`, `dataValidade`, `quantidadeEstoque`, `quantidadeMinima`, `CATEGORIA_codCategoria`, `MARCA_codMarca`) VALUES
	(1, 'Empada de Palmito', 1.80, 3.60, 100.00, '2022-11-20', 30.00, 10.00, 1, 6),
	(2, 'Prestígio', 2.00, 3.50, 75.00, '2023-12-11', 50.00, 15.00, 6, 7),
	(3, 'Guaraná 600mL', 2.00, 3.00, NULL, '2023-05-21', 45.00, 20.00, 4, 5),
	(4, 'Coca-Cola 600mL', 2.00, 4.00, 100.00, '2024-05-16', 50.00, 20.00, 4, 6);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para tabela lanchonete3si_2023.venda
DROP TABLE IF EXISTS `venda`;
CREATE TABLE IF NOT EXISTS `venda` (
  `codVenda` int(11) NOT NULL AUTO_INCREMENT,
  `dataHora` datetime NOT NULL,
  `desconto` decimal(5,2) DEFAULT NULL,
  `tipoVenda` enum('À vista','Cartão Débito','Cartão Crédito','PIX') NOT NULL,
  `CLIENTE_codCliente` int(11) NOT NULL,
  PRIMARY KEY (`codVenda`,`CLIENTE_codCliente`),
  KEY `fk_VENDA_CLIENTE1_idx` (`CLIENTE_codCliente`),
  CONSTRAINT `fk_VENDA_CLIENTE1` FOREIGN KEY (`CLIENTE_codCliente`) REFERENCES `cliente` (`codCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela lanchonete3si_2023.venda: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` (`codVenda`, `dataHora`, `desconto`, `tipoVenda`, `CLIENTE_codCliente`) VALUES
	(1, '2022-12-08 07:09:00', 6.00, 'À vista', 3),
	(2, '2023-05-11 10:14:35', NULL, 'PIX', 1);
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;

-- Copiando estrutura para view lanchonete3si_2023.v_nascimentoclientes
DROP VIEW IF EXISTS `v_nascimentoclientes`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_nascimentoclientes` (
	`Nome` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`Data de Nascimento` VARCHAR(10) NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para procedure lanchonete3si_2023.proc_alteraEmailCliente
DROP PROCEDURE IF EXISTS `proc_alteraEmailCliente`;
DELIMITER //
//
DELIMITER ;

-- Copiando estrutura para procedure lanchonete3si_2023.proc_alteraMarca
DROP PROCEDURE IF EXISTS `proc_alteraMarca`;
DELIMITER //
//
DELIMITER ;

-- Copiando estrutura para procedure lanchonete3si_2023.proc_alteraMargemLucro
DROP PROCEDURE IF EXISTS `proc_alteraMargemLucro`;
DELIMITER //
CREATE PROCEDURE `proc_alteraMargemLucro`(
	IN `codAlterado` INT,
	IN `novaMargemLucro` DECIMAL(5,2)
)
BEGIN
	IF(novaMargemLucro > 0)
		THEN
			UPDATE produto 
			SET margemLucro = novaMargemLucro
			WHERE codProduto = codAlterado;
	END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure lanchonete3si_2023.proc_apagaMarca
DROP PROCEDURE IF EXISTS `proc_apagaMarca`;
DELIMITER //
//
DELIMITER ;

-- Copiando estrutura para procedure lanchonete3si_2023.proc_insereCategoria
DROP PROCEDURE IF EXISTS `proc_insereCategoria`;
DELIMITER //
//
DELIMITER ;

-- Copiando estrutura para procedure lanchonete3si_2023.proc_insereCliente
DROP PROCEDURE IF EXISTS `proc_insereCliente`;
DELIMITER //
//
DELIMITER ;

-- Copiando estrutura para procedure lanchonete3si_2023.proc_insereMarca
DROP PROCEDURE IF EXISTS `proc_insereMarca`;
DELIMITER //
//
DELIMITER ;

-- Copiando estrutura para procedure lanchonete3si_2023.proc_insereProduto
DROP PROCEDURE IF EXISTS `proc_insereProduto`;
DELIMITER //
CREATE PROCEDURE `proc_insereProduto`(
	IN `nomeInserir` VARCHAR(200),
	IN `precoCustoInserir` DECIMAL(10,2),
	IN `precoVendaInserir` DECIMAL(10,2),
	IN `categoriaInserir` INT,
	IN `marcaInserir` INT
)
BEGIN
	INSERT INTO produto(nome, precoCusto, precoVenda, categoria_codCategoria, marca_codMarca)
	VALUES(nomeInserir, precoCustoInserir, precoVendaInserir, categoriaInserir, marcaInserir);
		
END//
DELIMITER ;

-- Copiando estrutura para trigger lanchonete3si_2023.tri_atualizaEstoque
DROP TRIGGER IF EXISTS `tri_atualizaEstoque`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_atualizaEstoque` AFTER UPDATE ON `itemvenda` FOR EACH ROW BEGIN

IF (NEW.quantidade > OLD.quantidade)
	THEN
		UPDATE produto
		SET quantidadeEstoque = quantidadeEstoque - (NEW.quantidade - OLD.quantidade)
		WHERE codProduto = NEW.PRODUTO_codProduto;
	ELSE IF (NEW.quantidade < OLD.quantidade)
		THEN
			UPDATE produto
			SET quantidadeEstoque = quantidadeEstoque + (OLD.quantidade - NEW.quantidade)
			WHERE codProduto = NEW.PRODUTO_codProduto;
	END IF;
END IF;
	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger lanchonete3si_2023.tri_atualizaMargemLucro
DROP TRIGGER IF EXISTS `tri_atualizaMargemLucro`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_atualizaMargemLucro` BEFORE UPDATE ON `produto` FOR EACH ROW BEGIN

IF (NEW.margemLucro != OLD.margemLucro)
	THEN
		SET NEW.precoVenda = NEW.precoCusto + (NEW.precoCusto * (NEW.margemLucro / 100));
END IF;

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger lanchonete3si_2023.tri_baixaEstoque
DROP TRIGGER IF EXISTS `tri_baixaEstoque`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_baixaEstoque` BEFORE INSERT ON `itemvenda` FOR EACH ROW BEGIN
	UPDATE produto 
	SET produto.quantidadeEstoque = produto.quantidadeEstoque - NEW.quantidade
	WHERE produto.codProduto = NEW.PRODUTO_codProduto;
	
	SELECT nome INTO @nomeProd 
	FROM produto
	WHERE codProduto = NEW.PRODUTO_codProduto;
	
	SET @mensagem =
	CONCAT("Produto vendido = ", @nomeProd, ", Quantidade = ", NEW.quantidade,
	", para a venda = ", NEW.VENDA_codVenda);
	
	INSERT INTO auditoria
	VALUES(NULL, @mensagem, "itemvenda", NOW(), USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger lanchonete3si_2023.tri_calculaPrecoVenda
DROP TRIGGER IF EXISTS `tri_calculaPrecoVenda`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_calculaPrecoVenda` BEFORE INSERT ON `produto` FOR EACH ROW BEGIN

IF(NEW.margemLucro > 0) 
	THEN
		SET NEW.precoVenda = NEW.precoCusto + (NEW.precoCusto * (NEW.margemLucro / 100));
END IF;
	
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger lanchonete3si_2023.tri_devolveEstoque
DROP TRIGGER IF EXISTS `tri_devolveEstoque`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_devolveEstoque` AFTER DELETE ON `itemvenda` FOR EACH ROW BEGIN
	UPDATE produto 
	SET produto.quantidadeEstoque = produto.quantidadeEstoque + OLD.quantidade
	WHERE produto.codProduto = OLD.PRODUTO_codProduto;
	
	SELECT nome INTO @nomeProd 
	FROM produto
	WHERE codProduto = OLD.PRODUTO_codProduto;
	
	SET @mensagem =
	CONCAT("Produto devolvido = ", @nomeProd, ", Quantidade = ", OLD.quantidade,
	", pela venda = ", OLD.VENDA_codVenda);
	
	INSERT INTO auditoria
	VALUES(NULL, @mensagem, "itemvenda", NOW(), USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para view lanchonete3si_2023.v_nascimentoclientes
DROP VIEW IF EXISTS `v_nascimentoclientes`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_nascimentoclientes`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_nascimentoclientes` AS (select `cliente`.`nome` AS `Nome`,date_format(`cliente`.`dataNascimento`,'%d/%m/%Y') AS `Data de Nascimento` from `cliente`);

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
