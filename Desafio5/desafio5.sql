-- Desafio 5

-- Ejercicio 1
-- 1)
/*
Usando la tabla ÚLTIMOS LANZAMIENTOS, 
obtener una lista de todos aquellos temas
lanzados durante el último año (año más alto 
que figure en la tabla). En el resultado de la 
consulta, mostrar solo las columnas 
ARTISTA y TÍTULO. Ordenar alfabéticamente
el resultado por los nombres de los artistas; 
en el caso de que un mismo artista haya 
tenido más de un lanzamiento, organizar el 
resultado por los títulos de esos 
lanzamientos.
*/
USE bonus_track;
select ARTISTA, TITULO from ultimos_lanzamientos
where ano = (select max(ano) from ultimos_lanzamientos)
order by artista, titulo;

-- 2)
/*
Utilizando la tabla TOP SPOTIFY, obtener una 
lista de todos aquellos lanzamientos correspondientes a LADY GAGA con mayor 
permanencia en la plataforma digital. En el 
resultado de la consulta, sólo mostrar los 
títulos de las canciones de la artista. Ordenar 
el resultado alfabéticamente por los títulos de 
las canciones.
*/
select TITULO from top_spotify
where artista = 'LADY GAGA' and permanencia = (select max(permanencia) from top_spotify)
order by titulo;

-- 3)
/*
Utiliza la tabla TOP SPOTIFY y genera una 
consulta que muestre los campos ARTISTA y 
TÍTULO. Agregar una columna con el nombre 
TIPO en la que se muestren los siguientes 
valores:
	● Pop si la canción pertenece a un género 
	que contenga la palabra POP.
	● Electrónica si la canción pertenece a un 
	género que contenga las palabras 
	ELECTRO o HOUSE.
	● Otro si no se cumple ninguna de las 
	condiciones anteriores.
	Ordena el resultado alfabéticamente por 
	nombres de los artistas. En el caso de que 
	haya un artista con más de una canción en el 
	listado, mostrar ordenados alfabéticamente 
	los nombres de las canciones
*/
select ARTISTA, TITULO,
case
	when genero = 'POP' then 'Pop'
    when genero in ('ELECTRO', 'HOUSE') then 'Electronica'
    else 'otro'
    end as TIPO
from top_spotify
order by artista, titulo;

-- Ejercicio 2
-- 1)
/*
Obtener una lista de todos aquellas canciones 
que contengan en su título la palabra BREAK. 
La lista resultante debe mostrar las canciones 
de las tablas TOP SPOTIFY y ÚLTIMOS 
LANZAMIENTOS. En el resultado de la 
consulta, mostrar todos los campos de 
ambas tablas. Ordenar alfabéticamente el 
resultado por los nombres de las canciones. 
Por último, agregar a la consulta una columna
con el nombre ESTADO en la que figure la 
palabra ANTERIOR para todos aquellos 
registros que provienen de la tabla TOP 
SPOTIFY y la palabra ÚLTIMO para todos 
aquellos que provienen de la tabla ÚLTIMOS 
LANZAMIENTOS
*/
select *, 'Anterior' as ESTADO from top_spotify where titulo like ('%break%')
union
select *, 'Ultimo' as ESTADO from ultimos_lanzamientos where titulo like ('%break%')
order by titulo;

-- Ejercicio 3
-- 1)
/*
Utilizando la tabla LIBROS, obtener una lista 
de todos aquellos productos cuyo precio 
supere al precio promedio de todos los 
libros. La lista debe contener todos los 
campos de la tabla. Ordenar el resultado 
alfabéticamente por los títulos de los libros.
*/
USE libreria;
select * from libros
where precio > (select avg(precio) from libros)
order by titulo;

-- 2)
/*
Dada la tabla LIBROS, extraer una lista de 
todos aquellos libros pertenecientes a la 
categoría NOVELAS cuyo precio sea superior 
al libro más caro de la categoría ENSAYOS. 
La lista debe contener todos los campos de la 
tabla. Mostrar el resultado de la consulta 
ordenado de mayor a menor por los precios 
de los libros obtenidos.
*/
select * from libros
where categoria = 'Novelas' 
and precio > (select max(precio) from libros where categoria = 'Ensayos')
order by precio desc;

