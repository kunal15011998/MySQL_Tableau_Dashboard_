#INSERT

#Select ten records from the “titles” table to get a better idea about its content.

#Then, in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.

#At the end, sort the records from the “titles” table in descending order to check if you have successfully inserted the new record.



use employees;



INSERT INTO employees

VALUES

(

    999903,

    '1977-09-14',

    'Johnathan',

    'Creek',

    'M',

    '1999-01-01'
    
);


SELECT 
    *
FROM
    titles
LIMIT 10;




insert into titles

(

                emp_no,

    title,

    from_date

)

values

(

                999903,

    'Senior Engineer',

    '1997-10-01'

);


SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC;


#Insert information about the individual with employee number 999903 into the “dept_emp” table. 
#He/She is working for department number 5, and has started work on  October 1st, 1997; her/his contract is for an indefinite period of time.

#Hint: Use the date ‘9999-01-01’ to designate the contract is for an indefinite period.

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no
LIMIT 10;


Insert into dept_emp 
(
			emp_no,
            dept_no,
            from_date,
            to_date
)
values (
			999903,
			'd005',
            '1997-10-01',
            '9999-01-01'
		);
        
#INSERTING DATA INTO A NEW TABLE

SELECT 
    *
FROM
    departments
ORDER BY dept_no
LIMIT 10;

#CREATING A NEW TABLE DEPARTMENT_DEMO

create table DEPARTMENT_DEMO
(
		dept_no char(4) not null,
        dept_name varchar(40) not null
);

#INSERTING THE DATA OF DEPARTMENTS TABLE IN DEPARTMENT_DEMO TABLE

INSERT INTO DEPARTMENT_DEMO
( 	
		dept_no,
        dept_name
)

select * from departments;



SELECT 
    *
FROM
    department_demo
ORDER BY dept_no;


#Create a new department called “Business Analysis”. Register it under number ‘d010’.

#Hint: To solve this exercise, use the “departments” table.

insert into departments
(
		dept_no,
        dept_name
)
values 
(
		'd010',
        'Business Analysis'
);

select * from departments
order by dept_no;

#NOTNULL & COALESCE

select * from department_demo;

SELECT 
    dept_no, IFNULL(dept_name, 'department not provided') as department
FROM
    department_demo;
    
    
    SELECT 
    dept_no, dept_name, COALESCE(dept_manager, dept_name, 'N/A') as manager_name
FROM
    department_demo
    order by dept_no;
    
    #Select the department number and name from the ‘departments_dup’ table and add a third column where you name the department number (‘dept_no’) as ‘dept_info’.
    #If ‘dept_no’ does not have a value, use ‘dept_name’.

alter table department_demo 
add column dept_info varchar(40) null after dept_name;
        
       select * from department_demo;
       
       SELECT 
    dept_no, dept_name, COALESCE('N/A') as dept_info
FROM
    department_demo
    order by dept_no;
    
    
    SELECT

    dept_no,

    dept_name,

    COALESCE(dept_no, dept_name) AS dept_info

FROM

    department_demo

ORDER BY dept_no ASC;


#Modify the code obtained from the previous exercise in the following way. Apply the IFNULL() function to the values from the first and second column,
 #so that ‘N/A’ is displayed whenever a department number has no value, and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.
 
  SELECT

    dept_no,

    dept_name,

    IFNULL(dept_no,'N/A') AS dept_no2,
    IFNULL(dept_name,'Department name not provided') as dept_name2,
    COALESCE(dept_no, dept_name) AS dept_info

FROM

    department_demo

ORDER BY dept_no ASC;


#If you currently have the ‘departments_dup’ table set up,
# use DROP COLUMN to remove the ‘dept_manager’ column from the ‘departments_dup’ table.
#Then, use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.

ALTER TABLE department_demo
DROP COLUMN dept_manager;

alter table department_demo 
change column dept_no dept_no char(4) null; 

alter table department_demo 
change column dept_name dept_name varchar(40) null; 

#Then, insert a record whose department name is “Public Relations”.
#Delete the record(s) related to department number two.
#Insert two new records in the “departments_dup” table. Let their values in the “dept_no” column be “d010” and “d011”.

insert into department_demo (
dept_name )
values ( 'Public Relation' );

select * from department_demo
order by dept_no; 


delete from department_demo where dept_no = 'd002';

#JOINS

#Create and fill in the ‘dept_manager_dup’ table, using the following code:



DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 



