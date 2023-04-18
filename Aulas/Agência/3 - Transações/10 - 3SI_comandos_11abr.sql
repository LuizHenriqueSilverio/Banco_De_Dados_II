/*
	Transação para atualizadação do saldo
	das contas do tipo Poupoança em 10%
*/

SELECT * FROM conta;
BEGIN;
	UPDATE conta SET saldo = saldo * 1.10
	WHERE tipo = "Poupança";
COMMIT;
SELECT * FROM conta;