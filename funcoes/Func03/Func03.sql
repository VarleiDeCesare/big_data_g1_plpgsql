-- III. Cliente e Pedidos
CREATE FUNCTION return_cliente_pedidos(in_pedido INTEGER) RETURNS numeric AS $$
DECLARE
var_cliente_pedidos NUMERIC;
BEGIN
SELECT pedido.cod_cliente into var_cliente_pedidos
FROM pedido
INNER JOIN cliente
ON cliente.cod_cliente = pedido.cod_cliente
WHERE pedido.status = 'A' and pedido.cod_pedido = in_pedido;
if(var_cliente_pedidos > 0) then
	RETURN var_cliente_pedidos;
ELSE	
	RAISE EXCEPTION 'Até o este cliente não efetuou nenhum pedido.';
END if;
END; $$
LANGUAGE PLPGSQL;