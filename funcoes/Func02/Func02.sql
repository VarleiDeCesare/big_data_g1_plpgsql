-- II. Reserva de Assentos
CREATE FUNCTION return_reserva_assento(in_reserva INTEGER) RETURNS numeric AS $$
DECLARE
var_reserva_assento NUMERIC;
BEGIN
SELECT count(reserva.cadeira) INTO var_reserva_assento FROM reserva
INNER JOIN sessao
ON reserva.cod_sessao = sessao.cod_sessao
INNER JOIN pedido
ON reserva.cod_pedido = pedido.cod_pedido
WHERE reserva.cod_reserva = in_reserva;
if(var_reserva_assento > 0) then
	RETURN var_reserva_assento;
else
	RAISE EXCEPTION 'Este assento está disponível para reserva.';
END if;		
END; $$
LANGUAGE PLPGSQL;