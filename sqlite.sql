CREATE TABLE regions (
	region_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	region_name text NOT NULL
);

CREATE TABLE countries (
	country_id text NOT NULL,
	country_name text NOT NULL,
	region_id INTEGER NOT NULL,
	PRIMARY KEY (country_id ASC),
	FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE locations (
	location_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	street_address text,
	postal_code text,
	city text NOT NULL,
	state_province text,
	country_id INTEGER NOT NULL,
	FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE departments (
	department_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	department_name text NOT NULL,
	location_id INTEGER NOT NULL,
	FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE jobs (
	job_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	job_title text NOT NULL,
	min_salary double NOT NULL,
	max_salary double NOT NULL
);

CREATE TABLE employees (
	employee_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	first_name text,
	last_name text NOT NULL,
	email text NOT NULL,
	phone_number text,
	hire_date text NOT NULL,
	job_id INTEGER NOT NULL,
	salary double NOT NULL,
	manager_id INTEGER,
	department_id INTEGER NOT NULL,
	FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE dependents (
	dependent_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
	first_name text NOT NULL,
	last_name text NOT NULL,
	relationship text NOT NULL,
	employee_id INTEGER NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);-- Sample INSERT statements for the 'regions' table
INSERT INTO regions (region_name) VALUES ('North America');
INSERT INTO regions (region_name) VALUES ('Europe');
INSERT INTO regions (region_name) VALUES ('Asia');

-- Sample INSERT statements for the 'countries' table
INSERT INTO countries (country_id, country_name, region_id) VALUES ('US', 'United States', 1);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('CA', 'Canada', 1);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('FR', 'France', 2);
INSERT INTO countries (country_id, country_name, region_id) VALUES ('JP', 'Japan', 3);

-- Sample INSERT statements for the 'locations' table
INSERT INTO locations (street_address, postal_code, city, state_province, country_id) VALUES ('123 Main St', '12345', 'New York', 'NY', 'US');
INSERT INTO locations (street_address, postal_code, city, state_province, country_id) VALUES ('456 Oak St', '67890', 'Toronto', 'ON', 'CA');
INSERT INTO locations (street_address, postal_code, city, state_province, country_id) VALUES ('789 Elm St', '23456', 'Paris', null, 'FR');
INSERT INTO locations (street_address, postal_code, city, state_province, country_id) VALUES ('101 Pine St', '98765', 'Tokyo', null, 'JP');

-- Sample INSERT statements for the 'departments' table
INSERT INTO departments (department_name, location_id) VALUES ('HR', 1);
INSERT INTO departments (department_name, location_id) VALUES ('IT', 2);
INSERT INTO departments (department_name, location_id) VALUES ('Finance', 3);

-- Sample INSERT statements for the 'jobs' table
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Manager', 50000, 80000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Developer', 60000, 90000);
INSERT INTO jobs (job_title, min_salary, max_salary) VALUES ('Accountant', 45000, 70000);

-- Sample INSERT statements for the 'employees' table
INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES ('John', 'Doe', 'john.doe@email.com', '123-456-7890', '2023-01-01', 1, 70000, null, 1);
INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES ('Jane', 'Smith', 'jane.smith@email.com', '987-654-3210', '2023-02-01', 2, 80000, 1, 2);
INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES ('Bob', 'Johnson', 'bob.johnson@email.com', '111-222-3333', '2023-03-01', 3, 60000, 1, 3);

-- Sample INSERT statements for the 'dependents' table
INSERT INTO dependents (first_name, last_name, relationship, employee_id) VALUES ('Alice', 'Doe', 'Child', 1);
INSERT INTO dependents (first_name, last_name, relationship, employee_id) VALUES ('Alex', 'Smith', 'Spouse', 2);
INSERT INTO dependents (first_name, last_name, relationship, employee_id) VALUES ('Charlie', 'Johnson', 'Child', 3);
