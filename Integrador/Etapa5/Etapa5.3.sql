-- 1)
/*
Obtener una lista de todos aquellos bebés 
nacidos con menos de 20 semanas de 
gestación. La lista mostrará los bebés de 
cualquier sexo, por lo tanto, la consulta se 
debe llevar a cabo en las tablas VARONES, 
MUJERES e INDETERMINADOS
*/
use laboratorio;

select * from varones where semanas < 20
union 
select * from mujeres where semanas < 20
union
select * from indeterminados where semanas < 20;

-- 2)
/*
Luego, obtener una lista de todos aquellos 
bebés nacidos durante el mes de septiembre, 
con más de 40 semanas de gestación y 
nacidos de madres chilenas casadas. 

La lista debe mostrar los bebés de cualquier 
sexo, por lo tanto, debe llevar adelante la 
consulta en las tablas VARONES, MUJERES
e INDETERMINADOS.
*/
select * from varones where fecha like '%/09/%' and semanas > 40 and ESTADO_CIVIL_MADRE = 'casada' and NACIONALIDAD = 'chilena'
union 
select * from mujeres where fecha like '%/09/%' and semanas > 40 and ESTADO_CIVIL_MADRE = 'casada' and NACIONALIDAD = 'chilena'
union
select * from indeterminados where fecha like '%/09/%' and semanas > 40 and ESTADO_CIVIL_MADRE = 'casada' and NACIONALIDAD = 'chilena';

-- 3)
/*
Obtener una lista de todos aquellos 
productos (a la venta y suspendidos) cuyo 
precio supere los 80 dólares. La búsqueda se 
debe llevar a cabo en las tablas 
PRODUCTOS_NEPTUNO
y PRODUCTOS_SUSPENDIDOS. Después, 
ordenar el resultado alfabéticamente según 
los nombres de los productos
*/
select * from productos_neptuno where PrecioUnidad > 80
union
select * from productos_suspendidos where PrecioUnidad > 80
order by NombreProducto;

-- 4)
/*
Modificar la consulta anterior y agregar una 
columna con el nombre CONDICIÓN en la 
que se muestre el texto “A LA VENTA” en el 
caso de que el registro provenga de la tabla 
PRODUCTOS_NEPTUNO; o que se muestre 
el texto SUSPENDIDO si el registro proviene 
de la tabla PRODUCTOS_SUSPENDIDOS.
*/
select *, 'A LA VENTA' as CONDICION from productos_neptuno where PrecioUnidad > 80 and suspendido = 'NO'
union
select *, 'SUSPENDIDO' as CONDICION from productos_suspendidos where PrecioUnidad > 80 and suspendido = 'SI'
order by NombreProducto;

-- 5)
/*
Generar una lista de todos los productos 
que pertenezcan a la categoría BEBIDAS, 
sin importar si los mismos se encuentran a 
la venta o suspendidos (la búsqueda se debe 
hacer en las tablas PRODUCTOS_NEPTUNO
y la tabla PRODUCTOS_SUSPENDIDOS). 
Luego, ordenar la lista alfabéticamente
según los nombres de los productos
*/
select * from productos_neptuno where NombreCategoria = 'Bebidas'
union
select * from productos_suspendidos where NombreCategoria = 'Bebidas'
order by NombreProducto;

-- 6)
/*
Duplicar el producto cuyo ID es el número 
43 de la tabla PRODUCTOS_NEPTUNO en 
la tabla PRODUCTOS_SUSPENDIDOS a 
través de una consulta de datos anexados.
*/
insert into productos_suspendidos (IdProducto, NombreProducto, NombreContacto, NombreCategoria, PrecioUnidad, Suspendido, IdProveedor)
select IdProducto, NombreProducto, NombreContacto, NombreCategoria, PrecioUnidad, Suspendido, IdProveedor from productos_neptuno
where IdProducto = 43;

-- 7)
/*
Repetir la consulta generada en el paso 5
(cinco) para observar que la cantidad de 
productos obtenida siga siendo la misma
*/
select * from productos_neptuno where NombreCategoria = 'Bebidas'
union
select * from productos_suspendidos where NombreCategoria = 'Bebidas'
order by NombreProducto;

-- 8)
/*
Modificar la consulta del paso 5 (cinco) para 
mostrar el producto duplicado
*/
select * from productos_neptuno where NombreCategoria = 'Bebidas'
union all
select * from productos_suspendidos where NombreCategoria = 'Bebidas'
order by NombreProducto;

-- 9)
/*
Eliminar el producto cuyo ID es el número 43
de la tabla PRODUCTOS_SUSPENDIDOS
*/
SET SQL_SAFE_UPDATES = 0;

delete from productos_suspendidos
where IdProducto = 43;
