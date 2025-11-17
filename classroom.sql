create database college;
create database if not exists college;

drop database abc;
drop database if exists abc;

show databases;
show tables;

USE college;

create table student (
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);

insert into student values(1, "Bhavesh",31);
insert into student values(2, "manish",31);
insert into student values(3, "vishal",33);

select * from student;

insert into student (id,name,age) values (4,"rajani",34), (5,"sagar",32);

create database microapp;
USE microapp;
create table employee (id int primary key, name varchar(100), joining_date date);
insert into employee values (1,"bhm","2022-01-01");
select * from employee;

create table temp1(
id int unique
);

insert into temp1 values(101);
insert into temp1 values(101); #not work because not allow dublicate value in unique constraints

#here we can use second way to define primary key as well as used combination of 2 fild to create primary key. here combination id and name define primary key like 1bhavesh 1raj
create table temp2(
id int,
name varchar(100),
age int,
city varchar(20),
primary key (id, name)
);

#default, check counstraints use
create table city (id int primary key, city varchar(50),name varchar(100) default "bhavesh", age int, constraint age_check check(age >= 18 and city="surat"));

insert into city (id,city,age) values(2,"surat",19);
select * from city;
drop database college;

create database college;
use college;
create table student (rollno int primary key, name varchar(50),marks int not null,grade varchar(1),city varchar(20));
insert into student (rollno, name, marks,grade,city) values (101,"anil",78,"C","pune"),(102,"bhk",93,"A","mumbai"),(103,"chetan",85,"B","mumbai"),(104,"dhruv",96,"F","delhi");
create table dept ( id int primary key, name varchar(50));
create table teacher ( id int primary key, name varchar(50),dept_id int,foreign key(dept_id) references dept(id) );
drop table teacher;
create table teacher ( id int primary key, name varchar(50),dept_id int,foreign key(dept_id) references dept(id) on update cascade on delete cascade);
select rollno, name from student;
select * from student where marks > 80;

select * from student where marks+10 >100;
select * from student where marks between 80 and 90;
select * from student where city in ("delhi","mumbai");
select * from student where city not in ("delhi","mumbai");

select * from student order by marks desc, name asc limit 3;

#foreign key execution -  we can see er diagram . go to database - select reverse engineer - next next upto complete

insert into dept values(101,"english"),(102,"IT");
select * from dept;
insert into teacher values(101,"adam",101),(102,"Eve",102);
select * from teacher;
update dept set id = 103 where id=102;
alter table student add column age int;
alter table student drop column age;
alter table student modify column age varchar(50) default "21";
alter table student change column age ages int default 10;
alter table student rename to stu;
rename table stu to student;
select * from student;
DESCRIBE  student;
alter table student drop column grade;
select * from dept as d inner join teacher as t on d.id = t.dept_id; 
select name, id  from dept union select name, id from teacher;

#MySQL Views
create view view1 as select rollno , name from student;
#used of views
select * from view1;
select * from student;

update view1 set name = "bhk" where rollno = 101;



insert into student values(106,"anil",95,"A","surat",20);

#subquery with select clause
SELECT name,
       (SELECT COUNT(*) FROM student) AS total_students
FROM student;

select name,  (SELECT COUNT(*) FROM student)  from student group by name ; # this is subquery with select clause
select name, count(name) from student group by name; # this is regular group by query

select * from student;

#subquery with from clause
select sum(marks), avg(marks) from (select marks from student order by marks desc limit 2) as toper;

select name, count(*) from student group by name having count(*)>1;#normal group by query with having

#Subquery in FROM Clause (Inline View)
SELECT AVG(marks)
FROM (SELECT marks FROM student ORDER BY marks DESC LIMIT 5) AS top5;

update student set ages = 40 where rollno =106;

#stored Procedures
select * from student;
CALL getStudents(85);

#stored procedures with inout and in parameter
call inandout_procedures(@data,50);
select @data as TotalRecords;



