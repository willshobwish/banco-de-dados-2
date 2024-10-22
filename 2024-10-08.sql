use teste;

DROP PROCEDURE inserecliente;

DELIMITER \\
-- cod_cliente	int
-- nome_cliente	varchar(40)
-- endereco_cliente	varchar(40)
-- cidade_cliente	varchar(40)
-- cidade_cep	int
-- uf_cliente	varchar(2)
-- cgc_cliente	varchar(30)
-- ie_cliente	varchar(4) NULL
CREATE PROCEDURE insereCliente (
    vid INT,
    vnomecliente VARCHAR(40),
    vEnderecoCliente VARCHAR(40),
    vCidadeCliente VARCHAR(40),
    vCidadeCep VARCHAR(40),
    vUfCliente VARCHAR(2),
    vCgcCliente VARCHAR(30),
    vIeCliente VARCHAR(4)
)BEGIN
INSERT INTO cliente (cod_cliente,nome_cliente,endereco_cliente,cidade_cliente,cidade_cep,uf_cliente,cgc_cliente,ie_cliente)VALUES (vid, vnomecliente, vEnderecoCliente,vCidadeCliente,vCidadeCep,vUfCliente,vCgcCliente,vIeCliente);
END

DELIMITER;

CALL insereCliente (
    22,
    "Cliente teste",
    "Rua dos afogados",
    "Preidente",
    "483273789",
    "SP",
    "38389172",
    "3242"
);

DELIMITER \\
CREATE PROCEDURE updateCliente(
    vid INT,
    vnomecliente VARCHAR(40),
    vEnderecoCliente VARCHAR(40),
    vCidadeCliente VARCHAR(40),
    vCidadeCep VARCHAR(40),
    vUfCliente VARCHAR(2),
    vCgcCliente VARCHAR(30),
    vIeCliente VARCHAR(4))
BEGIN
UPDATE cliente 
SET nome_cliente=vnomecliente,
endereco_cliente=vEnderecoCliente,
cidade_cliente=vCidadeCliente, 
cidade_cep=vCidadeCep, 
uf_cliente=vUfCliente,
cgc_cliente=vCgcCliente,
ie_cliente=vIeCliente
WHERE cod_cliente = vid;
END \\
DELIMITER ;

CALL updateCliente (22,
    "Cliente aaaaa",
    "Rua dos afogados",
    "Preidente",
    "483273789",
    "SP",
    "38389172",
    "3242");

DELIMITER \\
CREATE PROCEDURE deleteCliente(vid INT)
BEGIN
DELETE FROM cliente WHERE cod_cliente = vid;
END \\
DELIMITER ;

CALL deleteCliente(22);

-- cod_vendedor	int	
-- nome_vendedor	varchar(40)	
-- salario_vendedor	int	
-- comissao_vendedor	char(1)	
DELIMITER \\
CREATE PROCEDURE insereVendedor(vCodVendedor INT, vNomeVendedor VARCHAR(40),vSalarioVendedor INT, vComissaoVendedor CHAR(1))
BEGIN
INSERT INTO vendedor VALUES (vCodVendedor, vNomeVendedor,vSalarioVendedor,vComissaoVendedor);
END \\
DELIMITER ;

CALL insereVendedor(1,"Teste",100, "A");
DELIMITER \\
CREATE PROCEDURE updateVendedor(vCodVendedor INT, vNomeVendedor VARCHAR(40),vSalarioVendedor INT, vComissaoVendedor CHAR(1))
BEGIN
UPDATE vendedor
SET nome_vendedor = vNomeVendedor,
salario_vendedor = vSalarioVendedor,
comissao_vendedor = vComissaoVendedor
WHERE cod_vendedor = vCodVendedor;
END \\
DELIMITER ;

CALL updateVendedor(1,"TESTE modificado",300,"B");

DELIMITER \\
CREATE PROCEDURE deleteVendedor(vCodVendedor INT)
BEGIN
DELETE FROM vendedor WHERE cod_vendedor = vCodVendedor;
END \\
DELIMITER ;

CALL deleteVendedor(1);


-- cod_produto	int	
-- unidade_produto	varchar(3)	
-- desc_produto	varchar(40)	
-- valor_unitario	int	
DELIMITER \\
CREATE PROCEDURE insereProduto(vCodProduto INT, vUnidadeProduto VARCHAR(3),vDescProduto VARCHAR(40),vValorUnitario INT)
BEGIN
INSERT INTO produto VALUES (vCodProduto, vUnidadeProduto, vDescProduto,vValorUnitario);
END \\
DELIMITER ;

CALL insereProduto(23,"KG","TESTE",20);

DELIMITER \\
CREATE PROCEDURE updateProduto(vCodProduto INT, vUnidadeProduto VARCHAR(3),vDescProduto VARCHAR(40),vValorUnitario INT)
BEGIN
UPDATE produto SET
cod_produto = vCodProduto,
unidade_produto = vUnidadeProduto,
desc_produto = vDescProduto,
valor_unitario = vValorUnitario
WHERE cod_produto = vCodProduto;
END \\
DELIMITER ;

CALL updateProduto(23, "TES","AAAAAAAAA",524);

DELIMITER \\
CREATE PROCEDURE deleteProduto(vCodProduto INT)
BEGIN
DELETE FROM produto WHERE cod_produto = vCodProduto;
END \\
DELIMITER ;

CALL deleteProduto(22);