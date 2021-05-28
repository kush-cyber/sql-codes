create view first_view
AS
select distinct cs.customer_id, cs.first_name, cs.last_name
from customer cs
inner join rental ren on cs.customer_id = ren.customer_id
inner join inventory inv on ren.inventory_id = inv.inventory_id
inner join film fl on inv.film_id = fl.film_id
inner join film_category fc on fl.film_id = fc.film_id
inner join category	on fc.category_id = category.category_id
where category.name = "Action"
order by cs.customer_id;

select * from first_view;
