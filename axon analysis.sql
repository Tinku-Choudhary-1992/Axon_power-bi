use classicmodels;

--  the above is the database created for this capstone project --
-- below are the tables that are included in the classicmodels database --
  
select * from customers;
select * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
select * from payments;
select * from productlines;
select * from products;


-- the below query gives the analysis of the customers based on the country --

select * from customers;

select country,count(*) from customers group by country order by count(*) desc;


select * from employees;

select jobtitle,count(*) from employees group by jobtitle;

-- the above query gives the information about the employees ane their respective job roles in the 
-- organisation --

select * from orders;

with cte as
(select * from orders where status="shipped")

select * from cte where year(orderdate)='2003';

-- the above query gives the information about the customers whose orders were shipped in year 2003--
-- similarly we can find out the orders for other years also using cte thst is the 
-- common table expressions -- 

select count(ordernumber) from orders;

-- the above query provides the information about the total number of orders placed by the 
-- customers --


select c.customernumber,o.ordernumber,count(*) over(partition  by customernumber) as no_of_orders
from customers c join orders o on c.customernumber=o.customernumber
group by c.customernumber,o.ordernumber order by no_of_orders desc;

-- in the above query window function have been used to analyse the total orders 
-- placed by each customer-- 

select customernumber,count(*) as number_of_orders from orders group by customernumber order by count(*)desc;

-- the above query also defines the same aspects as that of the previous query,the only difference is that 
-- window function is not used here --

select count(*) from products;

-- the above query provides the information about the total number of products available -- 



