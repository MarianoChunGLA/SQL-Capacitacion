-- Etapa 3.3
-- 1)
/*
Utilizando la tabla PEDIDOS_NEPTUNO, 
obtener una lista de todos aquellos pedidos 
efectuados a lo largo del año 1998.
*/
use laboratorio;
select * from pedidos_neptuno
where year(FechaPedido) = 1998;

-- 2)
/*
Utilizando la tabla PEDIDOS_NEPTUNO, 
obtener una lista de todos aquellos pedidos 
efectuados durante los meses de agosto 
y septiembre del año 1997.
*/
select * from pedidos_neptuno
where month(FechaPedido) between 8 and 9 and year(FechaPedido) = 1997; 

-- 3)
/*
Utilizando la tabla PEDIDOS_NEPTUNO, 
obtener una lista de todos aquellos pedidos 
efectuados el primer día de cada mes de 
cualquier año
*/
select * from pedidos_neptuno
where day(FechaPedido) = 1;

-- 4)
/*
Utilizar la tabla PEDIDOS_NEPTUNO y 
obtener una lista de todos los registros
contenidos en la tabla. En una nueva 
columna llamada DIAS TRANSCURRIDOS, 
mostrar la cantidad de días transcurridos 
desde la fecha en que fue realizado cada 
pedido, al día de hoy
*/
select *, datediff(curdate(), FechaPedido) as 'DIAS TRANSCURRIDOS' from pedidos_neptuno;

-- 5)
/*
Modifica la consulta anterior y agregar otra 
columna con el nombre DIA, que refleje el 
nombre del día en el que se efectuó cada 
uno de los pedidos
*/
set lc_time_names = 'es_AR';
select *, datediff(curdate(), FechaPedido) as 'DIAS TRANSCURRIDOS', dayname(FechaPedido) as DIA from pedidos_neptuno;

-- 6)
/*
Modificar la consulta anterior, agregando otra 
columna con el nombre DIA DEL AÑO, que 
refleje el número del día del año en el que se 
efectuó cada uno de los pedidos.
*/
select *, 
datediff(curdate(), FechaPedido) as 'DIAS TRANSCURRIDOS', 
dayname(FechaPedido) as DIA,
dayofyear(FechaPedido) as 'DIA DEL AÑO' 
from pedidos_neptuno;

-- 7)
/*
Modificar la consulta anterior y agregar otra 
columna con el nombre MES, que refleje el 
nombre del mes del año en el que se efectuó 
cada uno de los pedidos.
*/
select *, 
datediff(curdate(), FechaPedido) as 'DIAS TRANSCURRIDOS', 
dayname(FechaPedido) as DIA,
dayofyear(FechaPedido) as 'DIA DEL AÑO',
monthname(FechaPedido) as 'MES' 
from pedidos_neptuno;

-- 8)
/*
Modificar la consulta anterior y agregar otra 
columna llamada PRIMER VENCIMIENTO
que calcule el primer vencimiento de cada 
factura, suponiendo que dicho vencimiento 
es a los 30 días de haber sido emitida.
*/
select *, 
datediff(curdate(), FechaPedido) as 'DIAS TRANSCURRIDOS', 
dayname(FechaPedido) as DIA,
dayofyear(FechaPedido) as 'DIA DEL AÑO',
monthname(FechaPedido) as 'MES',
adddate(FechaPedido, interval 30 day) as 'PRIMER VENCIMIENTO'
from pedidos_neptuno;

-- 9)
/*
Modificar la consulta anterior y agregar otra 
columna llamada SEGUNDO VENCIMIENTO 
que calcule el segundo vencimiento de cada 
factura, suponiendo que dicho vencimiento 
es a los 2 meses de haber sido emitida.
*/
select *, 
datediff(curdate(), FechaPedido) as 'DIAS TRANSCURRIDOS', 
dayname(FechaPedido) as DIA,
dayofyear(FechaPedido) as 'DIA DEL AÑO',
monthname(FechaPedido) as 'MES',
adddate(FechaPedido, interval 30 day) as 'PRIMER VENCIMIENTO',
adddate(FechaPedido, interval 2 month) as 'SEGUNDO VENCIMIENTO'
from pedidos_neptuno;



