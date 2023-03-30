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