USE agencia3si;

#Descrição e inserção na tabela de contas
DESC conta;
INSERT INTO conta VALUES (NULL, "Salário", 800.50, "abc123");
INSERT INTO conta VALUES (NULL, "Poupança", 1250.00, "teste");
INSERT INTO conta VALUES (NULL, "Poupança", 3000.00, "senha12");
INSERT INTO conta VALUES (NULL, "Corrente", 125.10, "*23AB*");

#Mostrar o valor financeiro em poder da agência
SELECT FORMAT(SUM(saldo), 2) AS Total FROM conta;

#Mostrar o menor saldo
SELECT MIN(saldo) AS "Menor Saldo" FROM conta;

#Mostrar o maior saldo
SELECT MAX(saldo) AS "Maior Saldo" FROM conta;

#Mostrar a média dos saldos
SELECT FORMAT(AVG(saldo), 2) AS "Média de Saldos" FROM conta;

#Mostrar os dados da conta com maior saldo
SELECT * FROM conta ORDER BY saldo DESC LIMIT 1;

#Descrever a tabela de contas vinculadas e inserir dados
DESC contavinculada;
INSERT INTO contavinculada VALUES (1, 1, "2022-12-20");
INSERT INTO contavinculada VALUES (2, 3, "2023-01-05");
INSERT INTO contavinculada VALUES (3, 2, "2022-02-08");
INSERT INTO contavinculada VALUES (4, 4, "2022-03-04");

/* Criar um relatório que mostre o nome de cada cliente,
	o identificador de sua conta com respectivo saldo
	e a data de abertura da mesma no formato brasileiro */
	
SELECT C.nome AS "Nome",
	   CO.tipo AS "Tipo de Conta",
	   CO.saldo AS "Saldo da Conta",
	   date_format(COV.dataAbertura, "%d/%m/%Y") AS "Data de Abertura"
	   FROM cliente AS C
	   INNER JOIN conta AS CO
	   INNER JOIN contavinculada AS COV
	   ON COV.CLIENTE_idCLIENTE = C.idCliente
	   AND COV.CONTA_idCONTA = CO.idCONTA;
	   