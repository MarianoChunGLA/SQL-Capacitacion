-- Etapa 2.1

-- 1)
/*
Importar el archivo CSV con el nombre
CLIENTES_NEPTUNO (éste se encuentra
disponible en el área de descargas, del
presente módulo) a la base de datos con el
nombre LABORATORIO. Y tener en cuenta
las siguientes indicaciones:
	a. No cambiar el nombre de la tabla.
	b. Eliminar la tabla en el caso de que ya
	exista dentro de la base de datos.
	c. Mantener los tipos de datos asignados al
	momento de la importación.
*/
USE laboratorio;
SELECT * FROM clientes_neptuno;

-- 2)
/*
Llevar a cabo los siguientes cambios en la 
tabla CLIENTES_NEPTUNO importada anteriormente. Respetar las consignas detalladas 
a continuación y utilizar el comando ALTER 
TABLE:
	a. Campo IDCliente: debe ser de tipo 
	VARCHAR, debe admitir hasta 5 caracteres como máximo y debe ser el campo 
	PRIMARY KEY de la tabla.
	b. Campo NombreCompania: debe ser de 
	tipo VARCHAR, debe admitir hasta 100 
	caracteres como máximo y no puede 
	quedar vacío.
	c. Campo Pais: debe ser de tipo VARCHAR, 
	debe admitir hasta 15 caracteres como 
	máximo y no puede quedar vacío.
*/
-- a)
ALTER TABLE clientes_neptuno modify IDCliente varchar(5) primary key;

desc clientes_neptuno;
-- b)
alter table clientes_neptuno modify NombreCompania varchar(100) not null;
-- c)
alter table clientes_neptuno modify Pais varchar(15) not null;

-- 3)
/*
Cambiar el nombre de la tabla CLIENTES por 
CONTACTOS
*/
rename table clientes to contactos;

-- 4)
/*
Importar el archivo CSV con el nombre 
CLIENTES a la base de datos 
LABORATORIO. Y tener en cuenta las 
siguientes indicaciones:
	a. Este archivo lo encontrarás disponible en el 
	área de descargas del presente módulo.
	b. No cambiar el nombre de la tabla.
	c. Mantener los tipos de datos asignados al 
	momento de la importación.
*/
SELECT * FROM clientes;

-- 5)
/*
Llevar a cabo los siguientes cambios en la 
tabla CLIENTES importada anteriormente. 
Respetar las consignas detalladas a continuación y utiliza el comando ALTER TABLE:
	a. Campo Cod_Cliente: debe ser de tipo 
	VARCHAR, debe admitir hasta 7 caracteres como máximo y debe ser el campo 
	PRIMARY KEY de la tabla.
	b. Campo Empresa: debe ser de tipo 
	VARCHAR, debe admitir hasta 100 
	caracteres como máximo y no puede 
	quedar vacío.
	c. Campo Ciudad: debe ser de tipo 
	VARCHAR, debe admitir hasta 25 caracteres como máximo y no puede quedar vacío.
	d. Campo Telefono: debe ser de tipo INT y no 
	debe admitir valores numéricos negativos.
	e. Campo Responsable: debe ser de tipo 
	VARCHAR y debe admitir como máximo 
	hasta 30 caracteres.
*/
-- a)
alter table Clientes modify Cod_Cliente varchar(7) primary key;
-- b)
alter table Clientes modify empresa varchar(100) not null;
-- c)
alter table Clientes modify Ciudad varchar(25) not null;
-- d)
alter table Clientes modify Telefono int unsigned;
-- e)
alter table Clientes modify Responsable varchar(30);

desc Clientes;
-- 6)
/*
Importar el archivo CSV con el nombre 
PEDIDOS a la base de datos LABORATORIO. 
Y tener en cuenta las siguientes indicaciones:
a. Este archivo lo encontrarás disponible en el 
área de descargas del presente módulo.
b. No cambiar el nombre de la tabla.
c. Mantener los tipos de datos asignados al 
momento de la importación.
*/
select * from pedidos;

-- 7)
/*
Llevar a cabo los siguientes cambios en la 
tabla PEDIDOS importada anteriormente. 
Respetar las consignas detalladas a continuación y utilizar el comando ALTER TABLE:
	a. Campo Numero_Pedido: debe ser de tipo 
	INT, sólo debe aceptar valores numéricos 
	enteros y debe ser el campo PRIMARY KEY
	de la tabla.
	b. Campo Codigo_Cliente: debe ser de tipo 
	VARCHAR, debe admitir hasta 7 caracteres como máximo y no puede quedar vacío.
	c. Campo Fecha_Pedido: debe ser de tipo 
	DATE y su carga es obligatoria.
	Introducción a Bases de Datos y SQL
	d. Campo Forma_Pago: sólo debe admitir la 
	carga de los valores APLAZADO, 
	CONTADO o TARJETA.
	e. Campo Enviado: sólo debe admitir la carga 
	de los valores SI o NO
*/
-- a)
alter table Pedidos modify Numero_Pedido int primary key;
-- b)
alter table Pedidos modify Codigo_Cliente varchar(7) not null;
-- c)
alter table Pedidos modify Fecha_Pedido date not null;
-- d)
alter table Pedidos modify Forma_Pago enum('APLAZADO', 'CONTADO', 'TARJETA');
-- e)
alter table Pedidos modify Enviado enum('SI', 'NO');

desc Pedidos;

-- 8)
/*
Importar el archivo CSV: PRODUCTOS a la 
base de datos LABORATORIO. Y tener en 
cuenta las siguientes indicaciones:
	a. Este archivo lo encontrarás disponible en 
	el área de descargas del presente módulo.
	b. No cambiar el nombre de la tabla.
	c. Mantener los tipos de datos asignados al 
	momento de la importación
*/
select * from productos;

-- 9)
/*
Llevar a cabo los siguientes cambios en la 
tabla PRODUCTOS importada en el paso 
anterior. Respetar las consignas detalladas a 
continuación, utilizando el comando ALTER 
TABLE:
	a. Campo Cod_Producto: debe ser de tipo 
	INT, sólo debe aceptar valores numéricos 
	enteros y debe ser el campo PRIMARY KEY
	de la tabla.
	b. Campo Seccion: debe ser de tipo 
	VARCHAR, debe admitir hasta 20 
	caracteres como máximo y no puede 
	quedar vacío.
	c. Campo Nombre: debe ser de tipo VARCHAR, debe 
	admitir hasta 40 caracteres como máximo y no 
	puede quedar vacío. 
	d. Campo Importado: sólo debe admitir la carga de los 
	valores VERDADERO o FALSO.
	e. Campo Origen: debe ser de tipo VARCHAR, admitir 
	hasta 25 caracteres y ser de carga obligatoria.
	f. Campos Dia, Mes y Ano: deben ser de tipo INT, 
	positivos y de carga obligatoria
*/
-- a)
alter table Productos modify Cod_Producto int primary key;
-- b)
alter table Productos modify Seccion varchar(20) not null;
-- c)
alter table Productos modify Nombre varchar(40) not null;
-- d)
alter table Productos modify Importado enum('VERDADERO', 'FALSO');
-- e)
alter table Productos modify Origen varchar(25) not null;
-- f)
alter table Productos modify Dia int unsigned not null, modify Mes int unsigned not null, modify Ano int unsigned not null;

desc Productos;










