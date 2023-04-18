/*
	Transação para colocar os nome dos clientes em
	letras MAIÚSCULAS desde que possuam telefone 
	cadastrado
*/

SELECT * FROM cliente;

BEGIN;
	UPDATE cliente SET nome = UPPER(nome)
	WHERE telefone IS NOT NULL;
COMMIT;

SELECT * FROM cliente;