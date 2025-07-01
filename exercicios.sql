 --1 quantos filmes há em português?

select count(*) from film f
inner join "language" l 
on l.language_id = f.language_id
where l."name" = 'Português';

--2 quantos clientes alugaram o filme de id=7?

select count(*) from customer c
inner join "rental" r
on c.customer_id = r.customer_id
inner join inventory i 
on r.inventory_id = i.inventory_id
inner join film f
on i.film_id = f.film_id
where f.film_id = 7;

--3 quantos alugueis foram feitos no total?

select count(*) as "quantos aluguéis foram feitos" from rental r;

--4 qual foi o custo do filme de id = 600

select f.title as "titulo do filme", replacement_cost as "custo de reabastecimento" from film f
where f.film_id = 600;

--5 qual funcionario alugou mais filmes

select 
	s.first_name,
	s.last_name,
	count(r.rental_id) as "quantidade de filmes aluguados"
from
	staff s
inner join rental r on
	s.staff_id = r.staff_id
group by 
	s.first_name,
	s.last_name
order by 
	count(r.rental_id)
limit 1;

--6 quantos funcionarios tem em cada loja?

select a.address,count(*)
from staff sta
inner join store sto on sta.store_id = sto.store_id;

--7 liste as seguintes colunas: titulo do filme, idioma, custo, data do ultimo aluguel, funcionario que alugou, loja do aluguel e preço do aluguel 

select
	f.title as "titulo do filme",
	l."name" as "idioma",
	f.replacement_cost as "custo de reposição",
	r.rental_date as "data do aluguel",
	c.first_name as "nome do cliente",
	s.first_name as "nome do funcionario",
	s2.store_id as "id da loja",
	f.rental_rate as "valor do aluguel"
from
	film f
inner join "language" l 
	on
	l.language_id = f.language_id
inner join inventory i 
	on
	i.film_id = f.film_id
inner join rental r 
	on
	r.inventory_id = i.inventory_id
inner join customer c 
	on
	c.customer_id = r.customer_id
inner join staff s 
	on

--8 quantos atores que participaram do filme de id = 1?
select
	count(*) as "quantos atores"
from
	film_actor fa
where
	fa.film_id = 1;
	
--9 qual loja possui mais inventarios
	
select
	s.store_id as "id da loja",
	count(i.inventory_id)
from
	store s
inner join staff s2 
on
	s2.store_id = s.store_id
inner join rental r 
on
	r.staff_id = s2.staff_id
inner join inventory i 
on
	i.inventory_id = r.inventory_id
group by 
	s.store_id
order by
	count(i.inventory_id) desc
limit 1;