Create and fill in the ‘dept_manager_dup’ table, using the following code:



DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 



Create and fill in the ‘dept_manager_dup’ table, using the following code:



DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 

#Create and fill in the ‘dept_manager_dup’ table, using the following code:



DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 

#JOINS

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 

#JOINS

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );
  
 
  
  
  INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');
                               
                               
DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO department_demo(dept_name)

VALUES                ('Public Relations');

 

DELETE FROM department_demo

WHERE

    dept_no = 'd002'; 

select * from department_demo
order by dept_no;

 select * from dept_manager_dup
  order by dept_no;
  
  
#InnerJoin

SELECT 
    m.emp_no, d.dept_name, d.dept_no
FROM
    department_demo d
        INNER JOIN
    dept_manager_dup m ON d.dept_no = m.dept_no
ORDER BY m.dept_no;


#Extract a list containing information about all manager's employee number, first and last name, department number, and hire date. 

SELECT 
    m.emp_no, e.first_name, e.last_name, m.dept_no, e.hire_date
FROM
    dept_manager m
        INNER JOIN
    employees e ON m.emp_no = e.emp_no
    order by e.emp_no;
    
    
#Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch. See if the output contains a manager with that name.  
#Hint: Create an output containing information corresponding to the following fields: ‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’,
 #‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.
 
 SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, d.from_date
FROM
    employees e
        LEFT JOIN
    dept_manager d ON e.emp_no = d.emp_no
    where e.last_name = 'Markovitch'
    order by dept_no desc, emp_no;
    
#Extract a list containing information about all managers’ employee number, first and last name, department number,
# and hire date. Use the old type of join syntax to obtain the result.

 SELECT 
    e.emp_no, e.first_name, e.last_name, d.dept_no, e.hire_date
FROM
    employees e,
    dept_manager d
WHERE
    e.emp_no = d.emp_no;
    
    
    set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');
    
    #Select the first and last name, the hire date, and the job title of all employees whose first name is “Margareta” and have the last name “Markovitch”.
    
  SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
    where first_name = 'margareta' and last_name = 'Markovitch'
    order by e.emp_no;
    
#CROSSJOIN 

#Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.
select dm.*, d.* 
from departments d
cross join
dept_manager dm
where  d.dept_no = 'd009'
order by d.dept_no;

#Return a list with the first 10 employees with all the departments they can be assigned to.


SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_name;


#Select all managers’ first and last name, hire date, job title, start date, and department name.


SELECT 
    e.first_name, e.last_name, e.hire_date, t.title, m.from_date as start_date, d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
         JOIN
    departments d 
on m.dept_no = d.dept_no
join
titles t 
on t.emp_no = e.emp_no
where t.title = 'manager'
order by e.emp_no
;

#How many male and how many female managers do we have in the ‘employees’ database?

SELECT 
    e.gender, COUNT(e.emp_no) AS total, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    title = 'manager'
GROUP BY e.gender;


#creating_employee_dup_table

drop table if exists employees_dup;
create table employees_dup (
emp_no int(11) not null,
birth_date date,
first_name varchar(16),
last_name varchar(14),
gender enum('M','F'),
hire_date date
);
#inserting_20 rows from employees
insert into employees_dup
select * from employees
limit 20;

select * from employees_dup;

#inserting one duplicate extra row in employees_dup

insert into employees_dup 
values ('10010', '1963-06-01' , 'Duangkaew', 'Piveteau', 'F', '1989-08-24' );

select * from employees_dup;

SELECT 
    d.dept_no,
    d.dept_name,
    NULL AS emp_no,
    NULL AS from_date,
    NULL AS to_date
FROM
    departments d 
UNION SELECT 
    NULL AS dept_no,
    NULL AS dept_name,
    dm.emp_no,
    dm.from_date,
    dm.to_date
FROM
    dept_emp dm;

#Go forward to the solution and execute the query. 
#What do you think is the meaning of the minus sign before subset A in the last row (ORDER BY -a.emp_no DESC)? 
 
 SELECT

    *

FROM

    (SELECT

        e.emp_no,

            e.first_name,

            e.last_name,

            NULL AS dept_no,

            NULL AS from_date

    FROM

        employees e

    WHERE

        last_name = 'Denis' UNION SELECT

        NULL AS emp_no,

            NULL AS first_name,

            NULL AS last_name,

            dm.dept_no,

            dm.from_date

    FROM

        dept_manager dm) as a

ORDER BY -a.emp_no DESC;

