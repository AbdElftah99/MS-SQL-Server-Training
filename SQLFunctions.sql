-- important functions
-- AGGREGATE FUNCTIONS
SELECT COUNT(Fname) FROM dbo.Employee;

SELECT SUM(Salary) FROM dbo.Employee;

SELECT AVG(Salary) FROM dbo.Employee;

SELECT MIN(Salary) FROM dbo.Employee;

SELECT MAX(Salary) FROM dbo.Employee;

SELECT Salary, COUNT(Salary) AS CountSalary, SUM(Salary) AS SumSalary, AVG(Salary) AS AvgSalary, MIN(Salary) AS MinSalary, MAX(Salary) AS MaxSalary

FROM dbo.Employee GROUP BY Salary;

-- STRING FUNCTIONS
-- CONCAT() is used to concatenate two or more strings together
SELECT CONCAT(Fname, Lname) FROM dbo.Employee;

SELECT UPPER(Fname) FROM dbo.Employee;

SELECT LOWER(Fname) FROM dbo.Employee;

SELECT LENGTH(Fname) FROM dbo.Employee;

 -- TRIM() is used to remove leadig or trailling spaces from a string
SELECT TRIM(Fname) FROM dbo.Employee;

-- SUBSTRING() used to extract a substring from a larger string
SELECT SUBSTRING(Fname, 0, 4) FROM dbo.Employee;

SELECT REPLACE(Fname, 'h', 'c') FROM dbo.Employee;

-- DATE FUNCTIONS
-- GETDATE() returns the current date and time
SELECT GETDATE() FROM dbo.Employee;

-- DATEPART() is used to extract a specific part of date, such as 'year, month, day'
SELECT DATEPART(YEAR, Bdate) FROM dbo.Employee;

-- DATEADD() is usred to add a specifird number of unites to a date or time value
SELECT DATEADD(YEAR, 3 ,Bdate) FROM dbo.Employee;

-- DATEDIFF() is used to calculate the differance between two dates or time values
SELECT DATEDIFF(YEAR, Bdate, Bdate) FROM dbo.Employee;

-- YEAR() is used to extract the year frome a date value
SELECT YEAR(Bdate) FROM dbo.Employee;