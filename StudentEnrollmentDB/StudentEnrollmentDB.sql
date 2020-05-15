/* i.Create the above tables by properly specifying the primary keys and the foreign keys.*/
create table student(regno varchar(15), name varchar(20), major varchar(20), bdate date, primary key (regno) );

create table course(courseno int, cname varchar(20), dept varchar(20), primary key (courseno) );

create table enroll(regno varchar(15), courseno int, sem int, marks int, primary key(regno,courseno),foreign key(regno) references student(regno), foreign key(courseno) references course(courseno));

create table text(book_isbn int, book_title varchar(20), publisher varchar(20), author varchar(20), primary key (book_isbn));

create table book_adoption(courseno int, sem int, book_isbn int, primary key (courseno,book_isbn), foreign key (courseno) references course (courseno), foreign key (book_isbn) references text(book_isbn));

/*ii. Enter at least five tuples for each relation.*/

insert into student values('1pe11cs002','b','sr', DATE '1993-09-24');
insert into student values('1pe11cs003','c','sr', DATE '1993-11-27');
insert into student values('1pe11cs004','d','sr', DATE '1993-04-13');
insert into student values('1pe11cs005','e','jr', DATE '1994-08-24');
select * from student;

INSERT INTO course VALUES (111,'OS','CSE');
INSERT INTO course VALUES(112,'EC','CSE');
INSERT INTO course VALUES(113,'SS','ISE');
INSERT INTO course VALUES(114,'DBMS','CSE');
INSERT INTO course VALUES(115,'SIGNALS','ECE');
select * from course;

INSERT INTO text VALUES (10,'DATABASE SYSTEMS','PEARSON','SCHIELD');
INSERT INTO text VALUES(900,'OPERATING SYS','PEARSON','LELAND');
INSERT INTO text VALUES(901,'CIRCUITS','HALL INDIA','BOB');
INSERT INTO text VALUES(902,'SYSTEM SOFTWARE','PETERSON','JACOB');
INSERT INTO text VALUES(903,'SCHEDULING','PEARSON','PATIL');
INSERT INTO text VALUES(904,'DATABASE SYSTEMS','PEARSON','JACOB');
INSERT INTO text VALUES(905,'DATABASE MANAGER','PEARSON','BOB');
INSERT INTO text VALUES(906,'SIGNALS','HALL INDIA','SUMIT');
select * from text;

INSERT INTO enroll VALUES ('1pe11cs002',114,5,100);
INSERT INTO enroll VALUES ('1pe11cs003',113,5,100);
INSERT INTO enroll VALUES ('1pe11cs004',111,5,100);
INSERT INTO enroll VALUES ('1pe11cs005',112,3,100);
select * from enroll;

INSERT INTO book_adoption VALUES(111,5,900);
INSERT INTO book_adoption VALUES(111,5,903);
INSERT INTO book_adoption VALUES(111,5,904);
INSERT INTO book_adoption VALUES(112,3,901);
INSERT INTO book_adoption VALUES(113,3,10);
INSERT INTO book_adoption VALUES(114,5,905);
INSERT INTO book_adoption VALUES(113,5,902);
INSERT INTO book_adoption VALUES(115,3,906);
select * from book_adoption;

/*iii. Demonstrate how you add a new text book to the database and make this book be adopted by some department.*/ 
/*iv. Produce a list of text books (include Course #, Book-ISBN, Book-title) in the alphabetical order for courses offered by the ‘CS’ department that use more than two books.*/
select c.courseno,t.book_isbn,t.book_title
     from course c,book_adoption ba,text t
     where c.courseno=ba.courseno
     and ba.book_isbn=t.book_isbn
     and c.dept='CSE'
     and 2<(
     select count(book_isbn)
     from book_adoption b
     where c.courseno=b.courseno)
     order by t.book_title;

/*v. List any department that has all its adopted books published by a specific publisher.*/
SELECT DISTINCT c.dept
     FROM course c
     WHERE c.dept IN
     ( SELECT c.dept
     FROM course c,book_adoption b,text t
     WHERE c.courseno=b.courseno
     AND t.book_isbn=b.book_isbn
     AND t.publisher='PEARSON')
     AND c.dept NOT IN
     (SELECT c.dept
     FROM course c,book_adoption b,text t
     WHERE c.courseno=b.courseno
     AND t.book_isbn=b.book_isbn
     AND t.publisher != 'PEARSON');

/*vi. Generate suitable reports.*/
/*vii. Create suitable front end for querying and displaying the results.*/