#Extract the information about all department managers who were hired between the 1st of January 1990 and the 1st of January 1995.


SELECT 
    *
FROM
    dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
            
#Select the entire information for all employees whose job title is “Assistant Engineer”. 
#Hint: To solve this exercise, use the 'employees' table.

SELECT 
    *
FROM
    employees
WHERE
    EXISTS( SELECT 
            emp_no
        FROM
            titles
        WHERE
            title = 'Assistant Engineer')
ORDER BY emp_no
limit 20;

SELECT

    *

FROM

    employees e

WHERE

    EXISTS( SELECT

            *

        FROM

            titles t

        WHERE

            t.emp_no = e.emp_no

                AND title = 'Assistant Engineer');
                
#Assign employee number 110022 as a manager to all employees from 10001 to 10020 and employee number 110039 as a manager to all employees from 10021 to 10040


SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager 
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
	 GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager 
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
	GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B;
    
    
    #Starting your code with “DROP TABLE”,
    #create a table called “emp_manager” (emp_no – integer of 11, not null; dept_no – CHAR of 4, null; manager_no – integer of 11, not null). 
    
   Drop table if exists emp_manager;
   CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);

#Fill emp_manager with data about employees, the number of the department they are working in, and their managers.

#Your query skeleton must be:

#Insert INTO emp_manager SELECT

#U.*

#FROM

#                 (A)

#UNION (B) UNION (C) UNION (D) AS U;

#A and B should be the same subsets used in the last lecture (SQL Subqueries Nested in SELECT and FROM).
# In other words, assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A),
# and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).
#Use the structure of subset A to create subset C, where you must assign employee number 110039 as a manager to employee 110022.
#Following the same logic, create subset D. Here you must do the opposite - assign employee 110022 as a manager to employee 110039.


Insert into emp_manager
select U.* from
	(SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager 
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
	 GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager 
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
	GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B
UNION SELECT 
    C.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager 
                WHERE
                    emp_no = 110039 ) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
	GROUP BY e.emp_no
    ORDER BY e.emp_no
    ) AS C
UNION SELECT 
    D.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager 
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
	GROUP BY e.emp_no
    ORDER BY e.emp_no
    ) AS D 
    ) as U ;
    
select * from emp_manager;


select distinct e1.emp_no, e1.dept_no, e2.manager_no 
from emp_manager e1
join emp_manager e2 on e1.emp_no = e2.manager_no ;

#VIEW

#Create a view that will extract the average salary of all managers registered in the database. Round this value to the nearest cent.

CREATE VIEW v_avg_salary AS
    SELECT 
        ROUND(AVG(s.salary),2) AS avg_salary, t.title
    FROM
        salaries s
            JOIN
        titles t ON s.emp_no = t.emp_no
    WHERE
        t.title = 'Manager';
        
select * from employees.v_avg_salary;

#STORED_PROCEDURE

#Create a procedure that will provide the average salary of all employees.
#Then, call the procedure.

USE employees;

drop procedure if exists avg_salary;

delimiter $$
create procedure avg_salary()
begin 
      select avg(salary) as average_salary from 
      salaries;
      
end $$
delimiter ;

#call the procedure

call avg_salary();

#Create a procedure called ‘emp_info’ that uses as parameters the first and the last name of an individual, and returns their employee number.

use employees;
drop procedure if exists emp_info;
Delimiter $$



create procedure emp_info(in p_first_name varchar(10), in p_last_name varchar(10), out p_emp_no int)
begin 
	select e.emp_no into p_emp_no 
    from employees e 
    where e.first_name = p_first_name and e.last_name = p_last_name;
    
end $$
delimiter ;


#VARIABLE
#Create a variable, called ‘v_emp_no’, where you will store the output of the procedure you created in the last exercise.

#Call the same procedure, inserting the values ‘Aruna’ and ‘Journel’ as a first and last name respectively.

#Finally, select the obtained output.

set @p_emp_no = 0;
call employees.emp_info('aruna', 'journel', @p_emp_no);
select @p_emp_no;

#User-defined functions in MySQL - exercise

#(Create a function called ‘emp_info’ that takes for parameters the first and last name of an employee, 
#and returns the salary from the newest contract of that employee.)

#Hint: In the BEGIN-END block of this program, you need to declare and use two variables 
#– v_max_from_date that will be of the DATE type, and v_salary, that will be of the DECIMAL (10,2) type.

