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


