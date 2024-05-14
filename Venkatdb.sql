
-- change name of the databse

alter database sample modify name = venkatdb

execute sp_renamedb 'venkatdb1','venkatdb'

-- selecting database

use venkatdb

-- drop a database

drop database test

drop table GENDER
drop table Person

-- create a table

create table Gender
(
ID int not null primary key,
Gender nvarchar(10)
)

create table Person
(
ID int not null primary key,
Name nvarchar(50) not null ,
Email nvarchar(50) not null, 
GenderID int,
Foreign key (genderID) references gender(ID) 
)


insert into person values (1,'John','j@j.com',1)
insert into person values (2,'Mary','m@m.com',2)
insert into person values (3,'Sam','s@S.com',3)
insert into person (ID,Name,Email,GenderID) values (5,'pat','P@p.com','1')
insert into person (ID,Name,Email,GenderID) values (7,'mat','m@m.com','1')
insert into person (ID,Name,Email,GenderID) values (5,'Tan','t@m.com','1')


insert into gender values (1,11),(2,22),(3,33)

select * from Person
select * from Gender

truncate table Person
truncate table Gender

-- CONSTRAINTS

-- foreign key

alter table person add constraint Person_GenderID_FK
Foreign Key (GenderID) references Gender(ID)

-- Default

-- 1 - Altering an existing column to add Default constraint

alter table person
add constraint DF_person_GenderID
default 3 for GenderID

-- 2 - Adding a new column with default value to an existing table	

alter table person
add PAN nvarchar(50)
constraint DF_person_PAN default 'GJYPS'

