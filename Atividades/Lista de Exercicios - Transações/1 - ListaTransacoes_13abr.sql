/* 
	Transação envolvendo 3 inserções de dados
*/

SELECT * FROM pacientes;
BEGIN;
    INSERT INTO pacientes
    VALUES(NULL, "842.984.085-21", "Geveraldo Antônio", "35 98048-7082", "Rua Gaivotas, nº359, Centenário");
    
    INSERT INTO pacientes
    VALUES(NULL, "052.654.088-99", "Hortência Aparecida", "35 94898-7182", "Rua Diamante, nº705, Pedras Precionas");
    
    INSERT INTO pacientes
    VALUES(NULL, "721.695.045-81", "LeBron James", "35 94657-4684", "Avenida das Pedras, nº054A, Jardim das Oliveiras");
    
    SELECT * FROM pacientes;
COMMIT;