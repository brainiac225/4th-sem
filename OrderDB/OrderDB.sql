create table salesman(salesman_id number (4), name varchar2 (20), city varchar2 (20), commission varchar2 (20), primary key (salesman_id));

create table customer(customer_id number (4), cust_name varchar2 (20), city varchar2 (20), grade number (3), primary key (customer_id), salesman_id references salesman (salesman_id) on delete set null);

create table orders(ord_no number (5), purchase_amt number (10, 2), ord_date date, primary key (ord_no), customer_id references customer (customer_id) on delete cascade, salesman_id references salesman (salesman_id) on delete cascade);

insert into salesman values (1000, 'John','Bangalore','25 %'); 
insert into salesman values (2000, 'Ravi','BBangalore','20 %'); 
insert into salesman values (3000, 'Kumar','Mysore','15 %'); 
insert into salesman values (4000, 'Smith','Delhi','30 %'); 
insert into salesman values (5000, 'Harsha','Hydrabad','15 %'); 
select * from salesman;

insert into customer values (10, 'Preethi','Bangalore', 100, 1000); 
insert into customer values (11, 'Vivek','Mangalore', 300, 1000); 
insert into customer values (12, 'Bhaskar','Chennai', 400, 2000); 
insert into customer values (13, 'Chethan','Bangalore', 200, 2000); 
insert into customer values (14, 'Mamatha','Bangalore', 400, 3000); 
select * from customer;


insert into orders values (50, 5000, '04-may-17', 10, 1000); 
insert into orders values (51, 450, '20-jan-17', 10, 2000);
insert into orders values (52, 1000, '24-feb-17', 13, 2000); 
insert into orders values (53, 3500, '13-apr-17', 14, 3000); 
insert into orders values (54, 550, '09-mar-17', 12, 2000);
select * from orders;

/*1. Count the customers with grades above Bangalore’s average.*/
select grade, count (distinct customer_id) from customer group by grade having grade > (select avg(grade) from customer where city='Bangalore');

/*2. Find the name and numbers of all salesmen who had more than one customer.*/
select salesman_id, name from salesman a where 1 < (select count (*) from customer where salesman_id=a.salesman_id);

/*3. List all salesmen and indicate those who have and don’t have customers in their cities (Use UNION operation.)*/
select salesman.salesman_id, name, cust_name, commission from salesman, customer where salesman.city = customer.city union 
select salesman_id, name, 'no match', commission 
from salesman 
where not city = any 
(select city 
from customer) 
order by 2 desc;

/*4. Create a view that finds the salesman who has the customer with the highest order of a day.*/
create view elitsalesman as 
select b.ord_date, a.salesman_id, a.name 
from salesman a, orders b
where a.salesman_id = b.salesman_id 
and b.purchase_amt=(select max (purchase_amt) 
from orders c 
where c.ord_date = b.ord_date);

select * from elitsalesman;

/*5. Demonstrate the DELETE operation by removing salesman with id 1000. All his orders must also be deleted.*/
delete from salesman where salesman_id=1000;

select * from salesman;

