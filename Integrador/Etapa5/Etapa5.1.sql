-- Etapa 5.1
-- 1)
/*
Utilizando la tabla PRODUCTOS_NEPTUNO, 
obtener una lista de todos aquellos productos 
cuyo precio supere el precio promedio. Esta 
debe contener todos los campos de la tabla. 
Por último, ordenar alfabéticamente el 
resultado según los nombres de los productos.
*/
use laboratorio;

select * from productos_neptuno
where PrecioUnidad > (select Avg(PrecioUnidad) from productos_neptuno)
order by NombreProducto;

-- 2)
/*
Tomando la tabla PRODUCTOS_NEPTUNO, 
obtener una lista de todos aquellos productos 
cuyo precio sea superior al producto más 
caro de la tabla 
PRODUCTOS_SUSPENDIDOS. 

Esta debe contener todos los campos de la 
tabla. Luego, ordenar el resultado de mayor a 
menor de acuerdo con los precios obtenidos.

*/
select * from productos_neptuno
where PrecioUnidad > (select max(PrecioUnidad) from productos_suspendidos)
order by PrecioUnidad desc;


-- 3)
/*
Utilizando la tabla VARONES, obtener una 
lista de todos aquellos bebés que hayan 
nacido con una cantidad de semanas de 
gestación menor que el bebé de sexo 
indeterminado con menor gestación. La lista 
debe mostrar todos los campos de la tabla
*/
select * from varones
where semanas < (select min(semanas) from indeterminados);

-- 4)
/*
Dada la tabla PRODUCTOS_NEPTUNO, 
obtener una lista de todos los productos cuyo 
nombre comience con la inicial del apellido 
del empleado cuyo IDEMPLEADO es el 
número 8. Esta debe mostrar todos los 
campos de la tabla PRODUCTOS_NEPTUNO
y se debe ordenar alfabéticamente según los 
nombres de los productos.
*/
select * from productos_neptuno
where left(NombreProducto, 1) = (select left(Nombre_empleado, 1) from empleados where IdEmpleado = 8)
order by NombreProducto;  


-- 5)
/*
Utilizando la tabla PRODUCTOS_NEPTUNO, 
obtener una lista de todos los productos que 
pertenezcan al proveedor con el ID más alto. 
La lista debe mostrar todos los campos de la 
tabla PRODUCTOS_NEPTUNO y debe 
ordenarse alfabéticamente por los nombres 
de los productos.
*/
select * from productos_neptuno
where IdProveedor = (select max(IdProveedor) from proveedores)
order by NombreProducto;

-- 6)
/*
Dada la tabla PRODUCTOS_NEPTUNO, 
extraer una lista de todos aquellos productos 
que pertenezcan a la categoría BEBIDAS y 
cuyo precio sea superior al producto más 
caro de la categoría CONDIMENTOS. La lista 
debe mostrar todos los campos de la tabla
*/
select * from productos_neptuno
where NombreCategoria = 'Bebidas' and PrecioUnidad > 
(select max(PrecioUnidad) from productos_neptuno where NombreCategoria = 'Condimentos');

-- 7)
/*
A partir de la tabla MUJERES, obtener una 
lista de todas aquellas bebas que hayan 
nacido de madres con una edad superior a 
la madre más longeva que figure en la tabla 
VARONES. La lista debe mostrar todos los 
campos de la tabla MUJERES.
*/
select * from mujeres
where edad_madre > (select max(edad_madre) from varones);

-- 8)
/*
Utilizando la tabla CLIENTES_NEPTUNO, extraer una 
lista de todos los clientes que hayan realizado compras 
por un cargo superior a 500 dólares. La lista debe 
mostrar los campos NOMBRECOMPANIA, CIUDAD y 
PAÍS y debe estar ordenada alfabéticamente por los 
nombres de las compañías.
*/
select clientes_neptuno.NombreCompania, ciudad, pais from clientes_neptuno
inner join Pedidos_Neptuno on clientes_neptuno.NombreCompania = Pedidos_Neptuno.NombreCompania
where Cargo > 500
order by NombreCompania;



