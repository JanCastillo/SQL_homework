-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "depart_ID" INTEGER   NOT NULL,
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
    "department" INTEGER   NOT NULL,
    "employee_ID" INTEGER   NOT NULL,
    "start_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL
);

CREATE TABLE "Dept_Employee" (
    "employee_ID" INTEGER   NOT NULL,
    "department" INTEGER   NOT NULL,
    "start_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL
);

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_salary" FOREIGN KEY("salary")
REFERENCES "Employees" ("employee_ID");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_title" FOREIGN KEY("title")
REFERENCES "Employees" ("employee_ID");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_department" FOREIGN KEY("department")
REFERENCES "Departments" ("depart_ID");

ALTER TABLE "Dept_Employee" ADD CONSTRAINT "fk_Dept_Employee_department" FOREIGN KEY("department")
REFERENCES "Departments" ("depart_ID");

