
SQL> CREATE TABLE student(
  2      snum INT,
  3      sname VARCHAR(10),
  4      major VARCHAR(2),
  5      lvl VARCHAR(2),
  6      age INT, primary key(snum));

Table created.

SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SNUM                                      NOT NULL NUMBER(38)
 SNAME                                              VARCHAR2(10)
 MAJOR                                              VARCHAR2(2)
 LVL                                                VARCHAR2(2)
 AGE                                                NUMBER(38)

SQL> CREATE TABLE faculty(
  2      fid INT,fname VARCHAR(20),
  3      deptid INT,
  4      PRIMARY KEY(fid));

Table created.

SQL> desc faculty;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 FID                                       NOT NULL NUMBER(38)
 FNAME                                              VARCHAR2(20)
 DEPTID                                             NUMBER(38)

SQL>  CREATE TABLE class(
  2      cname VARCHAR(20),
  3      metts_at TIMESTAMP,
  4      room VARCHAR(10),
5      fid INT,
  6      PRIMARY KEY(cname),
  7      FOREIGN KEY(fid) REFERENCES faculty(fid));

Table created.

SQL> DESC class;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CNAME                                     NOT NULL VARCHAR2(20)
 METTS_AT                                           TIMESTAMP(6)
 ROOM                                               VARCHAR2(10)
 FID                                                NUMBER(38)

SQL> CREATE TABLE enrolled(
  2      snum INT,
  3      cname VARCHAR(20),
  4      PRIMARY KEY(snum,cname),
  5      FOREIGN KEY(snum) REFERENCES student(snum),
  6      FOREIGN KEY(cname) REFERENCES class(cname));

Table created.

SQL> desc enrolled;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SNUM                                      NOT NULL NUMBER(38)
 CNAME                                     NOT NULL VARCHAR2(20)

SQL> commit;

Commit complete.

INSERTION OF VALUES:


SQL> INSERT INTO STUDENT VALUES(&snum, '&sname', '&major', '&lvl', &age);
Enter value for snum: 1
Enter value for sname: jhon
Enter value for major: CS
Enter value for lvl: Sr
Enter value for age: 19
old   1: INSERT INTO STUDENT VALUES(&snum, '&sname', '&major', '&lvl', &age)
new   1: INSERT INTO STUDENT VALUES(1, 'jhon', 'CS', 'Sr', 19)

1 row created.

SQL> /
Enter value for snum: 2
Enter value for sname: Smith
Enter value for major: CS
Enter value for lvl: Jr
Enter value for age: 20
old   1: INSERT INTO STUDENT VALUES(&snum, '&sname', '&major', '&lvl', &age)
new   1: INSERT INTO STUDENT VALUES(2, 'Smith', 'CS', 'Jr', 20)

1 row created.

SQL> /
Enter value for snum: 3 
Enter value for sname: Jacob
Enter value for major: CV
Enter value for lvl: Sr
Enter value for age: 20
old   1: INSERT INTO STUDENT VALUES(&snum, '&sname', '&major', '&lvl', &age)
new   1: INSERT INTO STUDENT VALUES(3 , 'Jacob', 'CV', 'Sr', 20)

1 row created.

SQL> /
Enter value for snum: 4
Enter value for sname: Tom 
Enter value for major: CS
Enter value for lvl: Jr
Enter value for age: 20
old   1: INSERT INTO STUDENT VALUES(&snum, '&sname', '&major', '&lvl', &age)
new   1: INSERT INTO STUDENT VALUES(4, 'Tom ', 'CS', 'Jr', 20)

1 row created.

SQL> /
Enter value for snum: 5
Enter value for sname: Rahul
Enter value for major: CS
Enter value for lvl: Jr
Enter value for age: 20
old   1: INSERT INTO STUDENT VALUES(&snum, '&sname', '&major', '&lvl', &age)
new   1: INSERT INTO STUDENT VALUES(5, 'Rahul', 'CS', 'Jr', 20)

