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
(1,1,2,'Tours turísticos',4000.00,'2022-01-01'), -- ES UNA TARIFA ESTANDAR QUE PERTENECE A LOS TRANSPORTES.
(2,1,2,'Viajes Emergentes, salida rapida',3400.00,'2022-01-01'),
(3,1,2,'Viajes en la Ciudad',1400.00,'2022-01-01'),
(4,1,2,'Capital STG - Vega',900.00,'2022-01-01'),
(5,1,2,'Capital STG - Santiago',1900.00,'2022-01-01'),
(6,2,2,'Tour Zona Colonial',400.00,'2021-09-01'), --OFERTA
(7,2,2,'STG - La Romana',2900.00,'2021-09-01'), --OFERTA
(8,2,2,'STG - Samaná',6500.00,'2021-09-01'); --OFERTA
GO

--TARIFAS DE ENVIOS (TRANSPORTE)
INSERT INTO Tb_tarifa
VALUES
(9,1,1,'ON 24 Hours', 4000.00,'2022-01-01'), -- ES UNA TARIFA ESTANDAR QUE PERTENECE A LOS ENVIOS.
(10,1,1,'Envios Emergentes, salida rapida!', 3400.00,'2022-01-01'),
(11,1,1,'Envios en la Ciudad',1200.00,'2022-01-01'),
(12,2,1,'Capital STG - Vega',900.00,'2022-01-01'),--OFERTA
(13,2,1,'Capital STG - Santiago',1900.00,'2022-01-01');--OFERTA
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
(1, 'Tours turísticos', 1, GETDATE()),
(2, 'Viajes Emergentes, salida rapida', 2, GETDATE()),
(3, 'Viajes en la Ciudad', 3, GETDATE()),
(4, 'Viajes Exterior', 3, GETDATE()),
(5, 'Viajes en la Ciudad', 3, GETDATE());

