use classicmodels;

select * from customers;

select customerNumber as Number,city as City from customers;

select * from customers
where customerName LIKE "Mini%"

select * from customers
where customerName LIKE "%Ltd"

select * from customers
where customerName LIKE "%nad%"

select * from customers
where customerName LIKE "c%d"

select * from customers
where city like "M____d";

select * from customers
where city like binary "%V%"


# aggregations max(),min(),

select * from payments;
select sum(amount) as Total from payments;

select * from payments;
select count(*) as total_payments, sum(amount) as Total,avg(amount) as average_payments from payments;

# string functions

select * from customers;
#concat, lower,upper
select distinct status from orders;

select *,
	case
		when status = "Shipped" then "Order Completed"
        when status = "Resolved" then "Order Completed"
        else "Order Pending"
        end as OrderStatus
from orders;

#Joins; inner,outer,left,right
#table aliasing


select customers.customerName,customers.phone,orders.OrderDate,orders.status
from customers
inner join
orders on customers.customerNumber = orders.customerNumber;
























































