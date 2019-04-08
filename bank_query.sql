-- Salchegger Robert, 11.09.2108
-- 03_query_bank.sql

use bank;
-- select-Statements

-- alle DS u. Attribute ausgeben

select *
from person;

-- nur bestimmte Attribute
select per_nn, per_vn
from person;

-- Alias für Spalte/Attribute
select per_nn as "Nachname", 
	   per_vn as "Vorname"
from person;

/*
+---------+--------+
| per_nn  | per_vn |
+---------+--------+
| Huber   | Franz  |
| Schmidt | Karl   |
| Baum    | NULL   |
+---------+--------+
3 rows in set (0.00 sec

+----------+---------+
| Nachname | Vorname |
+----------+---------+
| Huber    | Franz   |
| Schmidt  | Karl    |
| Baum     | NULL    |
+----------+---------+
*/

-- Alias für Tabelle
select p.per_nn AS "Nachname"
from   person p;

-- where-Klausel -- nur bestimmte Datensätze
select *
from person
where per_vn is not null;

-- die Person mit PK 1 ausgeben
select *
from person
where per_id = 1;

-- Person deren Nachname mit s beginnt
select *
from person
where per_nn like 'S%';
-- % Platzhalter für eine beliebige Anzahl alphanumerischer Zeichen
-- _ Platzhalter für ein beliebiges alphanumerisches Zeichen
-- like berücksichtigt keine Groß/Kleinschreibung
 
-- alle Personen mit e im Wortverlauf (Nachname)
select *
from person
where per_nn like '%e%';

-- alle Personen mit r an zweiter Stelle im Vornamen
select *
from person
where per_vn like '_r%';

-- Übung
/*
a) alle Personen deren Vorname auf l endet
b) nur die Nachnamen jener Personen, deren Vorname an vorletzter Stelle ain a hat
*/

select *
from person
where per_vn like '%l';

select per_nn
from person
where per_vn like '%a_';

-- Aufgabe: alle Personen deren Nach- oder Vorname ein a enthält

select *
from person
where per_nn like '%a%' or per_vn like '%a%';

-- Aufgabe: alle Personen deren Vorname ein a und Nachname ein u enthält

select *
from person
where per_nn like '%u%' and per_vn like '%a%';

-- Aufgabe: alle Personen deren Nachname kein u enthält
select *
from person
where per_nn not like '%u%';

-- Ergänzung: DB Namen der Tabelle voranstellen
select *
from bank.person;

-- MQSQL Funktionen
select count(*)
from person;

/* Aufgabe: verwenden sie Alias, geben sie die Anzahl der Personen
			mit Anfangsbuchstaben s im Familiennamen ausgeben
			Anzahl mit S
*/
select count(*) as "Anzahl mit S"
from person
where per_nn like 's%';

-- Summe der PKs in person
select sum(per_id) as "Summe"
from person;

-- Zwei Attribute in einer Spalte ausgeben
-- Vor- und Nachname in Spalte "Person " ausgeben
select concat_ws('  ', per_vn, per_nn) as "Person"
from person;

-- oder (theoretisch)
select concat(per_id, '  ', per_nn) as "Name"
from person;

-- LIMIT
-- beginend bei einem bestimmten DS (z.B. 3DS) eine
-- bestimmte Anzahl von DSen ausgeben
select *
from person
limit 0,1;

-- Sortieren von DS
-- Personen nach Namen aufsteigend sortiert ausgeben
select *
from person
order by per_nn ASC; -- ASC default

-- absteigend
select *
from person
order by per_nn DESC;

-- ********************************************
-- tabellenstruktur ausgeben
describe person;
-- oder describe
desc bankkonto;
desc person_bankkonto;






