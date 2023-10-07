SELECT e.Fname, e.Lname, d.Dname
FROM dbo.Employee e
JOIN dbo.Departments d
	ON e.Dno = d.Dnum;