--USE BD_Transporte;

-----------------------------------------Mandatos----------------------------------------------------------

--. Llevar	un	histórico	de	los	clientes	que	se	registran	y	son	extranjeros.		Utiliza	
--Triggers.

CREATE TRIGGER TG_FOR_INS_HIST_CLIENTE
ON Tb_Cliente
	FOR INSERT
AS
BEGIN
	
	SET NOCOUNT ON;

	DECLARE @id_pais INT;
	SET @id_pais = NULL;

	--DECLARAR EL CURSOR
	DECLARE CIDPAISES CURSOR 
	FOR 
		SELECT  id_pais
		FROM inserted;

	-- ABRIRLO
	OPEN  CIDPAISES;

	-- PRIMEROS VALORES
	FETCH CIDPAISES INTO  @id_pais
	
	WHILE (@@FETCH_STATUS = 0)
	BEGIN 
	
		IF @id_pais <> 1
		BEGIN 
			INSERT INTO Tb_Historico_Cliente
			SELECT *,GETDATE() FROM inserted
		END

		FETCH CIDPAISES INTO  @id_pais
	 END

	 --CERRARLO
	CLOSE CIDPAISES;
	
	-- ELIMINARLO
	DEALLOCATE CIDPAISES;

END
GO


---Este TRIGGER ES UNA OPCIONAL AL MANDATO, PERO CUANDO SE INICIE UN ENVIO, ESTE COMENZARA Y CREARÁ UN REGISTRO
--PARA DAR SEGUIMIENTO DE LA LONGITUD Y LATITUD PARA ALMACENAR EL RECORRIDO Y VER DONDE SE ENCUENTRAN EN ALGUN 
--PUNTO ESPECIFICOS. (AUNQUE SE GENEREN VARIOS REGISTROS ESTOS SERÁN UNICOS A UN ENVIO DETERMINADO GENERADO POR
--ALGUNA RENTA DE ESTE SERVICIO)

CREATE TRIGGER TG_FOR_INS_Tb_RentaEnvios
ON Tb_RentaEnvios
	FOR INSERT
AS
BEGIN
	
	SET NOCOUNT ON;

	--ID A CAPTURAR PARA EL REGISTRO DE REFERENCIA A RENTATRANSPORTE
	DECLARE @id_rentaEnvios INT;
	SET @id_rentaEnvios = NULL;

	--PARA SIMULAR EL REGISTRO DE LAS COORDENADAS.
	DECLARE @longitud float;
	DECLARE @latitud float;

	--PARA SIMULAR EL REGISTRO DE LAS COORDENADAS.
	SET @longitud = RAND()*2133;
	SET @latitud = RAND()*2133;

	
	--DECLARAR EL CURSOR
	DECLARE CIDRENTASENVIOS CURSOR 
	FOR 
		SELECT id_rentaEnvio
			FROM inserted

	
	-- ABRIRLO
	OPEN  CIDRENTAS;

	-- PRIMEROS VALORES
	FETCH CIDRENTAS INTO @id_rentaEnvios

	-- RECORRERLOS
	WHILE (@@FETCH_STATUS = 0)
	BEGIN 
			INSERT INTO Tb_TrackingTranp
			VALUES (@id_rentaEnvios, @longitud, @latitud, GETDATE()); --Esto INICIALIZARA EL Tracking, LUEGO DE AHÍ la inserciones proximas seran por el dispositivo hasta llegar a su --destino.
		FETCH CIDRENTAS INTO @id_rentaEnvios
	END 
	
	--CERRARLO
	CLOSE CIDRENTAS;
	
	-- ELIMINARLO
	DEALLOCATE CIDRENTAS;

END
GO

---------------------------------------------------------


CREATE TRIGGER TG_FOR_INS_Tb_RentaTranporte
ON Tb_RentaTranporte
	FOR INSERT
AS
BEGIN
	
	SET NOCOUNT ON;

	--ID A CAPTURAR PARA EL REGISTRO DE REFERENCIA A RENTATRANSPORTE
	DECLARE @id_rentaTransporte INT;
	SET @id_rentaTransporte = NULL;

	--PARA SIMULAR EL REGISTRO DE LAS COORDENADAS.
	DECLARE @longitud float;
	DECLARE @latitud float;

	--PARA SIMULAR EL REGISTRO DE LAS COORDENADAS.
	SET @longitud = RAND()*2133;
	SET @latitud = RAND()*2133;

	
	--DECLARAR EL CURSOR
	DECLARE CIDRENTASTRANSPORTE CURSOR 
	FOR 
		SELECT id_rentaTransporte
			FROM inserted

	
	-- ABRIRLO
	OPEN  CIDRENTASTRANSPORTE;

	-- PRIMEROS VALORES
	FETCH CIDRENTASTRANSPORTE INTO @id_rentaTransporte

	-- RECORRERLOS
	WHILE (@@FETCH_STATUS = 0)
	BEGIN 
			INSERT INTO Tb_TrackingTranp
			VALUES (@id_rentaTransporte, @longitud, @latitud, GETDATE()); --Esto INICIALIZARA EL Tracking, LUEGO DE AHÍ la inserciones proximas seran por el dispositivo hasta llegar a su --destino.
		
			FETCH CIDRENTASTRANSPORTE INTO @id_rentaTransporte
	END 
	
	--CERRARLO
	CLOSE CIDRENTASTRANSPORTE;
	
	-- ELIMINARLO
	DEALLOCATE CIDRENTASTRANSPORTE;

END
GO

--Crea	un	proceso	que	permita	registrar	una	tabla	un	reporte	de	la	cantidad	de	
--envíos,	por	cliente, por	año.	El	procedimiento	debe	incluir	gestión	
--transaccional	y	control	de	errores.

SELECT Tb_RentaEnvios.id_cliente,Tb_Cliente.nombre ,COUNT(*) as [Cantidad de Envios], Year(fecha_envio) as [AÑO]
FROM Tb_RentaEnvios
INNER JOIN 
Tb_Cliente ON Tb_Cliente.id_cliente = Tb_RentaEnvios.id_cliente
GROUP BY Tb_RentaEnvios.id_cliente, Tb_Cliente.nombre,  Year(fecha_envio)
