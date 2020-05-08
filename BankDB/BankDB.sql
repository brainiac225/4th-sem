create table Branch(branch_name varchar2(20),branch_city varchar2(20),assets float,primary key(branch_name));

create table Accounts(accno int,branch_name varchar2(20),balance float,primary key(accno),foreign key(branch_name) references Branch(branch_name));

create table Depositor(cust_name varchar2(20),accno int,primary key(cust_name,accno),foreign key(accno) references Accounts(accno));

create table Customer(cust_name varchar2(20),cust_street varchar2(20),cust_city varchar2(20),primary key(cust_name));

create table Loan(loan_no int,branch_name varchar2(20),amount float,primary key(loan_no),foreign key(branch_name) references Branch(branch_name));       

insert into Branch values('SBI_Chamrajpet', 'Bangalore', '50000');
insert into Branch values('SBI_ResidencyRoad', 'Bangalore', '10000');
insert into Branch values('SBI_ShivajiRoad', 'Bombay', '20000');
insert into Branch values('SBI_ParlimentRoad', 'Delhi', '10000');
insert into Branch values('SBI_Jantarmantar', 'Delhi', '20000');
select * from Branch;

insert into Loan values('2', 'SBI_ResidencyRoad', '2000');
insert into Loan values('1', 'SBI_Chamrajpet', '1000');
insert into Loan values('3', 'SBI_ShivajiRoad', '3000');
insert into Loan values('4', 'SBI_ParlimentRoad', '4000');
insert into Loan values('5', 'SBI_Jantarmantar', '5000');
select*from Loan order by loan_no;
delete from Loan where loan_no in(select loan_no from loan);

insert into Accounts values('1','SBI_Chamrajpet','2000');
insert into Accounts values('2','SBI_ResidencyRoad','5000');
insert into Accounts values('3','SBI_ShivajiRoad','6000');
insert into Accounts values('4','SBI_ParlimentRoad','9000');
insert into Accounts values('5','SBI_Jantarmantar','8000');
insert into Accounts values('6','SBI_ShivajiRoad','4000');
insert into Accounts values('8','SBI_ResidencyRoad','4000');
insert into Accounts values('9','SBI_ParlimentRoad','3000');
insert into Accounts values('10','SBI_ResidencyRoad','5000');
insert into Accounts values('11','SBI_Jantarmantar','2000');
select*from Accounts;

insert into Depositor values('Avinash', '1');
insert into Depositor values('Dinesh', '2');
insert into Depositor values('Nikil', '4');
insert into Depositor values('Ravi', '5');
insert into Depositor values('Avinash', '8');
insert into Depositor values('Nikil', '9');
insert into Depositor values('Dinesh', '10');
insert into Depositor values('Nikil', '11');
select * from Depositor;

insert into Customer values('Avinash', 'Bull_Temple_Road', 'Bangalore');
insert into Customer values('Dinesh', 'Bannergatta_Road', 'Bangalore');
insert into Customer values('Mohan', 'NationalCollege_Road', 'Bangalore');
insert into Customer values('Nikil', 'Akbar_Road', 'Delhi');
insert into Customer values('Ravi', 'Prithviraj_Road', 'Delhi');
select * from Customer;

commit;

/*Find Find all the customers who have at least two deposits at the same branch (Ex. ‘SBI_ResidencyRoad’).*/
select C.cust_name from Customer C where exists(select D.cust_name, count(D.cust_name) from Depositor D, Accounts A where D.accno=A.accno AND C.cust_name=D.cust_name AND A.branch_name='SBI_ResidencyRoad' group by D.cust_name having count(D.cust_name)>=2;);

/*Find all the customers who have an account at all the branches located in a specific city (Ex. Delhi).*/
select C.cust_name from Customer C where not exists(select branch_name from Branch where branch_city='Delhi' minus ( select A.branch_name from Depositor D, Accounts A where D.accno=A.accno and C.cust_name=D.cust_name);); 

/*Demonstrate how you delete all account tuples at every branch located in a specific city (Ex. Bomay).*/
delete from Accounts where branch_name IN ( select branch_name from Branch where branch_city='BOMBAY');

/*LIST THE ENTIRE LOAN RELATION IN THE DESCENDING ORDER OF AMOUNT.*/
SELECT * FROM LOAN ORDER BY AMOUNT DESC;

/*FIND ALL CUSTOMERS HAVING A LAON, AN ACCOUNT OR BOTH AT THE BANK*/
(SELECT CUSTOMER_NAME FROM DEPOSITOR ) UNION (SELECT CUSTOMER_NAME FROM BORROWER);

/*CREATE A VIEW WHICH GIVES EACH BRANCH THE SUM OF THE AMOUNT OF ALL THE LOANS AT THE BRANCH.*/
CREATE VIEW BRANCH_TOTAL_LOAN (BRANCH_NAME, TOTAL_LOAN) AS SELECT BRANCH_NAME, SUM(AMOUNT) FROM LOAN GROUP BY BRANCH_NAME;

/*THE ANNUAL INTEREST PAYMENTS ARE MADE AND ALL BRANCHES ARE TO BE INCREASED BY 5%.*/
UPDATE ACCOUNT SET BALANCE=BALANCE *1.05;
