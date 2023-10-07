SELECT AVG(e.Salary) AS salary, d.Dname
FROM dbo.Employee e
JOIN dbo.Departments d
	ON e.Dno = d.Dnum
GROUP BY d.Dname ;


