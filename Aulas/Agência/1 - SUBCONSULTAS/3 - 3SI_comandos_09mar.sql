#Atualização do telefone do cliente 1
UPDATE cliente SET telefone = "(35)4002-8922"
WHERE idCliente = 1;

#Subconsulta para mostrar contas vinculadas de cliente com telefone
SELECT * FROM contavinculada AS CV
WHERE CV.CLIENTE_idCLIENTE IN (SELECT CLI.idCLIENTE 
							   FROM cliente AS CLI 
							   WHERE CLI.telefone IS NOT NULL);