/*
	Mostrar id, nome e telefone dos clientes
	que possuem essa informação (telefone)
*/

CREATE VIEW agenda1 AS(
SELECT idCliente, nome, telefone FROM cliente AS cli
WHERE telefone IS NOT NULL
);

RENAME TABLE agenda1 TO v_agenda;

SELECT * FROM v_agenda;