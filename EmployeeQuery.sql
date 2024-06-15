-- 1) Select first_name, last_name, title, age, salary for everyone in our Employee table.
SELECT first_name,last_name,title,age,salary FROM Employee;

-- 2) Select first_name, age and salary for every one in the employee table.
SELECT first_name, age, salary FROM Employee

-- 3) Select first_name and display it as name for every one in the employee table
SELECT first_name AS [Name] FROM Employee

-- 4) Select first_name and last_name (seperate them with space) as Name for every one in the employee table
SELECT CONCAT(first_name,' ',last_name) AS [Name] FROM Employee

-- 5) Select all columns for everyone with a salary over 38000.
SELECT * FROM Employee WHERE salary > 38000;

--6) Select first name and last name for everyone that's under 24 years old
SELECT first_name, last_name FROM Employee Where age < 24

--7)select first_name, last_name and salary for anyone with programmer in their title.
SELECT first_name,last_name, salary FROM Employee Where LOWER(title) LIKE '%programmer%'

--8) select all columns for everyone whose last name contains 'O'
SELECT * FROM Employee Where last_name LIKE '%O%'

--9) select last name for everyone whose first name equals 'Kelly'
SELECT last_name FROM Employee WHERE LOWER(first_name) = 'kelly'

--10) select all columns for everyone whose last name ends in 'moore'
SELECT * FROM Employee WHERE LOWER(last_name) LIKE '%moore'

--11) select all columns for every one who are 35 and above
SELECT * FROM Employee WHERE age >= 35

-- 12) select first name, last name, age and salary of everyone whose age is above 24 and below 43
SELECT first_name , last_name, age, salary FROM Employee WHERE age > 24 AND age < 43

--13) select first name, title, last name whose age is in the range 28 and 62 and salary greater than 31250
SELECT first_name, title, last_name FROM Employee WHERE age BETWEEN 28 AND 62 AND salary > 31250

--14) Select all columns for everyone whose age is not more than 48 and salary not less than 21520
SELECT * FROM Employee Where age <= 48 AND salary >= 21520

--15)  Select firstname and age of everyone whose firstname starts with "John" and salary in the range 25000 and 35000
SELECT first_name, age FROM Employee WHERE LOWER(first_name) LIKE 'john%' AND salary BETWEEN 25000 AND 35000

--16) Select all columns for everyone by their ages in descending order
SELECT * FROM Employee ORDER BY age DESC

--17) Select all columns for everyone by their ages in ascending order.
SELECT * FROM Employee ORDER BY age

--18) Select all columns for everyone by their salaries in descending order.
SELECT * FROM Employee ORDER BY salary DESC

--19) Select all columns for everyone by their salaries in ascending order.
SELECT * FROM Employee ORDER BY salary

--20) Select all columns for everyone by their salaries in ascending order whose age not less than 17
SELECT * FROM Employee WHERE age >= 17 ORDER BY salary

--21) Select all columns for everyone by their salaries in descending order whose age not more than 34
SELECT * FROM EMployee WHERE age <= 34  ORDER BY salary DESC

--22)  Select all columns for everyone by their length of firstname in ascending order.
SELECT * FROM Employee ORDER BY LEN(first_name);

--23) Select the number of employees whose age is above 45
SELECT COUNT(*) FROM EMployee WHERE age > 45

--24)  Show the results by adding 5 to ages and removing 250 from salaries of all employees
SELECT id, first_name, last_name , age+5 AS [age] , salary - 250 AS [salary], title FROM Employee 

--25) Select the number of employees whose lastname ends with "re" or "ri" or "ks"SELECT COUNT(*) FROM Employee  WHERE LOWER(last_name) LIKE '%re' OR LOWER(last_name) LIKE '%ri' OR LOWER(last_name) LIKE '%ks';

--26)  Select the average salary of all your employees
SELECT AVG(salary) FROM Employee

--27)  Select the average salary of Freshers
SELECT AVG(salary) FROM Employee WHERE LOWER(title) = 'intern'

--28) Select the average age of Programmers
SELECT AVG(age) FROM Employee WHERE LOWER(title) LIKE '%programmer%'

--29) Select the average salary of employees whose age is not less than 35 and not more than 50
SELECT AVG(salary) FROM Employee WHERE age Between 35 AND 50