1 row created.

SQL> /
Enter value for snum: 6
Enter value for sname: Rita
Enter value for major: CS
Enter value for lvl: Sr
Enter value for age: 21
old   1: INSERT INTO STUDENT VALUES(&snum, '&sname', '&major', '&lvl', &age)
new   1: INSERT INTO STUDENT VALUES(6, 'Rita', 'CS', 'Sr', 21)

1 row created.

SQL> select * from student;

      SNUM SNAME      MA LV        AGE
---------- ---------- -- -- ----------
         1 jhon       CS Sr         19
         2 Smith      CS Jr         20
         3 Jacob      CV Sr         20
         4 Tom        CS Jr         20
         5 Rahul      CS Jr         20
         6 Rita       CS Sr         21

6 rows selected.

SQL> INSERT INTO FACULTY VALUES(&FID, '&FNAME', &DEPTID);
Enter value for fid: 11
Enter value for fname: Harish
Enter value for deptid: 1000
old   1: INSERT INTO FACULTY VALUES(&FID, '&FNAME', &DEPTID)
new   1: INSERT INTO FACULTY VALUES(11, 'Harish', 1000)

1 row created.

SQL> /
Enter value for fid: 12
Enter value for fname: MV
Enter value for deptid: 1000
old   1: INSERT INTO FACULTY VALUES(&FID, '&FNAME', &DEPTID)
new   1: INSERT INTO FACULTY VALUES(12, 'MV', 1000)

1 row created.

SQL> /
Enter value for fid: 13 
Enter value for fname: Mira
Enter value for deptid: 1001
old   1: INSERT INTO FACULTY VALUES(&FID, '&FNAME', &DEPTID)
new   1: INSERT INTO FACULTY VALUES(13 , 'Mira', 1001)

1 row created.

SQL> /
Enter value for fid: 14
Enter value for fname: Shiva
Enter value for deptid: 1002
old   1: INSERT INTO FACULTY VALUES(&FID, '&FNAME', &DEPTID)
new   1: INSERT INTO FACULTY VALUES(14, 'Shiva', 1002)

1 row created.

SQL> /
Enter value for fid: 15
Enter value for fname: Nupur
Enter value for deptid: 1000
old   1: INSERT INTO FACULTY VALUES(&FID, '&FNAME', &DEPTID)
new   1: INSERT INTO FACULTY VALUES(15, 'Nupur', 1000)

1 row created.

SQL> commit;

Commit complete.

SQL> select * from faculty;

       FID FNAME                    DEPTID
---------- -------------------- ----------
        11 Harish                     1000
        12 MV                         1000
        13 Mira                       1001
        14 Shiva                      1002
        15 Nupur                      1000

SQL> commit;

Commit complete.


SQL> alter session set nls_timestamp_format = 'RR/MM/DD HH24:MI:SSXFF';

Session altered.

SQL> alter session set nls_date_language ='ENGLISH';

Session altered.

SQL> insert into class values('&cname', '&meets_at', '&room', &fid);
Enter value for cname: class1
Enter value for meets_at: 12/11/15 10:15:16
Enter value for room: R1
Enter value for fid: 14
old   1: insert into class values('&cname', '&meets_at', '&room', &fid)
new   1: insert into class values('class1', '12/11/15 10:15:16', 'R1', 14)

1 row created.

Enter value for cname: class10
Enter value for meets_at: 12/11/15 10:15:16
Enter value for room: R128
Enter value for fid: 14
old   1: insert into class values('&cname', '&meets_at', '&room', &fid)
new   1: insert into class values('class10', '12/11/15 10:15:16', 'R128', 14)

1 row created.

SQL> /
Enter value for cname: class2
Enter value for meets_at: 12/11/15 10:15:20
Enter value for room: R2
Enter value for fid: 12
old   1: insert into class values('&cname', '&meets_at', '&room', &fid)
new   1: insert into class values('class2', '12/11/15 10:15:20', 'R2', 12)

