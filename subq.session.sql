-- --     CREATE TABLE student(
-- --         student_id  SERIAL PRIMARY KEY,
-- --         name VARCHAR(50) NOT NULL,
-- --         branch VARCHAR(30) NOT NULL
-- --     );


-- -- CREATE TABLE exam_scores(
-- --     score_id SERIAL PRIMARY KEY,
-- --     student_id  INT NOT NULL REFERENCES student (student_id),
-- --     subject VARCHAR(50) NOT NULL,
-- --     score INT NOT NULL CHECK( score between 0 and 100),
-- --     exam_month VARCHAR(7) NOT NULL

-- -- );

-- -- CREATE TABLE projects(
-- --     project_id SERIAL PRIMARY KEY,
-- --     student_id INT NOT NULL REFERENCES student(student_id),
-- --     title VARCHAR(50) NOT NULL,
-- --     marks INT NOT NULL CHECK ( marks BETWEEN 0 AND 100)
-- -- );

-- -- INSERT INTO projects(student_id, title, marks) VALUES
-- --     (1, 'to-do app in react', 78),
-- --     (2, 'to-do app in react', 96),
-- --     (3, 'student management system', 72),
-- --     (4, 'weather app using API', 88),
-- --     (6, 'SQL database project', 81),
-- --     (7, 'expense tracker', 90);
   

-- -- INSERT INTO exam_scores (student_id, subject, score, exam_month) VALUES
-- --     (1, 'Maths', 75, '2026-02'),
-- --     (2, 'English', 68, '2026-02'),
-- --     (3, 'SQL', 82, '2026-03'),
-- --     (4, 'Maths', 91, '2026-03'),
-- --     (5, 'English', 77, '2026-01'),
-- --     (6, 'SQL', 88, '2026-01'),
-- --     (7, 'Maths', 73, '2026-04'),
-- --     (8, 'SQL', 64, '2026-04'),
-- --     (1, 'English', 85, '2026-05'),
-- --     (2, 'Maths', 71, '2026-05'),
-- --     (3, 'SQL', 79, '2026-06'),
-- --     (4, 'English', 94, '2026-06'),
-- --     (5, 'Maths', 69, '2026-07'),
-- --     (6, 'SQL', 81, '2026-07'),
-- --     (7, 'English', 76, '2026-08'),
-- --     (8, 'Maths', 89, '2026-08'),
-- --     (1, 'SQL', 83, '2026-09'),
-- --     (2, 'English', 67, '2026-09'),
-- --     (3, 'Maths', 92, '2026-10'),
-- --     (4, 'SQL', 78, '2026-10'),
-- --     (5, 'English', 74, '2026-11'),
-- --     (6, 'Maths', 87, '2026-11'),
-- --     (7, 'SQL', 59, '2026-12'),
-- --     (8, 'English', 90, '2026-12');

-- -- INSERT INTO student (name, branch ) VALUES
-- --     ('ahmer', 'CS'),
-- --     ('ali', 'SE'),
-- --     ('hamza', 'IT'),
-- --     ('usman', 'AI'),
-- --     ('bilal', 'DS'),
-- --     ('ahmed', 'EE'),
-- --     ('hassan', 'CE'),
-- --     ('farhan', 'CS');

-- -- SELECT 
-- --     AVG(score) AS class_avg
-- -- FROM exam_scores ;
-- -- -- we want to fine avg of students who has marks above than class average 
-- SELECT 
--     e.student_id,
--     s.name AS student_name,
--     s.branch AS student_branch,
--     e.score
-- FROM exam_scores AS e

-- INNER JOIN student AS s ON s.student_id = e.student_id
-- WHERE e.score > (
--     SELECT 
--     AVG(score) AS class_avg
-- FROM exam_scores 
-- );


-- -- atleast 1 exam >= 90
-- -- and any of there project should have marks abouve 85
-- -- USING QUBQUERY IN WHERE
-- SELECT * FROM exam_scores WHERE score >= 90;
-- SELECT * FROM projects WHERE marks >= 85;

