select fname,lname , sum(hours)
from Employee,Works_for
where essn = ssn
group by Fname,Lname

--1Display (Using Union Function)
--a.the name and the gender of the dependence that's gender is Female and depending on Female Employee.
--b.And the male dependence that depends on Male Employee.

select Dependent_name, d.sex , e.fname
from dependent d inner join Employee e on SSN = ESSN
where d.Sex = 'f' and e.Sex = 'f'
union
select Dependent_name, d.sex , e.fname
from dependent d inner join Employee e on ssn = ESSN
where d.Sex = 'm' and e.Sex = 'm'

--1 other solution
SELECT dp.dependent_name, dp.Sex 
from dependent as dp, employee as e where dp.ESSN=e.SSN and e.sex = 'F' and dp.sex = 'F'
UNION 
SELECT dp.dependent_name, dp.Sex 
from dependent as dp, employee as e where dp.ESSN=e.SSN and e.sex = 'M' and dp.sex = 'M'; 


--2For each project, list the project name and the total hours per week (for all employees) spent on that project.
 SELECT Pname, sum(Hours) AS [Total_Hours]
FROM works_for AS w, project AS p
WHERE w.pno=p.pnumber
GROUP BY pname;


--Display the data of the department which has the smallest employee ID over all employees' ID.
SELECT d.*
FROM Departments as d, Employee e
where d.Dnum = e.Dno
and e.ssn in (select top(1) ssn
 FROM employee
 ORDER BY SSN asc)

--For each department, retrieve the department name and the maximum, minimum and average salary of its employees. 
SELECT d.Dname, MAX(e.salary) AS max_salary, MIN(e.salary) AS min_salary, AVG(e.salary) AS avg_salary
FROM departments d
INNER JOIN employee e ON d.Dnum = e.Dno
GROUP BY d.Dname;

--5List the full name of all managers who have no dependents.
SELECT e.fname+e.lname AS FullName
FROM employee AS e, departments AS d
WHERE e.ssn=d.mgrssn
and e.ssn NOT IN (select ESSN  from dependent);

--5 other solution
SELECT e.fname+e.lname AS FullName
FROM employee AS e, departments AS d
WHERE e.ssn=d.mgrssn
except 
SELECT e.fname+e.lname AS FullName
FROM employee AS e, Dependent AS dp
WHERE e.ssn=dp.ESSN


--6For each department-- if its average salary is less than the average salary of all employees-- display its number, name and number of its employees.
select dnum, dname ,count (ssn) "number of employees"
from Departments d inner join employee e on d.Dnum = e.Dno 
group by dnum,Dname
having avg(e.salary) < (select avg (salary) from employee)  --subquery to get the salary less than avg of another salries 

--7Retrieve a list of employees names and the projects names they are working on ordered by department number and within each department, ordered alphabetically by last name, first name.
SELECT fname,lname, Pname
FROM employee , Project , Works_for
where ssn = essn and pno = Pnumber
ORDER BY Dno , fname,Lname asc

--8Try to get the max 2 salaries using subquery
Select max(salary)
From employee
Union
Select max(salary)
From employee
Where salary !=(select max(salary) From employee)

--Get the names of employees that is similar to any dependent name
Select Concat(fname,' ',Lname) " Employee Full Name"
From employee
Intersect
Select dependent_name
From dependent


select fname
from employee
where salary in 
(select top(2) salary 
from employee 
where Fname is not null
order by salary desc)

--9Get the names of employees that is similar to any dependent name
SELECT DISTINCT Concat(fname,' ',Lname) " Employee Full Name"
FROM  Employee , Departments
Where CONCAT(fname,' ',Lname) IN (select Dependent_name from Dependent)

--10Display the employee number and name if at least one of them have dependents  (use exists) self-study.
select fname , lname ,ssn
from employee
where exists(select *
from Dependent)

--10 other solution
Select ssn,fname
From employee
Where exists (select essn from dependent) 

--11
INSERT INTO departments (Dnum, Dname, MGRSSN, [MGRStart Date])
VALUES (100, 'DEPT IT', 112233, '2006-11-01')

--12
UPDATE departments SET MGRSSN = 968574 WHERE Dnum = 100 
UPDATE departments SET MgrSSN = 102672 WHERE dnum=20;
UPDATE employee SET superssn = 102672 WHERE SSN = 102660

--13
update departments set mgrssn = 102672 where mgrssn = 223344
update employee set Superssn = 102672 where superssn = 223344
update Works_for set essn = 102672 where essn = 223344
delete from employee where ssn = 223344
DELETE  FROM dependent WHERE ESSN=223344;
DELETE  FROM works_for WHERE ESSN=223344;
DELETE  FROM EMPLOYEE WHERE fname='Kamel' and lname='Mohamed';


--14 using join

Update employee
Set salary=salary*1.30
From employee,works_for,project
Where ssn=essn and pno=pnumber and pname='Al Rabwah'

--14 using subquery
UPDATE employee
SET salary = salary * 1.3
WHERE ssn IN (
SELECT essn
FROM Works_for
WHERE pno IN 
(SELECT pnumber
FROM project
WHERE pname = 'Al Rabwah'))

select d.*
from Departments d
where d.Dnum not in
(
select dno
from employee
where dno is not null
)