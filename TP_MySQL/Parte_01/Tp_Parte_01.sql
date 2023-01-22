use videoclub;

create table pelicula (
codigo_pelicula int not null auto_increment primary key,
titulo varchar(30) not null,
ano int not null,
duracion int);

create table amigo (
codigo_amigo int not null auto_increment primary key,
nombre varchar(20) not null,
apellido varchar(20) not null,
telefono int not null,
direccion varchar(30) not null);

insert into pelicula (codigo_pelicula, titulo, ano, duracion)
values (1, 'Port of Call (Hamnstad)', 1977, 186),
(2, 'Off the Black', 1993, 232),
(3, 'Killing of Sister George', 2005, 102),
(4, 'Empire State', 2004, 151),
(5, 'Patrik Age 1.5 (Patrik 1,5)', 2002, 145),
(6, 'Human Lanterns', 2002, 186),
(7, 'Shadow of the Vampire', 1996, 106),
(8, 'The Cyclone', 1995, 136),
(9, '1984', 2000, 195),
(12, 'Notting Hill', 1994, 139);

insert into amigo (codigo_amigo, nombre, apellido, telefono, direccion)
values (1, 'Shandy', 'Cheers', 64906443, '342 Bonner Lane'),
(2, 'Bert', 'Cardno', 65435135, '86478 Twin Pines Plaza'),
(3, 'Petunia', 'Cowherd', 31584387, '9925 Sauthoff Terrace'),
(4, 'Suzann', 'McOrkill', 39489803, '3 Talisman Parkway'),
(5, 'Karyn', 'Sydall', 88997114, '3 Hazelcrest Drive'),
(6, 'Sharron', 'Capeling', 60443903, '42 Pepper Wood Terrace'),
(7, 'Devinne', 'Rushmare', 24195388, '128 Magdeline Parkway'),
(8, 'Bondie', 'Braunfeld', 13012306, '206 Fuller Way'),
(9, 'Glen', 'Clarkin', 32514107, '07035 Vidon Circle'),
(10, 'Aube', 'Bramwich', 40792415, '25 Linden Street');

update pelicula
set titulo = 'duro de matar'
where codigo_pelicula = 3;

delete from pelicula
where codigo_pelicula = 6;

delete from pelicula
where codigo_pelicula = 7;

delete from pelicula
where codigo_pelicula = 8;

rename table amigo to amigos;

rename table pelicula to peliculas;

rename table prestamo to prestamos;

select * from prestamos;

select distinct nombre from amigos;

select titulo, duracion from peliculas;