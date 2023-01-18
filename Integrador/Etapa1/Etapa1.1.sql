-- Etapa 1.1

-- 1)
/*
Crear una base de datos con el nombre 
LABORATORIO. En el caso de que la base de 
datos exista previamente, eliminarla antes de 
iniciar el laboratorio.
*/
CREATE DATABASE LABORATORIO;
-- 2)
/*
Poner en uso la base de datos generada en el 
paso anterior.
*/
USE LABORATORIO;
-- 3)
/*
Crear una tabla con el nombre FACTURAS
dentro de la base de datos con la estructura 
que se muestra en la diapositiva 5 y tener en 
cuenta las siguientes consideraciones:
	a. PK significa PRIMARY KEY.
	b. Observar que se declara una clave 
	primaria compuesta por los campos Letra
	y Número; cada campo por sí solo no es 
	clave, ni tampoco identifica al registro, pero 
	la combinación de ambos forman la clave.
*/
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
/*
Crear una tabla con el nombre ARTÍCULOS
dentro de la base de datos y tomar en 
consideración la estructura definida en la 
diapositiva 5
*/
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
/*
Crear una tabla con el nombre CLIENTES
dentro de la base de datos y tomar en 
consideración la estructura definida en la 
diapositiva siguiente.
*/
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

-- 6
/*
Mostrar un listado de todas las bases de 
datos alojadas en el servidor.
*/
SHOW DATABASES;

-- 7 y 8
/*
7)
Mostrar un listado de todas las tablas
generadas anteriormente dentro de la base 
de datos con el nombre LABORATORIO
8)
Comentar la instrucción que lista las tablas
contenidas dentro de la base de datos 
LABORATORIO.
*/
# SHOW TABLES;

-- 9)
/*
Describir la estructura de la tabla CLIENTES
*/
DESCRIBE CLIENTES;