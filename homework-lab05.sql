
-- 1 FULL OUTER WITH ALTERNATIVE WAY
SELECT student.ID,takes.ID,student.name,takes.course_id FROM student LEFT OUTER JOIN takes ON student.ID = takes.ID
UNION
SELECT student.ID,takes.ID,student.name,takes.course_id FROM student RIGHT OUTER JOIN takes ON student.ID = takes.ID;

-- 2 LEFT NOR RIGHT OUTER JOIN WITHOUT LEFT/RIGHT OUTER SYNTAX
SELECT student.ID,student.name,student.dept_name,student.tot_cred,takes.ID , takes.course_id,takes.sec_id,takes.semester,takes.year,takes.grade
FROM
   student
   INNER JOIN takes ON student.ID = takes.ID
UNION ALL 
SELECT student.ID, student.name , student.dept_name , student.tot_cred , NULL , null , null , null , null , null
FROM student
WHERE NOT EXISTS (
   SELECT *
   FROM takes
   WHERE student.ID = takes.ID
);