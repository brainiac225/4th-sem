create table person(driver_id varchar2(10), name VARCHAR2(20), address varchar2(30), primary key(driver_id));

create table car(reg_num varchar2(10), model varchar2(10),year int, primary key(reg_num));

create table accident(report_num varchar2(10), accident_date date,  location varchar2(20),primary key(report_num));

create table owns(driver_id varchar2(10), reg_num varchar2(10), primary key(driver_id,reg_num), foreign key(driver_id) references person(driver_id), foreign key(reg_num) references car(reg_num));

create table participated(driver_id varchar2(10), reg_num varchar2(10), report_num varchar2(10), damage_amount varchar2(10), primary key(driver_id, reg_num, report_num), foreign key(driver_id) references person(driver_id), foreign key(reg_num) references car(reg_num), foreign key(report_num) references accident(report_num));

insert into PERSON values('A01','Richard','Srinivas Nagar');
insert into PERSON values('A02','Pradeep','Rajaji Nagar');
insert into PERSON values('A03','Smith','Ashok Nagar');
insert into PERSON values('A04','Venu','NR Colony');
insert into PERSON values('A05','John','Hanumanth Nagar');
select*from person;

insert into car values('KA052250','Indica','1990');
insert into car values('KA031181','Lancer','1957');
insert into car values('KA095477','Toyota','1998');
insert into car values('KA053408','Honda','2008');
insert into car values('KA041702','Audi','2005');
select * from car;

insert into accident values('11','01-JAN-03','Mysore Road');
insert into accident values('12','02-FEB-04','Southend Circle');
insert into accident values('13','21-JAN-03','Bulltemple Road');
insert into accident values('14','17-FEB-08','Mysore Road');
insert into accident values('15','04-MAR-05','Kanakpura Road');
select * from accident;

insert into owns values ('A01','KA052250');
insert into owns values ('A02','KA053408');
insert into owns values ('A04','KA031181');
insert into owns values ('A03','KA095477');
insert into owns values ('A05','KA041702');
select * from owns;

insert into participated values ('A01','KA052250','11', '10000');
insert into participated values ('A02','KA053408','12', '50000');
insert into participated values ('A03','KA095477','13', '25000');
insert into participated values ('A04','KA031181','14', '3000');
insert into participated values ('A05','KA041702','15', '5000');
select*from participated;

/*Update the damage amount to 25000 for the car with a specific reg_num (example  'K A053408'  ) for which the accident report number was 12.*/
update participated set damage_amount=25000 where reg_num='KA053408' and report_num=12;
commit;
select * from participated;

/*Add a new accident to the database.*/
insert into accident values(16,'15-MAR-08','Domlur');
select * from accident;

/*Find the total number of people who owned cars that were involved in accidents in 2008.*/
select count(distinct driver_id) CNT from participated a, accident b where a.report_num=b.report_num and b.accident_date like '%08';

/*Find the number of accidents in which cars belonging to a specific model (example 'Lancer')  were involved.*/
select count(report_num) CNT from car c,participated p where c.reg_num=p.reg_num and model='Lancer';

/* LIST THE ENTIRE PARTICIPATED RELATION IN THE DESCENDING ORDER OF DAMAGE AMOUNT.*/
select * from participated order by damage_amount desc;

/*FIND THE AVERAGE DAMAGE AMOUNT*/
select avg(damage_amount) from participated;

/*DELETE THE TUPLE WHOSE DAMAGE AMOUNT IS BELOW THE AVERAGE DAMAGE AMOUNT*/
DELETE FROM PARTICIPATED WHERE DAMAGE_AMOUNT<(SELECT AVG (DAMAGE_AMOUNT) FROM PARTICIPATED);

/*LIST THE NAME OF DRIVERS WHOSE DAMAGE IS GREATER THAN THE AVERAGE DAMAGE AMOUNT.*/
SELECT NAME FROM PERSON A, PARTICIPATED B WHERE A.DRIVER_ID = B.DRIVER_ID AND DAMAGE_AMOUNT>(SELECT AVG(DAMAGE_AMOUNT) FROM PARTICIPATED);

/*FIND MAXIMUM DAMAGE AMOUNT.*/
SELECT MAX(DAMAGE_AMOUNT) FROM PARTICIPATED;
