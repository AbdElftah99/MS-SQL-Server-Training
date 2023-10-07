SELECT *
FROM dbo.Employee
WHERE SSN IN (

SELECT MGRSSN
FROM dbo.Departments
)

;