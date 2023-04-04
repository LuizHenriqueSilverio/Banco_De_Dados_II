/*
	Selecionando nome, telefone e endereço dos pacientes
	que possuem um número de telefone cadastrado
*/

CREATE VIEW v_ClienteTelefone AS (
	SELECT nome, telefone, endereco FROM pacientes AS pac
	WHERE telefone IS NOT NULL
);

/*
	Selecionando nome e crm dos médicos 
	cuja especialidade é de Clínico Geral
*/

CREATE VIEW v_clinicosGerais AS(
	SELECT nome, crm FROM medicos
	WHERE especialidade = "Clínico Geral"
);

/*
	Selecionando data e motivo das consultas
	com a data formatada
*/

CREATE VIEW v_consultas AS(
	SELECT DATE_FORMAT(dataHora, "%d/%m/%Y %H:%m:%s") AS "Data e Hora", motivo AS "Motivo"
	FROM consultas
);

