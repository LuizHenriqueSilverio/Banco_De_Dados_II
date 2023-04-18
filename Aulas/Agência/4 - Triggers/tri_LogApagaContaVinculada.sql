/*
	Proposta: criar um trigger(tri_LogApagaContaVinculada) 
	que registre na Auditoria a exclusão 
	de uma conta vinculada.
*/

delimiter $

CREATE TRIGGER tri_LogApagaContaVinculada
AFTER DELETE
ON contavinculada
FOR EACH ROW
BEGIN
	INSERT INTO auditoria 
	VALUES(NULL, "Exclusão de Reistro", "contavinculada", NOW(), USER());
END$

delimiter ;