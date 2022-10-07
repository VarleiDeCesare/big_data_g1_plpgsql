SET SEARCH_PATH to trabalho_g1;

CREATE OR REPLACE FUNCTION func_reserva(integer default null) RETURNS TABLE (nome varchar(50), descricao varchar(50), qt_ativas bigint, qt_inativas bigint) AS
    $BODY$
        DECLARE
            nome_espec VARCHAR(50);
            id_espec ALIAS FOR $1;
        BEGIN
            IF id_espec  IS NULL THEN
                RAISE EXCEPTION 'O código do espetáculo é um valor obrigatório a ser passado';
            end if;
            SELECT e.nome INTO nome_espec FROM estabelecimento e WHERE e.cod_estabelecimento = id_espec;
            IF nome_espec IS NULL THEN
                RAISE EXCEPTION 'Este espetáculo não existe.';
            end if;
            RETURN QUERY SELECT
                e.nome,
                e.descricao,
                COUNT ( DISTINCT r.cod_reserva ) AS qt_ativas,
                COUNT ( DISTINCT r.cod_reserva ) AS qt_inativas
            FROM
                espetaculo e
                LEFT JOIN reserva r on e.cod_espetaculo = r.cod_espetaculo
                LEFT JOIN pedido p on p.cod_pedido = r.cod_pedido
            WHERE
                e.cod_estabelecimento = id_espec
            GROUP BY e.nome, e.descricao;
        end;
    $BODY$
LANGUAGE plpgsql VOLATILE;
