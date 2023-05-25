# Relatório consolidado para mostrar todas as vendas para determinado cliente

SELECT V.codVenda, DATE_FORMAT(V.dataHora, "%d/%m/%Y %H:%i") AS dataHora, C.nome 
FROM venda AS V 
INNER JOIN cliente AS C
ON V.CLIENTE_codCliente = C.codCliente
WHERE V.CLIENTE_codCliente = 3
ORDER BY V.codVenda;