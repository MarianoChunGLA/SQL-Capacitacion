select numero_alquiler from prestamos
where numero_alquiler between 3 and 6;

select codigo_amigo from amigos
where codigo_amigo not between 2 and 5;

select titulo from peliculas
where titulo like ('%to%');

insert into amigos (nombre, apellido, telefono, direccion)
values ('Marina', 'Fernandez', 45128956, 'Parana 555'),
('Lujan', 'Tucci', 1137589612, 'Lavalle 1100'),
('Gabriel', 'Dominguez', 41109956, 'Carlos Calvo 100'),
('Raul', 'Vazquez', 45120014, 'Peru 1120'),
('Martina', 'Perez', 113203044, 'Uruguay 220');

update amigos
set nombre = 'Lorena', apellido = 'Milone'
where codigo_amigo = 12;

create table auxiliar (
codigo_amigo int primary key auto_increment,
nombre varchar(20),
apellido varchar(20),
telefono int,
direccion varchar(30));

insert into auxiliar (codigo_amigo, nombre, apellido, telefono, direccion)
select codigo_amigo, nombre, apellido, telefono, direccion from amigos;

truncate table auxiliar;

drop table auxiliar;

select count(nombre) as 'Cantidad de Nombres' from amigos;

select max(ano) as 'Año Maximo', min(ano) as 'Año Minimo' from peliculas;





