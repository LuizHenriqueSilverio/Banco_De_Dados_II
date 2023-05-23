# Relatório consolidado para mostrar todas as vendas para determinado cliente

SELECT * FROM venda AS V 
INNER JOIN cliente AS C
ON V.CLIENTE_codCliente = C.codCliente;