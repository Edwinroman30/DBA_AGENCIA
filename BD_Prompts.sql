USE BD_Transporte;

-----------------------------------------Mandatos----------------------------------------------------------

--. Llevar	un	histórico	de	los	clientes	que	se	registran	y	son	extranjeros.		Utiliza	
--Triggers.


ALTER TRIGGER TG_AFTER_INS_HIST_CLIENTE
ON Tb_Cliente
	FOR INSERT
AS
BEGIN
	
	SET NOCOUNT ON;

	DECLARE @id_pais INT;
	SET @id_pais = 1;

	SELECT @id_pais = id_pais FROM inserted;
	
	IF @id_pais <> 1
	BEGIN 
		INSERT INTO Tb_Historico_Cliente
		SELECT * FROM inserted
	END

END
GO