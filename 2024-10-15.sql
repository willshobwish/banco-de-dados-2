-- Active: 1725994696503@@127.0.0.1@3306
DELIMITER \\
CREATE PROCEDURE unknownColumn()
BEGIN
  DECLARE coluna_desconhecida CONDITION FOR SQLSTATE '42S22';
  DECLARE EXIT HANDLER FOR coluna_desconhecida
  BEGIN
      SELECT 'erro de coluna desconhecida';
  END;
  SELECT coluna;
  SELECT 'continua';
END;
DELIMITER ;

CALL unknownColumn();

DROP PROCEDURE unknownTable;
DELIMITER \\
CREATE PROCEDURE unknownTable()
BEGIN
  DECLARE tabelaDesconhecida CONDITION FOR SQLSTATE '42S02';
  DECLARE CONTINUE HANDLER FOR tabelaDesconhecida
  BEGIN
      SELECT 'erro de tabela desconhecida';
  END;
--   SELECT coluna;
  SELECT * from tabela; 
END;
DELIMITER ;
CALL unknownTable();

DELIMITER $$
CREATE PROCEDURE exemplo_cursor1 (OUT rid INT, OUT rnome VARCHAR(50))
	BEGIN
     DECLARE x INT;
     DECLARE y VARCHAR(50);
     DECLARE FIM INT DEFAULT 0;
     DECLARE sp_cursor1 CURSOR
			FOR SELECT cod_cliente, nome_cliente FROM cliente;
	 DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM = 1;
		OPEN sp_cursor1;
		REPEAT
           FETCH sp_cursor1 INTO x, y;
           select x,y;   
           UNTIL (FIM = 1)
        END REPEAT;   
		CLOSE sp_cursor1;
		SET rid = x;
		SET rnome = y;
	END $$
DELIMITER ;

SET @vid=0;
SET @vnome="";
CALL exemplo_cursor1(@vid,@vnome);