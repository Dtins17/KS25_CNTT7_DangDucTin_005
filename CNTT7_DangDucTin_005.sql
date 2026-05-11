create database salesmanagement;

use salesmanagement;

create table departments (
    dept_id varchar(5) primary key not null,
    dept_name varchar(100) not null unique,
    location varchar(100) not null,
    manager_name varchar(50) not null
);

create table employees (
    emp_id varchar(5) primary key not null,
    emp_name varchar(50) not null,
    dob date not null,
    email varchar(100) not null unique,
    phone varchar(15) not null unique,
    dept_id varchar(5),
    foreign key (dept_id) references departments(dept_id)
);

create table projects (
    project_id varchar(5) primary key not null,
    project_name varchar(20) not null unique,
    start_date date not null,
    end_date date not null,
    budget decimal(10,2)
);

create table assignments (
	assignment_id int primary key not null,
    emp_id varchar(5) not null,
    project_id varchar(5) not null,
    role varchar(20) not null,
    hours_worked int not null,
    foreign key (emp_id) references employees(emp_id),
    foreign key (project_id) references projects(project_id)
);

insert into departments (dept_id, dept_name, location, manager_name)
values
('D01', 'IT', 'Floor 5', 'Nguyen Van An'),
('D02', 'HR', 'Floor 2', 'Tran Thi Binh'),
('D03', 'Sales', 'Floor 1', 'Le Van Cuong'),
('D04', 'Marketing', 'Floor 3', 'Pham Thi Duong'),
('D05', 'Finance', 'Floor 4', 'Hoang Van Tu');

insert into employees (emp_id, emp_name, dob, email, phone, dept_id)
values
('E001', 'Nguyen Van Tuan', '1990-01-01', 'tuan@gamil.com', '0901234567', 'D01'),
('E002', 'Tran Thi Lan', '1995-05-05', 'lan@gamil.com', '0902345678', 'D02'),
('E003', 'Le Minh Khoi', '1992-10-10', 'khoi@gamil.com', '0903456789', 'D01'),
('E004', 'Pham Hoang Nam', '1998-12-12', 'nam@gamil.com', '0904567890', 'D03'),
('E005', 'Vu Minh Ha', '1996-07-07', 'ha@gamil.com', '0905678901', 'D01');

insert into projects (project_id, project_name, start_date, end_date, budget)
values
('P001', 'Wedsite Redesign', '2025-01-01', '2025-06-01', 50000.00),
('P002', 'MObile App Dev', '2025-02-01', '2025-08-01', 80000.00),
('P003', 'HR System', '2025-03-01', '2025-09-01', 30000.00),
('P004', 'Marketing Campaign', '2025-04-01', '2025-05-01', 10000.00),
('P005', 'AI Research', '2025-05-01', '2025-12-01', 100000.00);

insert into assignments (assignment_id, emp_id, project_id, role, hours_worked)
values
('1', 'E001', 'P001', 'Developer', '150'),
('2', 'E003', 'P001', 'Tester', '100'),
('3', 'E001', 'P002', 'Tech Lead', '200'),
('4', 'E005', 'P005', 'Data Scientist', '180'),
('5', 'E004', 'P004', 'Content Creator', '50');

update departments
set location = 'Floor 10'
where dept_id = 'D01';

update projects
set budget = budget * 1.1 and end_date = '2025-11-01'
where project_id = 'P005';

select project_name, start_date, budget from projects
where project_name like '%System';

select project_id, project_name, budget from projects
order by budget desc;

select
    *
from employees
order by dob asc
limit 3;

select project_id, project_name from projects
limit 3 offset 1;

select assignment_id, emp_name, project_name, role, hours_worked from employees, projects, assignments
where hours_worked > 100;



select * from projects;
