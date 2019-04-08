-- Salchegger Robert, 11.09.2108
-- 04_join_bank.sql

use bank;

-- cross-join
select *
from person, bankkonto, person_bankkonto;

-- inner join
select *
from 	person inner join person_bankkonto using(per_id)
		inner join bankkonto using(ban_id);
		
-- alternative schreibweise
select *
from	person_bankkonto inner join (person, bankkonto)
		using(per_id, ban_id);
		
-- natural join
select *
from 	person_bankkonto natural join (person, bankkonto);

/*
natural join vergleicht alle Attribute(Attributwerte) mit gleicher Bezeichnung
*/

-- Equi-Join ... Join mit WHERE-Klausel
select *
from 	person, bankkonto, person_bankkonto
where person.per_id = person_bankkonto.per_id
and bankkonto.ban_id = person_bankkonto.ban_id;

/*
Aufgabe: Aliase verwenden (Tabelle und Attribute)
			Person | Kto-Nr
			... Person enthält Vor- und Nachname
			... Kto-Nr ban_nr
			
			sortiert nach Kto-Nr
*/

select concat_ws('  ', per_vn, per_nn) as "Person", ban_nr as "Kto_Nr"
from 	person per, bankkonto bk, person_bankkonto perbk
where per.per_id = perbk.per_id
and bk.ban_id = perbk.ban_id
order by Kto_Nr ASC;

-- ***********************
-- OUTER JOINS
-- ***********************

-- left [outer] join
/*
	a) alle Bannkonto_Nr und falls vorhanden die per_id
	
*/

select 	ban_nr, per_id
from 	bankkonto left outer join person_bankkonto
		on bankkonto.ban_id = 
		person_bankkonto.ban_id;
		
-- right [outer] join
select 	ban_nr, per_id
from 	person_bankkonto right outer join bankkonto
		using(ban_id);
		
/* Aufgabe: nur jene Bankkonto-Nr die noch keiner Person zugeordnet wurden
			ban_id| ban_nr
			left oder right join
*/

select 	ban_id, ban_nr
from 	bankkonto
		left outer join person_bankkonto
		using(ban_id)
where per_id is NULL;

/* Aufgabe: Person | Kto-Nr
			alle Bankkonto_Nr u falls vorhanden auch
			Personen Vor- u. Nachname (in einer Spalte Person), ban_nr in Kto-Nr
*/

select concat_ws('  ', person.per_vn, person.per_nn) as "Person", ban_nr as "Kto-Nr"
from 	bankkonto
		left join person_bankkonto using(ban_id)
		left join person using(per_id);

/* GROUP BY und HAVING */
/*
a) Anzahl der Personen je Bankkonto - ban_id reicht aus
*/
select 	ban_id, count(per_id) as "Anzahl_personen"
from 	person_bankkonto
group by ban_id;

-- Aufgabe: wie a) aber je Kontonummer (ban_nr)
select 	ban_nr, count(per_id) as "Anzahl_personen"
from 	person_bankkonto
		left join bankkonto using(ban_id)
group by ban_nr;

/*
-- wie a) aber nur ban_id ausgeben, wenn mehr als einer Person dem Konto zugeorner ist
*/
select 	ban_id, count(per_id) as "Anzahl_personen"
from 	person_bankkonto
group by ban_id
having count(per_id) > 1;


