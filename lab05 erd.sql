--instructor table
create table instructor
(in_id int, fname nvarchar(30), lname nvarchar(30) , in_bdate date)

alter table instructor
alter column in_id int not null

alter table instructor
add in_address nvarchar(60), in_hiredate date, in_salary float, in_overtime float

alter table instructor
add constraint i_pk primary key (in_id)

alter table instructor
add constraint chk_addess check(in_address in('cairo','alex')

--get age
ALTER TABLE Instructor
ADD Age AS (YEAR(GETDATE()) - YEAR(Birthdate))

--salary available range
alter table instructor
add constraint salary_chk check (salary between 1000 and 5000 )

--salary default value
alter table instructor
add constraint salary2_chk default 3000 for salary

--netsalary drived table
ALTER TABLE Instructor
ADD Netsalary AS (Salary + Overtime);

--over time is unique
alter table instructor
add constraint over_chk unique (overtime)

--create courses table
Create table Courses
( CID int identity primary key ,
c_name varchar(50) , 
c_Duration int )

--create lab table
Create Table Lab_course
(C_CID int identity , 
LID int identity, 
Lab_Location varchar(50) , 
capacity int,
constraint lab_PK primary key (C_CID , LID) ,
constraint C_FK foreign key (C_CID) references Courses (CID)
on delete cascade on update cascade
) 

--create teach table
Create table teach 
(In_ID int , C_CID int ,
constraint T_pk primary key ( In_ID , C_CID),
constraint I_fk foreign key (In_Id) references instructor (in_ID),
constraint cid_fk foreign key (C_CID) references courses (CID)
on delete cascade on update cascade)

--Capacity of each lab under 20 seats
Alter table lab_course
add constraint cap_chk check (capacity < 20)

--Hiredate has a default value = current system data
Alter table instructor
add constraint Hd_chk default getdate() for hiredate

--Duration of each course is unique
Alter table courses
add constraint course_chk unique (duration)
