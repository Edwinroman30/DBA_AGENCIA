USE BD_Transporte;

-----------------------------------------DML----------------------------------------------------------

INSERT INTO Tb_Pais 
	VALUES
	(1, 'República  Dominicana', 'Dominicano/a',GETDATE()),
	(2, 'Mexico',  'Mexicano/a',GETDATE()),
	(3, 'Perú', 'Peruano/a',GETDATE()),
	(4, 'Venezuela','Venezonalo/a',GETDATE()),
	(5, 'Estados Unidos','Americano/a',GETDATE()),
	(6, 'Haíti','Haitiano/a',GETDATE()),
	(7, 'Colombia', 'Colombiano/a',GETDATE()),
	(8, 'Englaterra', 'Ingles/sa',GETDATE()),
	(9, 'España', 'Español/la',GETDATE()),
	(10, 'Francia', 'Frances/a',GETDATE());
GO

SELECT *
FROM Tb_Pais;
--------------------------------------------------------------------------------------------------

INSERT INTO Tb_Cliente
VALUES 
(1, 'Davids@gmail.com', 'admin00', '402-6346853-3','David','Vonsensei','Halper',1),
(2,'Johandri00@gmail.com','pfis2','402-4486519-9','Johandri','Roman','Garcias',2),
(3, 'PerezRosario@gmail.com', '03dwad','402-8234316-7','Magalis', 'Perez','Rosario',2),
(4, 'Manuel_99@gmail.com', 'flja39' ,'402-8300443-6','Manuel', 'Diaz','Diaz',10),
(5, 'Cesilia88@gmail.com', 'ij3p2' ,'402-8304314-2','Cesilia','Diaz','Rodriguez',5);
GO

INSERT INTO Tb_Cliente
VALUES 
(7,'Pablo099@gmail.com','PA3blo','402-8325483-2','Pablo'  ,'Frias','Gomez',5),
(8,'Johandri00@gmail.com','pfis2','402-4486519-9','Johandri','Roman','Garcias',3),
(9, 'PerezRosario@gmail.com', '03dwad','402-8234316-7','Magalis', 'Perez','Rosario',6);

SELECT *
FROM Tb_Cliente;

--------------------------------------------------------------------------------------------------

INSERT INTO Tb_tipoTarifa
VALUES
(1, 'Tarifa para Envios'),
(2, 'Tarifa para Transporte');
GO

SELECT *
FROM Tb_tipoTarifa;
--------------------------------------------------------------------------------------------------

INSERT INTO Tb_modalidadMonto
VALUES
(1, 'Tarifa Estandar'),
(2, 'Tarifa Oferta');
GO
SELECT *
FROM Tb_modalidadMonto;
--------------------------------------------------------------------------------------------------


--TARIFAS DE VIAJES (TRANSPORTE)
INSERT INTO Tb_tarifa
([id_tarifa],[id_modalidadMonto],[id_tipoTarifa],[descripcion],[monto],[fecha_expiracion])
VALUES
(1,1,2,'Tours turísticos de STG - Sámana',8000.00,'2022-01-01'), -- ES UNA TARIFA ESTANDAR QUE PERTENECE A LOS TRANSPORTES.
(2,1,2,'Viajes Emergentes, salida rapida en STG',3400.00,'2022-01-01'),
(3,1,2,'Viajes en la Ciudad',1400.00,'2022-01-01'),
(4,1,2,'Viajes Capital STG - Vega',900.00,'2022-01-01'),
(5,1,2,'ViajesCapital STG - Santiago',1900.00,'2022-01-01'),
(6,2,2,'Especial Tour Zona Colonial',400.00,'2021-09-01'), --OFERTA
(7,2,2,'Viajes STG - La Romana',2900.00,'2021-09-01'), --OFERTA
(8,2,2,'ESPECIAL Viajes STG - Samaná',6500.00,'2021-09-01'); --OFERTA
GO

