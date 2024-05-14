use pratyushdb

create table Employees
(
    emp_id int,
    emp_name varchar(50),
    dept_name varchar(50),
    salary int
)

insert into employees
values(1,'Deepak','IT',10000),
(2,'Dev','IT',12000),
(3,'Singh','IT',8000),
(4,'Pratyush','IT',4000),
(5,'Anik','IT',12000),
(6,'Ankit','HR',8000),
(7,'Aniket','HR',4000),
(8,'Rahul','HR',15000),
(9,'Himanshu','HR',20000),
(10,'Ankit','Finance',13000),
(11,'Bobby','Finance',11000),
(12,'Manish','Finance',13000),
(13,'Ishank','Finance',17000),
(14,'Mohit','Finance',19000),
(15,'Harman','Finance',20000),
(16,'Sagar','IT',3000),
(17,'Devender','IT',4000),
(18,'Shashi','Accounts',50000),
(19,'Aruna','Accounts',12000),
(20,'Mayuri','Accounts',40000),
(21,'Ravnish','Accounts',27000),
(22,'Garima','Accounts',12000)

select * from employees order by salary desc

select  min (salary) from employees where salary in (select top 4 (salary) from employees order by salary desc) 

-- window function

-- over clause

select * ,
max(salary) over(partition by dept_name) as Max_Salary
from Employees

-- rownumber

select * ,
ROW_NUMBER() over(partition by dept_name order by salary asc) as Max_Salary
from Employees


Select * from 
(select * ,
ROW_NUMBER() over(partition by dept_name order by salary desc) as Row_num
from Employees) as temprow
where temprow.Row_num <2


--rank

select * ,
rank() over(partition by dept_name order by salary asc) as Rank_num,
ROW_NUMBER() over(partition by dept_name order by salary asc) as Row_num
from Employees


Select * from 
(select * ,
rank() over(partition by dept_name order by salary asc) as rank_num,
ROW_NUMBER() over(partition by dept_name order by salary desc) as Row_num
from Employees) as temprow
where temprow.rank_num <3


--dense rank

select * ,
ROW_NUMBER() over(partition by dept_name order by salary asc) as Row_num,
rank() over(partition by dept_name order by salary asc) as Rank_num,
dense_rank() over(partition by dept_name order by salary asc) as denserank
from Employees


--- lag - lookup for previous value in the table

select * ,
lag(salary) over(partition by dept_name order by salary desc) as prevous_sal
from Employees

select * ,
lag(salary,2,0) over(partition by dept_name order by salary desc) as prevous_sal
from Employees


--- lead -- lookup for next value in the table


select * ,
lead(salary) over(partition by dept_name order by salary desc) as next_sal
from Employees

select * ,
lead(salary,2,0) over(partition by dept_name order by salary desc) as next_sal
from Employees





select * ,
lag(salary) over(partition by dept_name order by salary desc) as prevous_sal,
case 
when salary>lag(salary) over(partition by dept_name order by salary desc) then 'Higher salary from previous'
when salary<lag(salary) over(partition by dept_name order by salary desc) then 'lower salary from previous'
when salary=lag(salary) over(partition by dept_name order by salary desc) then 'equal salary from previous'
end as salary_range
from Employees


select * ,
case 
when salary>lag(salary) over(partition by dept_name order by salary) then 'Higher salary from previous'
when salary<lag(salary) over(partition by dept_name order by salary ) then 'lower salary from previous'
when salary=lag(salary) over(partition by dept_name order by salary ) then 'equal salary from previous'
end as salary_range
from Employees