--1
Select count(*) 
from Student
where St_Age is not null

--2
Select distinct ins_name
from Instructor

--3
SELECT St_Id, CONCAT(St_Fname,' ', St_Lname) AS 'Full Name', 
ISNULL(Department.Dept_Name, ' ') AS 'Department name'
FROM Student 
LEFT JOIN Department ON Student.Dept_ID = Department.Dept_Id

--4
SELECT Instructor.Ins_Name, ISNULL(Department.Dept_Name, ' ') AS 'Department Name'
FROM Instructor 
LEFT JOIN Department ON Instructor.Dept_ID = Department.Dept_Id

--5
SELECT CONCAT(St_Fname,' ', St_Lname) AS 'Student Full Name', Crs_Name
FROM Student s, course c , Stud_Course sc
where sc.Crs_Id = c.Crs_Id and sc.St_Id = s.St_Id
and sc.Grade IS NOT NULL

select isnull(St_Fname,' ')+' '+isnull(St_Lname,' ') as "fullname",Crs_Name
from Student S,Course C,Stud_Course Sc
where Sc.Crs_Id=C.Crs_Id
And Sc.St_Id=S.St_Id and Grade Is Not Null


--6
SELECT Top_Name, COUNT(*) as Num_Courses
FROM Course c , Topic t
where t.Top_Id = c.Top_Id
GROUP BY Top_Name

--7
select MAX(Salary) MaxSal,MIN(Salary) MinSal
from Instructor


--8
SELECT Ins_Name, Salary
FROM Instructor
WHERE Salary < (SELECT AVG(Salary) FROM Instructor)

--9
SELECT Dept_Name
FROM Department
JOIN Instructor ON Department.Dept_ID = Instructor.Dept_ID
WHERE Salary = (SELECT MIN(Salary) FROM Instructor)

--10
SELECT top(2)(salary) FROM Instructor

--11
SELECT Ins_Name, COALESCE(convert(varchar(10),Salary), 'bonus')
FROM Instructor;

--12
select avg(is null(salary,0))
from instructor

--13
select s.st_fname, sup.*
from student s , student sup
where s.St_super = sup.St_Id