delimiter $$
create function emp_info(p_first_name varchar(40) , p_last_name varchar(40)) returns decimal(10,2)
no sql
begin
declare v_max_from_date date;
declare v_salary decimal(10,2);
select max(s.from_date) into v_max_from_date
from salaries s 
join 
employees e on s.emp_no = e.emp_no
where e.first_name = p_first_name and e.last_name = p_last_name;

select s.salary into v_salary
from salaries s 
join 
employees e on s.emp_no = e.emp_no
where e.first_name = p_first_name and e.last_name = p_last_name and s.from_date = v_max_from_date;
return v_salary;
end $$
delimiter ;

#execute the function
select emp_info('aruna','journel');


#TRIGGERS

#Create a trigger that checks if the hire date of an employee is higher than the current date. 
#If true, set this date to be the current date. Format the output appropriately (YY-MM-DD).

delimiter $$
create trigger hire_date_trigger
before update on employees
for each row
begin 
     if new.hire_date > date_format(sysdate(), '%y-%m-%d') then
     set new.hire_date = date_format(sysdate(), '%y-%m-%d');
     end if;
     end $$
delimiter ;

INSERT into employees VALUES ('999904', '1970-01-31', 'John', 'Johnson', 'M', '2025-01-01');  

SELECT  

    *  

FROM  

    employees

ORDER BY emp_no DESC;


#INDEX_(creating and droping index)

select * from employees
where 
     first_name = 'georgi' and last_name = 'facello';
	
create index i_composite on employees(first_name,last_name);
 
 alter table employees
drop index i_composite;

#Select all records from the ‘salaries’ table of people whose salary is higher than $89,000 per annum.
#Then, create an index on the ‘salary’ column of that table, and check if it has sped up the search of the same SELECT statement.
select * from salaries 
where salary > 89000;

create index i_salary on salaries(salary);


#CASE STATEMENT
#Similar to the exercises done in the lecture, obtain a result set containing the employee number, first name, and last name of all employees with a number higher than 109990.
#Create a fourth column in the query, indicating whether this employee is also a manager, according to the data provided in the dept_manager table, or a regular employee. 

SELECT 
    e.emp_no AS employee_number,
    e.first_name,
    e.last_name,
    CASE
        WHEN m.emp_no IS NOT NULL THEN 'manager'
        ELSE 'regular employee'
    END AS degination
FROM
    employees e
        LEFT JOIN
    dept_manager m ON e.emp_no = m.emp_no
WHERE
    e.emp_no > 109990;

#Extract a dataset containing the following information about the managers: employee number, first name, and last name. 
#Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee,
# and another one saying whether this salary raise was higher than $30,000 or NOT.
#If possible, provide more than one solution.


select m.emp_no, e.first_name, e.last_name, max(s.salary) - min(s.salary) as salary,
case
	when max(s.salary) - min(s.salary) > 30000 then 'salary raise was higher than $30,000'
    else 'not raised'
    end as higher_or_not
from employees e
	join dept_manager m on e.emp_no = m.emp_no
	join salaries s on s.emp_no = m.emp_no
    group by s.emp_no;
    
    
#Extract the employee number, first name, and last name of the first 100 employees, and add a fourth column,
#called “current_employee” saying “Is still employed” if the employee is still working in the company, or “Not an employee anymore” if they aren’t.
#Hint: You’ll need to use data from both the ‘employees’ and the ‘dept_emp’ table to solve this exercise. 

select e.emp_no, e.first_name, e.last_name, 
case 
	when Max(de.to_date) > sysdate() then 'Is still employed'
    else 'Not an employee anymore'
    end as current_employee
from employees e 
	join dept_emp de on e.emp_no = de.emp_no
    group by de.emp_no
    limit 100;
    
    

#The ROW_NUMBER() Ranking Window Function - Exercises

#Exercise #1 :

#Write a query that upon execution, assigns a row number to all managers we have information for in the "employees" database (regardless of their department).
#Let the numbering disregard the department the managers have worked in. Also, let it start from the value of 1.
#Assign that value to the manager with the lowest employee number.


select emp_no,dept_no,row_number() over (order by emp_no) as row_num 
from dept_manager;


#Exercise #2:

#Write a query that upon execution, assigns a sequential number for each employee number registered in the "employees" table.
#Partition the data by the employee's first name and order it by their last name in ascending order (for each partition).

select emp_no,first_name,last_name,row_number() over(partition by first_name order by last_name) as row_num
from employees;


