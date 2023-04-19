/*
	Proposta: criar um trigger que registra no LOG
	uma inserção de uma conta com seus respectivos 
	saçdo: idConta, tipo e saldo
*/

delimiter $

CREATE TRIGGER tri_LogInsereConta
AFTER INSERT ON conta
FOR EACH ROW
BEGIN
	
	SET @mensagem = CONCAT("Código da conta: ", NEW.idConta, ", Tipo de Conta: ", NEW.tipo
	, ", Saldo inicial: R$", NEW.saldo);
	INSERT INTO auditoria
	VALUES(NULL, @mensagem, "conta", NOW(), USER());
	
END$

delimiter ;