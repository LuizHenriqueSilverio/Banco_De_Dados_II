/* 
	Transação para confirmar a inserção
	de 3 clientes
*/

SELECT * FROM cliente;

BEGIN;
	INSERT INTO cliente 
	VALUES(NULL, "Fernando Telles", "444.555.666-77", "MG 17.235.901", "1975-05-12", "(35)3295-1111");
	
	INSERT INTO cliente 
	VALUES(NULL, "Alessandra Silva Telles", "555.666.777-88", "MG 11.245.981", "1985-05-22", "(35)3002-4922");
	
	INSERT INTO cliente 
	VALUES(NULL, "Fernando Telles", "666.777.888-99", "MG 10.214.957", "1979-03-19", "(35)3295-6666");
COMMIT;

SELECT * FROM cliente;