--30)  Select the number of Freshers
SELECT COUNT(*) FROM EMployee WHERE LOWER(title) = 'intern'

--31) What percentage of programmers constitute your employees
SELECT 
    (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM Employee) AS programmers_percentage
FROM 
    Employee
WHERE 
    LOWER(title) LIKE 'Programmer';
--32) What is the combined salary that you need to pay to the employees whose age is not less than 40
SELECT SUM(salary) FROM Employee WHERE age >= 40

--33) What is the combined salary that you need to pay to all the Freshers and Programmers for 1 month
SELECT SUM(salary) AS total_salary
FROM Employee
WHERE LOWER(title) = 'intern' OR LOWER(title) LIKE '%programmer%';

-- 34) . What is the combined salary that you need to pay to all the Freshers whose age is greater than 27 for 3years
SELECT SUM(salary * 12 * 3) AS total_salary
FROM Employee
WHERE LOWER(title) = 'intern' AND age > 27;

--35) Select the eldest employee's firstname, lastname and age whose salary is less than 35000
SELECT TOP 1 first_name, last_name, age FROM Employee WHERE salary < 35000 ORDER BY age DESC

--36)  Who is the youngest General Manager
SELECT TOP 1 * FROM Employee WHERE LOWER(title) = 'general manager' ORDER BY age

--37) Select the eldest fresher whose salary is less than 35000
SELECT TOP 1 * FROM Employee WHERE salary < 35000 ORDER BY age DESC

--38) Select firstname and age of everyone whose firstname starts with "John" or "Michael" and salary in the range 17000 and 26000
SELECT first_name, age FROM Employee WHERE (LOWER(first_name) LIKE 'john%' OR LOWER(first_name) LIKE 'Michael%' ) AND salary BETWEEN 17000 AND 26000

--39)  How many employees are having each unique title. Select the title and display the number of employees present in ascending order
SELECT COUNT(*) FROM
(SELECT title, COUNT(*) AS num_employees
FROM Employee
GROUP BY title) AS title_counts;

SELECT title, COUNT(*) AS num_employees
FROM Employee
GROUP BY title
ORDER BY num_employees ASC;

--40) What is the average salary of each unique title of the employees. Select the title and display the average salary of employees in each
SELECT title,AVG(salary) AS [Average salary]
FROM Employee
GROUP BY title

--41) What is the average salary of employees excluding Freshers
SELECT AVG(salary) FROM Employee WHERE LOWER(title) <> 'intern'

--42) What is the average age of employees of each unique title.
SELECT title, AVG(age) AS [Average age] FROM Employee GROUP BY title

--43) In the age range of 25 to 40 get the number of employees under each unique title
SELECT title, COUNT(*) AS [Employees age range 25 to 40]
FROM Employee
WHERE age BETWEEN 25 AND 40 
GROUP BY title

--44) Show the average salary of each unique title of employees only if the average salary is not less than 25000
SELECT AVG(salary) AS [Average salary]
FROM Employee
GROUP BY title
HAVING AVG(salary) >= 25000;

--45)  Show the sum of ages of each unique title of employee only if the sum of age is greater than 30
SELECT SUM(age) AS [SUM of ages]
FROM Employee
GROUP BY title
HAVING SUM(age) > 30

--46)  Lisa Ray just got married to Michael Moore. She has requested that her last name be updated to Moore. 
UPDATE Employee
SET last_name = 'Moore'
Where first_name = 'Lisa' AND last_name = 'Ray'

--47) Ginger Finger's birthday is today, add 1 to his age and a bonus of 5000
UPDATE Employee
SET age = age + 1,
    salary = salary + 5000
WHERE first_name = 'Ginger' AND last_name = 'Finger';

--48) All 'Programmer's are now called "Engineer"s. Update all titles accordingly. 
UPDATE Employee
SET title = 'Engineer'
WHERE LOWER(title) LIKE '%programmer%'

--49) Everyone whose making under 30000 are to receive a 3500 bonus. 
UPDATE Employee
SET salary = salary + 3500
WHERE salary < 30000;

--50) Everyone whose making over 35500 are to be deducted 15% of their salaries
UPDATE Employee
SET salary = salary * 0.85
WHERE salary > 35500;

