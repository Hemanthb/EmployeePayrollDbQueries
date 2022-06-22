--CREATE DATABASE EmployeePayrollDatabase;

--USE EmployeePayrollDatabase;

--CREATE TABLE EmployeePayroll (EmpId int IDENTITY(1,1) PRIMARY KEY,EmpName VARCHAR(30),Salary INT,StartDate DATE);

--INSERT INTO Employeepayroll(EmpName,Salary,StartDate) VALUES('jaikumar',25000,'2021-08-21');
--INSERT INTO Employeepayroll(EmpName,Salary,StartDate) VALUES('Rohan',45000,'2022-08-01');

--SELECT * FROM EmployeePayroll;

--SELECT * FROM EmployeePayroll WHERE EmpName = 'jaikumar';

--SELECT * FROM EmployeePayroll WHERE StartDate BETWEEN '2021-07-21' AND CAST(GETDATE() AS DATE);

--ALTER TABLE EmployeePayroll ADD Gender char;

--UPDATE EmployeePayroll SET Gender = 'M' WHERE EmpName='jaikumar' OR EmpName ='sathish' OR EmpName ='Rohan';

--UPDATE EmployeePayroll SET Gender = 'F' WHERE StartDate = '2021-07-01';

--SELECT * FROM EmployeePayroll;

--SELECT MIN(Salary) FROM EmployeePayroll WHERE Gender='M';

--SELECT MAX(Salary) FROM EmployeePayroll WHERE Gender='F';

--SELECT SUM(Salary) FROM EmployeePayroll GROUP BY Gender;

--SELECT AVG(Salary) FROM EmployeePayroll WHERE Gender='M';

--SELECT COUNT(EmpName) FROM EmployeePayroll WHERE Gender='M';

--use EmployeePayrollDatabase;

--SELECT * FROM EmployeePayroll;

ALTER TABLE EmployeePayroll ADD EmpPhNo VARCHAR(255),EmpAddress VARCHAR(255);

ALTER TABLE EmployeePayroll DROP COLUMN EmpAddress;

ALTER TABLE EmployeePayroll ADD EmpAddress VARCHAR(255) NOT NULL DEFAULT 'chennai',EmpDept VARCHAR(30) NOT NULL DEFAULT 'Engineering';

SELECT * FROM EmployeePayroll;

-- UC-> 9 --
ALTER TABLE EmployeePayroll ADD BasicPay FLOAT,Deductions FLOAT,TaxablePay FLOAT,IncomeTax FLOAT,NetPay FLOAT;

-- UC -> 10 --

INSERT INTO EmployeePayroll VALUES
('Terissa',35000, '2019-10-03','F',9989899810, 'Chennai', 'Marketing',35000, 3000, 1000, 100, 30900);

INSERT INTO EmployeePayroll VALUES
('Terissa',35000, '2019-10-03','F',9989899810, 'Chennai', 'Sales',35000, 3000, 1000, 100, 30900);

-- UC -> 11 -- ER QUERIES --

CREATE TABLE Department(DeptId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,DeptName VARCHAR(50) NOT NULL);

INSERT INTO Department(DeptName) VALUES
('Marketing'),
('Sales'),
('Development'),
('Testing');

ALTER TABLE EmployeePayroll ADD
Payroll_id INT FOREIGN KEY REFERENCES EmployeePayroll(EmpId);

CREATE TABLE EmpPayrollDetails (Payroll_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),BasicPay FLOAT,Deductions FLOAT,TaxablePay FLOAT,IncomeTax FLOAT,NetPay FLOAT);

select * from EmployeePayroll;

ALTER TABLE EmployeePayroll DROP COLUMN Deductions,TaxablePay,IncomeTax,NetPay;

INSERT INTO EmpPayrollDetails VALUES(32000,5000,27000,1000,26000),(40000,5000,35000,2000,33000);

create table EmployeeDepts(
EmpId int not null Foreign key references EmployeePayroll(EmpId),
DeptId int not null Foreign key references Department(DeptId) 
);

UPDATE EmployeePayroll SET Payroll_id = 1 WHERE EmpId BETWEEN 1 AND 4;

UPDATE EmployeePayroll SET Payroll_id = 2 WHERE EmpId BETWEEN 5 AND 6;

UPDATE EmployeePayroll SET Payroll_id = 3 WHERE EmpName = 'Terissa';

SELECT * FROM Department;

INSERT INTO EmployeeDepts VALUES (1,4),(2,3),(3,3),(4,3),(5,2),(6,4),(7,1),(8,2);

SELECT * FROM EmployeeDepts;

-- UC -> 12 ---

SELECT EmpId,EmpName,EmpAddress,BasicPay,NetPay FROM EmployeePayroll,EmpPayrollDetails WHERE EmployeePayroll.Payroll_id=EmpPayrollDetails.payroll_id;

select Emp_id,Emp_Name,Income_Tax from EmployeeDetails,employee_payroll where Start_Date between CAST('1900-01-01' as date) and GETDATE() and  
EmployeeDetails.Payroll_id=employee_payroll.id;
