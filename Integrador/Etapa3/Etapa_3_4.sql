-- Etapa 3.4
-- 1)
/*
Utilizar la tabla PEDIDOS_NEPTUNO y 
obtener una lista de todos los registros
cargados en la tabla. Generar una nueva 
columna con el nombre IVA que calcule el 
21% del cargo de cada pedido, obteniendo 
un valor numérico que, como máximo, 
contenga 2 decimales
*/
use laboratorio;
select *, round(Cargo * 1.21, 2) as IVA from pedidos_neptuno;

-- 2)
/*
Modificar la consulta anterior, agregando una 
nueva columna con el nombre NETO, que 
calcule el total a pagar por cada cliente por 
las compras realizadas (es decir, sumándole 
el IVA al cargo original, manteniendo como 
máximo 2 decimales).
*/
select *, 
round(Cargo * 1.21, 2) as IVA,
round(SUM(Cargo * 1.21), 2) as NETO
from pedidos_neptuno
group by NombreCompania;

-- 3)
/*
Modificar la consulta anterior, agregando una 
nueva columna con el nombre REDONDEO A 
FAVOR CLIENTE que devuelva el valor entero 
inferior del neto calculado anteriormente.
*/
select *, 
round(Cargo * 1.21, 2) as IVA,
round(SUM(Cargo * 1.21), 2) as NETO,
floor(SUM(Cargo * 1.21)) as 'REDONDEO A FAVOR CLIENTE'
from pedidos_neptuno
group by NombreCompania;


-- 4)
/*
Modificar la consulta anterior, agregando una 
nueva columna con el nombre REDONDEO 
A FAVOR EMPRESA que devuelva el valor 
entero superior del neto antes calculado.
*/
select *, 
round(Cargo * 1.21, 2) as IVA,
round(SUM(Cargo * 1.21), 2) as NETO,
floor(SUM(Cargo * 1.21)) as 'REDONDEO A FAVOR CLIENTE',
ceil(SUM(Cargo * 1.21)) as 'REDONDEO A FAVOR EMPRESA'
from pedidos_neptuno
group by NombreCompania;



