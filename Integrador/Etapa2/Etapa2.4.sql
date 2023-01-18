-- Etapa 2.4

-- 1)
/*
De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés nacidos de madres 
extranjeras. Mostrar todos los campos de la 
tabla en el resultado de la consulta.
*/
select * from nacimientos
where NACIONALIDAD = 'extranjera'; 

-- 2)
/*
De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés nacidos de madres 
menores de edad. Mostrar todos los campos 
de la tabla en el resultado de la consulta y 
ordenar el resultado de menor a mayor por 
la edad de las madres.
*/
select * from nacimientos
where EDAD_MADRE < 18
order by EDAD_MADRE asc;

-- 3)
/*
De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés nacidos de madres 
que tengan la misma edad que el padre. 
Mostrar todos los campos de la tabla en 
el resultado de la consulta.
*/
select * from nacimientos
where EDAD_MADRE = EDAD_PADRE;

-- 4)
/*
De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés nacidos de madres 
que, con respecto al padre, tengan 40 años o 
menos que el padre.
*/
select * from nacimientos
where EDAD_MADRE <= EDAD_PADRE - 40;

-- 5)
/*
De la tabla CLIENTES_NEPTUNO, obtener 
una lista de todos aquellos clientes que 
residen en Argentina. Mostrar todos los 
campos de la tabla en el resultado de la 
consulta.
*/
select * from clientes_neptuno
where Pais = 'argentina';

-- 6)
/*
De la tabla CLIENTES_NEPTUNO, obtener 
una lista de todos los clientes, con excepción 
de los que residen en Argentina. Mostrar 
todos los campos de la tabla en el resultado 
de la consulta y ordenar alfabéticamente 
dicho resultado por los nombres de los países.
*/
select * from clientes_neptuno
where Pais != 'argentina'
order by Pais;

-- 7)
/*
De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés que nacieron con 
menos de 20 semanas de gestación. Mostrar 
todos los campos de la tabla en el resultado 
de la consulta y ordenar dicho resultado de 
mayor a menor, por los valores de la columna 
SEMANAS.
*/
select * from nacimientos
where semanas < 20 
order by semanas desc;

-- 8)
/*
De la tabla NACIMIENTOS, obtener una lista 
de todos los bebés de sexo femenino, 
nacidos de madres extranjeras solteras, de 
más de 40 años. Mostrar todos los campos
de la tabla en el resultado de la consulta.
*/
select * from nacimientos
where sexo = 'femenino' and  NACIONALIDAD = 'Extranjera' and ESTADO_CIVIL_MADRE = 'Soltera' and EDAD_MADRE > 40;

-- 9)
/*
De la tabla CLIENTES_NEPTUNO, obtener 
una lista de todos aquellos clientes que 
residan en países sudamericanos. 
Los países sudamericanos que figuran en esta 
tabla son Argentina, Brasil y Venezuela
Mostrar todos los campos de la tabla en el 
resultado de la consulta y ordenar de manera 
alfabética los registros, por los nombres de 
los países y las ciudades.
*/
select * from clientes_neptuno
where pais in ('Argentina', 'Brasil', 'Venezuela')
order by pais, ciudad;

-- 10)
/*
De la tabla NACIMIENTOS, obtener una lista 
de todos aquellos bebés que hayan nacido 
con una cantidad de semanas de gestación 
de entre 20 y 25 semanas, inclusive. Mostrar 
todos los campos de la tabla en el resultado 
de la consulta y ordenar el resultado según 
las semanas de gestación de los recién 
nacidos, de menor a mayor.
*/
select * from nacimientos
where semanas between 20 and 25
order by semanas asc;

-- 11)
/*
De la tabla NACIMIENTOS, utilizar el operador IN y obtener una lista de todos los bebés 
que nacieron en las comunas 1101, 3201, 
5605, 8108, 9204, 13120 y 15202. Mostrar 
todos los campos de la tabla en el resultado 
de la consulta y ordenar de menor a mayor
los registros, por los números de comuna
*/
select * from nacimientos
where comuna in (1101, 3201, 5605, 8108, 9204, 13120, 15202)
order by comuna asc;

-- 12)
/*
 De la tabla CLIENTES_NEPTUNO, obtener una lista de 
todos aquellos clientes cuyo ID comience con la letra 
C. Mostrar todos los campos de la tabla, en el 
resultado de la consulta.
*/
select * from clientes_neptuno
where IDCliente like('C%');

-- 13)
/*
De la tabla CLIENTES_NEPTUNO, obtener una lista de 
todos aquellos clientes que residan en una ciudad que 
comience con la letra B y en total posea 5 caracteres. 
Mostrar todos los campos de la tabla en el resultado 
de la consulta
*/
select * from clientes_neptuno
where Ciudad like('B%') and char_length(Ciudad) = 5;

-- 14)
/*
De la tabla NACIMIENTOS, obtener una lista de todos 
aquellos padres que tengan más de 10 hijos
*/
select * from nacimientos
where hijos_total > 10 and sexo = 'masculino';