1 row created.

SQL> insert into class values('&cname', '&meets_at', '&room', &fid);
Enter value for cname: class3
Enter value for meets_at: 12/11/15 10:15:25
Enter value for room: R3
Enter value for fid: 11
old   1: insert into class values('&cname', '&meets_at', '&room', &fid)
new   1: insert into class values('class3', '12/11/15 10:15:25', 'R3', 12)

1 row created.

SQL> /
Enter value for cname: class4
Enter value for meets_at: 12/11/15 20:15:20
Enter value for room: R4
Enter value for fid: 14
old   1: insert into class values('&cname', '&meets_at', '&room', &fid)
new   1: insert into class values('class4', '12/11/15 20:15:20', 'R4', 14)

1 row created.

SQL> /
Enter value for cname: class5
Enter value for meets_at: 12/11/15 20:15:20
Enter value for room: R3
Enter value for fid: 15
old   1: insert into class values('&cname', '&meets_at', '&room', &fid)
new   1: insert into class values('class5', '12/11/15 20:15:20', 'R3', 15)

1 row created.

SQL> /
Enter value for cname: class6
Enter value for meets_at: 12/11/15 13:20:20
Enter value for room: R2
Enter value for fid: 14
old   1: insert into class values('&cname', '&meets_at', '&room', &fid)
new   1: insert into class values('class6', '12/11/15 13:20:20', 'R2', 14)

1 row created.

SQL> /
Enter value for cname: class7
Enter value for meets_at: 12/11/15 10:10:10
Enter value for room: R3
Enter value for fid: 14
old   1: insert into class values('&cname', '&meets_at', '&room', &fid)
new   1: insert into class values('class7', '12/11/15 10:10:10', 'R3', 14)

1 row created.

SQL> select * from class;

CNAME
--------------------
METTS_AT
---------------------------------------------------------------------------
ROOM              FID
---------- ----------
class1
12/11/15 10:15:16.000000
R1                 14

class10
12/11/15 10:15:16.000000
R128               14

CNAME
--------------------
METTS_AT
---------------------------------------------------------------------------
ROOM              FID
---------- ----------

class2
12/11/15 10:15:20.000000
R2                 12

class3
12/11/15 10:15:25.000000

CNAME
--------------------
METTS_AT
---------------------------------------------------------------------------
ROOM              FID
---------- ----------
R3                 11

class4
12/11/15 20:15:20.000000
R4                 14

class5

CNAME
--------------------
METTS_AT
---------------------------------------------------------------------------
ROOM              FID
---------- ----------
12/11/15 20:15:20.000000
R3                 15

class6
12/11/15 13:20:20.000000
R2                 14


CNAME
--------------------
METTS_AT
---------------------------------------------------------------------------
ROOM              FID
---------- ----------
class7
12/11/15 10:10:10.000000	
R3                 14


8 rows selected.

SQL> commit;

Commit complete.

SQL> insert into enrolled values(&snum, '&cname');
Enter value for snum: 1
Enter value for cname: class1
old   1: insert into enrolled values(&snum, '&cname')
new   1: insert into enrolled values(1, 'class1')

1 row created.

SQL> /
Enter value for snum: 2
Enter value for cname: class1
old   1: insert into enrolled values(&snum, '&cname')
new   1: insert into enrolled values(2, 'class1')

1 row created.

SQL> /
Enter value for snum: 3
Enter value for cname: class3
old   1: insert into enrolled values(&snum, '&cname')
new   1: insert into enrolled values(3, 'class3')

1 row created.

SQL> /
Enter value for snum: 4
Enter value for cname: class3
old   1: insert into enrolled values(&snum, '&cname')
new   1: insert into enrolled values(4, 'class3')

1 row created.

