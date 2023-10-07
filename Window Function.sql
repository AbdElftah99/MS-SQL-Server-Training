-- Window Function Example

SELECT Fname , Salary,

RANK() OVER (ORDER BY Salary DESC) AS salary_rank,
DENSE_RANK() OVER (ORDER BY Salary DESC) AS salary_dense_rank, 
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS salary_rank

FROM dbo.Employee;