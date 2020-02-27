create table Cust (cust_no int,
                    cname varchar2(15),
                    city varchar2(15),
                    primary key(cust_no));
create table Or_der(order_no int, 
                odate date,
                cust_no int,
                order_amt int,
                primary key(order_no),
                foreign key(cust_no)references Cust(cust_no));
                drop table Or_der;
create table item(item_no int,
                    price float,
                    primary key(item_no));
create table order_item(order_no int,
                        item_no int,
                        qty int,
                        primary key(order_no,item_no),
                        foreign key(order_no) references Or_der(order_no),
                        foreign key(item_no) references item(item_no));
create table warehouse(w_no int,
                        city varchar2(15),
                        primary key(w_no));
create table shipment(order_no int,
                        w_no int,
                        S_date date,
                        primary key(order_no,w_no),
                        foreign key(order_no) references or_der(order_no),
                        foreign key(w_no) references warehouse(w_no));
insert into cust values(&cust_no,'&cname','&city');      
select * from cust;
insert into or_der values(&order_no,'&odate',&cust_no,&order_amt);
select * from or_der;
insert into item values(&item_no,&price);
select * from order_item;
insert into order_item values(&order_no,&item_no,&qty);
insert into warehouse values(&w_no,'&city');
select * from warehouse;
insert into shipment values(&order_no,&w_no,'&s_date');
select * from shipment;
