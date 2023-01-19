-- Etapa 4.2
-- 1)
/*
Actualizar la tabla CLIENTES_NEPTUNO. 
Cuando figure el valor ESTADOS UNIDOS en 
el campo PAIS, cambiar dicho valor por USA. 
Para verificar el cambio realizado, mostrar el 
contenido de la tabla CLIENTES_NEPTUNO.
*/
use laboratorio;

SET SQL_SAFE_UPDATES = 0;

update clientes_neptuno 
set pais = 'USA'
where pais = 'Estados Unidos'; 

select * from clientes_neptuno;

-- 2)
/*
Actualizar la tabla CLIENTES_NEPTUNO
para mostrar todos los valores del campo 
NOMBRECOMPANIA en mayúsculas. Para 
verificar el cambio realizado, mostrar el 
contenido de la tabla CLIENTES_NEPTUNO.
*/
update clientes_neptuno
set NombreCompania = upper(NombreCompania);

select * from clientes_neptuno;

-- 3)
/*
Actualizar la tabla CLIENTES_NEPTUNO
para mostrar todos los valores de los campos 
CIUDAD y PAIS en mayúsculas. Mostrar el 
contenido de la tabla CLIENTES_NEPTUNO
para verificar el cambio llevado a cabo
*/
update clientes_neptuno
set Ciudad = upper(Ciudad),
Pais = upper(Pais);

select * from clientes_neptuno;

-- 4)
/*
En la tabla EMPLEADOS generar una nueva 
columna llamada NOMBRE_EMPLEADO
que admita cadenas de texto con un máximo 
de 30 caracteres. Ubica esta columna a la 
derecha del campo IDEMPLEADO. Completar 
esta nueva columna concatenando los 
valores cargados en los campos APELLIDOS 
y NOMBRE, separando dichos valores por 
una coma y un espacio. Eliminar las 
columnas APELLIDOS y NOMBRE. Mostrar el 
contenido de la tabla EMPLEADOS para 
verificar el cambio llevado a cabo.
*/
alter table empleados 
add Nombre_empleado varchar(30) after IdEmpleado;

update empleados
set Nombre_empleado = concat(apellidos,', ', nombre);

alter table empleados
drop column Apellidos,
drop column Nombre;

select * from empleados;

-- 5)
/*
En la tabla CLIENTES generar una nueva 
columna con el nombre TIPO que admita 
cadenas de texto con un máximo de 3 
caracteres. Esta columna debe ubicarse 
al final de la tabla. Completar esta nueva 
columna estableciendo el valor VIP para 
todos aquellos clientes que residan en la 
ciudad de MADRID. Para verificar el cambio 
llevado a cabo, mostrar el contenido de la 
tabla CLIENTES
*/
alter table clientes 
add Tipo varchar(3);
 
update clientes
set tipo = 'VIP'
where ciudad = 'madrid';

select * from clientes;

-- 6)
/*
Dado que todos los clientes que figuran en la 
tabla CLIENTES residen en España, agregar 
el prefijo +34- a cada uno de los teléfonos
que figuran en el campo TELEFONO. En caso 
de que un cliente no tuviera el teléfono 
cargado, a ese teléfono no se le debería 
agregar el prefijo. Mostrar el contenido de la 
tabla CLIENTES para verificar el cambio 
realizado.

Atención: este campo es de tipo INT, por lo tanto, 
no admitirá el agregado del prefijo, tal como se 
especifica en el ejercicio. Deberás cambiar el tipo 
de dato de este campo
*/
alter table clientes
modify telefono varchar(30);

update clientes
set telefono = concat('+34-', telefono)
where telefono is not null;

select * from clientes;

-- 7)
/*
En la tabla PRODUCTOS generar una nueva 
columna con el nombre FECHA que admita la 
carga de fechas. Completar la nueva columna 
con fechas coherentes, concatenando los 
campos DIA, MES y ANO. Cargados los datos 
en la nueva columna, eliminar las columnas 
originales (DIA, MES y ANO). Además, 
actualizar el campo ORIGEN de manera que, 
donde figure el valor ESPANA, sea reemplazado por ESPAÑA. Mostrar el contenido de la 
tabla PRODUCTOS para verificar el cambio 
llevado a cabo.
*/
alter table productos
add Fecha date;

update productos
set fecha = concat_ws('-', ano, mes, dia);

alter table productos
drop column dia,
drop column mes,
drop column ano;

update productos
set origen = 'ESPAÑA' where origen = 'espana';

select * from productos;

-- 8)
/*
Actualizar el campo SUSPENDIDO de la tabla 
PRODUCTOS_NEPTUNO de manera que:
a. Donde figure el valor 0, éste se reemplace por la 
palabra NO.

b. Donde figure el valor 1, éste se reemplace por la 
palabra SI.

c. Tener en cuenta que el campo SUSPENDIDO es de 
tipo INT actualmente. Cambiar el tipo de dato para 
que admita el reemplazo.

d. Para verificar el cambio llevado a cabo, mostrar el 
contenido de la tabla PRODUCTOS_NEPTUNO
*/
alter table productos_neptuno
modify Suspendido char(2);

update productos_neptuno
set suspendido = if(suspendido = '0', 'NO', 'SI');

select * from productos_neptuno;

-- 9)
/*
Actualizar los precios de todos los productos
de la tabla PRODUCTOS_NEPTUNO, 
recargándolos un 10% y manteniendo un 
total de 2 decimales para cada uno de los 
precios. Mostrar el contenido de la tabla 
PRODUCTOS_NEPTUNO para verificar el 
cambio llevado a cabo
*/
update productos_neptuno
set PrecioUnidad = round(PrecioUnidad*1.1, 2);

select * from productos_neptuno;

-- 10)
/*
Observar la tabla PROVEEDORES y su 
contenido. Para todos aquellos proveedores 
que no tengan cargado un valor en el campo 
REGION, mostrar el valor NULL en dicho 
campo. Mostrar el contenido de la tabla 
PROVEEDORES para verificar el cambio 
llevado a cabo.
*/
update proveedores
set Region = null where region = '';

select * from proveedores;

-- 11)
/*
Observar el contenido de la tabla CLIENTES. 
Actualizar el campo CIUDAD de manera que 
todos los valores cargados en esta columna 
muestren la primera letra en mayúsculas y el 
resto en minúsculas. Mostrar el contenido de 
la tabla PROVEEDORES para verificar el 
cambio llevado a cabo
*/
update clientes
set ciudad = concat(upper(left(ciudad,1)), lower(substring(ciudad,2)));

select * from clientes;

-- 12)
/*
Generar una nueva tabla con el nombre 
PRODUCTOS_SUSPENDIDOS a partir de la tabla 
PRODUCTOS_NEPTUNO. Volcar en esta nueva tabla 
todos los campos de la tabla PRODUCTOS_NEPTUNO, 
pero sólo aquellos registros en los que en el campo 
SUSPENDIDO figure la palabra SI. Mostrar el 
contenido de la tabla PRODUCTOS_SUSPENDIDOS
una vez generada. La nueva tabla debería contener 8 
productos (registros).
*/
create table Productos_suspendidos
select * from productos_neptuno 
where suspendido = 'SI';

select * from Productos_suspendidos;


