create database company_DB;
use company_DB;

create table Departments(
DepartmentID int primary key,
DepartmentName varchar(255)
);
insert into Departments (DepartmentID,DepartmentName) values
(1,'IT'),
(2,'Marketing'),
(3,'Finance'),
(4,'HR'),
(5,'Operations');

select * from Departments;

create table Employees(
EmployeeID int primary key identity,
FirstName varchar(255),
LastName varchar(255),
DepartmentID int ,
Salary decimal(10,2),
foreign key (DepartmentID) references Departments (DepartmentID)
);

alter table Employees add HireDate datetime;

insert into Employees(FirstName,LastName,DepartmentID,Salary,HireDate) values
('James','John',1,60000.00,'2023-02-21'),
('Taylor','Swift',3,55000.00,'2023-01-01'),
('Billie','Eilish',null,null,null),
('Lana','Delray',5,75000.00,'2023-07-11'),
('Olivia','Rodrigo',2,70000.00,'2024-01-02'),
('John','Doe',3,35000.00,'2022-12-23'),
('David','Johnson',4,20000,'2023-11-23'),
('Emily','Brown',3,25000.00,'2022-11-01'),
('Jane','Anderson',1,65000.00,'2024-01-03'),
('Sarah','Thomas',1,50000,'2023-08-25');

select * from Employees;

--Queries
--1)
update Employees set Salary =Salary*1.1 where DepartmentID =1;
select * from Employees;
--2)
delete from Employees where Salary <30000;
select * from Employees;
--3)
select emp.FirstName, emp.LastName, dept.DepartmentName, emp.Salary from Employees emp 
inner join Departments dept on emp.DepartmentID=dept.DepartmentID;
--4)
select dept.DepartmentName, COUNT(emp.EmployeeID) as NumberOfEmployees from Departments dept 
left join Employees emp on dept.DepartmentID=emp.DepartmentID group by dept.DepartmentName;
--5)
select emp.FirstName, emp.LastName, emp.HireDate from Employees emp 
inner join Departments dept on emp.DepartmentID=dept.DepartmentID where emp.HireDate > '2023-01-01';