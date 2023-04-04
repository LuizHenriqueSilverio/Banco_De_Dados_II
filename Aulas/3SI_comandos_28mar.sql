DESC cliente;

INSERT INTO cliente(idCliente, nome, cpf, dataNascimento)
VALUES(NULL, "Afrânio Rosa", "777.777.777-77", "1958-06-12");

SELECT * FROM cliente;

/*
	Criação de uma tabela virtual - VIEW para ordenar
	os clientes em ordem alfabética crescente
*/

CREATE VIEW v_ClientesOrdemCrescente AS 
(SELECT * FROM cliente ORDER BY nome);
SHOW TABLES;

/*
	Listagem dos dados de uma view
*/

SELECT * FROM v_clientesordemcrescente;