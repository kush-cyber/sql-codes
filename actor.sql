select concat(first_name, " ", last_name) as FullName from sakila.actor order by FullName desc;

select length(concat(left(first_name, 1), left(last_name, 1), " ", first_name, " ", last_name)) as FullName,
replace(first_name, 'A', '&') as ReplaceName
from sakila.actor;

select * from sakila.actor
where first_name = 'KENNETH' and (last_name = 'TEMPLE' or actor_id < 100);

select *
from sakila.actor
where first_name in ('KENNETH', 'VIViEN', 'JOE', 'NICK')
and actor_id in(select actor_id from sakila.actor where last_name = "DEGENERES");

-- between
select *
from sakila.actor where first_name between "TOM" and "ZERO";

-- like
select *
from sakila.actor
where first_name like "A%L%";

-- create table
USE sakila;

CREATE TABLE actor_sample(
	actor_id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NULL,
    last_update timestamp NOT NULL DEFAULT current_timestamp
		on update current_timestamp,
	primary key(actor_id)
);

INSERT into actor_sample(first_name, last_name)
values("Latish", "Pavan");

select *
from sakila.actor_sample;

INSERT INTO actor_sample(first_name, last_name)
SELECT first_name, last_name from sakila.actor where actor_id < 100;

UPDATE sakila.actor_sample SET first_name = "LATISH" where actor_id = 2;