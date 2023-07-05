IF OBJECT_ID('Tb_Importaciones') is not null
	drop table Tb_Importaciones
go	

CREATE TABLE Tb_Importaciones (
    DUA_Importaciones varchar(15) PRIMARY KEY CHECK (DUA_Importaciones LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9][0-9]'),
    Fecha_Importacion date,
    Nombre_Importador varchar(255),
    Peso_Neto_Importado numeric(10,2),
    Valor_CFR_Importado numeric(10,2),
    Embarcador_Exportador varchar(255),
    Origen_Importacion varchar(255),
    Adquisicion_Importacion varchar(255),
    Descrip_Comercial varchar(255),
    Familia_SKU varchar(255),
    Subfamilia_SKU varchar(255),
	RUC_Importador_fk varchar(11),
	Codigo_SKU_fk varchar(6)
)

IF OBJECT_ID('Tb_Productos') is not null
	drop table Tb_Productos
go	

CREATE TABLE Tb_Productos (
    Codigo_SKU varchar(6) PRIMARY KEY CHECK (Codigo_SKU LIKE '[A-Z][A-Z][A-Z][0-9][0-9][0-9]'),
    Familia_SKU varchar(255),
    Subfamilia_SKU varchar(255),
    Peso_SKU numeric(10,2)
)

IF OBJECT_ID('Tb_Compras') is not null
	drop table Tb_Compras
go	

CREATE TABLE Tb_Compras (
    Id_Compra varchar(15) PRIMARY KEY CHECK (Id_Compra LIKE '[A-Z][A-Z]. [0-9][0-9].[0-9][0-9].[0-9][0-9]'),
    Fecha_Compra date,
    Familia_SKU varchar(255),
    Subfamilia_SKU varchar(255),
    Proveedor_Compra varchar(255),
    Pais_Proveedor varchar(255),
	Codigo_SKU_fk2 varchar(6)
)

IF OBJECT_ID('Tb_Importadores') is not null
	drop table Tb_Importadores
go	

CREATE TABLE Tb_Importadores (
    RUC_Importador varchar(11) PRIMARY KEY CHECK (RUC_Importador LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Nombre_Importador varchar(255)
)

ALTER TABLE Tb_Importaciones
ADD CONSTRAINT fk_RUC_Importador FOREIGN KEY (RUC_Importador_fk) REFERENCES Tb_Importadores (RUC_Importador)
ALTER TABLE Tb_Importaciones
ADD CONSTRAINT fk_Codigo_SKU FOREIGN KEY (Codigo_SKU_fk) REFERENCES Tb_Productos (Codigo_SKU)
ALTER TABLE Tb_Compras
ADD CONSTRAINT fk_Codigo_SKU2 FOREIGN KEY (Codigo_SKU_fk2) REFERENCES Tb_Productos (Codigo_SKU)