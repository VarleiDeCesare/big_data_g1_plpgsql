SET SEARCH_PATH to trabalho_g1;

CREATE OR REPLACE PROCEDURE proc_total_ingressos(cod_sessao in int, in_cod_espetaculo in int, in_duracao in int, total_ingressos in int, in_preco numeric, in_cod_periodicidade in int)
AS
	$BODY$
		DECLARE
			id_sessao ALIAS FOR cod_sessao;
			ingressos_total ALIAS FOR total_ingressos;
		BEGIN
			SELECT COUNT(s.total_ingressos) INTO ingressos_total FROM sessao s WHERE s.cod_sessao = id_sessao;
			IF id_sessao IS NULL THEN
				RAISE EXCEPTION 'Essa sessão não existe.';
			END IF;
			IF ingressos_total IS NULL THEN
				RAISE EXCEPTION 'Não tem nenhum ingresso desta sessão com esse valor informado.';
			END IF;
			IF in_cod_espetaculo IS NULL THEN
				RAISE EXCEPTION 'Não existem espetaculos nessa sessão com esse valor informado.';
			END IF;
			IF in_duracao IS NULL THEN
				RAISE EXCEPTION 'É necessário passar uma duração na chamada da função.';
			END IF;
			IF in_preco IS NULL THEN
				RAISE EXCEPTION 'É necessário passar um preço na chamada da função.';
			END IF;
			
			UPDATE sessao SET cod_espetaculo = in_cod_espetaculo,
							  duracao = in_duracao,
							  total_ingressos = ingressos_total,
							  preco = in_preco,
							  cod_periodicidade = in_cod_periodicidade;
		END;
	$BODY$
LANGUAGE 'plpgsql'

--Chamada da procedure
call proc_total_ingressos(1,3, 90, 1, 10.50, 1);