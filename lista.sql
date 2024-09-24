-- Questão 1
select  desc_produto, unidade_produto, valor_unitario from teste.produto

-- Questão 2
select cgc_cliente, nome_cliente, endereco_cliente from teste.cliente

-- Questão 3
select teste.pedido.cod_pedido, teste.produto.cod_produto,teste.produto.desc_produto, teste.item_pedido.qtd_pedido from teste.pedido INNER JOIN teste.item_pedido on teste.pedido.cod_pedido = teste.item_pedido.cod_pedido INNER JOIN teste.produto on teste.item_pedido.cod_produto = teste.produto.cod_produto WHERE teste.item_pedido.qtd_pedido>25 ORDER BY teste.item_pedido.qtd_pedido ASC

-- Questão 4
select teste.cliente.nome_cliente from teste.cliente where teste.cliente.cidade_cliente = "Niterói"

-- Questão 5
select * from teste.produto WHERE teste.produto.unidade_produto = "M" and teste.produto.valor_unitario = 1.05

-- Questão 6
SELECT * from teste.cliente where teste.cliente.uf_cliente = 'São Paulo' or (CAST(teste.cliente.cidade_cep as int) > 30077000 and CAST(teste.cliente.cidade_cep as INT) < 30079000)

SELECT teste.cliente.nome_cliente FROM teste.cliente
WHERE teste.cliente.cidade_cliente = 'São Paulo' 
  OR (teste.cliente.cidade_cep  > 30077000 
      AND teste.cliente.cidade_cep  < 30079000);

-- Questão 7
SELECT * from teste.pedido where teste.pedido.prazo_entrega != 15

-- Questão 8
select * from teste.produto WHERE  teste.produto.valor_unitario > 0.32 and teste.produto.valor_unitario <2

-- Questão 9
select * from teste.produto WHERE teste.produto.desc_produto LIKE 'Q%'

-- Questão 10
SELECT * from teste.vendedor where teste.vendedor.nome_vendedor not like "jo%"

-- Questão 11
SELECT * from teste.vendedor where teste.vendedor.comissao_vendedor = 'A' or teste.vendedor.comissao_vendedor = 'B'

-- Questão 12
SELECT * from teste.cliente where teste.cliente.ie_cliente = NULL or teste.cliente.ie_cliente = 0

-- Questão 13
SELECT * from teste.vendedor ORDER BY teste.vendedor.nome_vendedor ASC