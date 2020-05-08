create table student(snum int, sname varchar(10), major varchar(2), lvl varchar(2), age int, primary key(snum));

create table faculty(fid int,fname varchar(20), deptid int, primary key(fid));

create table class(cname varchar(20), metts_at timestamp, room varchar(10), fid int, primary key(cname), foreign key(fid) references faculty(fid));

create table enrolled(snum int, cname varchar(20), primary key(snum,cname), foreign key(snum) references student(snum),foreign key(cname) references class(cname));

insert into student values('1', 'John', 'CS', 'Sr', '19');
insert into student values('2', 'Smith', 'CS', 'Jr', '20');
insert into student values('3', 'Jacob', 'CV', 'Sr', '20');
insert into student values('4', 'Tom', 'CS', 'Jr', '20');
insert into student values('5', 'Rahul', 'CS', 'Jr', '20');
insert into student values('6', 'Rita', 'CS', 'Sr', '21');
select * from student;

insert into faculty values('11', 'Harish', '1000');
insert into faculty values('12', 'MV', '1000');
insert into faculty values('13', 'Mira', '1001');
insert into faculty values('14', 'Shiva', '1002');
insert into faculty values('15', 'Nupur', '1000');
select*from faculty;

alter session set nls_timestamp_format = 'RR/MM/DD HH24:MI:SSXFF';

alter session set nls_date_language ='ENGLISH';

insert into class values('class1', '12/11/15 10:15:16.000000', 'R1', '14');
insert into class values('class10', '12/11/15 10:15:16.000000', 'R128', '14');
insert into class values('class2', '12/11/15 10:15:20.000000', 'R2', '12');
insert into class values('class3', '12/11/15 10:15:25.000000', 'R3', '11');
insert into class values('class4', '12/11/15 20:15:20.000000', 'R4', '14');
insert into class values('class5', '12/11/15 20:15:20.000000', 'R3', '15');
insert into class values('class6', '12/11/15 13:20:20.000000', 'R2', '14');
insert into class values('class7', '12/11/15 10:10:10.000000', 'R3', '14');
select * from class;

insert into enrolled values('1', 'class1');
insert into enrolled values('2', 'class1');
insert into enrolled values('3', 'class3');
insert into enrolled values('4', 'class3');
insert into enrolled values('5', 'class4');
insert into enrolled values('1', 'class5');
insert into enrolled values('2', 'class5');
insert into enrolled values('3', 'class5');
insert into enrolled values('4', 'class5');
insert into enrolled values('5', 'class5');
select * from enrolled;

/*Find the names of all Juniors (level(lvl) = Jr) who are enrolled in a class taught by Harish.*/
select distinct S.Sname from Student S, Class C, Enrolled E, Faculty F WHERE S.snum = E.snum AND E.cname = C.cname AND C.fid = F.fid AND F.fname = 'Harish' AND S.lvl = 'Jr';

/*Find the names of all classes that either meet in room R128 or have five or more Students enrolled.*/
select C.cname from Class C where C.room = 'R128' OR C.cname IN (SELECT E.cname FROM Enrolled E GROUP BY E.cname having count (*) >= '5');

/*Find the names of all students who are enrolled in two classes that meet at the same time.*/
select distinct S.sname FROM Student S WHERE S.snum IN (SELECT E1.snum FROM Enrolled E1, Enrolled E2, Class C1, Class C2 WHERE E1.snum = E2.snum AND E1.cname <> E2.cname AND E1.cname = C1.cname AND E2.cname = C2.cname AND C1.metts_at = C2.metts_at);

/*Find the names of faculty members who teach in every room in which some class is taught.*/
select distinct F.fname FROM Faculty F WHERE NOT EXISTS ((SELECT C.room FROM Class C ) MINUS (select C1.room FROM Class C1 WHERE C1.fid = F.fid ));

/*Find the names of faculty members for whom the combined enrollment of the courses that they teach is less than five.*/
select distinct F.fname FROM Faculty F WHERE '5' > (select COUNT (E.snum) FROM Class C, Enrolled E WHERE C.cname = E.cname AND C.fid = F.fid)

/*Find the names of students who are not enrolled in any class.*/
select distinct S.sname FROM Student S WHERE S.snum NOT IN (select E.snum FROM Enrolled E );

/*For each age value that appears in Students, find the level value that appears most often. For example, if there are more FR level students aged 18 than SR, JR, or SO students aged 18, you should print the pair (18, FR).*/
select S.age, S.lvl from Student S GROUP BY S.age, S.lvl HAVING S.lvl IN (SELECT S1.lvl FROM Student S1 WHERE S1.age = S.age GROUP BY S1.lvl, S1.age HAVING COUNT (*) >= ALL (SELECT COUNT (*) FROM Student S2 WHERE s1.age = S2.age GROUP BY S2.lvl, S2.age));


