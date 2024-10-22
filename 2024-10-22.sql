USE teste;
DROP TABLE auditoria_salario;
CREATE TABLE auditoria_salario(
    func_codigo INT NOT NULL,
    salario_inicial FLOAT NOT NULL,
    salario_alterado FLOAT NOT NULL,
    data_alteracao DATE NOT NULL,
    nome_usuario VARCHAR(60) NOT NULL
);
DROP TRIGGER update_salario;
DELIMITER \\
CREATE TRIGGER update_salario AFTER UPDATE ON vendedor FOR EACH ROW
BEGIN
    INSERT INTO auditoria_salario (func_codigo, salario_inicial, salario_alterado, data_alteracao, nome_usuario)
    VALUES (NEW.cod_vendedor, OLD.salario_vendedor, NEW.salario_vendedor, CURDATE(), USER());
END

DELIMITER ;

UPDATE vendedor SET salario_vendedor = 5000 WHERE cod_vendedor = 720;