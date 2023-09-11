CREATE TABLE customers
(
	Customer_id int not null,
    first_name varchar(255) not null,
    last_name varchar(255),
    email_adress varchar(255) not null,
    number_of_complaints int not null
);


use sales;
select * from sale;
select * from customers;

select * from sales.sale;

 DROP TABLE sale;
 
 DROP table CUSTOMERS;
 
 
 
 
 CREATE TABLE customers                                                              

(  

    customer_id INT,  

    first_name varchar(255),  

    last_name varchar(255),  

    email_address varchar(255),  

    number_of_complaints int,  

primary key (customer_id)  

);  



CREATE TABLE items

(
	Item_code varchar(255),
    
    item_name varchar(255),
    
    unit_price numeric(10,2),
    
    company_id varchar(255),
    
    primary key(Item_code)
);


DROP TABLE companies;



create table companies

(
	company_id varchar(255),
    
    company_name varchar(255),
    
    headquaters_phone_number integer,
    
    primary key(company_id)
);



drop table customers;

drop table items;

drop table companies;

#new_table

CREATE TABLE customers
(
	customer_id int auto_increment,
    first_name varchar(255),
    last_name varchar(255),
    email_adress varchar(255),
    number_of_complaints int,
    primary key (customer_id)
);

ALTER table customers
ADD COLUMN gender enum ('M','F') after last_name;


insert into customers(first_name, last_name, gender, email_adress, number_of_complaints)
values ('Kunal','Batsa','M','Kunalbatsa@gmail.com',0);


#to assign default constraint after creation of table

alter table customers
change column number_of_complaints number_of_complaints int default 0;


#to drop the default constraint

alter table customers
alter column number_of_complaints drop default;




    
    #not_null practice
    
  create table companies

(
	company_id varchar(255),
    
    company_name varchar(255),
    
    headquaters_phone_number integer,
    
    primary key(company_id)
);  

alter table companies
change column company_name company_name varchar(255) not null;

alter table companies
modify column company_name varchar(255) null;


