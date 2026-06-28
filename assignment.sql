-----------------------------
-- 1. CREATE TABLES
-----------------------------

CREATE TABLE Students (
    student_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    gender VARCHAR2(10),
    department VARCHAR2(50)
);

CREATE TABLE Courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(100),
    credit_hours NUMBER
);

CREATE TABLE Instructors (
    instructor_id NUMBER PRIMARY KEY,
    instructor_name VARCHAR2(100),
    course_id NUMBER,
    CONSTRAINT fk_course FOREIGN KEY (course_id)
    REFERENCES Courses(course_id)
);

CREATE TABLE Enrollments (
    enrollment_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    course_id NUMBER,
    semester VARCHAR2(20),
    grade NUMBER(5,2),
    CONSTRAINT fk_student FOREIGN KEY (student_id)
    REFERENCES Students(student_id),
    CONSTRAINT fk_course2 FOREIGN KEY (course_id)
    REFERENCES Courses(course_id)
);











-----------------------------
-- 2. INSERT DATA
-----------------------------

INSERT INTO Students VALUES (1, 'Ali', 'Hassan', 'Male', 'CS');
INSERT INTO Students VALUES (2, 'Sara', 'Mohamed', 'Female', 'IS');
INSERT INTO Students VALUES (3, 'John', 'Peter', 'Male', 'SE');
INSERT INTO Students VALUES (4, 'Amina', 'Ibrahim', 'Female', 'CS');
INSERT INTO Students VALUES (5, 'David', 'Kim', 'Male', 'IS');

INSERT INTO Courses VALUES (101, 'Database Systems', 3);
INSERT INTO Courses VALUES (102, 'Programming', 4);
INSERT INTO Courses VALUES (103, 'Web Development', 3);

INSERT INTO Instructors VALUES (201, 'Dr. Ahmed', 101);
INSERT INTO Instructors VALUES (202, 'Dr. Mary', 102);
INSERT INTO Instructors VALUES (203, 'Dr. James', 103);

INSERT INTO Enrollments VALUES (301, 1, 101, 'Fall2026', 85);
INSERT INTO Enrollments VALUES (302, 1, 102, 'Fall2026', 78);
INSERT INTO Enrollments VALUES (303, 2, 101, 'Fall2026', 92);
INSERT INTO Enrollments VALUES (304, 3, 103, 'Fall2026', 88);
INSERT INTO Enrollments VALUES (305, 4, 102, 'Fall2026', 74);
INSERT INTO Enrollments VALUES (306, 5, 101, 'Fall2026', 81);











-----------------------------
-- 3. CTE QUERIES
-----------------------------

-- Simple CTE


WITH StudentGrades AS (
    SELECT s.student_id, s.first_name, e.grade
    FROM Students s
    JOIN Enrollments e ON s.student_id = e.student_id
)
SELECT * FROM StudentGrades;



-- Multiple CTE


WITH AvgGrades AS (
    SELECT course_id, AVG(grade) avg_grade
    FROM Enrollments
    GROUP BY course_id
),
StudentData AS (
    SELECT s.student_id, s.first_name, c.course_name, e.grade, e.course_id
    FROM Students s
    JOIN Enrollments e ON s.student_id = e.student_id
    JOIN Courses c ON e.course_id = c.course_id
)
SELECT * FROM StudentData sd
JOIN AvgGrades ag ON sd.course_id = ag.course_id;




-- Recursive CTE


WITH Numbers (num) AS (
    SELECT 1 FROM dual
    UNION ALL
    SELECT num + 1 FROM Numbers WHERE num < 10
)
SELECT * FROM Numbers;



-- Aggregation CTE


WITH DeptAvg AS (
    SELECT s.department, AVG(e.grade) avg_grade
    FROM Students s
    JOIN Enrollments e ON s.student_id = e.student_id
    GROUP BY s.department
)
SELECT * FROM DeptAvg;



-- CTE with JOIN


WITH StudentCourse AS (
    SELECT s.student_id, s.first_name, c.course_name, e.grade
    FROM Students s
    JOIN Enrollments e ON s.student_id = e.student_id
    JOIN Courses c ON e.course_id = c.course_id
)
SELECT * FROM StudentCourse;







-----------------------------
-- 4. WINDOW FUNCTIONS
-----------------------------

SELECT s.student_id, s.first_name, e.grade,
ROW_NUMBER() OVER (ORDER BY e.grade DESC) rn
FROM Students s JOIN Enrollments e
ON s.student_id = e.student_id;



SELECT s.student_id, s.first_name, e.grade,
RANK() OVER (ORDER BY e.grade DESC) rnk
FROM Students s JOIN Enrollments e
ON s.student_id = e.student_id;



SELECT s.student_id, s.first_name, e.grade,
DENSE_RANK() OVER (ORDER BY e.grade DESC) drnk
FROM Students s JOIN Enrollments e
ON s.student_id = e.student_id;



SELECT s.student_id, s.first_name, e.grade,
PERCENT_RANK() OVER (ORDER BY e.grade DESC) pr
FROM Students s JOIN Enrollments e
ON s.student_id = e.student_id;



SELECT s.student_id, s.first_name, e.grade,
SUM(e.grade) OVER (ORDER BY e.grade DESC) running_sum
FROM Students s JOIN Enrollments e
ON s.student_id = e.student_id;



SELECT s.student_id, s.first_name, e.grade,
AVG(e.grade) OVER () avg_grade
FROM Students s JOIN Enrollments e
ON s.student_id = e.student_id;



SELECT s.student_id, s.first_name, e.grade,
MIN(e.grade) OVER () min_grade
FROM Students s JOIN Enrollments e
ON s.student_id = e.student_id;



SELECT s.student_id, s.first_name, e.grade,
MAX(e.grade) OVER () max_grade
FROM Students s JOIN Enrollments e
ON s.student_id = e.student_id;



SELECT s.student_id, s.first_name, e.grade,
LAG(e.grade) OVER (ORDER BY e.grade DESC) prev_grade
FROM Students s JOIN Enrollments e
ON s.student_id = e.student_id;



SELECT s.student_id, s.first_name, e.grade,
LEAD(e.grade) OVER (ORDER BY e.grade DESC) next_grade
FROM Students s JOIN Enrollments e
ON s.student_id = e.student_id;



SELECT s.student_id, s.first_name, e.grade,
NTILE(4) OVER (ORDER BY e.grade DESC) grp
FROM Students s JOIN Enrollments e
ON s.student_id = e.student_id;



SELECT s.student_id, s.first_name, e.grade,
CUME_DIST() OVER (ORDER BY e.grade DESC) cd
FROM Students s JOIN Enrollments e
ON s.student_id = e.student_id;



-----------------------------
-- END OF FILE
-----------------------------