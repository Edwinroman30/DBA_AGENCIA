-- CREATE DATABASE BD_Transporte;

USE BD_Transporte;


-----------------------------------------DDL----------------------------------------------------------

--MUCHOS DE LOS CAMPOS CLAVES SERÍAN MAS COMODOS MANEJARLOS AUTOINCREMENTABLES.

CREATE TABLE Tb_Pais(
	id_pais int PRIMARY KEY  NOT NULL,
	nombre_pais varchar(50) NOT NULL,
	nacionalidad varchar(20) NOT NULL,
	fecha_creacion datetime NOT NULL
)
GO

CREATE TABLE Tb_Cliente(
	id_cliente INT PRIMARY KEY  NOT NULL,
	username varchar(50) NOT null,
	pass varchar(50) NOT null,
	cedula char(13) NOT NULL,
	nombre varchar(25) NOT NULL,
	prim_apellido varchar(25) NOT NULL,
	seg_apellido varchar(25) NOT NULL,
	id_pais int NOT NULL,
	CONSTRAINT Cliente_pais FOREIGN KEY (id_pais) REFERENCES Tb_Pais (id_pais),
);
GO

CREATE TABLE Tb_Historico_Cliente(
	id_historicoCliente INT PRIMARY KEY IDENTITY (1,1), 
	id_cliente INT NOT NULL,
	username varchar(50) NOT null,
	pass varchar(50) NOT null,
	cedula char(13) NOT NULL,
	nombre varchar(25) NOT NULL,
	prim_apellido varchar(25) NOT NULL,
	seg_apellido varchar(25) NOT NULL,
	id_pais int NOT NULL,
	fechaIngreso DATETIME DEFAULT GETDATE()
);
GO


CREATE TABLE Tb_tipoTarifa(
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
	monto decimal NOT NULL CHECK (monto >= 0),
	fecha_expiracion datetime,
	CONSTRAINT tarifa_modalidadMonto FOREIGN KEY (id_modalidadMonto) REFERENCES Tb_modalidadMonto (id_modalidadMonto),
	CONSTRAINT tarifa_tipoTarifa FOREIGN KEY (id_tipoTarifa) REFERENCES Tb_tipoTarifa (id_tipoTarifa)

);
GO


CREATE TABLE Tb_ServiciosTransp
(
	id_servicioTransporte int PRIMARY KEY NOT NULL,
	descripcion varchar(75) NOT NULL,
	fecha_creacion datetime DEFAULT GETDATE(),
);
GO


CREATE TABLE Tb_ServiciosEnvios
(
	id_serviciosEnvios int PRIMARY KEY NOT NULL,
	descripcion varchar(75) NOT NULL,
	fecha_creacion datetime DEFAULT GETDATE(),
);
GO


CREATE TABLE Tb_provincia(
    id_provincia INT NOT NULL
    , nomProvincia VARCHAR(45) DEFAULT NULL
    , CONSTRAINT Provincia_PK PRIMARY KEY CLUSTERED (id_provincia ASC)
)
GO



-----------------------------------------------------------AUTOMINCR
CREATE TABLE Tb_RentaEnvios
(
	id_rentaEnvio int PRIMARY KEY NOT NULL,
	id_servicioEnvios int NOT NULL,
	id_lugarOrigen INT NOT NULL,
	id_lugarDestino INT NOT NULL,
	id_tarifa INT NOT NULL,
	id_cliente INT NOT NULL,
	peso_paquete decimal(6,2),
	cedula_receptor char(13) NOT NULL,
	firmadig_receptor binary(50) NULL,
	fecha_envio datetime DEFAULT GETDATE(),
	CONSTRAINT ServEnvio_tarifa FOREIGN KEY (id_tarifa) REFERENCES Tb_tarifa (id_tarifa),
	CONSTRAINT RentaEnv_servicio FOREIGN KEY (id_servicioEnvios) REFERENCES Tb_ServiciosEnvios (id_serviciosEnvios),
	CONSTRAINT RentaEnv_origen FOREIGN KEY (id_lugarOrigen) REFERENCES Tb_provincia (id_provincia),
	CONSTRAINT RentaEnv_destino FOREIGN KEY (id_lugarDestino) REFERENCES Tb_provincia (id_provincia),
	CONSTRAINT RentaEnv_cliente FOREIGN KEY (id_cliente) REFERENCES Tb_Cliente (id_cliente)
);
GO

CREATE TABLE Tb_RentaTranporte
(
	id_rentaTransporte int PRIMARY KEY NOT NULL,
	id_servicioTransporte int NOT NULL,
	id_lugarOrigen INT NOT NULL,
	id_lugarDestino INT NOT NULL,
	id_tarifa INT NOT NULL,
	id_cliente INT NOT NULL,
	fecha_envio datetime DEFAULT GETDATE(),
	CONSTRAINT ServTransp_tarifa FOREIGN KEY (id_tarifa) REFERENCES Tb_tarifa (id_tarifa),
	CONSTRAINT RentaTran_servicio FOREIGN KEY (id_servicioTransporte) REFERENCES Tb_ServiciosTransp (id_servicioTransporte),
	CONSTRAINT RentaTran_origen FOREIGN KEY (id_lugarOrigen) REFERENCES Tb_provincia (id_provincia),
	CONSTRAINT RentaTran_destino FOREIGN KEY (id_lugarDestino) REFERENCES Tb_provincia (id_provincia),
	CONSTRAINT RentaTran_cliente FOREIGN KEY (id_cliente) REFERENCES Tb_Cliente (id_cliente)
);
GO

-----------------------------------------------------------AUTOMINCR

CREATE TABLE Tb_TrackingTranp
(
	idtracking int PRIMARY KEY IDENTITY (1,1), --SEA autoincrementable
	id_rentaTransporte int NOT NULL,
	longitud float,
	latitud float,
	fecha_actual datetime DEFAULT GETDATE(),
	CONSTRAINT Tracking_Transporte FOREIGN KEY (id_rentaTransporte) REFERENCES Tb_RentaTranporte (id_rentaTransporte),

);
GO

CREATE TABLE Tb_TrackingEnvios
(
	idtracking int PRIMARY KEY NOT NULL IDENTITY (1,1), --SEA autoincrementable
	id_rentaEnvio int NOT NULL,
	longitud float,
	latitud float,
	fecha_actual datetime DEFAULT GETDATE(),
	CONSTRAINT Tracking_envio FOREIGN KEY (id_rentaEnvio) REFERENCES Tb_RentaEnvios (id_rentaEnvio)
);
GO
