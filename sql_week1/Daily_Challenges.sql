create database ABC_DATA;

use ABC_DATA

create table customers(
customer_id int,
first_name varchar(100),
last_name varchar(100),
email varchar(100)
);

create table products(
product_id int,
product_name varchar(100),
price int
);

create table orders(
order_id int,
customer_id int,
order_date date
);

create table order_items(
order_id int,
product_id int,
quantity int
);

INSERT INTO customers (customer_id, first_name, last_name, email) VALUES
    (1, 'John', 'Doe', 'johndoe@email.com'),
    (2, 'Jane', 'Smith', 'janesmith@email.com'),
    (3, 'Bob', 'Johnson', 'bobjohnson@email.com'),
    (4, 'Alice', 'Brown', 'alicebrown@email.com'),
    (5, 'Charlie', 'Davis', 'charliedavis@email.com'),
    (6, 'Eva', 'Fisher', 'evafisher@email.com'),
    (7, 'George', 'Harris', 'georgeharris@email.com'),
    (8, 'Ivy', 'Jones', 'ivyjones@email.com'),
    (9, 'Kevin', 'Miller', 'kevinmiller@email.com'),
    (10, 'Lily', 'Nelson', 'lilynelson@email.com'),
    (11, 'Oliver', 'Patterson', 'oliverpatterson@email.com'),
    (12, 'Quinn', 'Roberts', 'quinnroberts@email.com'),
    (13, 'Sophia', 'Thomas', 'sophiathomas@email.com');
    
INSERT INTO products (product_id, product_name, price) VALUES
    (1, 'Product A', 10.00),
    (2, 'Product B', 15.00),
    (3, 'Product C', 20.00),
    (4, 'Product D', 25.00),
    (5, 'Product E', 30.00),
    (6, 'Product F', 35.00),
    (7, 'Product G', 40.00),
    (8, 'Product H', 45.00),
    (9, 'Product I', 50.00),
    (10, 'Product J', 55.00),
    (11, 'Product K', 60.00),
    (12, 'Product L', 65.00),
    (13, 'Product M', 70.00);    


INSERT INTO orders (order_id, customer_id, order_date) VALUES
    (1, 1, '2023-05-01'),
    (2, 2, '2023-05-02'),
    (3, 3, '2023-05-03'),
    (4, 1, '2023-05-04'),
    (5, 2, '2023-05-05'),
    (6, 3, '2023-05-06'),
    (7, 4, '2023-05-07'),
    (8, 5, '2023-05-08'),
    (9, 6, '2023-05-09'),
    (10, 7, '2023-05-10'),
    (11, 8, '2023-05-11'),
    (12, 9, '2023-05-12'),
    (13, 10, '2023-05-13'),
    (14, 11, '2023-05-14'),
    (15, 12, '2023-05-15'),
    (16, 13, '2023-05-16');



    INSERT INTO order_items (order_id, product_id, quantity) VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 2, 1),
    (2, 3, 3),
    (3, 1, 1),
    (3, 3, 2),
    (4, 2, 4),
    (4, 3, 1),
    (5, 1, 1),
    (5, 3, 2),
    (6, 2, 3),
    (6, 1, 1),
    (7, 4, 1),
    (7, 5, 2),
    (8, 6, 3),
    (8, 7, 1),
    (9, 8, 2),
    (9, 9, 1),
    (10, 10, 3),
    (10, 11, 2),
    (11, 12, 1),
    (11, 13, 3),
    (12, 4, 2),
    (12, 5, 1),
    (13, 6, 3),
    (13, 7, 2),
    (14, 8, 1),
    (14, 9, 2),
    (15, 10, 3),
    (15, 11, 1),
    (16, 12, 2),
    (16, 13, 3); 
 
#Daily challenge 3
#Which product has the highest price? Only return a single row?

select *
from products
where price = (select max(price) from products);

#Which order_id had the highest number of items in terms of quantity\

select order_id 
from order_items
where quantity = (select max(quantity) from order_items);


#Daily Challenge 4
#Which customer has made the most orders?

select c.customer_id,c.first_name,c.last_name,
count(o.order_id) as total_orders
from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
group by c.customer_id,c.first_name,c.last_name
having count(o.order_id) =  (select max(order_count)
from (select count(order_id) as order_count from orders
group by customer_id)
as sub);


#What’s the total revenue per product?
select p.product_name,sum(quantity*price) as total_revenue
from products p
join order_items oi on p.product_id = oi.product_id
group by p.product_name


#Daily Challenge 5
#Find the first order (by date) for each customer.
select c.customer_id,c.first_name,c.last_name,min(o.order_date)
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id,c.first_name,c.last_name

#Find the day with the highest revenue.
select o.order_date, sum(p.price*oi.quantity) as total_revenue
from orders o
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
group by o.order_date
having total_revenue = (select max(daily_revenue)
from (select sum(p.price*oi.quantity) as daily_revenue
from orders o
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
group by o.order_date)
as sub);












