TABLE Professor{ 
        professor_id int
        professor_name varchar
        department varchar
        salary numeric
        salary_level numeric
        hire_date date
}

TABLE Student {
        student_id int
        student_name varchar
        major varchar
}

TABLE Course {
        course_id int
        section_id int
        employee_id int
        professor_id int
        course_name varchar
        indexes {
            (course_id, section_id)
        }
}

TABLE Enrollment {
    student_id int
    course_id int
    grade varchar
    points numeric
    enrolled_at DATE
    indexes {
        (student_id, course_id)
    }    
}

Ref: Enrollment.student_id > Student.student_id
Ref: Course.professor_id > Professor.professor_id