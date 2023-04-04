#Mostrar BD instalados
SHOW DATABASES;

#Indicar qual BD será usado
USE `agencia3si`;

#Mostar tabelas(entidades) do BD em uso;
SHOW TABLES;

#Descrever a estrutura de uma tabela especifica;
DESC `cliente`;

#Inserir um cliente
INSERT INTO cliente (idCliente, nome, cpf, dataNascimento)
VALUES(NULL, "Amanda Carvalho", "123.456.789-10", "1980-06-23");

#Inserindo vários cliente, somente campos obrigatorios
INSERT INTO cliente (idCliente, nome, cpf, dataNascimento) VALUES
	(NULL, "Rogério Carvalho", "183.358.779-50", "1979-04-25"),
	(NULL, "Lúcia Silviano", "444.036.444-77", "1989-01-15");
	

#Ordenados pela ordem de nome decrescente
SELECT * FROM cliente ORDER BY nome DESC;