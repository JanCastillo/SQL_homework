CREATE TABLE "Departments" (
    "depart_ID" VARCHAR   NOT NULL,
    "depart_Name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "depart_ID"
     )
);

CREATE TABLE "Salaries" (
    "employee_ID" INTEGER   NOT NULL,
    "salary" NUMERIC   NOT NULL,
    "start_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL
);

CREATE TABLE "Titles" (
    "employee_ID" INTEGER   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "start_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL
);

CREATE TABLE "Employees" (
    "employee_ID" INTEGER   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "employee_ID"
     )
);

CREATE TABLE "Dept_Manager" (
    "department" VARCHAR   NOT NULL,
    "employee_ID" INTEGER   NOT NULL,
    "start_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL
);

CREATE TABLE "Dept_Employee" (
    "employee_ID" INTEGER   NOT NULL,
    "department" VARCHAR   NOT NULL,
    "start_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL
);

SELECT * FROM "Departments";
SELECT * FROM "Dept_Employee";
SELECT * FROM "Dept_Manager";
SELECT * FROM "Employees";
SELECT * FROM "Salaries";
SELECT * FROM "Titles";

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e."employee_ID", e."last_name", e."first_name", e."gender", s."salary"
FROM "Employees" e
JOIN "Salaries" s
ON e."employee_ID" = s."employee_ID";

-- 2. List employees who were hired in 1986.

SELECT * FROM "Employees"
WHERE date_part('year', "hire_date") = 1986;

-- 3. List the manager of each department with the following information: 
--    department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT m."department", d."depart_Name", m."employee_ID", e."last_name", e."first_name", m."start_date", m."end_date"
FROM "Dept_Manager" m
JOIN "Employees" e
ON m."employee_ID" = e."employee_ID"
JOIN "Departments" d
ON m."department" = d."depart_ID";

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

CREATE VIEW "Emp_Dept" AS
SELECT de."employee_ID", e."last_name", e."first_name", d."depart_Name"
FROM "Dept_Employee" de
JOIN "Employees" e
ON de."employee_ID" = e."employee_ID"
JOIN "Departments" d
ON de."department" = d."depart_ID";

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM "Employees"
WHERE "first_name" LIKE 'Hercules' AND "last_name" LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT * FROM "Emp_Dept"
WHERE "depart_Name" LIKE 'Sales';

-- 7. List all employees in the Sales and Development departments, 
--    including their employee number, last name, first name, and department name.

SELECT * FROM "Emp_Dept"
WHERE "depart_Name" LIKE 'Sales' OR "depart_Name" LIKE 'Development';

-- 8 In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT "last_name", COUNT("last_name") AS "last_names_count"
FROM "Employees"
GROUP BY "last_name"
ORDER BY "last_names_count" DESC;