-- 3)
/*
Utilizando la tabla EMPLEADOS, obtener una 
lista de todos aquellos empleados con mayor 
permanencia dentro de la empresa
*/
select * from empleados
where permanencia = (select max(permanencia) from empleados);

-- 4)
/*
A partir de la tabla EMPLEADOS, extraer 
una lista de todos aquellos empleados con 
el puesto más alto.
*/
select * from empleados
where puesto_id = (select max(puesto_id) from empleados);

-- 5)
/*
Utilizando la tabla LIBROS, generar una 
consulta que muestre los campos LIBRO_ID, 
TÍTULO, CATEGORÍA y PRECIO_PÚBLICO. 
Agregar una columna con el nombre TIPO
en la que se muestren los siguientes valores:
	● Económico si el precio del libro es inferior 
	a 15 dólares.
	● Regular si el precio del libro oscila entre 
	15 y 30 dólares.
	● Deluxe en el caso de que no se cumplan 
	ninguna de las condiciones anteriores.
	Ordenar alfabéticamente el resultado, por 
	el título de los libros. No muestres en el 
	resultado de la consulta aquellos libros que 
	no tienen precio (falta de stock).
*/
select libro_id, titulo, categoria, precio_publico,
case
	when precio < 15 then 'Económico'
    when precio between 15 and 30 then 'Regular'
    else 'Deluxe'
end as TIPO
from libros
where precio is not null
order by titulo;

-- 6)
/*
Obtener una lista de todos los empleados
que ocupen o hayan ocupado el puesto 9. 
La lista debe mostrar los empleados que 
actualmente estén trabajando en la empresa 
y los que se hayan desvinculado; por lo tanto, 
la consulta se debe llevar a cabo en las tablas 
EMPLEADOS y EMPLEADOS ANTERIORES.
Introducción a Bases de Datos y SQL
En el resultado de la consulta, sólo debes 
mostrar una columna (con el nombre 
EMPLEADO) en la que figuren el nombre 
y el apellido de los empleados, separando 
ambos datos por una coma y un espacio
(por ejemplo, GARCIA, MONICA). Por último, 
ordenar el resultado alfabéticamente
*/
select concat(apellido, ', ', nombre) as EMPLEADO 
from empleados where puesto_id = 9
union
select concat(apellido, ', ', nombre) as EMPLEADO 
from empleados_anteriores where puesto_id = 9
order by EMPLEADO;

-- 7)
/*
Generar una consulta que muestre las 
siguientes columnas: LIBRO_ID, TÍTULO, 
PRECIO_PÚBLICO, LOCAL_ID, 
FACTURA_NRO y CANTIDAD. Estos 
campos se hallan en las tablas LIBROS
y VENTAS. Ordenar alfabéticamente el 
resultado, por los títulos de los libros
*/
select l.libro_id, titulo, precio_publico, local_id, factura_nro, cantidad 
from libros as l inner join ventas as v
on l.libro_id = v.libro_id
order by titulo;

-- 8)
/*
Modificar la consulta anterior para agregar 
una columna con el nombre TOTAL en la que 
se multipliquen los valores de las columnas 
PRECIO_PÚBLICO y CANTIDAD. Esta nueva 
columna debe mostrar como máximo sólo 2 
decimales.
*/
select l.libro_id, titulo, precio_publico, local_id, factura_nro, cantidad,
round(precio_publico * cantidad, 2) as TOTAL 
from libros as l inner join ventas as v
on l.libro_id = v.libro_id
order by titulo;

-- 9)
/*
Crear una consulta en la que se muestren sólo 
los títulos de aquellos libros que nunca 
hayan sido vendidos. Ordenar el resultado 
alfabéticamente.
*/
select titulo from libros left join ventas
on libros.libro_id = ventas.libro_id
where ventas.libro_id is null
order by titulo;
