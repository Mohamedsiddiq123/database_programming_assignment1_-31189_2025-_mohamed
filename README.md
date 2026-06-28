Student Information System Database Project

Business Problem

The university needs a database system to manage students, courses, instructors, and enrollments. The system helps store student information, manage course registrations, and analyze student performance using SQL queries.

---

Database Schema

The database contains four related tables:

- Students
- Courses
- Instructors
- Enrollments

Relationships:

- A student can enroll in many courses.
- A course can have many students.
- An instructor teaches a course.

---

ER Diagram

The ER Diagram is included in the project folder.

---

CTE Implementations

This project demonstrates:

- Simple CTE
- Multiple CTEs
- Recursive CTE
- CTE with Aggregation
- CTE with JOIN

Each query was executed successfully and screenshots are included.

---

Window Function Implementations

The following SQL Window Functions were implemented:

- ROW_NUMBER()
- RANK()
- DENSE_RANK()
- PERCENT_RANK()
- SUM() OVER()
- AVG() OVER()
- MIN() OVER()
- MAX() OVER()
- LAG()
- LEAD()
- NTILE()
- CUME_DIST()

Screenshots of all outputs are included.

---

Analysis and Findings

Descriptive Analysis

The database stores information about students, instructors, courses, and enrollments. SQL queries generated reports showing student grades and course performance.

Diagnostic Analysis

The analysis indicates differences in student performance across courses and departments. Some students achieved higher grades than others based on their enrolled courses.

Prescriptive Analysis

The university should monitor student performance regularly, provide academic support for low-performing students, and use analytical reports for decision-making.

---

References

- Oracle SQL Documentation
- Course Lecture Notes

---

Academic Integrity Statement

I declare that this project is my own original work and has not been copied from any other student or online source.