#Exercise #1:

#Obtain a result set containing the salary values each manager has signed a contract for. To obtain the data, refer to the "employees" database.
#Use window functions to add the following two columns to the final output:
-# a column containing the row number of each row from the obtained dataset, starting from 1.
#- a column containing the sequential row numbers associated to the rows for each manager,
#where their highest salary has been given a number equal to the number of rows in the given partition, and their lowest - the number 1.
#Finally, while presenting the output, make sure that the data has been ordered by the values in the first of the row number columns, 
#and then by the salary values for each partition in ascending order.

select m.emp_no, s.salary, 
		row_number() over() as row_num1,
        row_number() over(partition by m.emp_no order by s.salary) as row_num2
from dept_manager m 
left join salaries s on m.emp_no = s.emp_no 
ORDER BY row_num1, emp_no, salary;


#Exercise #2:

/* Obtain a result set containing the salary values each manager has signed a contract for. To obtain the data, refer to the "employees" database.
Use window functions to add the following two columns to the final output:
- a column containing the row numbers associated to each manager, 
where their highest salary has been given a number equal to the number of rows in the given partition, and their lowest - the number 1.
- a column containing the row numbers associated to each manager, 
where their highest salary has been given the number of 1, and the lowest - a value equal to the number of rows in the given partition.
Let your output be ordered by the salary values associated to each manager in descending order.
Hint: Please note that you don't need to use an ORDER BY clause in your SELECT statement to retrieve the desired output */



select m.emp_no, s.salary, 
		row_number() over(partition by m.emp_no order by s.salary) as row_num1,
        row_number() over(partition by m.emp_no order by s.salary desc) as row_num2
from dept_manager m 
left join salaries s on m.emp_no = s.emp_no ;


/*Write a query that provides row numbers for all workers from the "employees" table,
partitioning the data by their first names and ordering each partition by their employee number in ascending order.*/

select emp_no, first_name, last_name, 
		row_number() over w as row_num
from employees 
WINDOW w AS (PARTITION BY first_name ORDER BY emp_no);


#partion_by vs group_by
select a.emp_no,max(salary) as max_salary from
     (select emp_no,salary,row_number() over(partition by emp_no order by salary desc) as row_num
		from salaries)a
        group by emp_no;


select a.emp_no,max(a.salary) as max_salary from
     (select emp_no,salary
		from salaries)a
        group by emp_no;
        
        
select emp_no,max(salary) as max_salary from
salaries
group by emp_no;


#Exercise #1:

/* Find out the lowest salary value each employee has ever signed a contract for. To obtain the desired output, use a subquery containing 
a window function, as well as a window specification introduced with the help of the WINDOW keyword.
Also, to obtain the desired result set, refer only to data from the “salaries” table. */

select a.emp_no, min(a.salary) as minimum_salary from
		(select emp_no,salary,row_number() over (partition by emp_no order by salary asc) as row_num
from salaries)a 
where a.row_num = 3
group by a.emp_no;



#Exercise #2:

/*Once again, find out the lowest salary value each employee has ever signed a contract for. This time,
 to obtain the desired output, avoid using a window function. Just use an aggregate function and a subquery.
To obtain the desired result set, refer only to data from the “salaries” table.*/



select a.emp_no, min(a.salary) as minimum_salary from
		(select emp_no,salary
from salaries)a 
group by a.emp_no;


select emp_no, min(salary) as minimum_salary from
salaries
group by emp_no;


/* Exercise #3:

Find out the second-lowest salary value each employee has ever signed a contract for. To obtain the desired output, use a subquery
 containing a window function, as well as a window specification introduced with the help of the WINDOW keyword. Moreover, 
 obtain the desired result set without using a GROUP BY clause in the outer query.
To obtain the desired result set, refer only to data from the “salaries” table. */

select a.emp_no, a.salary as min_salary from
(select emp_no, salary , row_number() over (partition by emp_no order by salary) as row_num
from salaries)a
where a.row_num = 2 ;

#RANK AND DENSE_RANK

/* Exercise #1:

Write a query containing a window function to obtain all salary values that employee number 10560 has ever signed a contract for.

Order and display the obtained salary values from highest to lowest.*/

select emp_no, salary, dense_rank() over (partition by emp_no order by salary desc) as num
from salaries
where emp_no = 10560;

/*Exercise #2:

Write a query that upon execution, displays the number of salary contracts that each manager has ever signed while working in the company.*/

