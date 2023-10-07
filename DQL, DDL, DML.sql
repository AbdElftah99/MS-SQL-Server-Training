--DQL Example

SELECT * FROM dbo.Employee;

-- DDL Example

CREATE TABLE employees (
	id INT PRIMARY KEY,
	name VARCHAR(100),
	age INT,
	department VARCHAR(50)

);

-- DML Example

INSERT INTO dbo.employees (id, name, age, department)
VALUES (1, 'John Doe', 38, 'HR');