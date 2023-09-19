--Company
--1.	Display the Department id, name and id and the name of its manager
select d.Dnum as 'Dep Id', d.Dname as 'Dep Name' , e.SSN  as 'manager Id', e.Fname + ' ' + e.Lname as 'Manager Name'
from Departments d , Employee e
where d.MGRSSN = e.SSN

--2.	Display the name of the departments and the name of the projects under its control.
select d.Dname as 'Dep Name' , p.Pname as 'Project Name'
from Departments d , Project p
where d.Dnum = p.Dnum
--Or using inner join
select d.Dname as 'Dep Name' , p.Pname as 'Project Name'
from Departments d
Inner Join Project p
on d.Dnum = p.Dnum


--3.	Display the full data about all the dependence associated with the name of the employee they depend on him/her.
select d.* , e.Fname 'Employee Name'
from Dependent d , Employee e
where d.ESSN = e.SSN

--Or using Inner Join
select d.* , e.Fname 'Employee Name'
from Dependent d 
Inner Join Employee e
on d.ESSN = e.SSN

--4.	Display the Id, name and location of the projects in Cairo or Alex city.
select Pnumber as 'Project ID' , Pname as 'Project name' , Plocation as 'Project Location'
from Project
--Apply Condition using in
--where City in ('Cairo' , 'Alex')
--Apply Condition using Or
where City = 'Alex' or City = 'Cairo'

--5.	Display the Projects full data of the projects with a name starts with "a" letter.
select *
from Project
where Pname like 'a%'

--6.	display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
select *
from Employee e 
where e.Dno = 30 and e.Salary <2000 and e.Salary >1000

--7.	Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.
select e.Fname 'Employee Name'
from Employee e , Project p , Works_for w
where w.Pno = p.Pnumber    --join works for and projecct
and e.SSN = w.ESSn         --join works for and employee
and Dnum = 10
and p.Pname = 'AL Rabwah'
and w.Hours >= 10

--8.	Find the names of the employees who directly supervised with Kamel Mohamed
select e.Fname + ' ' + e.Lname as 'Employee Name' , s.Fname + ' ' + s.Lname as 'Superviser Name'
from Employee e , Employee s
where e.Superssn = s.SSN
and s.Fname = 'Kamel'
and s.Lname = 'Mohamed'

--9.	Retrieve the names of all employees and the names of the projects they are working on, sorted by the project name.
select distinct e.Fname + ' ' + e.Lname as 'Employee Name' , p.Pname as 'Project Name' , City
from Employee e , Project p , Works_for w
where e.SSN = w.ESSn
and w.Pno = p.Pnumber
order by p.Pname

--10.	For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.
select p.Pnumber 'Project Number' , d.Dname 'Controlling Department Name' , e.Lname as 'Mgr Last Name' , e.Address , e.Bdate
from Project p , Departments d ,Employee e
where e.SSN = d.MGRSSN
and p.Dnum = d.Dnum
and p.City like 'Cairo'

--Or using inner joins
SELECT p.Pnumber, d.Dname , e.Lname, e.Address, e.Bdate 
FROM Project p
inner join  Departments d on p.Dnum = d.Dnum
inner join  employee e on d.MGRSSN = e.ssn
WHERE p.City = 'Cairo'

--11.	Display All Data of the managers
select e.*
from  Departments d ,Employee e
where e.SSN = d.MGRSSN

--12.	Display All Employees data and the data of their dependents even if they have no dependents
--Lets First Show the data if employee have dependet
select e.* , d.*
from Employee e , Dependent d
where e.SSN = d.ESSN
--if they have no dependents
select e.* , d.*
from Employee e
left outer join Dependent d
on e.SSN = d.ESSN

------------------------------
--Some DML Queries
--13.	Insert your personal data to the employee table as a new employee in department 
insert into Employee 
(Dno , SSN , Superssn , Salary)
values (30 , 1001 , 101 , 15000)

--14.	Upgrade your salary by 20 % of its last value.
update Employee 
set Salary *= 1.2
where SSN = 1001
