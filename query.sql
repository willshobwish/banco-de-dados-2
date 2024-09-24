SELECT cliente.nome_cliente
FROM cliente
INNER JOIN pedido ON cliente.cod_cliente= pedido.cod_cliente
INNER JOIN item_pedido ON pedido.cod_pedido = item_pedido.cod_pedido
INNER JOIN produto ON item_pedido.cod_produto = produto.cod_produto
WHERE pedido.prazo_entrega > 15 AND produto.desc_produto= "queijo" AND cliente.uf_cliente = "RJ"
ORDER BY cliente.nome_cliente