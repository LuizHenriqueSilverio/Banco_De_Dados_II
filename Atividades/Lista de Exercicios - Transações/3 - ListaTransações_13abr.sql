/*
	Transação para excluir 2 pacientes
*/

SELECT * FROM pacientes;
BEGIN;
	
	DELETE FROM pacientes
	WHERE codPacientes = 13;
	
	DELETE FROM pacientes
	WHERE nome LIKE "%Hortência%";
	
	SELECT * FROM pacientes;
COMMIT;