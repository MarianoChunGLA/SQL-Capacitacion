-- Etapa 5.2
-- 1)
/*
Utilizando la tabla CLIENTES_NEPTUNO, 
generar una consulta que muestre los campos 
IDCLIENTE, NOMBRECOMPANÍA, CIUDAD
y PAÍS. Agregar una columna cuyo nombre 
sea CONTINENTE, en la que se muestren los 
siguientes valores:
	a. América del Norte si el cliente está 
	radicado en México, Canadá o USA.
    
	b. América del Sur si el cliente está radicado 
	en Argentina, Brasil o Venezuela.
	Etapa 5.2
    
	c. Europa en el caso de que no se cumplan 
	ninguna de las condiciones anteriores.
	Ordenar el resultado alfabéticamente por los 
	campos CONTINENTE y PAÍS
*/
use laboratorio;
select IDCliente, NombreCompania, Ciudad, Pais, 
case when Pais in('Mexico', 'Canada', 'USA') then 'America del Norte'
when Pais in('Argentina', 'Brasil', 'Venezuela') then 'America del Sur'
else 'Europa'
end CONTINENTE
from clientes_neptuno
order by continente, pais;

-- 2)
/*
Utilizar la tabla PEDIDOS_NEPTUNO, 
generar una consulta que muestre los 
campos IDPEDIDO, NOMBRECOMPAÑÍA, 
FECHAPEDIDO y CARGO. Luego, agregar 
una columna llamada EVALUACIÓN en la 
que se muestren los siguientes valores:
	a. EXCELENTE si el cargo supera los 700 
	dólares.
    
	b. MUY BUENO si el cargo oscila entre 500 y 
	700 dólares.
    
	c. BUENO si el cargo oscila entre 250 y 500 
	dólares.
    
	d. REGULAR si el cargo oscila entre 50 y 250 
	dólares.
    
	e. MALO si el cargo es inferior a 50 dólares.
	Por último, ordenar el resultado de mayor a 
	menor según los cargos de cada pedido.
*/
select IdPedido, NombreCompania, FechaPedido, Cargo,
case when Cargo > 700 then 'Excelente'
when Cargo between 500 and 700 then 'Muy Bueno'
when Cargo between 250 and 500 then 'Bueno'
when Cargo between 50 and 250 then 'Regular'
else 'Malo'
end EVALUACION
from Pedidos_Neptuno
order by Cargo desc;

-- 3)
/*
Utilizando la tabla PRODUCTOS_NEPTUNO, 
generar una consulta que muestre los campos 
IDPRODUCTO, NOMBREPRODUCTO, 
NOMBRECATEGORÍA y PRECIOUNIDAD. 
Agregar una columna con el nombre TIPO en 
la que se muestren los siguientes valores:
	a. DELUXE si el precio del producto supera 
	los 100 dólares.
    
	b. REGULAR si el precio del producto oscila 
	entre 10 y 100 dólares.
    
	c. ECONÓMICO si el precio del producto es 
	inferior a los 10 dólares.
	Por último, ordenar los productos de mayor a 
	menor según sus precios.
*/
select IdProducto, NombreProducto, NombreCategoria, PrecioUnidad,
case when PrecioUnidad > 100 then 'Deluxe'
when PrecioUnidad between 10 and 100 then 'Regular'
else 'Economico'
end TIPO
from productos_neptuno
order by PrecioUnidad desc;

