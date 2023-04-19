/* 
	Proposta: criar um trigger que registre
	no LOG de Auditoria a alteração de CPF de
	um cliente da agência 
*/

delimiter $

CREATE TRIGGER tri_LogFiscalizaCPF 
AFTER UPDATE ON cliente
FOR EACH ROW
BEGIN
	
	SET @mensagem = CONCAT("CPF do Cliente: ", NEW.nome, " foi alterado para ", NEW.cpf, ". CPF antigo era: ", OLD.cpf);
	INSERT INTO auditoria
	VALUES(NULL, @mensagem, "cliente", NOW(), USER());
	
END$

delimiter ;