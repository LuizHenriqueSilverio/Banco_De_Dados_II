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


-- Copiando estrutura do banco de dados para psf_luizedaiana
DROP DATABASE IF EXISTS `psf_luizedaiana`;
CREATE DATABASE IF NOT EXISTS `psf_luizedaiana` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `psf_luizedaiana`;

-- Copiando estrutura para tabela psf_luizedaiana.auditoria
DROP TABLE IF EXISTS `auditoria`;
CREATE TABLE IF NOT EXISTS `auditoria` (
  `idAuditoria` int(11) NOT NULL AUTO_INCREMENT,
  `acao` varchar(400) DEFAULT NULL,
  `tabela` varchar(50) DEFAULT NULL,
  `dataHora` datetime DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idAuditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Registra as principais alterações neste BD.';

-- Copiando dados para a tabela psf_luizedaiana.auditoria: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` (`idAuditoria`, `acao`, `tabela`, `dataHora`, `usuario`) VALUES
	(1, 'Novo paciente registrado no sistema. Código: 14. Nome: Rogério Telles. CPF: 584.015.695-41. Telefone: (35) 98145-0486. Endereço: Rua Pica-Pau, Nº58, Monte Verde, Paraguaçu-MG', 'pacientes', '2023-05-02 10:06:04', 'root@localhost'),
	(2, 'Novo paciente registrado no sistema. Código: 15. Nome: Roberto Silvério. CPF: 081.896.201-59. Telefone: (35)94123-6890. Endereço: Rua Bem-te-vi, Nº57, Macuco, Paraguaçu-MG', 'conta', '2023-05-02 10:23:32', 'root@localhost'),
	(3, 'Médico excluído do registro. Código: 5. Nome: André Durães. CRM: 48208.', 'medicos', '2023-05-02 10:38:27', 'root@localhost');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;

-- Copiando estrutura para tabela psf_luizedaiana.consultas
DROP TABLE IF EXISTS `consultas`;
CREATE TABLE IF NOT EXISTS `consultas` (
  `codCONSULTA` int(11) NOT NULL AUTO_INCREMENT,
  `dataHora` datetime NOT NULL,
  `motivo` varchar(200) NOT NULL,
  `MEDICOS_codMEDICOS` int(11) NOT NULL,
  `PACIENTES_codPACIENTES` int(11) NOT NULL,
  PRIMARY KEY (`codCONSULTA`,`MEDICOS_codMEDICOS`,`PACIENTES_codPACIENTES`),
  KEY `fk_CONSULTAS_MEDICOS_idx` (`MEDICOS_codMEDICOS`),
  KEY `fk_CONSULTAS_PACIENTES1_idx` (`PACIENTES_codPACIENTES`),
  CONSTRAINT `fk_CONSULTAS_MEDICOS` FOREIGN KEY (`MEDICOS_codMEDICOS`) REFERENCES `medicos` (`codMEDICOS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTAS_PACIENTES1` FOREIGN KEY (`PACIENTES_codPACIENTES`) REFERENCES `pacientes` (`codPACIENTES`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela psf_luizedaiana.consultas: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
INSERT INTO `consultas` (`codCONSULTA`, `dataHora`, `motivo`, `MEDICOS_codMEDICOS`, `PACIENTES_codPACIENTES`) VALUES
	(27, '2022-12-01 15:30:09', 'Paciente reclama de dor de dente constante. Possível cárie.', 3, 3),
	(28, '2022-12-05 17:00:00', 'Paciente sente dor constante nas pernas.', 2, 4),
	(29, '2023-04-04 10:41:37', 'Paciente possui dor de coluna crônica', 4, 3);
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;

-- Copiando estrutura para tabela psf_luizedaiana.medicos
DROP TABLE IF EXISTS `medicos`;
CREATE TABLE IF NOT EXISTS `medicos` (
  `codMEDICOS` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `crm` varchar(45) NOT NULL,
  `especialidade` varchar(200) NOT NULL,
  PRIMARY KEY (`codMEDICOS`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela psf_luizedaiana.medicos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` (`codMEDICOS`, `nome`, `crm`, `especialidade`) VALUES
	(2, 'Daiana Mendes', '45893', 'Clínico Geral'),
	(3, 'Luiz Silvério Cunha', '17920', 'Dentista'),
	(4, 'Pedro Henrique', '86056', 'Clínico Geral');
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;

-- Copiando estrutura para tabela psf_luizedaiana.pacientes
DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE IF NOT EXISTS `pacientes` (
  `codPACIENTES` int(11) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(100) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  PRIMARY KEY (`codPACIENTES`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela psf_luizedaiana.pacientes: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` (`codPACIENTES`, `cpf`, `nome`, `telefone`, `endereco`) VALUES
	(3, '123,456,789-10', 'José da Silva', '35 99999-9999', 'Rua das Acácias, Nº 180, Centro'),
	(4, '400,289,227-89', 'Gabriel Caproni Pegoraro', '(35) 4002-8922', 'Rua Maria, nº76, Centro, Carvalhópolis-MG'),
	(5, '489.017.638-77', 'Rogério da Silva', '(35) 3284-5567', 'Avenida Dom Bosco, nº558, Centro, Paraguaçu-MG'),
	(6, '048.048.682-99', 'Guilherme Henrique Silva', '', 'Avenida Dom Bosco, nº27, Centro, Paraguaçu-MG'),
	(10, '842.984.085-21', 'Geveraldo Antônio', '(35) 9 7937-6971', 'Rua Gaivotas, nº359, Centenário'),
	(14, '584.015.695-41', 'Rogério Telles', '(35) 98145-0486', 'Rua Pica-Pau, Nº58, Monte Verde, Paraguaçu-MG'),
	(15, '081.896.201-59', 'Roberto Silvério', '(35)94123-6890', 'Rua Bem-te-vi, Nº57, Macuco, Paraguaçu-MG');
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;

-- Copiando estrutura para tabela psf_luizedaiana.receitas
DROP TABLE IF EXISTS `receitas`;
CREATE TABLE IF NOT EXISTS `receitas` (
  `codRECEITA` int(11) NOT NULL AUTO_INCREMENT,
  `medicamentos` varchar(100) NOT NULL,
  `posologia` varchar(200) NOT NULL,
  `consultas_codCONSULTA` int(11) NOT NULL,
  `consultas_MEDICOS_codMEDICOS` int(11) NOT NULL,
  `consultas_PACIENTES_codPACIENTES` int(11) NOT NULL,
  PRIMARY KEY (`codRECEITA`,`consultas_codCONSULTA`,`consultas_MEDICOS_codMEDICOS`,`consultas_PACIENTES_codPACIENTES`),
  KEY `fk_receitas_consultas1_idx` (`consultas_codCONSULTA`,`consultas_MEDICOS_codMEDICOS`,`consultas_PACIENTES_codPACIENTES`),
  CONSTRAINT `fk_receitas_consultas1` FOREIGN KEY (`consultas_codCONSULTA`, `consultas_MEDICOS_codMEDICOS`, `consultas_PACIENTES_codPACIENTES`) REFERENCES `consultas` (`codCONSULTA`, `MEDICOS_codMEDICOS`, `PACIENTES_codPACIENTES`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela psf_luizedaiana.receitas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `receitas` DISABLE KEYS */;
/*!40000 ALTER TABLE `receitas` ENABLE KEYS */;

-- Copiando estrutura para tabela psf_luizedaiana.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `codusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  PRIMARY KEY (`codusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela psf_luizedaiana.usuarios: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`codusuario`, `nome`, `senha`) VALUES
	(1, 'adm', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
	(2, 'Luiz', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Copiando estrutura para view psf_luizedaiana.v_clientetelefone
DROP VIEW IF EXISTS `v_clientetelefone`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_clientetelefone` (
	`nome` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`telefone` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci',
	`endereco` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view psf_luizedaiana.v_clinicosgerais
DROP VIEW IF EXISTS `v_clinicosgerais`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_clinicosgerais` (
	`nome` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`crm` VARCHAR(45) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para view psf_luizedaiana.v_consultas
DROP VIEW IF EXISTS `v_consultas`;
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_consultas` (
	`Data e Hora` VARCHAR(24) NULL COLLATE 'utf8mb4_general_ci',
	`Motivo` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Copiando estrutura para procedure psf_luizedaiana.proc_alteraConsulta
DROP PROCEDURE IF EXISTS `proc_alteraConsulta`;
DELIMITER //
CREATE PROCEDURE `proc_alteraConsulta`(IN codCons INT, IN dataHora DATETIME, IN motivo VARCHAR(200),  IN Pacientes_codPacientes INT, IN Medicos_codMedicos INT)
BEGIN
	UPDATE `psf_luizedaiana`.`consultas`
	SET
	`dataHora` = dataHora,
	`motivo` = motivo,
	`MEDICOS_codMEDICOS` = Medicos_codMedicos,
	`PACIENTES_codPACIENTES` = Pacientes_codPacientes
	WHERE `codCONSULTA` = codCons;
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_alteraMedico
DROP PROCEDURE IF EXISTS `proc_alteraMedico`;
DELIMITER //
CREATE PROCEDURE `proc_alteraMedico`(IN nome VARCHAR(100), IN crm VARCHAR(45), IN espMed VARCHAR(200),IN cod INT)
BEGIN
	UPDATE `psf_luizedaiana`.`medicos`
	SET
		`nome` = nome,
		`crm` = crm,
        `especialidade` = espMed
	WHERE `codMEDICOS` = cod;

END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_alteraPaciente
DROP PROCEDURE IF EXISTS `proc_alteraPaciente`;
DELIMITER //
CREATE PROCEDURE `proc_alteraPaciente`(IN cpf VARCHAR(100), IN nome VARCHAR(200), IN telefone VARCHAR(45), IN endereco VARCHAR(200))
BEGIN
	UPDATE `psf_luizedaiana`.`pacientes`
	SET
		`cpf` = cpf,
		`nome` = nome,
		`telefone` = telefone,
		`endereco` = endereco
	WHERE `codPACIENTES` = cod;

END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_alteraReceita
DROP PROCEDURE IF EXISTS `proc_alteraReceita`;
DELIMITER //
CREATE PROCEDURE `proc_alteraReceita`(IN meds VARCHAR(100), IN posologia VARCHAR(200), IN codConsulta INT, IN codMed INT, IN codPac INT, IN codRec INT)
BEGIN
	UPDATE `psf_luizedaiana`.`receitas`
	SET
	`medicamentos` = meds,
	`posologia` = posologia,
	`consultas_codCONSULTA` = codConsulta,
	`consultas_MEDICOS_codMEDICOS` = codMed,
	`consultas_PACIENTES_codPACIENTES` = codPac
	WHERE `codRECEITA` = codRec;

END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_consultaLogin
DROP PROCEDURE IF EXISTS `proc_consultaLogin`;
DELIMITER //
CREATE PROCEDURE `proc_consultaLogin`(IN usuario VARCHAR(100), IN senha VARCHAR(100))
BEGIN
	SELECT * FROM USUARIOS 
    WHERE USUARIOS.nome = usuario
    AND USUARIOS.senha = senha;
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_deletaConsulta
DROP PROCEDURE IF EXISTS `proc_deletaConsulta`;
DELIMITER //
CREATE PROCEDURE `proc_deletaConsulta`(IN codCons INT)
BEGIN
	DELETE FROM `psf_luizedaiana`.`consultas`
	WHERE `codCONSULTA` = codCons;
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_deletaMedico
DROP PROCEDURE IF EXISTS `proc_deletaMedico`;
DELIMITER //
CREATE PROCEDURE `proc_deletaMedico`(IN codMed INT)
BEGIN
	DELETE FROM `psf_luizedaiana`.`medicos`
	WHERE codMedicos = codMed;
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_deletaPaciente
DROP PROCEDURE IF EXISTS `proc_deletaPaciente`;
DELIMITER //
CREATE PROCEDURE `proc_deletaPaciente`(IN codPac INT)
BEGIN
	DELETE FROM `psf_luizedaiana`.`pacientes`
	WHERE codPacientes = codPac;
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_deletaReceita
DROP PROCEDURE IF EXISTS `proc_deletaReceita`;
DELIMITER //
CREATE PROCEDURE `proc_deletaReceita`(IN codRec INT)
BEGIN
	DELETE FROM `psf_luizedaiana`.`receitas`
	WHERE `codRECEITA` = codRec;
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_insereConsulta
DROP PROCEDURE IF EXISTS `proc_insereConsulta`;
DELIMITER //
CREATE PROCEDURE `proc_insereConsulta`(IN dataHora DATETIME, IN motivo VARCHAR(200), IN Medicos_codMedicos INT, IN Paciente_codPacientes INT)
BEGIN
	INSERT INTO `psf_luizedaiana`.`consultas`
	(
		`dataHora`,
		`motivo`,
		`MEDICOS_codMEDICOS`,
		`PACIENTES_codPACIENTES`)
	VALUES(
		dataHora,
		motivo,
		Medicos_codMedicos,
		Paciente_codPacientes
	);


END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_insereLogin
DROP PROCEDURE IF EXISTS `proc_insereLogin`;
DELIMITER //
CREATE PROCEDURE `proc_insereLogin`(IN usuario VARCHAR(100), IN senha VARCHAR(100))
BEGIN
	INSERT INTO `psf_luizedaiana`.`usuarios`
	(
	`nome`,
	`senha`
    )
	VALUES
	(
	nome,
	senha
    );
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_insereMedico
DROP PROCEDURE IF EXISTS `proc_insereMedico`;
DELIMITER //
CREATE PROCEDURE `proc_insereMedico`(IN nomeMed VARCHAR(100), IN crmMed VARCHAR(45), IN espMed VARCHAR(200))
BEGIN
	INSERT INTO `psf_luizedaiana`.`medicos`
	(
	`nome`,
	`crm`,
	`especialidade`
    )
	VALUES
	(
	nomeMed,
	crmMed,
	espMed
    );

END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_inserePaciente
DROP PROCEDURE IF EXISTS `proc_inserePaciente`;
DELIMITER //
CREATE PROCEDURE `proc_inserePaciente`(IN cpfPaciente VARCHAR(100), 
										IN nomePaciente VARCHAR(100), 
                                        IN telefone VARCHAR(45), 
                                        IN endereco VARCHAR(100))
BEGIN
	INSERT INTO `psf_luizedaiana`.`pacientes`
	(
	`cpf`,
	`nome`,
	`telefone`,
	`endereco`)
	VALUES
	(
	cpfPaciente,
	nomePaciente,
	telefone,
	endereco
    );

END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_insereReceita
DROP PROCEDURE IF EXISTS `proc_insereReceita`;
DELIMITER //
CREATE PROCEDURE `proc_insereReceita`(IN meds VARCHAR(100), IN posologia VARCHAR(200), IN codConsulta INT, IN codMed INT, IN codPac INT)
BEGIN
	INSERT INTO `psf_luizedaiana`.`receitas`
	(
	`medicamentos`,
	`posologia`,
	`consultas_codCONSULTA`,
	`consultas_MEDICOS_codMEDICOS`,
	`consultas_PACIENTES_codPACIENTES`)
	VALUES
	(
	meds,
	posologia,
	codConsulta,
	codMed,
	codPac
    );

END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_listaConsMed
DROP PROCEDURE IF EXISTS `proc_listaConsMed`;
DELIMITER //
CREATE PROCEDURE `proc_listaConsMed`(IN codMed INT)
BEGIN
	SELECT C.codConsulta AS 'Código',
		   date_format(C.dataHora, "%d/%m/%Y, %H:%i") AS 'Data e Hora',
           C.motivo AS 'Motivo',
           M.nome AS 'Nome do Médico',
           P.nome AS 'Nome do Paciente'
           FROM CONSULTA AS C
           INNER JOIN MEDICOS AS M
           INNER JOIN PACIENTES AS P
           ON C.MEDICOS_codMEDICOS = M.codMEDICOS
           AND C.PACIENTES_codPACIENTES = P.codPACIENTES
           WHERE M.codMEDICOS = codMed;
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_listaConsPac
DROP PROCEDURE IF EXISTS `proc_listaConsPac`;
DELIMITER //
CREATE PROCEDURE `proc_listaConsPac`(IN codPac INT)
BEGIN
	SELECT C.codConsulta AS 'Código',
		   date_format(C.dataHora, "%d/%m/%Y, %H:%i") AS 'Data e Hora',
           C.motivo AS 'Motivo',
           M.nome AS 'Nome do Médico',
           P.nome AS 'Nome do Paciente'
           FROM CONSULTA AS C
           INNER JOIN MEDICOS AS M
           INNER JOIN PACIENTES AS P
           ON C.MEDICOS_codMEDICOS = M.codMEDICOS
           AND C.PACIENTES_codPACIENTES = P.codPACIENTES
           WHERE P.codPACIENTES = codPac;
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_listaConsultas
DROP PROCEDURE IF EXISTS `proc_listaConsultas`;
DELIMITER //
CREATE PROCEDURE `proc_listaConsultas`()
BEGIN
	SELECT C.codConsulta AS 'Código',
		   date_format(C.dataHora, "%d/%m/%Y, %H:%i") AS 'Data e Hora',
           C.motivo AS 'Motivo',
           M.nome AS 'Nome do Médico',
           P.nome AS 'Nome do Paciente'
           FROM CONSULTAS AS C
           INNER JOIN MEDICOS AS M
           INNER JOIN PACIENTES AS P
           ON C.MEDICOS_codMEDICOS = M.codMEDICOS
           AND C.PACIENTES_codPACIENTES = P.codPACIENTES;
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_listaMedicos
DROP PROCEDURE IF EXISTS `proc_listaMedicos`;
DELIMITER //
CREATE PROCEDURE `proc_listaMedicos`()
BEGIN
	SELECT *
	FROM `psf_luizedaiana`.`medicos`;
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_listaPacientes
DROP PROCEDURE IF EXISTS `proc_listaPacientes`;
DELIMITER //
CREATE PROCEDURE `proc_listaPacientes`()
BEGIN
	SELECT *
	FROM `psf_luizedaiana`.`pacientes`;
END//
DELIMITER ;

-- Copiando estrutura para procedure psf_luizedaiana.proc_listaReceitas
DROP PROCEDURE IF EXISTS `proc_listaReceitas`;
DELIMITER //
CREATE PROCEDURE `proc_listaReceitas`()
BEGIN
	SELECT R.codReceita AS 'Código',
		   R.medicamento AS 'Medicamento(s)',
           R.posologia AS 'posologia',
           C.codConsulta AS 'Código da Consulta',
           M.nome AS 'Nome do médico',
           P.nome AS 'Nome do paciente'
           FROM RECEITAS AS R
           INNER JOIN CONSULTAS AS C
           INNER JOIN MEDICOS AS M
           INNER JOIN PACIENTES AS P
           ON R.consultas_codCONSULTA = C.codCONSULTA
           AND R.consultas_MEDICOS_codMEDICOS = M.codMEDICOS
           AND R.consultas_PACIENTES_codPACIENTES = P.codPACIENTES;
END//
DELIMITER ;

-- Copiando estrutura para trigger psf_luizedaiana.tri_LogAlteraCpfPaciente
DROP TRIGGER IF EXISTS `tri_LogAlteraCpfPaciente`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogAlteraCpfPaciente` AFTER UPDATE ON `pacientes` FOR EACH ROW BEGIN
    IF(NEW.cpf != OLD.cpf)
    THEN
		SET @mensagem = CONCAT("O CPF do Paciente: ", NEW.nome, " foi alterado para ", 
					NEW.cpf, ". CPF antigo era: ", OLD.cpf);
		INSERT INTO auditoria
		VALUES(NULL, @mensagem, "pacientes", NOW(), USER());
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger psf_luizedaiana.tri_LogApagaMedico
DROP TRIGGER IF EXISTS `tri_LogApagaMedico`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogApagaMedico` BEFORE DELETE ON `medicos` FOR EACH ROW BEGIN
	SET @mensagem = CONCAT("Médico excluído do registro. Código: ", 
	OLD.codMEDICOS, ". Nome: ", OLD.nome, ". CRM: ", OLD.crm, 
	".");
	
	INSERT INTO auditoria
	VALUES(NULL, @mensagem, "medicos", NOW(), USER()); 
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para trigger psf_luizedaiana.tri_LogInserePaciente
DROP TRIGGER IF EXISTS `tri_LogInserePaciente`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `tri_LogInserePaciente` AFTER INSERT ON `pacientes` FOR EACH ROW BEGIN
	SET @mensagem = CONCAT("Novo paciente registrado no sistema. 
	Código: ", NEW.codPACIENTES, ". Nome: ", NEW.nome, ". CPF: ", NEW.cpf, 
	". Telefone: ", NEW.telefone, ". Endereço: ", NEW.endereco);
	INSERT INTO auditoria
	VALUES(NULL, @mensagem, "conta", NOW(), USER());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Copiando estrutura para view psf_luizedaiana.v_clientetelefone
DROP VIEW IF EXISTS `v_clientetelefone`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_clientetelefone`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_clientetelefone` AS (
	SELECT nome, telefone, endereco FROM pacientes AS pac
	WHERE telefone IS NOT NULL
) ;

-- Copiando estrutura para view psf_luizedaiana.v_clinicosgerais
DROP VIEW IF EXISTS `v_clinicosgerais`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_clinicosgerais`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_clinicosgerais` AS (
	SELECT nome, crm FROM medicos
	WHERE especialidade = "Clínico Geral"
) ;

-- Copiando estrutura para view psf_luizedaiana.v_consultas
DROP VIEW IF EXISTS `v_consultas`;
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_consultas`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_consultas` AS (
	SELECT DATE_FORMAT(dataHora, "%d/%m/%Y %H:%m:%s") AS "Data e Hora", motivo AS "Motivo"
	FROM consultas
) ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
