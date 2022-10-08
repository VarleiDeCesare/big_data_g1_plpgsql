-- I. Sessões e Ingressos

CREATE FUNCTION return_ingressos_disponiveis(in_sessao INTEGER) RETURNS numeric AS $$
DECLARE
var_ingressos_disponiveis NUMERIC;
BEGIN
SELECT ingressos_disponiveis into var_ingressos_disponiveis
FROM sessao 
WHERE cod_sessao = in_sessao;
if(var_ingressos_disponiveis > 0) then
	RETURN var_ingressos_disponiveis;
else
	RAISE EXCEPTION 'Não há mais ingressos disponíveis para essa Sessão.';	
END if;
END; $$
LANGUAGE PLPGSQL;