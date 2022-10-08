SET SEARCH_PATH to trabalho_g1;

CREATE OR REPLACE FUNCTION func_cliente_reserva(integer default null, integer default null) RETURNS TABLE (espetaculo varchar(50), cidade varchar(50), qt_reserva bigint, qt_cliente bigint) AS
    $BODY$
        DECLARE
            id_espec ALIAS FOR $1;
            id_cid ALIAS for $2;
            nome_espec VARCHAR(50);
        BEGIN
            IF id_espec IS NULL OR id_cid IS NULL THEN
                RAISE EXCEPTION 'O código do espetáculo e da cidade são valores obrigatórios a serem passados.';
            end if;
            SELECT e.nome INTO nome_espec FROM estabelecimento e WHERE e.cod_estabelecimento = id_espec;
            IF nome_espec IS NULL THEN
                RAISE EXCEPTION 'Este espetáculo não existe.';
            end if;
            RETURN QUERY SELECT
                e.nome AS espetaculo,
                i.nome AS cidade,
                COUNT (DISTINCT r.cod_reserva) AS qt_reservas,
                COUNT (DISTINCT c.cod_cliente) AS qt_clientes
            FROM
                espetaculo e
                JOIN cidade i ON i.cod_cidade = id_cid
                LEFT JOIN reserva r on e.cod_espetaculo = r.cod_espetaculo
                LEFT JOIN pedido p on p.cod_pedido = r.cod_pedido
                LEFT JOIN cliente c ON c.cod_cliente = p.cod_cliente AND c.cod_cidade = i.cod_cidade
            WHERE
                e.cod_estabelecimento = id_espec
            GROUP BY e.nome, i.nome;
        end;
    $BODY$
LANGUAGE plpgsql VOLATILE;