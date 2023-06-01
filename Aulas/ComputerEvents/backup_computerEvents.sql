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


-- Copiando estrutura do banco de dados para computerevents3si
DROP DATABASE IF EXISTS `computerevents3si`;
CREATE DATABASE IF NOT EXISTS `computerevents3si` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `computerevents3si`;

-- Copiando estrutura para tabela computerevents3si.atividade
DROP TABLE IF EXISTS `atividade`;
CREATE TABLE IF NOT EXISTS `atividade` (
  `codAtividade` int(11) NOT NULL AUTO_INCREMENT,
  `tema` varchar(200) NOT NULL,
  `dataHoraInicio` datetime NOT NULL,
  `dataHoraTermino` datetime NOT NULL,
  `numVagas` int(11) NOT NULL,
  `palestrantes` varchar(450) NOT NULL,
  `cpfPalestrantes` varchar(200) NOT NULL,
  `local` varchar(200) NOT NULL,
  `tipo` enum('Palestra Presencial','Palestra online','Oficina','Minicurso','Roda de Conversa') NOT NULL,
  `EVENTO_codEvento` int(11) NOT NULL,
  PRIMARY KEY (`codAtividade`,`EVENTO_codEvento`),
  KEY `fk_ATIVIDADE_EVENTO1_idx` (`EVENTO_codEvento`),
  CONSTRAINT `fk_ATIVIDADE_EVENTO1` FOREIGN KEY (`EVENTO_codEvento`) REFERENCES `evento` (`codEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela computerevents3si.atividade: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `atividade` DISABLE KEYS */;
INSERT INTO `atividade` (`codAtividade`, `tema`, `dataHoraInicio`, `dataHoraTermino`, `numVagas`, `palestrantes`, `cpfPalestrantes`, `local`, `tipo`, `EVENTO_codEvento`) VALUES
	(1, 'Processo de construção de software até a precificação', '2023-06-13 09:00:00', '2023-06-13 11:00:00', 400, 'Matheus Allonso', '456.789.123-10', 'Auditório', 'Palestra Presencial', 1);
/*!40000 ALTER TABLE `atividade` ENABLE KEYS */;

-- Copiando estrutura para tabela computerevents3si.evento
DROP TABLE IF EXISTS `evento`;
CREATE TABLE IF NOT EXISTS `evento` (
  `codEvento` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `dataInicio` date NOT NULL,
  `dataTermino` date NOT NULL,
  PRIMARY KEY (`codEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela computerevents3si.evento: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` (`codEvento`, `nome`, `dataInicio`, `dataTermino`) VALUES
	(1, 'VII Computer Day', '2023-06-13', '2023-06-13');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;

-- Copiando estrutura para tabela computerevents3si.inscricao
DROP TABLE IF EXISTS `inscricao`;
CREATE TABLE IF NOT EXISTS `inscricao` (
  `PARTICIPANTE_codParticipante` int(11) NOT NULL,
  `ATIVIDADE_codAtividade` int(11) NOT NULL,
  `checkin` datetime DEFAULT NULL,
  PRIMARY KEY (`PARTICIPANTE_codParticipante`,`ATIVIDADE_codAtividade`),
  KEY `fk_PARTICIPANTE_has_ATIVIDADE_ATIVIDADE1_idx` (`ATIVIDADE_codAtividade`),
  KEY `fk_PARTICIPANTE_has_ATIVIDADE_PARTICIPANTE1_idx` (`PARTICIPANTE_codParticipante`),
  CONSTRAINT `fk_PARTICIPANTE_has_ATIVIDADE_ATIVIDADE1` FOREIGN KEY (`ATIVIDADE_codAtividade`) REFERENCES `atividade` (`codAtividade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PARTICIPANTE_has_ATIVIDADE_PARTICIPANTE1` FOREIGN KEY (`PARTICIPANTE_codParticipante`) REFERENCES `participante` (`codParticipante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela computerevents3si.inscricao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `inscricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscricao` ENABLE KEYS */;

-- Copiando estrutura para tabela computerevents3si.participante
DROP TABLE IF EXISTS `participante`;
CREATE TABLE IF NOT EXISTS `participante` (
  `codParticipante` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `sobrenome` varchar(200) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `email` varchar(200) NOT NULL,
  `TURMA_codTurma` int(11) NOT NULL,
  PRIMARY KEY (`codParticipante`,`TURMA_codTurma`),
  KEY `fk_PARTICIPANTE_TURMA_idx` (`TURMA_codTurma`),
  CONSTRAINT `fk_PARTICIPANTE_TURMA` FOREIGN KEY (`TURMA_codTurma`) REFERENCES `turma` (`codTurma`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela computerevents3si.participante: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `participante` DISABLE KEYS */;
INSERT INTO `participante` (`codParticipante`, `nome`, `sobrenome`, `cpf`, `email`, `TURMA_codTurma`) VALUES
	(1, 'Fabiano', 'Teixeira', '123.456.789-10', 'fabianoteixeira@gmail.com', 5),
	(2, 'Rosália', 'Silva Telles', '234.567.891-23', 'rosaliast@gmail.com', 3);
/*!40000 ALTER TABLE `participante` ENABLE KEYS */;

-- Copiando estrutura para tabela computerevents3si.turma
DROP TABLE IF EXISTS `turma`;
CREATE TABLE IF NOT EXISTS `turma` (
  `codTurma` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(200) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`codTurma`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela computerevents3si.turma: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` (`codTurma`, `sigla`, `descricao`) VALUES
	(1, '1SI', '1º Sistemas de Informação'),
	(2, '2SI', '2º Sistemas de Informação'),
	(3, '3SI', '3º Sistemas de Informação'),
	(4, '4SI', '4º Sistemas de Informação'),
	(5, '5SI', '5º Sistemas de Informação'),
	(6, '6SI', '6º Sistemas de Informação'),
	(7, '7SI', '7º Sistemas de Informação'),
	(8, '8SI', '8º Sistemas de Informação'),
	(9, '1INFO', '1º Ano do Técnico em Informática Integrado ao Ensino Médio'),
	(10, '2INFO', '2º Ano do Técnico em Informática Integrado ao Ensino Médio'),
	(11, '3INFO', '3º Ano do Técnico em Informática Integrado ao Ensino Médio');
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
