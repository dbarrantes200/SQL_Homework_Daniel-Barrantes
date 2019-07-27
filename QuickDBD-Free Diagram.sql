-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/h2RXgB
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "departments" (
    "dep_id" int   NOT NULL,
    "emp_no" int   NOT NULL,
    "dept_no" character   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dep_id"
     )
);

CREATE TABLE "dept_emp" (
    "dep_id" int   NOT NULL,
    "dept_no" character   NOT NULL,
    "emp_no" integer   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "dep_id"
     )
);

CREATE TABLE "employees" (
    "emp_id" int   NOT NULL,
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" character   NOT NULL,
    "last_name" character   NOT NULL,
    "gender" character   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "salaries" (
    "emp_id" int   NOT NULL,
    "emp_no" integer   NOT NULL,
    "salary" money   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_id"
     )
);

CREATE TABLE "titles" (
    "emp_ID" int   NOT NULL,
    "emp_no" int   NOT NULL,
    "title" character   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "emp_ID"
     )
);

ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_emp" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "titles" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