--TARIFAS DE ENVIOS (TRANSPORTE)
INSERT INTO Tb_tarifa
([id_tarifa],[id_modalidadMonto],[id_tipoTarifa],[descripcion],[monto],[fecha_expiracion])
VALUES
(9,1,1,'ON 24 Hours', 4000.00,'2022-01-01'), -- ES UNA TARIFA ESTANDAR QUE PERTENECE A LOS ENVIOS.
(10,1,1,'Envios Emergentes, salida rapida!', 3400.00,'2022-01-01'),
(11,1,1,'Envios en la Ciudad',1200.00,'2022-01-01'),
(12,2,1,'Envios Capital STG - Vega',900.00,'2022-01-01'),--OFERTA
(13,2,1,'Envios Capital STG - Monte Plata',2900.00,'2022-01-01'),--OFERTA
(14,2,1,'Envios Capital STG - La Romana',900.00,'2022-01-01'),--OFERTA
(15,2,1,'Envios Capital STG - Santiago',1900.00,'2022-01-01');--OFERTA
GO
--------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------
SELECT *
FROM Tb_ServiciosTransp;

INSERT INTO Tb_ServiciosTransp
VALUES 
(1, 'Tours turísticos', GETDATE()),
(2, 'Viajes Emergentes, salida rapida', GETDATE()),
(3, 'Viajes en la Ciudad', GETDATE()),
(4, 'Viajes Exterior', GETDATE());

SELECT *
FROM Tb_ServiciosEnvios;

INSERT INTO Tb_ServiciosEnvios
VALUES 
(1, 'ON 24 Hours', GETDATE()),
(2, 'En la Ciudad', GETDATE()),
(3, 'Envios Emergentes', GETDATE()),
(4, 'Envios en el Exterior', GETDATE());

--------------------------------------------------------------------------------------------------


INSERT INTO Tb_ProvinciaOrigen VALUES
    (1,'Azua')
    ,(2,'Bahoruco')
    ,(3,'Barahona')
    ,(4,'Dajabón')
    ,(5,'Distrito Nacional')
    ,(6,'Duarte')
    ,(7,'Elías Piña')
    ,(8,'El Seibo')
    ,(9,'Espaillat')
    ,(10,'Hato Mayor')
    ,(11,'Hermanas Mirabal')
    ,(12,'Independencia')
    ,(13,'La Altagracia')
    ,(14,'La Romana')
    ,(15,'La Vega')
    ,(16,'María Trinidad Sánchez')
    ,(17,'Monseñor Nouel')
    ,(18,'Monte Cristi')
    ,(19,'Monte Plata')
    ,(20,'Pedernales')
    ,(21,'Peravia')
    ,(22,'Puerto Plata')
    ,(23,'Samaná')
    ,(24,'Sánchez Ramírez')
    ,(25,'San Cristóbal')
    ,(26,'San José de Ocoa')
    ,(27,'San Juan')
    ,(28,'San Pedro de Macorís')
    ,(29,'Santiago')
    ,(30,'Santiago Rodríguez')
    ,(31,'Santo Domingo')
    ,(32,'Valverde')
GO

INSERT INTO Tb_ProvinciaDestino VALUES
    (1,'Azua')
    ,(2,'Bahoruco')
    ,(3,'Barahona')
    ,(4,'Dajabón')
    ,(5,'Distrito Nacional')
    ,(6,'Duarte')
    ,(7,'Elías Piña')
    ,(8,'El Seibo')
    ,(9,'Espaillat')
    ,(10,'Hato Mayor')
    ,(11,'Hermanas Mirabal')
    ,(12,'Independencia')
    ,(13,'La Altagracia')
    ,(14,'La Romana')
    ,(15,'La Vega')
    ,(16,'María Trinidad Sánchez')
    ,(17,'Monseñor Nouel')
    ,(18,'Monte Cristi')
    ,(19,'Monte Plata')
    ,(20,'Pedernales')
    ,(21,'Peravia')
    ,(22,'Puerto Plata')
    ,(23,'Samaná')
    ,(24,'Sánchez Ramírez')
    ,(25,'San Cristóbal')
    ,(26,'San José de Ocoa')
    ,(27,'San Juan')
    ,(28,'San Pedro de Macorís')
    ,(29,'Santiago')
    ,(30,'Santiago Rodríguez')
    ,(31,'Santo Domingo')
    ,(32,'Valverde')
GO

--------------------------------------------------------------------------------------------------

