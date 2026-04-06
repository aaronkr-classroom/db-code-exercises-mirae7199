DROP TABLE Professor;

CREATE TABLE Professor (
                      employee_id int primary key,
                      professor_name varchar(100),
                      department varchar(50),
                      salary numeric,
                      salary_level numeric,
                      hire_date date
);

CREATE TABLE Student (
                    student_id int primary key,
                    student_name varchar(100),
                    major varchar(100)
);

CREATE TABLE Course (
                    course_id int,
                    section_id int,
                    employee_id int,
                    course_name varchar(100),
                    PRIMARY KEY (course_id, section_id), -- 복합키
                    FOREIGN KEY (employee_id) REFERENCES Professor(employee_id)
);

CREATE TABLE Enrollment (
                    student_id int,
                    course_id int,
                    grade varchar(2),
                    points numeric, -- 99.65
                    enrolled_at DATE,
                    PRIMARY KEY (student_id, course_id)
--                  FOREIGN KEY (student_id) references Student(student_id),
--                  FOREIGN KEY (course_id) references Course(course_id)
);