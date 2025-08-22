--  ## Easy Level

CREATE TABLE Employee (emp_id INT);

INSERT INTO Employee VALUES 
(2),
(4),
(4),
(6),
(6),
(7),
(8),
(8);

SELECT MAX(emp_id) AS [Greatest Unique ID] FROM Employee
WHERE emp_id IN
(SELECT emp_id FROM Employee GROUP BY emp_id HAVING COUNT(emp_id) = 1);


--  ## Medium Level

CREATE TABLE Department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employee (
    id INT,
    name VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(id)
);

INSERT INTO Department (id, dept_name) VALUES
(1, 'IT'),
(2, 'SALES');

INSERT INTO Employee (id, name, salary, dept_id) VALUES
(1, 'JOE', 70000, 1),
(2, 'JIM', 90000, 1),
(3, 'HENRY', 80000, 2),
(4, 'SAM', 60000, 2),
(5, 'MAX', 90000, 1);

SELECT E.name, E.salary, D.dept_name, D.id FROM
Employee AS E
INNER JOIN
Department AS D
ON E.dept_id = D.id
WHERE E.salary IN (SELECT MAX(salary) FROM Employee AS E2 WHERE E2.dept_id = E.dept_id)
ORDER BY D.dept_name;


--  ## Hard Level

CREATE TABLE Employee_1 (
	id INT PRIMARY KEY,
	name VARCHAR(20),
	salary INT
);

INSERT INTO Employee_1 VALUES
(1, 'AA', 1000),
(2, 'BB', 300);

CREATE TABLE Employee_2 (
	id INT PRIMARY key,
	name VARCHAR(20),
	salary INT
);

INSERT INTO Employee_2 VALUES
(2, 'BB', 400),
(3, 'CC', 100);

SELECT id, MIN(name), MIN(salary) AS min_salary
FROM (
    SELECT * FROM Employee_1
    UNION
    SELECT * FROM Employee_2
) AS SQ
GROUP BY id;
