-- Salchegger Robert, 11.09.2108
-- Übung MySQL
-- 02_create_bank.sql
-- DB löschen(damit das script immer ohne Warnung etc. ausgeführt werden kann)

drop database if exists bank;

-- DB erstellen
create database bank;

-- alle DBen anzeigen
show databases;

-- DB wählen (zum Arbeiten)
use bank;

-- Tabelle person erstellen
create table person(per_id int primary key auto_increment,
	per_nn varchar(45) not null,
	per_vn varchar(45)
);

-- erstellne Sie die Tabele bankkonto (ban_id PK AI, ban_nr int Pflichtfeld)
create table bankkonto(ban_id int primary key auto_increment,
	ban_nr int not null
);

-- Tabellen anzeigen
show tables;

show create table bankkonto;

/*
| bankkonto | CREATE TABLE `bankkonto` (
  `ban_id` int(11) NOT NULL AUTO_INCREME
  `ban_nr` int(11) NOT NULL,
  PRIMARY KEY (`ban_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 |
*/


-- Zwischentabelle erstellen

create table person_bankkonto(
	per_id int not null,
	ban_id int not null,
	foreign key (per_id) references person (per_id) on update cascade
	on delete cascade,
	foreign key (ban_id) references bankkonto(ban_id) on update cascade
	on delete cascade
);

-- CONSTRAINT `person_bankkonto_ibfk_1`
show tables;
show create table person_bankkonto;

-- DS einfügen
insert into person values(null, 'Huber', 'Franz'),
(null, 'Schmidt', 'Karl');

-- alle Attribute und DS anzeigen(einer bestimmten Tabelle)
select *
from person;

-- nur bestimmte Attribute einfügen...
insert into person (per_nn) values ('Baum');

select * from person;

insert into bankkonto(ban_nr) values(4711), (8989), (7476);
insert into person_bankkonto values (1, 2), (2,2), (3,1);
select * from bankkonto;
select * from person_bankkonto;