-- SELECT * FROM student AS s
-- WHERE s.student_id IN (
--     SELECT student_id FROM exam_scores WHERE score >= 90
-- ) AND
-- s.student_id IN(
--     SELECT student_id FROM projects WHERE marks >= 85
-- );

-- -- problem = we need total score student has earned and number of exam attempts?
-- -- method 1
-- SELECT 
--     e.student_id,
--     s.name,
--     SUM(e.score) AS total_score,
--     COUNT(e.student_id) AS student_attempts
-- FROM exam_scores AS e
-- INNER JOIN student AS s ON s.student_id = e.student_id
-- GROUP BY e.student_id, s.name
-- ORDER BY total_score DESC;
-- method 2
-- --USING SUBQUIERY IN FROM
-- SELECT 
--     s.student_id,
--     s.name,
--     s.branch,
--     total_stats.total_score,
--     total_stats.total_attempts
-- from(
--     SELECT  
--     student_id,
--     SUM(score) AS total_score,
--     count(*) AS total_attempts
-- FROM exam_scores 
-- GROUP BY student_id

-- ) AS total_stats;

-- -- INNER JOIN student As s ON s.student_id = total_stats.student_id
-- -- ORDER BY total_score DESC


-- -- problem = for each project get student name, branch and project marks and average of exam score 
-- -- USING SUB-QUERY IN JOINS
-- SELECT 
--     s.student_id,
--     s.name,
--     p.title,
--     p.marks,
--     exam_avg.average_score

-- FROM  projects AS p
-- INNER JOIN student AS s ON s.student_id = p.student_id
-- INNER JOIN (
--     SELECT 
--     student_id,
--     ROUND(AVG(score),2)AS average_score
--     FROM exam_scores
--     GROUP BY student_id
-- ) AS exam_avg ON p.student_id = exam_avg.student_id;


-- list of the report where we have list if exam attempts 
-- which are above average score and also name of the student.
-- first we  are creating new table for high scorers and then we need to populate that table
-- we used join to join student and exam score table then we write subqiery in where to get above 
--average students then use that sub query to put in the vales for the above average students.
CREATE TABLE high_scorer_report(
    id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    student_name VARCHAR(50) NOT NULL,
    subject VARCHAR(12) NOT NULL,
    score INT NOT NULL,
    achive_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO high_scorer_report(
    student_id,
    student_name,
    subject,
    score
)
SELECT 
    e.student_id,
    s.name,
    e.subject,
    e.score

from exam_scores AS e
INNER JOIN student AS s ON s.student_id = e.student_id
WHERE e.score >(
    SELECT 
        AVG(score) AS avg_score
    FROM exam_scores 
);


-- COMMON TABLE EXPRESSIONS CTEs
-- getting above average sturdents useing CTEs and not subquery


-- WITH cls_average AS(
--     SELECT 
--    ROUND( AVG(score),2) as class_average
--     FROM exam_scores AS e
-- )

-- SELECT 
--     s.name,
--     s.branch,
--     e.score,
--     ca.class_average

-- FROM exam_scores AS e
-- INNER JOIN student AS s on s.student_id = e.student_id
-- -- cross join to join cte and exam_scores table no need to define using ON in Cross join.
-- CROSS JOIN cls_average AS ca
-- WHERE e.score > ca.class_average;

-- cte to get student who as score> 90 in atleast 1 attempt and there prject marks in above 85.

WITH exam_topper AS(
    SELECT
    DISTINCT student_id
    FROM exam_scores
    WHERE score >= 90
),
project_topper AS(
    SELECT 
     DISTINCT student_id
    FROM projects
    WHERE marks >= 85
)
SELECT 
    s.student_id,
    s.name,
    s.branch


FROM student AS s
INNER JOIN exam_topper AS et ON et.student_id = s.student_iD 
INNER JOIN project_topper AS p ON p.student_id = s.student_id
