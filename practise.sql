use test;

CREATE TABLE table1
(ID INT, Value VARCHAR(20));

INSERT INTO table1(ID, Value)
select 1, 'First'
UNION ALL
select 2, 'Second'
UNION ALL
select 3, 'Third'
UNION ALL
select 4, 'Fourth'
UNION ALL
select 5, 'Fifth';

CREATE TABLE table2
(ID INT, Value VARCHAR(20));

INSERT INTO table2(ID, Value)
select 1, 'First'
UNION ALL
select 2, 'Second'
UNION ALL
select 3, 'Third'
UNION ALL
select 6, 'Sixth'
UNION ALL
select 7, 'Seventh'
UNION ALL
select 8, 'Eighth';

select *
from table1;

select *
from table2;

SELECT t1.*, t2.*
from table1 t1
INNER JOIN table2 t2 ON t1.ID = t2.ID;

SELECT t1.ID AS T1ID, t1.Value AS T1VALUE,
t2.ID AS T2ID, t2.Value AS T2VALUE
FROM table1 t1 LEFT JOIN table2 t2 ON t1.ID = t2.ID;

SELECT t1.ID AS T1ID, t1.Value AS T1VALUE,
t2.ID AS T2ID, t2.Value AS T2VALUE
FROM table1 t1 RIGHT JOIN table2 t2 ON t1.ID = t2.ID;

select t1.*, t2.*
from table1 t1
cross join table2 t2;

Create Table Students
(StudentId INT, StudentName VARCHAR(20));

INSERT into Students
Values (1, 'John'),
(2, 'Matt'),
(3, 'James');

Create table Classes (ClassId INT, ClassName varchar(20));

INSERT into Classes
Values (1, 'Maths'),
(2, 'Arts'),
(3, 'History');

Create table StudentClass(StudentId INT, ClassID INT);

insert into StudentClass
Values (1, 1), (1, 2), (3, 1), (3, 2), (3, 3);

select * from students;

select * from classes;

select * from studentclass;

select st.StudentName, cl.ClassName
from studentclass sc
inner join classes cl on cl.ClassId = sc.ClassID
inner join students st on st.StudentId = sc.StudentId;

select students.StudentName
from students 
left join studentclass on studentclass.StudentId = students.StudentId
left join classes on studentclass.ClassID = classes.ClassId
where className is NULL;

use test;

select t1.ID as T1ID, t1.Value as T1Value,
t2.ID as T2ID, t2.Value as T2Value
From table1 t1
natural left join table2 t2;

select t1.ID as T1ID, t1.Value as T1Value,
t2.ID as T2ID, t2.Value as T2Value
From table1 t1
inner join table2 t2 using (ID, Value);

select * from table1
UNION
select * from table2;

use sakila;

select 	cs.customer_id, cs.first_name, cs.last_name
from customer cs where cs.customer_id in
(
select rt.customer_id 
from rental as rt
where rt.inventory_id in
(
select inv.inventory_id
from inventory as inv
where inv.film_id in
(
select film.film_id
from film
where film.film_id in
(
select fc.film_id
from film_category fc
where fc.category_id in
(
select category_id
from category
where category.name = "Action"
)
)
)
)
) order by cs.customer_id;

-- same with INNER JOIN
select distinct cs.customer_id, cs.first_name, cs.last_name
from customer cs
inner join rental ren on cs.customer_id = ren.customer_id
inner join inventory inv on ren.inventory_id = inv.inventory_id
inner join film fl on inv.film_id = fl.film_id
inner join film_category fc on fl.film_id = fc.film_id
inner join category	on fc.category_id = category.category_id
where category.name = "Action"
order by cs.customer_id;

select fm.title, cat.name, dt.CountofCategory
FROM film fm
inner join film_category fc ON fc.film_id = fm.film_id
inner join category cat on cat.category_id = fc.category_id
inner join
	(   select count(*) as CountofCategory, fc.category_id
		from film_category fc
        group by fc.category_id
    ) dt on dt.category_id = fc.category_id;
    
select avg(amount), cust.first_name, cust.last_name
from payment pt
inner join customer cust on pt.customer_id = cust.customer_id
group by cust.first_name, cust.last_name
order by cust.customer_id;

use test;

select *
from table1 t1
where t1.ID not in (select t2.ID from table2 t2);

select *
from table1 t1
left join table2 t2 on t1.ID = t2.ID
where t2.Value is not null;

insert into table1
values(1, "First first"); 

select char(77, 121, 83, 81, 76);

select adddate(current_date(), interval 45 day);

select rental_date, date_format(rental_date, "%W %M%Y") from sakila.rental;

set @var1 = 12;
set @var2 = 13;

select case when @var1 = 12 then 'one'
			when @var1 = 13 then 'two'
			else 'more'
            end
            as result;

select if(year(rental_date) = 2005, 'yes', 'no') as IS2005 from sakila.rental;

select *, IFNULL(t2.Value, "NULL")
from table1 t1 left join table2 t2 on t1.ID = t2.ID;

use sakila;

select count(*) NoRentals, customer_id
from rental
group by customer_id;

select max(rental_date) LastRentalDate, customer_id
from rental
group by customer_id;

select avg(amount), sum(amount), customer_id
from payment
group by customer_id;
  