/* 
Mostrar as contas cujos saldos
sejam iguais ou maiores que a média
dos saldos
*/
SELECT * FROM conta;


SELECT format(SUM(saldo), 2) FROM conta;

SELECT COUNT(*) FROM conta;

SELECT format(SUM(saldo) / COUNT(*), 2) FROM conta;

SELECT format(AVG(saldo), 2) FROM conta;

#Subconsulta
SELECT * FROM conta WHERE saldo >= (SELECT AVG(saldo) FROM conta);

/* 
Mostrar as contas vinculadas aos clientes
com idade superior a 35 anos
*/

SELECT * FROM contavinculada HAVING Cliente_idCliente IN
(SELECT idCliente FROM cliente WHERE FLOOR(DATEDIFF(CURDATE(), dataNascimento)/ 365) > 35);