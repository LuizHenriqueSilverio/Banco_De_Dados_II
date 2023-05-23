# Relatório consolidado para mostrar todas as vendas para determinado cliente

SELECT V.codVenda, DATE_FORMAT(V.dataHora, "%d/%m/%Y %H:%i") FROM venda AS V 
INNER JOIN cliente AS C
ON V.CLIENTE_codCliente = C.codCliente;