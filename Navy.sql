drop database if exists pacific_navy;
create database pacific_navy;
use pacific_navy;

# CURRENTLY DONE

create table ship (
	id_ship int primary key auto_increment not null,
	shipyard int,
	nation int,
	class int,
	name varchar (50),
	comissioned datetime,
	decomissioned datetime,
	status varchar (50)
);

# CURRENTLY DONE

create table class (
	id_class int primary key auto_increment not null,
	nation int,
	type varchar (50),
	displacement_tons decimal (10,1),
	length_meters decimal (10,1),
	beam_meters decimal (10,1),
	draught_meters decimal (10,1),
	power_hp decimal (10,1),
	speed_knots decimal (10,1),
	range_nmi decimal (10,1),
	aircraft int
);

create table shipyard (
	id_shipyard int primary key auto_increment not null,
	nation int
);

create table nation (
	id_nation int primary key auto_increment not null
);



create table ship_operation (
	id_ship_operation int primary key auto_increment not null,
	ship int,
	operation int
);

create table operation (
	id_operation int primary key auto_increment not null,
	battle int
);

create table battle (
	id_battle int primary key auto_increment not null
);

create table ship_battle (
	id_ship_battle int primary key auto_increment not null,
	ship int,
	battle int
);

alter table ship add foreign key (shipyard) references shipyard (id_shipyard);
alter table ship add foreign key (nation) references nation (id_nation);
alter table ship add foreign key (class) references class (id_class);
alter table ship_operation add foreign key (ship) references ship (id_ship);
alter table ship_operation add foreign key (operation) references operation (id_operation);
alter table operation add foreign key (battle) references battle (id_battle);
alter table ship_battle add foreign key (ship) references ship (id_ship);
alter table ship_battle add foreign key (battle) references battle (id_battle);
alter table class add foreign key (nation) references nation (id_nation);
alter table shipyard add foreign key (nation) references nation (id_nation);