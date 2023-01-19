-- Etapa 4.3 y 4.4

-- 1)
/*
Desde ahora, todos los productos provistos 
por el proveedor 1 pasan a estar suspendidos
por tiempo indeterminado. Por lo tanto:

a. Ejecutar una consulta de actualización por 
la que, todos los productos de la tabla 
PRODUCTOS_NEPTUNO que pertenecen 
al proveedor cuyo IDPROVEEDOR sea el 
número 1 pasen a mostrar el valor SI en 
el campo SUSPENDIDO.

b. Ejecutar una consulta de datos anexados
por la que, todos los productos que ahora 
se encuentran suspendidos en la tabla 
PRODUCTOS_NEPTUNO se copien en 
la tabla PRODUCTOS_SUSPENDIDOS.

c. Ejecutar una consulta de eliminación
por la que, todos los productos de la tabla 
PRODUCTOS_NEPTUNO que fueron 
copiados, se eliminen de la tabla 
PRODUCTOS_SUSPENDIDOS.
*/
use laboratorio;
-- a)
update productos_neptuno
set suspendido = 'SI'
where idproveedor = 1;

-- b)
insert into productos_suspendidos(IdProducto, NombreProducto, NombreContacto, NombreCategoria, PrecioUnidad, Suspendido, IdProveedor)
select IdProducto, NombreProducto, NombreContacto, NombreCategoria, PrecioUnidad, Suspendido, IdProveedor from productos_neptuno 
where suspendido = 'SI';

-- Ejercicio desafio 4.4 IDEM ejercico c) desafio 4.3
-- Consigna etapa 4.4
/*
En la etapa anterior, se creó una tabla nueva 
con el nombre PRODUCTOS_SUSPENDIDOS
y se copió en ella, todos los productos que se 
encontraban suspendidos de la tabla 
PRODUCTOS_NEPTUNO. Sin embargo, estos 
registros se copiaron de una tabla a la otra; 
es decir, aún se encuentran cargados en la 
tabla PRODUCTOS_NEPTUNO. 

Por lo tanto, llevar a cabo una consulta 
de eliminación por la que los productos 
suspendidos se eliminen de la tabla 
PRODUCTOS_NEPTUNO. Al ejecutar esta 
consulta deberían eliminarse de la tabla 
PRODUCTOS_NEPTUNO 8 registros
*/
delete from productos_neptuno 
where suspendido = 'SI';

select * from productos_suspendidos;

select * from productos_neptuno;
