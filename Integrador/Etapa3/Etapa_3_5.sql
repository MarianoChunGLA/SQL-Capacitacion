-- Etapa 3.5
-- 1)
/*
Calcular la cantidad de registros cargados en 
la tabla PEDIDOS_NEPTUNO.
*/
use laboratorio;
select count(*) as 'CANTIDAD DE REGISTROS' from pedidos_neptuno;

-- 2)
/*
Calcular la cantidad de pedidos cargados en 
la tabla PEDIDOS_NEPTUNO que hayan sido 
entregados por el transportista con el nombre 
SPEEDY EXPRESS. La columna en la que se 
obtiene el resultado debe mostrarse con el 
nombre ENTREGAS SPEEDY EXPRESS.
*/
select count(*) as 'ENTREGAS SPEEDY EXPRESS' 
from pedidos_neptuno 
where Transportista = 'SPEEDY EXPRESS';


-- 3)
/*
 Calcular la cantidad de pedidos cargados en 
la tabla PEDIDOS_NEPTUNO que hayan sido 
atendidos por empleados cuyo apellido 
comience con la letra C. La columna en la 
que se obtiene el resultado debe mostrarse 
con el nombre VENTAS
*/
select count(*) as VENTAS
from pedidos_neptuno
where Empleado like('C%');

-- 4)
/*
Calcular el precio promedio de todos los 
productos cargados en la tabla llamada 
PRODUCTOS_NEPTUNO. La columna del 
resultado, debe mostrarse con el nombre 
PRECIO PROMEDIO. El resultado debe 
mostrar, como máximo, sólo 2 decimales.
*/
select round(avg(Cargo), 2) as 'PRECIO PROMEDIO' from pedidos_neptuno;

-- 5)
/*
 Modificar la consulta anterior para obtener el 
precio más bajo de la tabla. La columna en 
la que se obtiene el resultado debe mostrarse 
con el nombre PRECIO INFERIOR
*/
select min(Cargo) as 'PRECIO INFERIOR' from pedidos_neptuno;

-- 6)
/*
Modificar la consulta anterior para obtener 
el precio más alto de la tabla. La nueva 
columna debe mostrarse con el nombre 
PRECIO MAXIMO.
*/
select max(Cargo) as 'PRECIO MAXIMO' from pedidos_neptuno;

-- 7)
/*
Generar una consulta en base a la tabla 
PRODUCTOS_NEPTUNO que muestre el 
precio más alto correspondiente a cada 
categoría. La columna en la que se obtiene 
dicho precio debe mostrarse con el nombre 
PRECIO MAXIMO. La columna que muestra 
las categorías debe mostrarse con el nombre 
CATEGORIA
*/
select NombreCategoria as CATEGORIA,
max(PrecioUnidad) as 'PRECIO MAXIMO'
from productos_neptuno
group by NombreCategoria;

-- 8)
/*
Calcular la cantidad de entregas efectuadas 
por cada transportista, utilizando la tabla 
PEDIDOS_NEPTUNO. La columna en la que 
se obtienen los resultados debe mostrarse con 
el nombre ENTREGAS.
*/
select Transportista, count(*) as 'ENTREGAS' 
from pedidos_neptuno 
group by Transportista;

-- 9)
/*
Utilizar la tabla NACIMIENTOS y calcular la 
cantidad de nacimientos según el sexo de 
los bebés. La columna en la que se obtienen 
los resultados debe mostrarse con el nombre 
NACIMIENTOS
*/
select SEXO, count(*) as NACIMIENTOS
from nacimientos
group by sexo;

-- 10)
/*
Utilizando la tabla PEDIDOS_NEPTUNO, 
calcular el total de gastos por cliente. La 
columna en la que se obtienen los resultados 
debe mostrarse con el nombre TOTAL 
GASTOS y debe mostrar como máximo 2 
decimales. La columna en la que figuran los 
nombres de los clientes debe tener el título 
CLIENTE.
*/
select NombreCompania as CLIENTE, round(sum(Cargo),2) as 'TOTAL GASTO'
from pedidos_neptuno
group by NombreCompania;

-- 10)
/*
Utilizando la tabla PRODUCTOS, calcular la 
cantidad de productos pertenecientes a cada 
sección. La columna en la que se obtienen los 
resultados debe mostrarse con el nombre 
CANTIDAD. Ordenar la consulta de mayor 
a menor según los valores de la columna 
CANTIDAD
*/
select SECCION, count(*) as CANTIDAD
from productos
group by Seccion
order by CANTIDAD desc;

-- 12)
/*
Utilizar la tabla PEDIDOS_NEPTUNO y 
calcular la cantidad de ventas efectuadas 
por mes y año. Las columnas deben 
mostrarse con los nombres AÑO, MES
y VENTAS respectivamente. Ordenar el 
resultado por año y mes, para obtener 
un listado cronológico de las ventas.
*/
select month(FechaPedido) as MES, year(FechaPedido) as AÑO, count(*) as VENTAS
from pedidos_neptuno
group by AÑO, MES
order by AÑO, MES;

-- 13)
/*
Utilizar la tabla PEDIDOS_NEPTUNO y 
calcular las siguientes estadísticas:
	a. El total facturado por empleado.
    
	b. El promedio de facturación por empleado.
    
	c. La mejor venta efectuada por cada 
	empleado.
    
	d. La peor venta efectuada por cada 
	empleado.
    
	e. La cantidad de ventas efectuadas por 
	cada empleado
    
	f. Tener en cuenta las siguientes especificaciones: las columnas deben recibir los 
	nombres FACTURACION, PROMEDIO, 
	MEJOR VENTA, PEOR VENTA y VENTAS. 
	Las columnas llamadas FACTURACION y 
	PROMEDIO deben mostrar, como máximo, 
	2 decimales.
*/
select EMPLEADO, round(sum(Cargo), 2) as FACTURACION,
round(avg(Cargo), 2) as PROMEDIO,
max(Cargo) as 'MEJOR VENTA',
min(Cargo) as 'PEOR VENTA',
count(*) as VENTAS
from pedidos_neptuno
group by Empleado;
