-- SCRIPT 4 Finding which student and professor have the most courses in common
SELECT 
	students_first_name,
    MAX(professor_name),
    course_name
FROM students
	RIGHT JOIN grades
		ON grades_student_id = students_id
	RIGHT JOIN professors
		ON professor_id = grades_professors_id
	RIGHT JOIN courses
		ON course_professor_id = professor_id
GROUP BY professor_name
ORDER BY course_professor_id;





-- SCRIPT 4 Create a summary report of courses and their average grades, sorted by the most challenging course
SELECT 
	grades_course_name,
    AVG(grades_value * 1.0) AS "AVG Grade"
FROM grades
GROUP BY grades_course_name
ORDER BY AVG(grades_value * 1.0);

SELECT 
	grades_course_name, 
	grades_value
FROM grades;







-- SCRIPT 3 Group students by the courses that they are enrolled in
SELECT 
	students_first_name,
    students_last_name,
    course_name
FROM students
	RIGHT JOIN grades
		ON grades_student_id = students_id
	RIGHT JOIN courses
		ON course_id = grades_course_id;





-- SCRIPT 2 The top grades for each student
SELECT
	students_first_name AS "First Name",
    students_last_name AS "Last Name",
	MAX(grades_value) AS "Highest Grade"
FROM students
	RIGHT JOIN grades
		ON grades_student_id = students_id
	GROUP BY students_id
    ORDER BY students_id;



-- SCRIPT 1 The average grade that is given by each professor
SELECT 
    AVG(grades_value * 1.0) AS "AVG Grade",
    professor_name AS "Professor Name"
FROM grades
	RIGHT JOIN professors
		ON professor_id = grades_professors_id
GROUP BY professor_name
ORDER BY grades_professors_id ASC;