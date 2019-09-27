-- #1
select distinct rental_duration from film;

-- #2
select max(length),min(length),avg(length) from film where length between 60 and 100;

-- #3
select city from city where city like "G%" or city like "%z%";

-- #4
select count(*) as total_customer from payment;

-- #5
select * from film order by rental_rate desc;
