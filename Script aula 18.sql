select a.first_name, a.last_name from film f
inner join film_actor fa 
on fa.film_id = f.film_id
inner join actor a
on fa.actor_id = a.actor_id
where f.film_id = 561;