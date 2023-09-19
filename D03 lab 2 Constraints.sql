--DDL
--Instructor Table
--Create
CREATE TABLE Instructor
(
	in_id int ,
	fname nvarchar(30),
	lname nvarchar(30),
	in_bdate date
)

--alter "ADD"
alter table instructor
add in_address nvarchar(60),
in_hiredate date,
in_salary float,
in_overtime float

--Constranint & Defaults
--1- Check Value
alter table instructor
add constraint chk_addess check(in_address in('cairo','alex'))

--2- Primary Key
alter table instructor
add constraint in_Pk primary key (in_id)

--3- Salary Default value
alter table instructor
add constraint default_sal default 3000 for in_salary

--4- SaLary Range
alter table instructor
add constraint chk_salary check (in_salary between 1000 and 5000)

--5- Unique OverTime
alter table instructor
add constraint unique_OverTime unique (in_overtime)

--6- Hire Date
alter table instructor
add constraint default_hiredate default getdate() for hiredate

--Alters
--1 Net Salary
alter table instructor
add NetSal as in_salary + in_overtime

--2 Get Age
ALTER TABLE Instructor
ADD Age AS (YEAR(GETDATE()) - YEAR(Birthdate))

-------------------------------
--Course Table
--Create
Create table courses
(		
	CID int identity primary key,
	c_name varchar(50), 
	c_Duration int 
)

alter table courses
add constraint unique_Duration unique (c_Duration)

-------------------------------
--Lab Table
--Create
Create table lab
(
	crs_id int identity,
	lid int identity,
	location varchar(50),
	capacity int
	constraint T_PK Primary Key (crs_id,lid),
	constraint T_FK Foreign Key (crs_id) references courses (CID) on delete set null
	on update cascade
)

-------------------------------
--Teach table
--Create
Create table teach
(
	ins_id int ,
	crs_id int identity,
	constraint T_pk primary key ( ins_id , crs_id),
	constraint I_fk foreign key (ins_id) references Instructor (in_id),
	constraint cid_fk foreign key (crs_id) references courses (CID)
	on delete set null
	on update cascade
)