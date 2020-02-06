
Table PERSON created.

Name      Null?    Type         
--------- -------- ------------ 
DRIVER_ID NOT NULL VARCHAR2(10) 
NAME               VARCHAR2(20) 
ADDRESS            VARCHAR2(30) 

Error starting at line : 10 in command -
create table car(reg_num varchar2(10), name varchar2(10), address varchar2(10)
Error report -
ORA-00907: missing right parenthesis
00907. 00000 -  "missing right parenthesis"
*Cause:    
*Action:

Table CAR created.

Name    Null? Type         
------- ----- ------------ 
REG_NUM       VARCHAR2(10) 
NAME          VARCHAR2(10) 
ADDRESS       VARCHAR2(10) 

Table ACCIDENT created.

Name          Null? Type         
------------- ----- ------------ 
REPORT_NUM          VARCHAR2(10) 
ACCIDENT_DATE       DATE         
LOCATION            VARCHAR2(10) 

Table OWNS created.

Name      Null? Type         
--------- ----- ------------ 
DRIVER_ID       VARCHAR2(10) 
REG_NUM         VARCHAR2(10) 

Table PARTICIPATED created.


ERROR:
ORA-04043: object perticipated does not exist
Name          Null? Type         
------------- ----- ------------ 
DRIVER_ID           VARCHAR2(10) 
REG_NUM             VARCHAR2(10) 
REPORT_NUM          VARCHAR2(10) 
DAMAGE_AMOUNT       VARCHAR2(10) 

Error starting at line : 10 in command -
create table car(reg_num varchar2(10), model varchar2(10),year int, primary key(reg_num))
Error report -
ORA-00955: name is already used by an existing object
00955. 00000 -  "name is already used by an existing object"
*Cause:    
*Action:

Table CAR dropped.


Table CAR created.


Table ACCIDENT dropped.


Table ACCIDENT created.


Table OWNS dropped.


Table OWNS created.


Table OWNS dropped.


Table OWNS created.


Table PARTICIPATED dropped.


Table PARTICIPATED created.

Name          Null?    Type         
------------- -------- ------------ 
DRIVER_ID     NOT NULL VARCHAR2(10) 
REG_NUM       NOT NULL VARCHAR2(10) 
REPORT_NUM    NOT NULL VARCHAR2(10) 
DAMAGE_AMOUNT          VARCHAR2(10) 
old:insert into PERSON values('&driver_id','&name','&address')
new:insert into PERSON values('A01','Richard','Srinivas Nagar')

1 row inserted.

old:insert into PERSON values('&driver_id','&name','&address')
new:insert into PERSON values('A02','Pradeep','Rajajinagar')

1 row inserted.

old:insert into PERSON values('&driver_id','&name','&address')
new:insert into PERSON values('A03','Smith','Ashoknagar')

1 row inserted.

old:insert into PERSON values('&driver_id','&name','&address')
new:insert into PERSON values('A04','Venu','N.R. Colony')

1 row inserted.

old:insert into PERSON values('&driver_id','&name','&address')
new:insert into PERSON values('A05','John','Hanumanth Nagar')

1 row inserted.

old:insert into car values('&reg_num', '&model', '&year')
new:insert into car values('KA052250', 'Indica', '1990')

1 row inserted.

old:insert into car values('&reg_num', '&model', '&year')
new:insert into car values('KA031181', 'Lancer', '1957')

1 row inserted.

old:insert into car values('&reg_num', '&model', '&year')
new:insert into car values('KA095477', 'Toyota', '1998')

1 row inserted.

old:insert into car values('&reg_num', '&model', '&year')
new:insert into car values('KA053408', 'Honda', '2008')

1 row inserted.

old:insert into car values('&reg_num', '&model', '&year')
new:insert into car values('KA041702', 'Audi', '2005')

1 row inserted.

old:insert into accident values('&report_num', '&accident_date', '&location')
new:insert into accident values('11', '01-JAN-03', 'Mysore Road')

1 row inserted.

old:insert into accident values('&report_num', '&accident_date', '&location')
new:insert into accident values('12', '02-FEB--4', 'Southend Circle')

Error starting at line : 26 in command -
insert into accident values('&report_num', '&accident_date', '&location')
Error report -
ORA-01858: a non-numeric character was found where a numeric was expected


Substitution cancelled
old:insert into accident values('&report_num', '&accident_date', '&location')
new:insert into accident values('13', '21-JAN-03', 'Bulltemple Road')

1 row inserted.

old:insert into accident values('&report_num', '&accident_date', '&location')
new:insert into accident values('14', '17-FEB-08', 'Mysore Road')

1 row inserted.

old:insert into accident values('&report_num', '&accident_date', '&location')
new:insert into accident values('15', '04-MAR-05', 'Kanakpura Road')

1 row inserted.

old:insert into accident values('&report_num', '&accident_date', '&location')
new:insert into accident values('12', '02-FEB-04', 'Southendcircle')

1 row inserted.


Commit complete.


Commit complete.


Commit complete.

old:insert into owns values('&driver_id', '&reg_num')
new:insert into owns values('A01', 'KA052250')

1 row inserted.

old:insert into owns values('&driver_id', '&reg_num')
new:insert into owns values('A02', 'KA053408')

1 row inserted.

old:insert into owns values('&driver_id', '&reg_num')
new:insert into owns values('A03', 'KA095477')

1 row inserted.

old:insert into owns values('&driver_id', '&reg_num')
new:insert into owns values('A04', 'KA031181')

1 row inserted.

old:insert into owns values('&driver_id', '&reg_num')
new:insert into owns values('A05', 'KA041702')

1 row inserted.


Commit complete.

old:insert into participated values('&driver', '&reg_num', '&report_num', '&damage_amount')
new:insert into participated values('A01', 'KA052250', '11', '10000')

1 row inserted.

old:insert into participated values('&driver', '&reg_num', '&report_num', '&damage_amount')
new:insert into participated values('A02', 'KA053408', '12', '50000')

1 row inserted.

old:insert into participated values('&driver', '&reg_num', '&report_num', '&damage_amount')
new:insert into participated values('A03', 'KA095477', '13', '25000')

1 row inserted.

old:insert into participated values('&driver', '&reg_num', '&report_num', '&damage_amount')
new:insert into participated values('A04', 'KA031181', '14', '3000')

1 row inserted.

old:insert into participated values('&driver', '&reg_num', '&report_num', '&damage_amount')
new:insert into participated values('A05', 'KA041702', '15', '5000')

1 row inserted.


Commit complete.


1 row updated.


1 row inserted.

