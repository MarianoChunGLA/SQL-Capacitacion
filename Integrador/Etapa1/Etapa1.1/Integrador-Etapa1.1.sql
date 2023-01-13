-- Etapa 1.1

-- 1)
CREATE DATABASE LABORATORIO;
-- 2)
USE LABORATORIO;
-- 3)
CREATE TABLE FACTURAS 
(
	letra char,
    numero int,
    clienteId int,
    articuloID int,
    fecha date,
    monto double,
    primary key(letra, numero)
);

SHOW TABLES;
DESCRIBE FACTURAS;

-- 4)
CREATE TABLE ARTICULOS 
(
		articuloId int,
        nombre varchar(50),
        precio double,
        stock integer,
        primary key(articuloId)
);

SHOW TABLES;
DESCRIBE ARTICULOS;

-- 5)
CREATE TABLE CLIENTES 
(
	clienteId int,
    nombre varchar(25),
    apellido varchar(25),
    cuit char(16),
    direccion varchar(50),
    comentarios varchar(50),
    primary key(clienteId)
);

SHOW TABLES;
DESCRIBE CLIENTES;

-- 6)
SHOW DATABASES;

-- 7 y 8)
# SHOW TABLES;

-- 9)
DESCRIBE CLIENTES;