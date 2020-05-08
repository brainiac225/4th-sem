create table flights (flno int, from_at varchar(20) not null, to_at varchar(20) not null, distance int, departs timestamp, arrives timestamp, price int, primary key(flno));

create table aircraft (aid integer primary key, aname varchar(10), cruisingrange integer);

create table employees (eid integer primary key, ename varchar(15), salary number(10,2));

create table certified (eid integer not null, aid integer not null, primary key (eid, aid), foreign key (eid) references employees (eid), foreign key (aid) references aircraft (aid));

insert into aircraft values('101','747','3000');
insert into aircraft values('102','Boeing','900');
insert into aircraft values('103','647','800');
insert into aircraft values('104','Dreamliner','10000');
insert into aircraft values('105','Boeing','3500');
insert into aircraft values('106','707','1500');
insert into aircraft values('107','Dream','120000');
select * from aircraft;

insert into employees values('701','A','50000');
insert into employees values('702','B','100000');
insert into employees values('703','C','150000');
insert into employees values('704','D','90000');
insert into employees values('705','E','40000');
insert into employees values('706','F','60000');
insert into employees values('707','G','90000');
select * from employees;


insert into certified values(701,101);
insert into certified values(701,102);
insert into certified values(701,106);
insert into certified values(701,105);
insert into certified values(702,104);
insert into certified values(703,104);
insert into certified values(704,104);
insert into certified values(702,107);
insert into certified values(703,107);
insert into certified values(704,107);
insert into certified values(702,101);
insert into certified values(703,105);
insert into certified values(704,105);
insert into certified values(705,103);
select * from certified;

alter session set nls_timestamp_format = 'RR/MM/DD HH24:MI:SSXFF';

alter session set nls_date_language ='ENGLISH';


insert into flights values(101,'Bangalore','Delhi',2500,TIMESTAMP '2005-05-13 07:15:31',TIMESTAMP '2005-05-13 17:15:31',5000);
insert into flights values(102,'Bangalore','Lucknow',3000,TIMESTAMP '2005-05-13 07:15:31',TIMESTAMP '2005-05-13 11:15:31',6000);
insert into flights values(103,'Lucknow','Delhi',500,TIMESTAMP '2005-05-13 12:15:31',TIMESTAMP ' 2005-05-13 17:15:31',3000);
insert into flights values(107,'Bangalore','Frankfurt',8000,TIMESTAMP '2005-05-13  07:15:31',TIMESTAMP '2005-05-13 22:15:31',60000);
insert into flights values(104,'Bangalore','Frankfurt',8500,TIMESTAMP '2005-05-13 07:15:31',TIMESTAMP '2005-05-13 23:15:31',75000);
insert into flights values(105,'Kolkata','Delhi',3400,TIMESTAMP '2005-05-13 07:15:31',TIMESTAMP  '2005-05-13 09:15:31',7000);
select * from flights;

/*Find the names of aircraft such that all pilots certified to operate them have salaries more than Rs.80,000.*/
select distinct a.aname from aircraft a where a.aid in (select c.aid from certified c, employees e where c.eid = e.eid and not exists (select*from employees e1 where e1.eid = e.eid and e1.salary <'80000'));

/*For each pilot who is certified for more than three aircrafts, find the eid and the maximum cruising range of the aircraft for which she or he is certified.*/
select c.eid, max (a.cruisingrange) from certified c, aircraft a where c.aid = a.aid group by c.eid having count (*) > 3; 

/*Find the names of pilots whose salary is less than the price of the cheapest route from Bangalore to Frankfurt.*/
select distinct e.ename from employees e where e.salary <( select min(f.price) from flights f where f.from_at = 'Bangalore' and f.to_at = 'Frankfurt');

/*For all aircraft with cruising range over 1000 Kms, find the name of the aircraft and the average salary of all pilots certified for this aircraft.*/
select temp.name, temp.avgsalary from ( select a.aid, a.aname as name, avg (e.salary) as avgsalary from aircraft a, certified c, employees e where a.aid = c.aid and c.eid = e.eid and a.cruisingrange > '1000' group by a.aid, a.aname )  temp; 

/*Find the names of pilots certified for some Boeing aircraft.*/
select distinct e.ename from employees e, certified c, aircraft a where e.eid = c.eid and c.aid = a.aid and a.aname like 'Boeing%'; 

/*Find the aids of all aircraft that can be used on routes from Bangalore to Frankfurt.*/
select a.aid from aircraft a where a.cruisingrange >( select min (f.distance) from flights f where f.from_at = 'Bangalore' and f.to_at = 'Frankfurt' );

/*A customer wants to travel from Bangalore to Delhi  with no more than two changes of flight. List the choice of departure times from Bangalore if the customer wants to arrive in Delhi  by 6 p.m.*/
SELECT F.departs
FROM Flights F
WHERE F.flno IN ( ( SELECT F0.flno
 FROM Flights F0
 WHERE F0.from_at = 'Bangalore' AND F0.to_at = 'Delhi'
 AND extract(hour from F0.arrives) < 18 )
 UNION
( SELECT F0.flno
 FROM Flights F0, Flights F1
 WHERE F0.from_at = 'Bangalore' AND F0.to_at <> 'Delhi'
 AND F0.to_at = F1.from_at AND F1.to_at = 'Delhi'
 AND F1.departs > F0.arrives
 AND extract(hour from F1.arrives) < 18)
 UNION
( SELECT F0.flno
 FROM Flights F0, Flights F1, Flights F2
 WHERE F0.from_at = 'Bangalore'
 AND F0.to_at = F1.from_at
 AND F1.to_at = F2.from_at
 AND F2.to_at = 'Delhi'
 AND F0.to_at <> 'Delhi'
 AND F1.to_at <> 'Delhi'
 AND F1.departs > F0.arrives
 AND F2.departs > F1.arrives
 AND extract(hour from F2.arrives) < 18));

/*Print the name and salary of every non-pilot whose salary is more than the average salary for pilots.*/
select e.ename, e.salary from employees e where e.eid not in ( select distinct c.eid from certified c ) and e.salary >( select avg (e1.salary) from employees e1 where e1.eid in ( select distinct c1.eid from certified c1 ) ); 