select s.emp_no, count(s.salary) as num_of_contracts from salaries s
join dept_manager dm on s.emp_no = dm.emp_no
group by s.emp_no;


/* Exercise #3:

Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has ever signed a contract for. 
Use a window function to rank all salary values from highest to lowest in a way that equal salary values bear 
the same rank and that gaps in the obtained ranks for subsequent rows are allowed.*/

select 
emp_no, salary ,rank() over (partition by emp_no order by salary)as rnk
from salaries
where emp_no = 10560;

/*Exercise #4:

Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has ever signed a contract for.
 Use a window function to rank all salary values from highest to lowest in a way that equal salary values bear 
 the same rank and that gaps in the obtained ranks for subsequent rows are not allowed. */
 
 
select 
emp_no, salary ,dense_rank() over (partition by emp_no order by salary)as rnk
from salaries
where emp_no = 10560;


/* Exercise #1:

Write a query that ranks the salary values in descending order of all contracts signed by employees numbered between 10500 and 10600 inclusive.
Let equal salary values for one and the same employee bear the same rank. Also, allow gaps in the ranks obtained for their subsequent rows.

Use a join on the “employees” and “salaries” tables to obtain the desired result.*/


select e.emp_no,
 s.salary,
 rank() over(partition by emp_no order by salary desc) as employee_salary_ranking
 from salaries s
 join employees e on e.emp_no = s.emp_no
 where e.emp_no between 10500 and 10600;
 
 
 /* Write a query that ranks the salary values in descending order of the following contracts from the "employees" database:

- contracts that have been signed by employees numbered between 10500 and 10600 inclusive.

- contracts that have been signed at least 4 full-years after the date when the given employee was hired in the company for the first time.

In addition, let equal salary values of a certain employee bear the same rank. Do not allow gaps in the ranks obtained for their subsequent rows.

Use a join on the “employees” and “salaries” tables to obtain the desired result.*/


select e.emp_no,
 s.salary,
 dense_rank() over(partition by emp_no order by salary desc) as employee_salary_ranking,
 e.hire_date,
 s.from_date,
(year(s.from_date) - year(e.hire_date)) as year
 from salaries s
 join employees e on e.emp_no = s.emp_no
 and year(s.from_date) - year(e.hire_date) >= 4
 where e.emp_no between 10500 and 10600;
 
 
 #The LAG() and LEAD() Value Window Functions - Exercise
 
 /*Exercise #1:

Write a query that can extract the following information from the "employees" database:

- the salary values (in ascending order) of the contracts signed by all employees numbered between 10500 and 10600 inclusive

- a column showing the previous salary from the given ordered list

- a column showing the subsequent salary from the given ordered list

- a column displaying the difference between the current salary of a certain employee and their previous salary

- a column displaying the difference between the next salary of a certain employee and their current salary

Limit the output to salary values higher than $80,000 only.

Also, to obtain a meaningful result, partition the data by employee number.*/

select emp_no, salary,
       lag(salary) over (partition by emp_no order by salary) as previous_salary,
       lead(salary) over (partition by emp_no order by salary) as subsequent_salary,
       salary - lag(salary) over (partition by emp_no order by salary) as diff_previous_salary,
       lead(salary) over (partition by emp_no order by salary) - salary as diff_current_salary
from salaries
where emp_no between 10500 and 10600
				and salary > 80000;
                

#Exercise #2:

/*The MySQL LAG() and LEAD() value window functions can have a second argument, designating how many rows/steps back (for LAG())
 or forth (for LEAD()) we'd like to refer to with respect to a given record.

With that in mind, create a query whose result set contains data arranged by the salary values associated to each employee number 
(in ascending order). Let the output contain the following six columns:

- the employee number

- the salary value of an employee's contract (i.e. which we’ll consider as the employee's current salary)

- the employee's previous salary

- the employee's contract salary value preceding their previous salary

- the employee's next salary

- the employee's contract salary value subsequent to their next salary

Restrict the output to the first 1000 records you can obtain.*/


select emp_no,salary as current_salary,
		lag(salary) over w as previous_salary,
        lag(salary,2) over w as second_previous,
        lead(salary) over w as next_salary,
        lead(salary,2) over w as second_next
        from salaries
window w as (partition by emp_no order by salary)
limit 1000;


#MySQL Aggregate Functions in the Context of Window Functions - Part II-exercise

