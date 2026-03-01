--1
SELECT description, course_no, to_char(cost, '$9,999') FROM course
WHERE cost < (SELECT AVG(cost) FROM course)
ORDER BY cost desc;
--2
SELECT co.course_no, description, cost, MIN(start_date_time) FROM course co
INNER JOIN section se ON co.course_no = se.course_no
GROUP BY co.course_no, description, cost
ORDER BY course_no, description;
--3
SELECT zip.zip, COUNT(instructor_id) FROM zipcode zip
INNER JOIN instructor ins ON zip.zip = ins.zip
GROUP BY zip.zip;
--4
SELECT student_id, first_name, last_name, street_address, state, stu.zip FROM student stu
INNER JOIN zipcode zip ON stu.zip = zip.zip
WHERE city = 'Brooklyn'
ORDER BY last_name, first_name;
--5
SELECT first_name, last_name, COUNT(sec.instructor_id) AS sec_count FROM instructor ins
INNER JOIN section sec ON ins.instructor_id = sec.instructor_id
GROUP BY first_name, last_name
ORDER BY sec_count desc;
--6
SELECT first_name, last_name, street_address, zip FROM student
WHERE zip = (SELECT zip FROM instructor WHERE (first_name||' '||last_name) = 'Tom Wojick');
--7
SELECT student_id, salutation, first_name, last_name, registration_date FROM student
WHERE registration_date -
(SELECT registration_date FROm student WHERE first_name||' '||last_name = 'Vera Wetcel') < 0
ORDER BY registration_date desc;
--8
SELECT student_id FROM student
MINUS
SELECT student_id FROm enrollment;
--9
CREATE OR REPLACE VIEW all_people_view AS
SELECT salutation, (first_name||' '||last_name) AS full_name, street_address, zip, phone
FROM student
UNION
SELECT salutation, (first_name||' '||last_name) AS full_name, street_address, zip, phone
FROM instructor;
--10
SELECT first_name, last_name, stu.student_id FROM student stu
INNER JOIN enrollment enr ON stu.student_id = enr.student_id
WHERE final_grade = (SELECT MAX(final_grade) FROM enrollment);
--11
SELECT cou.course_no, description, COUNT(sec.course_no) FROM course cou
INNER JOIN section sec ON cou.course_no = sec.course_no
GROUP BY cou.course_no, description;
--12
SELECT cou1.course_no, cou1.description, cou1.cost, cou1.prerequisite, cou2.description AS prereq_desc
FROM course cou1
LEFT JOIn course cou2 ON cou1.prerequisite = cou2.course_no
ORDER BY cou1.course_no;
--13
SELECT cou.course_no, description, COUNT(sec.course_no) AS sec_count FROM course cou
INNER JOIN section sec ON cou.course_no = sec.course_no
GROUP BY cou.course_no, description

HAVING sec_count = (SELECT MAX(sec_count) FROM
(SELECT COUNT(course_no) AS sec_count FROM section GROUP BY course_no));
--14
SELECT cou.course_no, description, start_date_time, capacity, SUM(sec.section_no) AS enrolled
FROM course cou
INNER JOIN section sec ON cou.course_no = sec.course_no
INNER JOIN enrollment enr ON sec.section_id = enr.section_id
GROUP BY cou.course_no, description, start_date_time, capacity
HAVING capacity < enrolled;