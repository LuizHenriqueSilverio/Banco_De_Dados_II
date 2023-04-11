/* 
	Subconsulta:
	Aumentar em 5 reais o saldo dos cliente de MG
*/


#Entendimento da situação-problema
SHOW TABLES;
SELECT * FROM cliente;
UPDATE cliente SET rg = "MG 999.999-99" WHERE idCliente = 1;
SELECT * FROM contavinculada;
SELECT * FROM conta;

#Codificação da subconsulta
UPDATE conta SET saldo = saldo + 5 WHERE idConta IN
(SELECT Conta_idConta FROM contavinculada WHERE Cliente_idCliente IN
(SELECT idCliente FROM cliente WHERE rg LIKE "MG%"));

/* 
	Subconsulta:
	Excluir as contas vinculadas aos clientes sem RG
*/

#Entendimento da Situação-Problema
SELECT * FROM contavinculada;
SELECT * FROM cliente;

#Codificação da subconsulta

DELETE FROM contavinculada WHERE CLIENTE_idCliente IN
(SELECT idCliente FROM cliente WHERE rg IS NULL);