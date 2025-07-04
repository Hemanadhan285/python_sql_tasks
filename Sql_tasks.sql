create database market; 
use market;

-- 1. Customer Purchase Summary
-- From orders: show number of orders, total spend, and average order value per customer. Sort by highest total spend.
select customer_id, count(order_id) as number_of_orders, sum(amount) as total_spend, avg(amount) as avaerage_order_value  
from orders group by customer_id order by total_spend desc;

-- 2. Top Products by Revenue
-- Join sales and products, calculate total_revenue, and list top 3 products overall (not per category).
select p.product_name,sum(s.price_per_unit * s.units_sold) as total_revenue
from sales s
join product p on s.product_id = p.product_id 
group by
p.product_name
order by
total_revenue desc limit 3;

-- 3. Frequent Customers
-- From orders, identify customers who placed 5 or more orders in total.
-- Show: customer_id, number_of_orders, and total_spend.
select customer_id, count(order_id) as number_of_orders, sum(amount) as total_spend from orders
group by customer_id
having count(customer_id) >= 5
order by 
number_of_orders desc;
