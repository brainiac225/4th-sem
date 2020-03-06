select * from tab;
create table person(driver_id varchar2(10),
name VARCHAR2(20),
address varchar2(30),
primary key(driver_id));

desc PERSON;
select * from person;

create table car(reg_num varchar2(10), model varchar2(10),year int, primary key(reg_num));
desc car;
drop table accident;
create table accident(report_num varchar2(10), accident_date date,  location varchar2(20),primary key(report_num));
desc accident;
drop table owns;
create table owns(driver_id varchar2(10), reg_num varchar2(10), primary key(driver_id,reg_num), foreign key(driver_id) references person(driver_id), foreign key(reg_num) references car(reg_num));
desc owns;
drop table participated;
create table participated(driver_id varchar2(10), reg_num varchar2(10), report_num varchar2(10), damage_amount varchar2(10), primary key(driver_id, reg_num, report_num), foreign key(driver_id) references person(driver_id), foreign key(reg_num) references car(reg_num), foreign key(report_num) references accident(report_num));
desc participated;

insert into PERSON values('&driver_id','&name','&address');
select * from person;
insert into car values('&reg_num', '&model', '&year');
select * from car;
insert into accident values('&report_num', '&accident_date', '&location');
select * from accident;
commit accident;
insert into owns values('&driver_id', '&reg_num');
select * from owns;
COMMIT;
insert into participated values('&driver', '&reg_num', '&report_num', '&damage_amount');
select * from participated;
commit;
update participated set damage_amount=25000 where reg_num ='KA053408' and report_num=12\
insert into accident values(16,'15-MAR-08', 'Domlur');
select count(distinct driver_id) CNT from participated a,accident b where a.report_num=b.report_num and b.accident_date like '%08';
select count(report_num) CNT from car c,participated p where c.reg_num=p.reg_num and model='Lancer';