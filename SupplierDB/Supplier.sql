create table SUPPLIERS(sid number(5) primary key, sname varchar(20), city varchar(20));

create table PARTS(pid number(5) primary key, pname varchar(20), color varchar(10));

create table CATALOG(sid number(5), pid number(5),  foreign key(sid) references SUPPLIERS(sid), foreign key(pid) references PARTS(pid), cost float(6), primary key(sid, pid));

insert into suppliers values('10001', 'Acme Widget','Bangalore');
insert into suppliers values('10002', 'Johns','Kolkata');
insert into suppliers values('10003', 'Vimal','Mumbai');
insert into suppliers values('10004', 'Reliance','Delhi');
select * from suppliers;

insert into PARTS values('20001', 'Book','Red');
insert into PARTS values('20002', 'Pen','Red');
insert into PARTS values('20003', 'Pencil','Green');
insert into PARTS values('20004', 'Mobile','Green');
insert into PARTS values('20005', 'Charger','Black');
select * from parts;

insert into CATALOG values('10001', '20001','10');
insert into CATALOG values('10001', '20002','10');
insert into CATALOG values('10001', '20003','30');
insert into CATALOG values('10001', '20004','10');
insert into CATALOG values('10001', '20005','10');
insert into CATALOG values('10002', '20001','10');
insert into CATALOG values('10002', '20002','20');
insert into CATALOG values('10003', '20003','30');
insert into CATALOG values('10004', '20003','40');
select * from catalog;

/*Find the pnames of parts for which there is some supplier*/
SELECT DISTINCT P.pname FROM Parts P, Catalog C WHERE P.pid = C.pid;

/*Find the snames of suppliers who supply every part.*/
SELECT S.sname FROM Suppliers S WHERE NOT EXISTS ((SELECT P.pid  FROM Parts P) MINUS (SELECT C.pid FROM Catalog C WHERE C.sid = S.sid));

/*Find the snames of suppliers who supply every red part.*/
SELECT S.sname FROM Suppliers S WHERE NOT EXISTS ((SELECT P.pid FROM Parts P WHERE P.color = 'Red') MINUS (SELECT C.pid FROM Catalog C, Parts P WHERE C.sid = S.sid AND C.pid = P.pid AND P.color = 'Red') );

/*Find the pnames of parts supplied by Acme Widget Suppliers and by no one else.*/
select pname from parts where pid in (select pid from catalog where sid = (select sid from suppliers where sname='Acme Widget') minus select pid from catalog where sid in (select sid from suppliers where sname <>'Acme Widget'));

/*Find the sids of suppliers who charge more for some part than the average cost of that part (averaged over all the suppliers who supply that part).*/
SELECT DISTINCT C.sid FROM Catalog C WHERE C.cost > ( SELECT AVG (C1.cost) FROM Catalog C1 WHERE C1.pid = C.pid );

/*For each part, find the sname of the supplier who charges the most for that part.*/
SELECT P.pid, S.sname FROM Parts P, Suppliers S, Catalog C WHERE C.pid = P.pid AND C.sid = S.sid AND C.cost = (SELECT MAX (C1.cost) FROM Catalog C1 WHERE C1.pid = P.pid);


