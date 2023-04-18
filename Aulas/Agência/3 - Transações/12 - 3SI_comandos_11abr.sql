/*
	Transação para deletar uma conta vinculada
	e depois a conta
*/

SELECT * FROM conta;
SELECT * FROM contavinculada;

BEGIN;
	DELETE FROM contavinculada WHERE CONTA_idCONTA = 1;
	DELETE FROM conta WHERE idCONTA = 1;
COMMIT;

SELECT * FROM conta;
SELECT * FROM contavinculada;