/*Exercise #1:

Consider the employees' contracts that have been
signed after the 1st of January 2000 and terminated before the 1st of January 2002 (as registered in the "dept_emp" table).

Create a MySQL query that will extract the following information about these employees:

- Their employee number
- The salary values of the latest contracts they have signed during the suggested time period
- The department they have been working in (as specified in the latest contract they've signed during the suggested time period)
- Use a window function to create a fourth field containing the average salary paid in 
the department the employee was last working in during the suggested time period. Name that field "average_salary_per_department".

Note1: This exercise is not related neither to the query you created nor to the output you obtained while solving the exercises after the previous lecture.
Note2: Now we are asking you to practically create the same query as the one we worked on during the video lecture;
the only difference being to refer to contracts that have been valid within the period between the 1st of January 2000 and the 1st of January 2002.
Note3: We invite you solve this task after assuming that the "to_date" values stored in the "salaries" and "dept_emp" tables are greater than the
"from_date" values stored in these same tables. If you doubt that, you could include a couple of lines in your code to ensure that this is the case anyway!
Hint: If you've worked correctly, you should obtain an output containing 200 rows.*/


SELECT

    de2.emp_no, d.dept_name, s2.salary, AVG(s2.salary) OVER w AS average_salary_per_department

FROM

    (SELECT

    de.emp_no, de.dept_no, de.from_date, de.to_date

FROM

    dept_emp de

        JOIN

(SELECT

emp_no, MAX(from_date) AS from_date

FROM

dept_emp

GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no

WHERE

    de.to_date < '2002-01-01'

AND de.from_date > '2000-01-01'

AND de.from_date = de1.from_date) de2

JOIN

    (SELECT

    s1.emp_no, s.salary, s.from_date, s.to_date

FROM

    salaries s

    JOIN

    (SELECT

emp_no, MAX(from_date) AS from_date

FROM

salaries

    GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no

WHERE

    s.to_date < '2002-01-01'

AND s.from_date > '2000-01-01'

AND s.from_date = s1.from_date) s2 ON s2.emp_no = de2.emp_no

JOIN

    departments d ON d.dept_no = de2.dept_no

GROUP BY de2.emp_no, d.dept_name

WINDOW w AS (PARTITION BY de2.dept_no)

ORDER BY de2.emp_no, salary;





SELECT
    T1.emp_no,
    T2.salary,
    d.dept_name,
    AVG(T2.salary) OVER(PARTITION BY T1.dept_no) AS avg_salary_by_department
FROM 
    (SELECT
        dm.emp_no,
        dm.dept_no,
        dm.from_date,
        dm.to_date
    FROM dept_emp dm
        JOIN (
            SELECT emp_no, MAX(from_date) AS from_date
            FROM dept_emp
            GROUP BY emp_no
        ) d ON dm.emp_no = d.emp_no
    WHERE
        dm.from_date > '2000-01-01'
        AND dm.to_date < '2002-01-01'
        AND dm.from_date = d.from_date) T1
    JOIN (
        SELECT
            s.emp_no,
            s.salary,
            s.from_date,
            s.to_date
        FROM salaries s
        JOIN (
            SELECT emp_no, MAX(salary) AS max_salary
            FROM salaries 
            GROUP BY emp_no
        ) s1 ON s1.emp_no = s.emp_no 
        WHERE
            s.from_date > '2000-01-01'
            AND s.to_date < '2002-01-01'
            AND s.salary = s1.max_salary
    ) T2 ON T1.emp_no = T2.emp_no
    JOIN departments d ON d.dept_no = T1.dept_no
GROUP BY T1.emp_no, T2.salary, d.dept_name
ORDER BY T2.salary;


/*Exercise #1:

Use a CTE (a Common Table Expression) and a SUM() function in the SELECT statement in a query to find out how many male employees have never signed 
a contract with a salary value higher than or equal to the all-time company salary average.*/

WITH cte as(
SELECT avg(salary) as avg_salary from salaries)
select 
	sum(case when s.salary < c.avg_salary then 1 else 0 end) as no_of_emp_less_than_avg,
    count(s.salary) as total_no_of_contracts
	from 
    salaries s join 
    employees e on e.emp_no = s.emp_no and e.gender = 'M'
    cross join 
    cte c ;
    
#Exercise #2:

/*Use a CTE (a Common Table Expression) and (at least one) COUNT() function in the SELECT statement of a query
 to find out how many male employees have never signed a contract with a salary value higher than or equal to the all-time company salary average.*/
 
 WITH cte as(
SELECT avg(salary) as avg_salary from salaries)
select 
	count(case when s.salary < c.avg_salary then s.salary else null end) as no_of_emp_less_than_avg,
    count(s.salary) as total_no_of_contracts
	from 
    salaries s join 
    employees e on e.emp_no = s.emp_no and e.gender = 'M'
    cross join 
    cte c ;
    
/*Exercise #3:

Use MySQL joins (and don’t use a Common Table Expression) in a query to find out how many male employees have never signed a contract with a salary value higher
 than or equal to the all-time company salary average (i.e. to obtain the same result as in the previous exercise).*/
 
    SELECT

    SUM(CASE

        WHEN s.salary < a.avg_salary THEN 1

        ELSE 0

    END) AS no_salaries_below_avg,

    COUNT(s.salary) AS no_of_salary_contracts

FROM

    (SELECT

        AVG(salary) AS avg_salary

    FROM

        salaries s) a

        JOIN

    salaries s

        JOIN

    employees e ON e.emp_no = s.emp_no AND e.gender = 'M';
    
    
/*Exercise #4:

Use a cross join in a query to find out how many male employees have never signed a contract with a salary value higher than or equal 
to the all-time company salary average (i.e. to obtain the same result as in the previous exercise). */


  with cte as (select avg(salary) as avg_salary from salaries)
  select sum( case when s.salary < c.avg_salary then 1 else 0 end) as total_emp_less_tan_avg_salary,
  count(s.salary) as total_contracts
  from salaries s 
	join 
		employees e on s.emp_no = e.emp_no and e.gender = 'M'
	 cross join cte c;
     
     
/*Using Multiple Subclauses in a WITH Clause-Exercise
Exercise #1:

Use two common table expressions and a SUM() function 
in the SELECT statement of a query to obtain the number of male employees whose highest salaries have been below the all-time average.*/

with cte1 as ( select avg(salary)as avg_salary from salaries),
	 cte2 as ( select s.emp_no, max(s.salary) as max_salary from employees e
			join salaries s on e.emp_no = s.emp_no and e.gender = 'M'
            group by s.emp_no
)
	select 
			count(case when c2.max_salary < c1.avg_salary then c2.max_salary else null end) as no_of_employees_with_less_salary_than_avg,
            count(c2.emp_no) as total_contracts
            from cte2 c2 cross join cte1 c1;
            
            
select e.emp_no, max(s.salary) from employees e
	join salaries s on e.emp_no = s.emp_no
    where e.hire_date >= '2000-01-01'
    group by e.emp_no;
    
    
/*MySQL Temporary Tables in Action-Exercise
Exercise #1:

Store the highest contract salary values of all male employees in a temporary table called male_max_salaries.*/

create temporary table male_max_salaries
SELECT 
    e.emp_no, MAX(s.salary) AS max_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no AND e.gender = 'M'
    group by e.emp_no;
            
 SELECT 
    *
FROM
    male_max_salaries;
    
drop table male_max_salaries;
    
    
/*Exercise #1:

Create a temporary table called dates containing the following three columns:

- one displaying the current date and time,

- another one displaying two months earlier than the current date and time, and a

- third column displaying two years later than the current date and time.*/

create temporary table dates
	select 
		now() as current_date_and_time,
        date_sub(now(),interval 2 month) as two_months_earlier_than_the_current_date_and_time,
        date_sub(now(), interval -2 year) as  two_years_later_than_the_current_date_and_time;
        
select * from dates;
    
with cte as (select 
		now() as current_date_and_time,
        date_sub(now(),interval 2 month) as two_months_earlier_than_the_current_date_and_time,
        date_sub(now(), interval -2 year) as  two_years_later_than_the_current_date_and_time)
        select * from dates d join cte c ;
       
       
       select * from dates 
			union all
				select * from cte ;

/*Exercise #4:

Again, create a query joining the result sets from the dates temporary table you created during the previous lecture
 with a new Common Table Expression (CTE) containing the same columns. This time, combine the two sets vertically.*/
 
with cte1 as (select 
		now() as current_date_and_time,
        date_sub(now(),interval 2 month) as two_months_earlier_than_the_current_date_and_time,
        date_sub(now(), interval -2 year) as  two_years_later_than_the_current_date_and_time)
select * from dates union all select * from cte1 ;


drop table if exists male_max_salaries;
drop table dates;

        

    
    

            

    
    

    
    

 
 
