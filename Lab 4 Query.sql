--Problem 1

select Dependent_name, d.Sex , e.Fname " Employer name"
From Dependent d INNER JOIN Employee e ON SSN=ESSN
where d.Sex = 'F' AND e.Sex = 'F'
Union
select Dependent_name, d.Sex , e.Fname " Employer name"
From Dependent d INNER JOIN Employee e ON SSN=ESSN
where d.Sex = 'M' AND e.Sex = 'M'

--Problem 2

Select Pname,SUM(Hours)
From Project INNER JOIN Works_for ON Pno=Pnumber
Group by Pname

--Problem 3

select * from Departments INNER JOIN Employee ON Dnum=Dno
Where SSN= (Select top(1) SSN 
from Employee
Order by SSN asc)

--Problem 4

select Dname , avg(salary), Max(salary),Min(salary)
from Departments INNER JOIN Employee ON Dno=Dnum
Group By Dname

--Problem 5

select Fname "MANAGER NAME"
from Employee INNER JOIN Departments ON MGRSSN=SSN
EXCEPT
(select Fname from Employee INNER JOIN Dependent ON ESSN=SSN)

--Problem 6

SELECT 
 d.Dname, d.Dnum , count (ssn) " number of employees"
FROM 
  Departments d INNER JOIN employee e ON d.Dnum = e.Dno
GROUP BY 
  d.Dnum , d.Dname
HAVING 
  AVG(salary) < (
    SELECT 
      AVG(salary) 
    FROM 
      employee)

--Problem 7

SELECT e.lname, e.fname, p.pname
FROM employee e
JOIN project p ON e.Dno = p.Dnum
ORDER BY e.Dno ASC, e.Lname ASC, e.Fname ASC;

--Problem 8

SELECT salary
FROM employee
WHERE salary IN (SELECT top(2)(salary) FROM employee Where salary is not null)

--Problem 9 
SELECT DISTINCT
 Concat(fname,' ',Lname) " Employee Full Name"
FROM  Employee 
Where CONCAT(fname,' ',Lname) IN (select Dependent_name from Dependent)

--Problem 11

INSERT INTO Departments(Dnum, Dname, MGRSSN, [MGRStart Date])
VALUES (100, 'DEPT IT', '112233', '2006-11-01')

--Problem 12

UPDATE departments  SET MGRSSN = '968574' Where Dnum = 100
Insert into Employee(Fname,Lname,SSN,Dno) VALUES ('Mohamed','Aly','102672',20)
UPDATE Employee SET Superssn='102672' Where SSN='102660' 

--Problem 13

Update employee set superssn ='102672' where Superssn='223344'
Update Departments set MGRSSN = '102672' where MGRSSN='223344'
Update Works_for set ESSn ='102672' where ESSn='223344'
DELETE FROM employee WHERE ssn = '223344'

--Problem 14 

UPDATE employee
SET salary = salary * 1.3
WHERE ssn IN (
	SELECT essn
	FROM Works_for
	WHERE pno IN 
						(
			SELECT pnumber
			FROM project
			WHERE pname = 'Al Rabwah'
						)
			 )