create database sales_case_study;
use sales_case_study;

select count(*) from customers; 
select count(*) from orders; 
select count(*) from products; 

select * from customers limit 5;
select * from orders limit 5;
select * from products limit 5;

# CUSTOMERS INSIGHTS

-- Total number of customers
select count(*) as total_customers
from customers;

-- City-wise customer distribution
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city
ORDER BY customer_count DESC;

-- New customers added per month
select DATE_FORMAT(signup_date, '%y-%m') as month,
       COUNT(*) as new_customers
from customers
group by month
order by month;

-- Top 10 cities by customer count
select city,count(*) as cnt
from customers
group by city
order by cnt desc
limit 10;

-- Oldest customers by signup date
select * 
from customers
order by signup_date
limit 1;


# PRODUCT INSIGHTS

-- Ctegory-wise product count
select category, count(*) as product_count
from products
group by category;

-- Top 10  highest priced products
select *
from products
order by price desc
limit 10;

-- Average price per category
select category, avg (price) as avg_price
from products
group by category;

-- Cheapest product in each category
select *
from (
   select *,
          row_number() over(partition by category order by price asc) as rn
	from products
) t
where rn=1;

-- products never ordered
select p.*
from products p 
left join orders o using (product_id)
where o.product_id is null;

# SALES INSIGHTS (ORDES)

-- Revenue by category
select p.category,
       sum(o.quantity * p.price) as revenue
from orders o
join products p using (product_id)
group by p.category
order by revenue DESC;

-- Monthly revenue trend
select date_format(order_date, '%Y-%m') as month,
       sum(o.quantity * p.price) as revenue
from orders o
join products p using (product_id)
group by month
order by month;

-- Top 10 best selling products(by quantity)
select
	   p.product_name,
       sum(o.quantity) as total_qty
from orders o
join products p using (product_id)
group by p.product_name
order by total_qty desc
limit 10;

-- highest revenue generation products
select any_value (p.product_name) as product_name,
       sum(o.quantity * p.price) as revenue
from orders o
join products p using (product_id)
group by p.product_id
order by revenue desc
limit 10;

-- customer who generated highest revenue
select c.customer_id,
       sum(o.quantity * p.price) as revenue
from orders o
join customers c using(customer_id)
join products p using(product_id)
group by c.customer_id
order by revenue desc
limit 1;

-- repeat customers (>1 order)
select customer_id, count(*) as order_count
from orders
group by customer_id
Having order_count >1;

-- Average order values
select avg(o.quantity * p.price) as avg_order_value
from orders o
join products p using (product_id);

-- Orders by city
select c.city, count(*) as total_orders
from orders o
join customers c using(customer_id)
group by c.city
order by total_orders desc;

-- Revenue by city
select c.city,
       sum(o.quantity * p.price) as revenue
from orders o
join customers c using(customer_id)
join products p using (product_id)
group by c.city
Order by revenue desc;

# WINDOW FUNCTIONS

-- Rank products by total revenue
select p.product_id,
       sum(o.quantity * p.price) as revenue,
       rank() over(order by sum(o.quantity * p.price)desc) as revenue_rank
from orders o
join products p using(product_id)
group by p.product_id;

-- Running total of monthly revenue
select month,
       revenue,
       sum(revenue) over (order by month) as running_total
from(
   select date_format(order_date, '%y-%m') as month,
		 sum(o.quantity * p.price)as revenue
   from orders o
   join products p using(product_id)
   group by month
) t;

-- Rank customers by number of orders
select customer_id,
       count(*) as order_count,
       rank() over(order by count(*) desc) as order_rank
from orders
group by customer_id;

-- Cumulative customer signups
select signup_date,
       count(*) as daily_signups,
       sum(count(*)) over(order by signup_date) as cumulative_customers
from customers
Group by signup_date;

-- revenue percentage contribution per category
select category,
       revenue,
       round((revenue/sum(revenue)over())*100, 2) as pct_contribution
from(
    select p.category,
           sum(o.quantity * p.price) as revenue
	from orders o
    join products p using(product_id)
    group by p.category
) t;