INSERT INTO Tb_RentaEnvios
([id_rentaEnvio],[id_servicioEnvios],[id_lugarOrigen],[id_lugarDestino],[id_tarifa],[id_cliente],[peso_paquete],[cedula_receptor],[firmadig_receptor],[fecha_envio])
VALUES
(1, 4, 31, 14, 14, 1, 8.37, '402-4325169-3', NULL, '2019-07-30'),
(2, 4, 31, 15, 12, 1, 2.37, '402-4435169-3', NULL, '2020-04-11'),
(3, 4, 31, 29, 15, 3, 12.37,'402-4251699-3', NULL, '2020-01-22'),
(4, 4, 31, 14, 14, 1, 8.37, '402-4325169-3', NULL, '2021-05-19'),
(5, 4, 31, 29, 15, 3, 12.37,'402-4251699-3', NULL, '2021-01-22'),
(6, 4, 31, 29, 15, 3, 16.37,'402-4251699-3', NULL, '2021-03-22'),
(7, 1, 31, 31, 11, 1, 1.37, '402-4486519-9', NULL, '2021-07-02'),
(8, 4, 31, 15, 12, 1, 2.37, '402-4435169-3', NULL, '2021-05-11');
GO

INSERT INTO Tb_RentaEnvios
VALUES
(9, 1, 31, 31, 11, 5, 1.37, '402-4486519-9', NULL, '2021-07-02'),
(10, 4, 31, 15, 12, 5, 2.37, '402-4435169-3', NULL, '2021-05-11');


--CON ESTE REGISTRO VAMOS A PROBAR DE QUE EL SP_reporte_envios actualiza los datos de la tabla Tb_REPORTES,
--ANTERIORMENTE ESTA TENIA SOLO DOS (2) ENVIOS EN 2021, AHORA LE AUMENTAREMOS UNO.
INSERT INTO Tb_RentaEnvios
VALUES
(11, 4, 31, 15, 12, 5, 2.37, '402-4435169-3', NULL, '2021-05-12');


----Otro mas para la clienta 5 cecilia diaz
INSERT INTO Tb_RentaEnvios
VALUES
(12, 4, 31, 15, 12, 5, 2.37, '402-4435169-3', NULL, '2021-08-12');


----ENVIOS REALIZADO CON EL NOMBRE DE LOS CLIENTES Y UNA DESCRIPCIÓN DEL TIPO DE ENVIO--------------

SELECT id_rentaEnvio, SE.descripcion, Tb_ProvinciaOrigen.nomProvincia as [Origen], Tb_ProvinciaDestino.nomProvincia as [Destino], TF.descripcion, TF.monto, CONCAT(Tb_Cliente.nombre,' ',Tb_Cliente.prim_apellido) AS CLIENTE
FROM Tb_RentaEnvios
	INNER JOIN
		Tb_ProvinciaOrigen  ON  Tb_ProvinciaOrigen.id_provOrigen = Tb_RentaEnvios.id_lugarOrigen
	INNER JOIN
		Tb_ProvinciaDestino  ON  Tb_ProvinciaDestino.id_provDestino = Tb_RentaEnvios.id_lugarDestino
	INNER JOIN
		Tb_ServiciosEnvios SE ON SE.id_serviciosEnvios =  Tb_RentaEnvios.id_servicioEnvios
	INNER JOIN 
		Tb_tarifa TF ON TF.id_tarifa = Tb_RentaEnvios.id_tarifa
	INNER JOIN 
			Tb_Cliente ON Tb_Cliente.id_cliente = Tb_RentaEnvios.id_cliente
GO

----------------------------------------------------------------------------------------------------

----INSERTANDO RENTA DE TRANSPORTES....

INSERT INTO Tb_RentaTranporte
VALUES
(1,3,31,31,3,4,GETDATE()),
(2,4,31,29,5,3,GETDATE()),
(3,2,31,15,2,7,GETDATE()),
(4,1,31,31,6,1,Getdate()),
(5,4,31,14,7,9,Getdate()),
(6,4,29,31,5,3,GETDATE());



----------------------------------------------------------------------------------------------------
SELECT *
FROM Tb_TrackingEnvios

SELECT *
FROM Tb_TrackingTranp

SELECT *
FROM Tb_Cliente

SELECT *
FROM Tb_Historico_Cliente

SELECT *
FROM Tb_RentaEnvios

SELECT *
FROM Tb_RentaTranporte

SELECT *
FROM Tb_ServiciosTransp

SELECT *
FROM Tb_ProvinciaDestino

SELECT *
FROM Tb_tarifa
WHERE id_tipoTarifa = 2

SELECT *
FROM Tb_ProvinciaDestino

SELECT *
FROM Tb_RentaEnvios

SELECT *
FROM Tb_ServiciosEnvios

SELECT *
FROM Tb_tarifa

SELECT *
FROM Tb_tipoTarifa;

SELECT *
FROM Tb_modalidadMonto;



