/*
	Relatório de clientes com mais de 45 anos
	e com contas vinculadas
*/

SELECT * FROM contavinculada
HAVING contavinculada.CLIENTE_idCLIENTE IN 
(SELECT idCliente FROM cliente WHERE 
 FLOOR(DATEDIFF(CURDATE(), dataNascimento) / 365) > 45
);

/* 
	Relatório com agrupamento dos saldos
	pelo tipo de conta
*/

SELECT tipo, SUM(saldo) AS somaSaldo
FROM conta GROUP BY tipo;

/* 
	Relatório das contas mostrando o tipo
	e soma dos saldos tendo a soma maior
	que a média
*/

SELECT tipo, SUM(saldo) AS somaSaldo
FROM conta GROUP BY tipo 
HAVING somaSaldo > (SELECT AVG(saldo) FROM conta);