SET SEARCH_PATH to trabalho_g1;

CREATE OR REPLACE PROCEDURE proc_cria_sessoes(id_espec IN INT, inicio IN TIMESTAMP WITHOUT TIME ZONE, id_periodicidade IN INT, duracao INT, preco IN NUMERIC)
AS
    $BODY$
        DECLARE
            id_espetaculo ALIAS FOR id_espec;
            id_periodicidade ALIAS FOR id_periodicidade;
            espetaculo VARCHAR(50);
            periodicidade VARCHAR(50);
        BEGIN
            SELECT e.nome INTO espetaculo FROM espetaculo e WHERE e.cod_espetaculo = id_espetaculo;
            IF espetaculo IS NULL THEN
                RAISE EXCEPTION 'Este espetáculo não existe.';
            end if;
            SELECT p.descricao INTO periodicidade FROM periodicidade p WHERE p.cod_periodicidade = id_periodicidade;
            IF periodicidade IS NULL THEN
                RAISE EXCEPTION 'Esta periodicidade não existe.';
            end if;
            INSERT INTO sessao (cod_espetaculo, data_hora_inicio, duracao, preco, cod_periodicidade)
                        VALUES (id_espetaculo, inicio, duracao, preco, id_periodicidade);
        end;
    $BODY$
LANGUAGE plpgsql;

call proc_cria_sessoes(1, '2022-10-07', 2, 120, 12.50);