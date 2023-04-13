/* 
	Transação para atualização de 3 telefones
	diferentes
*/

SELECT * FROM pacientes;
BEGIN;
	UPDATE pacientes SET telefone = "(35) 9 7937-6971"
	WHERE codPacientes = 10;
	
	UPDATE pacientes SET telefone = "(35) 9 8894-5328"
	WHERE codPacientes = 11;
	
	UPDATE pacientes SET telefone = "(35) 9 8723-8977"
	WHERE codPacientes = 12;
	
	SELECT * FROM pacientes;
COMMIT;