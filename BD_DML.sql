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

--------------------------------------------------------------------------------------------------

INSERT INTO Tb_tipoTarifa
VALUES
(1, 'Tarifa para Envios'),
(2, 'Tarifa para Transporte');
GO

--------------------------------------------------------------------------------------------------

INSERT INTO Tb_modalidadMonto
VALUES
(1, 'Tarifa Estandar'),
(2, 'Tarifa Oferta');
GO

--------------------------------------------------------------------------------------------------


--TARIFAS DE VIAJES (TRANSPORTE)
INSERT INTO Tb_tarifa
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
VALUES
(9,1,1,'ON 24 Hours', 4000.00,'2022-01-01'), -- ES UNA TARIFA ESTANDAR QUE PERTENECE A LOS ENVIOS.
(10,1,1,'Envios Emergentes, salida rapida!', 3400.00,'2022-01-01'),
(11,1,1,'Envios en la Ciudad',1200.00,'2022-01-01'),
(12,2,1,'Envios Capital STG - Vega',900.00,'2022-01-01'),--OFERTA
(13,2,1,'Envios Capital STG - Monte Plata',2900.00,'2022-01-01'),--OFERTA
(14,2,1,'Envios Capital STG - La Romana',900.00,'2022-01-01'),--OFERTA
(15,2,1,'Envios Capital STG - Santiago',1900.00,'2022-01-01');--OFERTA
GO

SELECT *
FROM Tb_tipoTarifa;

SELECT *
FROM Tb_modalidadMonto;

SELECT *
FROM Tb_tarifa;

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

SELECT *
FROM Tb_provincia;

INSERT INTO Tb_provincia VALUES
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

SELECT *
FROM Tb_RentaEnvios

SELECT *
FROM Tb_ServiciosEnvios

SELECT *
FROM Tb_tarifa


INSERT INTO Tb_RentaEnvios
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


SELECT *
FROM Tb_TrackingEnvios

SELECT *
FROM Tb_TrackingTranp

SELECT *
FROM Tb_Cliente