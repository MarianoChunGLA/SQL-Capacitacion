-- Etapa 1.2

-- 1)
DESCRIBE FACTURAS;
-- a)
ALTER TABLE FACTURAS CHANGE clienteID idCliente int;
-- b)
ALTER TABLE FACTURAS CHANGE articuloId idArticulo int;
-- c)
ALTER TABLE FACTURAS MODIFY monto double UNSIGNED;

-- 2)
-- a)
DESCRIBE ARTICULOS;
ALTER TABLE ARTICULOS CHANGE articuloId idArticulo int;
-- b)
ALTER TABLE ARTICULOS MODIFY nombre varchar(75);
-- c)
ALTER TABLE ARTICULOS MODIFY precio int UNSIGNED NOT NULL;
-- d)
ALTER TABLE ARTICULOS MODIFY stock int UNSIGNED NOT NULL;

-- 3)
-- a)
DESCRIBE CLIENTES;
ALTER TABLE CLIENTES CHANGE clienteId idCliente int;
-- b)
ALTER TABLE CLIENTES MODIFY nombre varchar(30) NOT NULL;
-- c)
ALTER TABLE CLIENTES MODIFY apellido varchar(35) NOT NULL;
-- d)
ALTER TABLE CLIENTES CHANGE comentarios observaciones varchar(255);
