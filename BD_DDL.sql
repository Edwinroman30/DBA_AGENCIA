-- CREATE DATABASE BD_Transporte;

USE BD_Transporte;


-----------------------------------------DDL----------------------------------------------------------

CREATE TABLE Tb_tipo(
	id_tipoTarifa INT NOT NULL PRIMARY KEY,
	descripcion varchar(75) NOT NULL
);
GO

CREATE TABLE Tb_modalidadMonto(
	id_modalidadMonto INT NOT NULL PRIMARY KEY,
	descripcion varchar(75) NOT NULL
);
GO

CREATE TABLE Tb_tarifa(
	id_tarifa INT NOT NULL PRIMARY KEY,
	id_modalidadMonto INT NOT NULL,
	id_tipoTarifa INT NOT NULL, 
	descripcion varchar(75) NOT NULL,
	monto decimal NOT NULL,
	fechaExpiración datetime
);
GO




CREATE TABLE Tb_ServiciosTransp
(


);
GO





CREATE TABLE Tb_provincia(
    id_provincia INT NOT NULL
    , nomProvincia VARCHAR(45) DEFAULT NULL
    , CONSTRAINT Provincia_PK PRIMARY KEY CLUSTERED (id_provincia ASC)
)
GO

