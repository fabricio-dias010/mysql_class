USE employees;

SELECT * FROM employees;

/*Selecionar os trabalhadores do gênero Masculino*/

SELECT * FROM employees WHERE gender = 'M';
SELECT * FROM employees WHERE gender = 'F';
SELECT * FROM employees WHERE last_name = "Koblick" AND gender = "F";

SELECT first_name, last_name, gender FROM employees WHERE emp_no = 491008;

SELECT * FROM salaries;

SELECT * FROM salaries WHERE salary >= 155000;

/*DISTINCT*/
SELECT DISTINCT gender FROM employees;

SELECT * FROM titles;
SELECT DISTINCT title FROM titles;

SELECT * FROM salaries WHERE salary > 145000 AND from_date > "1998-12-12";
SELECT * FROM titles WHERE title = "Senior Engineer" OR title = "Staff";
SELECT * FROM titles WHERE NOT title = "Staff" AND NOT title = "Senior Staff";

/*ORDER BY*/
SELECT * FROM titles WHERE title = "Senior Staff" OR title = "Staff" ORDER BY emp_no ASC;

SELECT emp_no, salary FROM salaries ORDER BY salary DESC;

SELECT first_name, last_name
FROM employees
ORDER BY
first_name,
last_name DESC;
/*-----------------------------------------------------------------------------------*/
/* Funções */
/*MIN*/
SELECT salary FROM salaries ORDER BY salary LIMIT 1;
SELECT MIN(salary) AS Menor_Salário FROM salaries;

/*MAX*/
SELECT salary FROM salaries ORDER BY salary DESC LIMIT 1;
SELECT MAX(salary) AS Maior_Salário FROM salaries;

/*COUNT - CONTAGEM*/
SELECT * FROM employees;
SELECT COUNT(*) AS Homens FROM employees WHERE gender = "M";
SELECT COUNT(*) AS Mulheres FROM employees WHERE gender = "F";
SELECT COUNT(*) FROM employees;

/*AVG - Média*/
SELECT AVG(salary) AS Salário_Média FROM salaries;
SELECT AVG(salary) AS Salário_Média FROM salaries WHERE salary >= 30000 AND salary <= 40000;
SELECT COUNT(*) AS Salário_Média FROM salaries WHERE salary >= 30000 AND salary <= 40000;

/*SUM - SOMA*/
SELECT SUM(salary) AS Salário_Soma FROM salaries;
SELECT SUM(salary) AS Salário_Soma FROM salaries WHERE salary >= 30000 AND salary <= 40000;

/*LIKE*/

SELECT * FROM employees WHERE first_name LIKE "%ber%";
SELECT * FROM employees WHERE last_name LIKE "%mc%" AND gender = "M" ORDER BY last_name DESC;
SELECT COUNT(*) AS Empregados_MC_Em_Quaquer_Lugar FROM employees WHERE last_name LIKE "%mc%";
SELECT COUNT(*) AS Empregados_MC_Em_Quaquer_Lugar FROM employees WHERE last_name LIKE "mc%";
SELECT COUNT(*) AS Empregados_MC_Em_Quaquer_Lugar FROM employees WHERE last_name LIKE "%mc";

/*IN*/

SELECT * FROM dept_emp;
SELECT * FROM dept_emp WHERE dept_no IN('d002','d005','d007');
SELECT * FROM dept_emp WHERE dept_no IN('d004','d005','d008') ORDER BY dept_no ASC;

SELECT * FROM departments;
SELECT * FROM departments WHERE dept_name IN('Marketing', 'Finance') ORDER BY dept_no ASC;

/*BETWEEN*/
SELECT * FROM dept_emp;
SELECT * FROM dept_emp WHERE dept_no BETWEEN 'd002' AND 'd004' ORDER BY emp_no;

/*ALIAS*/
SELECT SUM(salary) AS Soma_Salário_Empresa FROM salaries;
SELECT * FROM departments;
SELECT
dept_no AS Número_Departamento,
dept_name AS Nome_Departamento
FROM departments
ORDER BY 
Número_Departamento;

/*INDEX*/

SELECT first_name FROM employees;

CREATE INDEX primeiro_nome
ON employees(first_name);

DROP INDEX primeiro_nome
ON employees;
