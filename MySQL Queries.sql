use work;

--to create Department table
create table Department(
     DeptID INT PRIMARY KEY,
     DeptName VARCHAR(20)NOT NULL
     );

--to create Employees table
CREATE TABLE Employees(
     EmpID INT PRIMARY KEY,
     EmpName VARCHAR(20)NOT NULL,
     DeptID INT,
     Salary INT,
     HireData DATE NOT NULL,
     FOREIGN KEY(DeptID)REFERENCES Department(DeptID)
     );

--Insert Department values
INSERT INTO Department VALUES(1,'HR'),
     (2,'IT'),
     (3,'Sales');

--Insert  Employees values 
INSERT INTO Employees VALUES(101,'John',1,50000,'2018-02-12'),
      (102,'Alice',2,60000,'2019-07-10'),
      (103,'Bob',1,55000,'2020-05-05'),
      (104,'Carol',3,45000,'2017-09-20');

-- 1.Display all records from the Employees table.
SELECT * FROM Employees;

-- 2. Display only EmpName and Salary of all employees.
SELECT EmpName,Salary FROM Employees ORDER BY EmpName;

-- 3. Find all employees who belong to the IT department.
SELECT e.EmpID, 
  e.EmpName, 
  e.Salary, 
  e.HireData, 
  d.DeptName  
  FROM Employees AS e 
  INNER JOIN department AS d 
  ON e.DeptID = d.DeptID  WHERE d.DeptName = 'IT';

-- 4. List employees whose salary is greater than 50,000.
SELECT EmpID,EmpName,Salary,HireData FROM Employees WHERE Salary > 50000;

-- 5. Find employees hired before 2020-01-01.
SELECT EmpID,EmpName,Salary,HireData FROM Employees WHERE HireData < '2020-01-01';

-- 6. Display employees in descending order of salary.
SELECT * FROM Employees ORDER BY Salary DESC;

-- 7. Count total number of employees.
SELECT COUNT(*) FROM Employees;

-- 8. Find the average salary of all employees.
SELECT AVG(Salary) AS AVG_Salary FROM Employees;

-- 9. Find the maximum salary in each department.
SELECT DeptID, MAX(Salary) AS MaxSalary  FROM Employees GROUP BY DeptID;

-- 10. Find departments having more than 1 employee.
SELECT DeptID, COUNT(*) AS EmployeeCount FROM Employees GROUP BY DeptID HAVING COUNT(*) > 1;

--11. Display Employees whose names start with 'A' 
SELECT * FROM Employees WHERE EmpName LIKE 'A%';

--12. Find Employees whose salary is between 45,000 and 60,000
SELECT * FROM Employees WHERE Salary BETWEEN 45000 AND 60000;

--13. Show the Department name of each employee(JOIN QUERY)
SELECT e.EmpID,
  e.EmpName,
  e.Salary,
  d.DeptName 
  FROM Employees AS e 
  INNER JOIN Department AS d 
  ON e.DeptID = d.DeptID 
  WHERE e.Salary BETWEEN 45000 AND 60000;

--14. Find the number of employees in each department
SELECT d.DeptName,
  COUNT(e.EmpID) AS NumEmployees 
  FROM Employees AS e 
  INNER JOIN Department AS d 
  ON e.DeptID = d.DeptID GROUP BY d.DeptName;

--15. Display all employees, including those without a department(LEFT JOIN)
SELECT e.EmpID,
  e.EmpName,
  e.Salary,
  d.DeptName 
  FROM Employees AS e 
  LEFT JOIN Department AS d 
  ON e.DeptID = d.DeptID;

