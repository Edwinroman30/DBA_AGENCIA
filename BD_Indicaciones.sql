--Crea	un	proceso	que	permita	registrar	una	tabla	un	reporte	de	la	cantidad	de	
--envíos,	por	cliente, por	año.	El	procedimiento	debe	incluir	gestión	
--transaccional	y	control	de	errores.

--CREATE TABLE Tb_REPORTE
--(
--	id_reporte INT PRIMARY KEY IDENTITY (1,1),
--	id_cliente INT NOT NULL,
--	nom_Cliente varchar (35) NOT NULL,
--	cantidad_envios int NOT NULL,
--	anio_reporte int NOT NULL,
--	fecha_generacion datetime default GETDATE()
--);

--CREATE VIEW VW_RP_envios
--as 
--(	SELECT Tb_RentaEnvios.id_cliente, CONCAT(Tb_Cliente.nombre,' ',Tb_Cliente.prim_apellido) as [nom_Cliente],COUNT(*) as [cantidad_envios], Year(fecha_envio) as [anio_reporte]
--	FROM Tb_RentaEnvios
--	INNER JOIN 
--		Tb_Cliente ON Tb_Cliente.id_cliente = Tb_RentaEnvios.id_cliente
--	GROUP BY Tb_RentaEnvios.id_cliente, Tb_Cliente.nombre, Tb_Cliente.prim_apellido ,  Year(fecha_envio)
--)


--CREATE PROC SP_reporte_envios
--as
--BEGIN

--	DECLARE @numColumns int;
--	SELECT @numColumns = COUNT(*) FROM Tb_REPORTE;

--	IF(@numColumns = 0)
--	BEGIN ---COMIENZO DEL IF
--		BEGIN TRY 		
--			--CREAR UNA TABLA INTERMEDIARIA COMO REFERENCIA.
--			CREATE TABLE #TEMP1
--					(
--						id_cliente INT NOT NULL,
--						fullname varchar (65) NOT NULL,
--						cantidad_envios int NOT NULL,
--						anio_reporte int NOT NULL,
--						fecha_generacion datetime default GETDATE()
--					);

--				INSERT INTO #TEMP1
--					SELECT *, GETDATE()
--					FROM VW_RP_envios

--				SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
--				-- LO PONGO SERÍALIZABLE DEBIDO A QUE QUIERO HACERLO (EN UN TIEMPO X) Y MANTENER CIERTO GRADDO DE COINSISTENCIA.
--				-- AQUÍ ME ASEGURO DE QUE LOS DATOS NO HAYAN SIDO MANIPULADOS Y PASAR DATOS CONSISTENTE.
--				BEGIN TRANSACTION --TRAN_REPORT
				
--				INSERT INTO Tb_REPORTE
--					SELECT *
--					FROM #TEMP1
				
--				print 'PRIMERA OPCION -  SE INSERTARAN NUEVOS REGISTROS DE REPORTE....'

--				COMMIT 

--				RETURN 0; -- INTERRUMPIENDO EL SP, NO ME INTERESA SEGUIR LA EJECUCIÓN.

--		END TRY
--		BEGIN CATCH  
--				ROLLBACK 
--				RAISERROR('HA OCURRIDO UN ERROR AL MOMENTO DE GENERAR EL PRIMER REPORTE (RP_0001), COMUNIQUESE CON Edwin Alberto....', 16,1)
--				RETURN -1;
--		END CATCH

--	END --CIERRE INTERNO DEL IF

	
--	--FACETA DE VERIFICAR DUPLICADO Y COINSIDENCIAS.
	
--	BEGIN TRY
--		SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
--		BEGIN TRANSACTION --TRAN_REPORT_ACTUA_INSERCIONES

--		-- LO PONGO SERÍALIZABLE DEBIDO A QUE QUIERO HACERLO (EN UN TIEMPO X) Y MANTENER CIERTO GRADDO DE COINSISTENCIA.
--		-- AQUÍ ME ASEGURO DE QUE LOS DATOS NO HAYAN SIDO MANIPULADOS Y PASAR DATOS CONSISTENTE AL PROCESO SIGUIENTE, EL CUAL
--		-- TODOS VIENEN ARRASTRANDO UN NIVEL DE AISLAMIENTO FUERTE COMO EL SERIALIZABLE.

--				MERGE /*TABLA DE DESTINO*/ Tb_REPORTE AS TARGET
--				USING /*TABLA DE ORIGEN*/ VW_RP_envios AS SOURCE 
--					ON (TARGET.id_cliente = SOURCE.id_cliente AND TARGET.anio_reporte = SOURCE.anio_reporte) /*COLUMNA POR LA QUE SE COMUNICAN AMBAS TABLAS*/
	
--				WHEN MATCHED AND (TARGET.cantidad_envios <> SOURCE.cantidad_envios and TARGET.anio_reporte = SOURCE.anio_reporte) THEN
	
--						/*ACCION A REALIZAR CUANDO COINCIDEN*/
--						UPDATE SET
--							TARGET.id_cliente = SOURCE.id_cliente,
--							TARGET.nom_Cliente = SOURCE.[nom_Cliente],
--							TARGET.cantidad_envios = SOURCE.cantidad_envios,
--							TARGET.anio_reporte = SOURCE.anio_reporte
	
--				WHEN NOT MATCHED BY TARGET THEN
--					/*ACCION A REALIZAR CUANDO NO COINCIDEN CON LA TABLA  DESTINO*/
--					INSERT  (id_cliente,nom_Cliente,cantidad_envios,anio_reporte,fecha_generacion)
--					VALUES (SOURCE.id_cliente,SOURCE.[nom_Cliente],SOURCE.cantidad_envios, SOURCE.anio_reporte,GETDATE());
			
--		COMMIT
--	END TRY
--	BEGIN CATCH
--			ROLLBACK 
--			RAISERROR('HA OCURRIDO UN ERROR AL MOMENTO DE ACTUALIZAR DATOS O INGRESAR EN NUESTRO NUEVO REPORTE (RP_0003), COMUNIQUESE CON Edwin Alberto....', 16,1)
--			RETURN -1;
--	END CATCH

--	IF (@@ROWCOUNT = 0)
--	BEGIN
--		PRINT 'Su reporte esta al día....'
--	END


--END	-- FIN PROCEDURE
--GO


--TABLA DE REPORTES
SELECT *
FROM Tb_REPORTE
GO

--VISTA DE REPORTES
SELECT *
FROM VW_RP_envios
GO

--EXECUCION DEL PROCE
EXEC SP_reporte_envios
