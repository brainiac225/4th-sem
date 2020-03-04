CREATE TABLE student(
snum INT,
sname VARCHAR(10),
major VARCHAR(2),
lvl VARCHAR(2),
age INT, primary key(snum));

desc student;

CREATE TABLE faculty(
fid INT,fname VARCHAR(20),
deptid INT,
PRIMARY KEY(fid));

desc faculty;

CREATE TABLE class(
cname VARCHAR(20),
metts_at TIMESTAMP,
room VARCHAR(10),
fid INT,
PRIMARY KEY(cname),
FOREIGN KEY(fid) REFERENCES faculty(fid));

CREATE TABLE enrolled(
snum INT,
cname VARCHAR(20),
PRIMARY KEY(snum,cname),
FOREIGN KEY(snum) REFERENCES student(snum),
FOREIGN KEY(cname) REFERENCES class(cname));

desc enrolled;

commit;

INSERT INTO STUDENT VALUES(&snum, '&sname', '&major', '&lvl', &age);

select * from student;

INSERT INTO FACULTY VALUES(&FID, '&FNAME', &DEPTID);

select * from faculty;

commit;

alter session set nls_timestamp_format = 'RR/MM/DD HH24:MI:SSXFF';

alter session set nls_date_language ='ENGLISH';

insert into class values('&cname', '&meets_at', '&room', &fid);

select * from class;

commit;

select * from enrolled;

SELECT DISTINCT S.Sname
FROM Student S, Class C, Enrolled E, Faculty F
WHERE S.snum = E.snum AND E.cname = C.cname AND C.fid = F.fid AND
F.fname = ‘Harish’ AND S.lvl = ‘Jr’;


SELECT C.cname
FROM Class C
WHERE C.room = ‘R128’
OR C.cname IN (SELECT E.cname
FROM Enrolled E
GROUP BY E.cname
HAVING COUNT (*) >= 5);


SELECT DISTINCT S.sname
FROM Student S
WHERE S.snum IN (SELECT E1.snum
FROM Enrolled E1, Enrolled E2, Class C1, Class C2
WHERE E1.snum = E2.snum AND E1.cname <> E2.cname
AND E1.cname = C1.cname
AND E2.cname = C2.cname AND C1.meets_at = C2.meets_at);


SELECT DISTINCT F.fname
FROM Faculty F
WHERE NOT EXISTS ((SELECT C.roomFROM Class C )
MINUS
(SELECTC1.room
FROM Class C1
WHERE C1.fid = F.fid ));

SELECT DISTINCT F.fname
FROM Faculty F
WHERE 5 > (SELECT COUNT (E.snum)
FROM Class C, Enrolled E
WHERE C.cname = E.cname
AND C.fid = F.fid)


SELECT DISTINCT S.sname
FROM Student S
WHERE S.snum NOT IN (SELECT E.snum
FROM Enrolled E );

SELECT S.age, S.lvl
FROM Student S
GROUP BY S.age, S.lvl
HAVING S.lvl IN (SELECT S1.lvl FROM Student S1
WHERE S1.age = S.age
GROUP BY S1.lvl, S1.age
HAVING COUNT (*) >= ALL (SELECT COUNT (*)
FROM Student S2
WHERE s1.age = S2.age
GROUP BY S2.lvl, S2.age));

