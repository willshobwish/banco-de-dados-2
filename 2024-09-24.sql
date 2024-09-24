DELIMITER $$

DROP PROCEDURE IF EXISTS teste $$

CREATE PROCEDURE teste()
BEGIN
SELECT 'ola';
end $$

DELIMITER;

CALL teste ()

DELIMITER / /

CREATE PROCEDURE insereCliente(vNome VARCHAR(60), vEndereco VARCHAR(20))
BEGIN
    IF((vNome!='')AND(vEndereco!=''))THEN
        INSERT INTO cliente (cod_cliente,nome_cliente, endereco_cliente)VALUES(vCod,vNome,vEndereco);
    ELSE
        SELECT 'Nome e endereço devem ser fornecidos para o cadastro' AS msg;
    END IF;
    END;

SELECT * from teste.cliente;

CREATE DATABASE ProcedureTeste;

Use ProcedureTeste;

DROP TABLE IF EXISTS cliente;

CREATE Table cliente (
    id int AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200),
    endereco VARCHAR(200),
    genero CHAR(1)
);

SELECT * from ProcedureTeste.cliente;

DELIMITER / /

DROP PROCEDURE IF EXISTS insereCliente

CREATE PROCEDURE insereCliente(vNome VARCHAR(200), vEndereco VARCHAR(200), vSexo VARCHAR(1))
BEGIN
    IF((vNome!='')AND(vEndereco!=''))THEN
        INSERT INTO cliente (nome, endereco,genero)VALUES(vNome,vEndereco,vSexo);
    ELSE
        SELECT 'Nome e endereço devem ser fornecidos para o cadastro' AS msg;
    END IF
    END//

CALL insereCliente ('teste', 'teste', 'm');

SELECT * from `ProcedureTeste`.cliente;

DELIMITER //
DROP PROCEDURE IF EXISTS updateCliente;
CREATE PROCEDURE updateCliente(vId INTEGER,vNome VARCHAR(200), vEndereco VARCHAR(200), vSexo CHAR(1))
BEGIN
    IF((vId>0)AND(vNome!='')AND(vEndereco!=''))THEN
        -- INSERT INTO cliente (nome, endereco,genero)VALUES(vNome,vEndereco,vSexo);
        UPDATE cliente SET nome = vNome, endereco=vEndereco,genero=vSexo where id = vId ;
    ELSE
        SELECT 'Nome e endereço devem ser fornecidos para o cadastro' AS msg;
    END IF;
END//

CALL updateCliente(2,'testemodificado','teste','f');

SELECT * from `ProcedureTeste`.cliente;
DELIMITER //
CREATE PROCEDURE deleteCliente(vId INTEGER)
BEGIN
    IF((vId>0)AND(VId!=0))THEN
    DELETE FROM cliente where id = vId;
    ELSE
        SELECT 'Nome e endereço devem ser fornecidos para o cadastro' AS msg;
    END IF;
END;

CALL deleteCliente(1);
SELECT * from `ProcedureTeste`.cliente;