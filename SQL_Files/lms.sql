create database lms;
use lms;
create table users(
U_ID int primary key auto_increment,
name varchar(100) not null,
password varchar(100) not null,
email varchar(120) unique not null,
address varchar(300),
usertype varchar(20) not null,
unpaid_fines int,
status varchar(20) default 'deactivated'
);
create table librarian(
Lib_ID int primary key auto_increment,
name varchar(100) not null,
password varchar(100) not null,
email varchar(120) unique not null,
address varchar(300)
);
insert into librarian 
CREATE TABLE shelf(
shelf_id int unique not null,
capacity int not null default 100,
shelf_status varchar(50) not null default 'available',
primary key(shelf_Id)
);
CREATE TABLE book(
accession_number int unique not null auto_increment,
ISBN varchar(100) not null,
title varchar(100) not null,
author varchar(100) not null,
year_of_publication int not null,
shelf_Id int not null,
genre varchar(100) not null,
book_shelf_status varchar(100) not null,
book_reserve_status varchar(100) not null default 'no' ,
foreign key(shelf_Id) references shelf(shelf_Id) on delete cascade on update cascade,
primary key(accession_number)
);
CREATE TABLE Issue_Book(
s_No int unique not null auto_increment,
U_ID int not null,
accession_number int not null,
start_date date not null,
due_date date not null,
fine int default 0,
primary key(S_No),
foreign key (U_ID) references users(U_ID),
foreign key (accession_number) REFERENCES book(accession_number)
);
CREATE TABLE Reserve_Book(
s_No int unique not null auto_increment,
U_ID int not null,
accession_number int not null,
start_date date ,
due_date date ,
primary key(S_No),
foreign key (U_ID) references users(U_ID),
foreign key (accession_number) REFERENCES book(accession_number)
);
CREATE TABLE wishlist(
U_ID int not null,
accession_number int not null,
primary key (U_ID,accession_number),
foreign key (U_ID) references users(U_ID),
foreign key (accession_number) REFERENCES book(accession_number) 
);
INSERT INTO shelf (shelf_id, capacity, shelf_status) VALUES (1, 100, 'available');
INSERT INTO shelf (shelf_id, capacity, shelf_status) VALUES (2, 100, 'available');
INSERT INTO shelf (shelf_id, capacity, shelf_status) VALUES (3, 100, 'available');
INSERT INTO shelf (shelf_id, capacity, shelf_status) VALUES (4, 100, 'available');
INSERT INTO shelf (shelf_id, capacity, shelf_status) VALUES (5, 100, 'available');
INSERT INTO shelf (shelf_id, capacity, shelf_status) VALUES (6, 100, 'available');
INSERT INTO shelf (shelf_id, capacity, shelf_status) VALUES (7, 100, 'available');
INSERT INTO shelf (shelf_id, capacity, shelf_status) VALUES (8, 100, 'available');
INSERT INTO shelf (shelf_id, capacity, shelf_status) VALUES (9, 100, 'available');
INSERT INTO shelf (shelf_id, capacity, shelf_status) VALUES (10, 100, 'available');
INSERT INTO shelf (shelf_id, capacity, shelf_status) VALUES (11, 100, 'available');
INSERT INTO shelf (shelf_id, capacity, shelf_status) VALUES (12, 100, 'available');


create table Transaction_History(
S_no int auto_increment primary key,
U_ID int not null,
accession_number int not null,
title varchar(100) not null,
author varchar(100) not null,
date date not null,
foreign key (U_ID) references users(U_ID),
foreign key (accession_number) REFERENCES book(accession_number)
);