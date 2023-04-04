/*
	Criando uma VIEW que mostre o total
	financeiro em poder do banco
*/

# Mostrando o total financeiro da Agência

SELECT SUM(saldo) FROM conta;

# Criando a view chamada v_TotalFinanceiro

CREATE VIEW v_TotalFinanceiro AS 
(SELECT SUM(saldo) FROM conta);

SELECT * FROM v_totalfinanceiro;

/*
	Comando para mostrar o nome do cliente, o tipo
	de sua(s) conta(s) e respectivo(s) saldo(s).
*/

SELECT cli.nome, con.tipo, con.saldo FROM cliente AS cli
INNER JOIN conta AS con
INNER JOIN contavinculada AS cv
ON cli.idCLIENTE = cv.CLIENTE_idCLIENTE
AND con.idCONTA = cv.CONTA_idCONTA;

SELECT * FROM v_contasclientes;