SQL> /
Enter value for snum: 5
Enter value for cname: class4
old   1: insert into enrolled values(&snum, '&cname')
new   1: insert into enrolled values(5, 'class4')

1 row created.

SQL> /
Enter value for snum: 1
Enter value for cname: class5
old   1: insert into enrolled values(&snum, '&cname')
new   1: insert into enrolled values(1, 'class5')

1 row created.

SQL> /
Enter value for snum: 2
Enter value for cname: class5
old   1: insert into enrolled values(&snum, '&cname')
new   1: insert into enrolled values(2, 'class5')

1 row created.

SQL> /
Enter value for snum: 3
Enter value for cname: class5
old   1: insert into enrolled values(&snum, '&cname')
new   1: insert into enrolled values(3, 'class5')

1 row created.

SQL> /
Enter value for snum: 4
Enter value for cname: class5
old   1: insert into enrolled values(&snum, '&cname')
new   1: insert into enrolled values(4, 'class5')

1 row created.

SQL> /
Enter value for snum: 5
Enter value for cname: class5
old   1: insert into enrolled values(&snum, '&cname')
new   1: insert into enrolled values(5, 'class5')

1 row created.


SQL> select * from enrolled;

      SNUM CNAME
---------- --------------------
         1 class1
         2 class1
         3 class3
         4 class3
         5 class4
         1 class5
         2 class5
         3 class5
         4 class5
         5 class5


10	rows selected.


iii. Find the names of all Juniors (level(lvl) = Jr) who are enrolled in a class taught by Harish.

SELECT DISTINCT S.Sname
FROM Student S, Class C, Enrolled E, Faculty F
WHERE S.snum = E.snum AND E.cname = C.cname AND C.fid = F.fid AND
F.fname = ‘Harish’ AND S.lvl = ‘Jr’;

SNAME
----------
Tom

vi. Find the names of all classes that either meet in room R128 or have five or more Students enrolled.

SQL>SELECT C.cname
FROM Class C
WHERE C.room = ‘R128’
OR C.cname IN (SELECT E.cname
		FROM Enrolled E
		GROUP BY E.cname
		HAVING COUNT (*) >= 5);

CNAME
--------------------
class10
class5
v. Find the names of all students who are enrolled in two classes that meet at the same time.
SQL>SELECT DISTINCT S.sname
FROM Student S
WHERE S.snum IN (SELECT E1.snum
			FROM Enrolled E1, Enrolled E2, Class C1, Class C2
			WHERE E1.snum = E2.snum AND E1.cname <> E2.cname
			AND E1.cname = C1.cname
			AND E2.cname = C2.cname AND C1.meets_at = C2.meets_at);
SNAME
----------
Rahul

vi. Find the names of faculty members who teach in every room in which some class is taught.

SELECT DISTINCT F.fname
FROM Faculty F
WHERE NOT EXISTS ((SELECT C.roomFROM Class C )
				MINUS
				(SELECTC1.room
				FROM Class C1
				WHERE C1.fid = F.fid ));

FNAME
--------------------
Shiva

vii. Find the names of faculty members for whom the combined enrollment of the courses that they teach is less than five.
SQL>SELECT DISTINCT F.fname
FROM Faculty F
WHERE 5 > (SELECT COUNT (E.snum)
FROM Class C, Enrolled E
WHERE C.cname = E.cname
AND C.fid = F.fid)
		FNAME
--------------------
Harish
MV
Mira
Shiva

viii. Find the names of students who are not enrolled in any class. 

SELECT DISTINCT S.sname
FROM Student S
WHERE S.snum NOT IN (SELECT E.snum
FROM Enrolled E );
SNAME
----------
Rita	

ix. For each age value that appears in Students, find the level value that appears most often. For example, if there are more FR level students aged 18 than SR, JR, or SO students aged 18, you should print the pair (18, FR).

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
       AGE LV
---------- --
        19 Sr
        20 Jr
        21 Sr

