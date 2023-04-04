/*
	Mostrar nomes dos clientes e data de nascimento
	no formato brasileiro
*/

SELECT nome AS "Nome", date_format(dataNascimento, "%d/%m/%Y") AS "Data de Nascimento" FROM cliente;

CREATE VIEW v_nascimentoClientes AS(
	SELECT nome AS "Nome", 
	date_format(dataNascimento, "%d/%m/%Y") AS "Data de Nascimento" 
	FROM cliente
);