create table aircraft (aid integer, aname varchar(20), cruising_range integer, primary key(aid));
create table employees(eid integer, ename varchar(20), salary integer, primary key(eid));
create table certified(eid integer, aid integer, primary key(eid, aid), foreign key(eid) references employees(eid), foreign key (aid) references aircraft(aid));
create table flights(flno integer, ffrom varchar(20), tto varchar(20), distance integer, departs char(10), arrives char(10), price real, primary key(flno)); 

insert into aircraft values(&aid,'&aname', &cruising_range); 

insert into employees values(&eid, '&ename', &salary); 

insert into certified values(&eid, &aid);

insert into flights(&flno, '&ffrom', '&tto', &distance, '&departs', '&arrives', &price);


/*i. Find the names of aircraft such that all pilots certified to operate them have salaries more than Rs.80,000.*/
select aname from aircraft where aid in(select aid from certified where eid in (select eid from employees where salary >=80000)); 

/*ii. For each pilot who is certified for more than three aircrafts, find the eid and the maximum  cruising range of the aircraft for which she or he is certified*/
SELECT C.eid, MAX(A.cruising_range) FROM Certified C, Aircraft A WHERE A.aid = C.aid GROUP BY C.eid HAVING COUNT(C.aid) > =3 ; 

/*iii. Find the names of pilots whose salary is less than the price of the cheapest route from  Bengaluru to Frankfurt.*/
SELECT  ename FROM employees WHERE salary < ( SELECT MIN(price) FROM Flights WHERE ffrom = 'Bengaluru' AND tto = 'Frankfurt' ) ; 

/*iv. For all aircraft with cruising range over 1000 Kms, find the name of the aircraft and the average  salary of all pilots certified for this aircraft.*/
SELECT a.aid, a.aname, AVG (e.salary) FROM aircraft a, certified c, employees e WHERE a.aid = c.aid AND c.eid = e.eid AND a.cruising_range > 1000 GROUP BY a.aid, a.aname;

v. Find the names of pilots certified for some Boeing aircraft	
SELECT DISTINCT e.ename FROM employees e, certified c, aircraft a WHERE e.eid = c.eid  AND a.aid = c.aid AND a.aname = 'Boeing' ; 

vi. Find the aids of all aircraft that can be used on routes from Bengaluru to New Delhi.
SELECT DISTINCT a.aid FROM aircraft a WHERE a.cruising_range > ( SELECT MIN(f.distance) FROM flights f WHERE f.ffrom = 'Bengaluru' AND f.tto = 'New Delhi' );







