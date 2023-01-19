-- Etapa 5.5
-- 1)
/*
Generar un listado en el que se muestre el 
campo NOMBRECONTACTO de la tabla 
PROVEEDORES y los campos IDPRODUCTO, 
NOMBREPRODUCTO y PRECIOUNIDAD de 
la tabla PRODUCTOS NEPTUNO. Generar el 
JOIN a través de la cláusula FROM. Después, 
ordenar el resultado alfabéticamente por los 
nombres de los contactos y cuando el nombre 
del contacto (nombre del proveedor) se repita, 
ordena los productos, también de manera 
alfabética, provistos por el proveedor.
*/
use laboratorio;
select proveedores.NombreContacto, IdProducto, NombreProducto, PrecioUnidad from proveedores join productos_neptuno
on proveedores.NombreContacto = productos_neptuno.NombreContacto
order by proveedores.NombreContacto, NombreProducto;

-- 2)
/*
Modificar la consulta anterior para generar 
el JOIN a través de la cláusula WHERE
*/
select proveedores.NombreContacto, IdProducto, NombreProducto, PrecioUnidad from proveedores, productos_neptuno
where proveedores.NombreContacto = productos_neptuno.NombreContacto
order by proveedores.NombreContacto, NombreProducto;

-- 3)
/*
Crear un listado en la que se muestre el 
campo EMPRESA de la tabla CLIENTES y los 
campos NUMERO_PEDIDO, FECHA_PEDIDO 
y FORMA_PAGO de la tabla PEDIDOS. 
Generar el JOIN a través de la cláusula FROM. 
Luego, ordenar el listado alfabéticamente por 
los nombres de las empresas.
*/
select clientes.empresa, numero_pedido, fecha_pedido, forma_pago from clientes join pedidos
on clientes.Cod_Cliente = pedidos.Codigo_Cliente
order by clientes.empresa;

-- 4)
/*
Modificar la consulta anterior para mostrar 
únicamente aquellos clientes que no hayan 
efectuado ningún pedido.
*/
select clientes.empresa, numero_pedido, fecha_pedido, forma_pago from clientes left join pedidos
on clientes.Cod_Cliente = pedidos.Codigo_Cliente 
where pedidos.Codigo_Cliente is null
order by clientes.empresa;

-- 5)
/*
Por último, modificar la consulta anterior para 
mostrar únicamente el campo EMPRESA.
*/
select clientes.empresa from clientes left join pedidos
on clientes.Cod_Cliente = pedidos.Codigo_Cliente 
where pedidos.Codigo_Cliente is null
order by clientes.empresa;

-- 6)
/*
¿Existe algún proveedor que en este momento 
no le esté vendiendo ningún producto a 
nuestra empresa? Responder esta pregunta 
a través de una consulta en la que utilices las 
tablas PROVEEDORES y PRODUCTOS 
NEPTUNO. Mostrar todos los campos de 
ambas tablas en el resultado de la consulta
*/
select * from proveedores left join productos_neptuno
on proveedores.IdProveedor = productos_neptuno.IdProveedor
where productos_neptuno.IdProducto is null;

-- 7)
/*
¿Existe algún producto que no se sepa quién 
es el proveedor que lo provee a nuestra 
empresa? Responder esta pregunta a través 
de una consulta en la que utilices las tablas 
PROVEEDORES y PRODUCTOS NEPTUNO. 
Puedes mostrar todos los campos de ambas 
tablas en el resultado de la consulta.
*/
select * from proveedores right join productos_neptuno
on proveedores.IdProveedor = productos_neptuno.IdProveedor
where proveedores.IdProveedor is null;


