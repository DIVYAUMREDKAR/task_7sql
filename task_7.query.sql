select * from customer

select *from product 

select * from sales

-- 1) create a report of all state sales, quantity, discount , profit  with following aggregation ,
-- (sum , avg, min , max, count)  

select c.state,count(s.sales) as "count_sales" ,avg(s.sales)as "avg_sales" ,sum(s.quantity) as "sum_quantity",avg(s.discount)as "avg_discount",min (discount) as "min_discount",max(s.profit)as "max_profit"
from customer as c inner join sales as s on c.customer_id=s.customer_id
group by c.state

	
--2) get data of all state and city's avg customer age     
--(state,city ,age)
--(age average)
	
select city,state,avg(age) as "avg_age" from customer  group by city,state 

	
-- 3) get data of 2017 to 2018  with product name and sales per quantity   
--(product name,sales ,quantity,order_date(2017 -2018))
  
select product_name, min(s.sales)/max(s.quantity) as "sales_quantity" from product as P inner join sales as S
on p.product_id=s.product_id
where order_date between '01-01-2017' and  '31-12-2018'
group by product_name

	
-- 4)create 4 question on your data like above and solve 
select * from customer
select * from sales
select * from product	

---(retrieve all orders placed by customers along with customer)
select distinct s.order_id,c.customer_name,c.age,c.country,c.city,c.state,c.postal_code,c.region
from sales as s
inner join customer as c
on s.order_id = s.order_id

---(list all products purchased by a customer along with the order)
select p.category,s.order_id,s.order_date,s.quantity from sales as s
inner join customer as c
on c.customer_id = s.customer_id
inner join product as p
on p.product_id = s.product_id


