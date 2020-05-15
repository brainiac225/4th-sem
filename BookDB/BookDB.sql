create table publisher (name varchar2 (20) primary key, phone integer, address varchar2 (20)); 

create table book (book_id integer primary key, title varchar2 (20), pub_year varchar2 (20), publisher_name references publisher (name) on delete cascade);

create table book_authors (author_name varchar2 (20), book_id references book (book_id) on delete cascade, primary key (book_id, author_name)); 

create table library_branch (branch_id integer primary key, branch_name varchar2 (50), address varchar2 (50)); 

create table book_copies (no_of_copies integer, book_id references book (book_id) on delete cascade, branch_id references library_branch (branch_id) on delete cascade, primary key (book_id, branch_id)); 

create table card (card_no integer primary key); 

create table book_lending (date_out date, due_date date, book_id references book (book_id) on delete cascade, branch_id references library_branch (branch_id) on delete cascade, card_no references card (card_no) on delete cascade, primary key (book_id, branch_id, card_no));

INSERT INTO PUBLISHER VALUES ('MCGRAW-HILL', 9989076587, 'BANGALORE'); 
INSERT INTO PUBLISHER VALUES ('PEARSON', 9889076565, 'NEWDELHI'); 
INSERT INTO PUBLISHER VALUES ('RANDOM HOUSE', 7455679345, 'HYDRABAD'); 
INSERT INTO PUBLISHER VALUES ('HACHETTE LIVRE', 8970862340, 'CHENNAI'); 
INSERT INTO PUBLISHER VALUES ('GRUPO PLANETA', 7756120238,'BANGALORE'); 
select * from publisher;

INSERT INTO BOOK VALUES (1,'DBMS','JAN-2017', 'MCGRAW-HILL'); 
INSERT INTO BOOK VALUES (2,'ADBMS','JUN-2016', 'MCGRAW-HILL'); 
INSERT INTO BOOK VALUES (3,'CN','SEP-2016', 'PEARSON'); 
INSERT INTO BOOK VALUES (4,'CG','SEP-2015', 'GRUPO PLANETA'); 
INSERT INTO BOOK VALUES (5,'OS','MAY-2016', 'PEARSON');
select * from book;

INSERT INTO BOOK_AUTHORS VALUES ('NAVATHE', 1); 
INSERT INTO BOOK_AUTHORS VALUES ('NAVATHE', 2); 
INSERT INTO BOOK_AUTHORS VALUES ('TANENBAUM', 3); 
INSERT INTO BOOK_AUTHORS VALUES ('EDWARD ANGEL', 4); 
INSERT INTO BOOK_AUTHORS VALUES ('GALVIN', 5); 
select * from book_authors;

INSERT INTO LIBRARY_BRANCH VALUES (10,'RR NAGAR','BANGALORE'); 
INSERT INTO LIBRARY_BRANCH VALUES (11,'RNSIT','BANGALORE'); 
INSERT INTO LIBRARY_BRANCH VALUES (12,'RAJAJI NAGAR', 'BANGALORE'); 
INSERT INTO LIBRARY_BRANCH VALUES (13,'NITTE','MANGALORE'); 
INSERT INTO LIBRARY_BRANCH VALUES (14,'MANIPAL','UDUPI'); 
select * from library_branch;

INSERT INTO BOOK_COPIES VALUES (10, 1, 10); 
INSERT INTO BOOK_COPIES VALUES (5, 1, 11); 
INSERT INTO BOOK_COPIES VALUES (2, 2, 12); 
INSERT INTO BOOK_COPIES VALUES (5, 2, 13); 
INSERT INTO BOOK_COPIES VALUES (7, 3, 14); 
INSERT INTO BOOK_COPIES VALUES (1, 5, 10); 
INSERT INTO BOOK_COPIES VALUES (3, 4, 11); 
select * from book_copies;

INSERT INTO CARD VALUES (100); 
INSERT INTO CARD VALUES (101); 
INSERT INTO CARD VALUES (102); 
INSERT INTO CARD VALUES (103); 
INSERT INTO CARD VALUES (104);
select * from card;

INSERT INTO BOOK_LENDING VALUES ('01-JAN-17','01-JUN-17', 1, 10, 101); 
INSERT INTO BOOK_LENDING VALUES ('11-JAN-17','11-MAR-17', 3, 14, 101); 
INSERT INTO BOOK_LENDING VALUES ('21-FEB-17','21-APR-17', 2, 13, 101); 
INSERT INTO BOOK_LENDING VALUES ('15-MAR-17','15-JUL-17', 4, 11, 101); 
INSERT INTO BOOK_LENDING VALUES ('12-APR-17','12-MAY-17', 1, 11, 104); 
select * from book_lending;

/*1. Retrieve details of all books in the library – id, title, name of publisher, authors, number of copies in each branch, etc. */
select card_no from book_lending where date_out between '01-jan-2017' and '01-jul-2017' group by card_no having count (*)>3;

/*2. Get the particulars of borrowers who have borrowed more than 3 books, but from Jan 2017 to Jun 2017.*/
select card_no from book_lending where date_out between '01-jan-2017' and '01-jul-2017'group by card_no having count (*)>3;

/*3. Delete a book in BOOK table. Update the contents of other tables to reflect this data manipulation operation.*/
delete from book where book_id=3;
select * from book;

/*4. Partition the BOOK table based on year of publication. Demonstrate its working with a simple query.*/
create view v_publication as select pub_year from book;
select * from v_publication;

/*5. Create a view of all books and its number of copies that are currently available in the Library.*/
create view v_books as select b.book_id, b.title, c.no_of_copies from book b, book_copies c, library_branch l where b.book_id=c.book_id and c.branch_id=l.branch_id;
select * from v_books;

