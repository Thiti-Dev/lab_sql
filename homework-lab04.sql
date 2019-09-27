-- 1
select title from course where dept_name="Comp. Sci." and credits=3;

-- 2
select s_ID from advisor where i_ID = (select ID from instructor where name="Einstein");

-- 3
select max(salary) as highest_Salary from instructor;

-- 4
select * from instructor where salary=(select max(salary) from instructor);

-- 5
select * from section where semester="Fall" and year=2009;

-- 6
select count(*) from takes where semester="Fall" and year=2009;

-- 7
SELECT course_id from (SELECT T.course_id, COUNT(T.course_id) as count FROM takes as T where T.semester="Fall" and T.year=2009 GROUP BY T.course_id having count=(SELECT max(count) from (SELECT N.course_id, COUNT(N.course_id) as count FROM takes as N where N.semester="Fall" and N.year=2009 GROUP BY N.course_id) as J)) as x;

-- 8
INSERT INTO course (course_id, title, dept_name, credits) VALUES ("CS-001", 'Weekly Seminar' , 'Comp. Sci.', 1);

-- 9
INSERT INTO section (course_id, sec_id, semester, year) VALUES ("CS-001", 1 , "Fall", 2009);

-- 10
INSERT INTO takes (ID, course_id, sec_id, semester,year) SELECT ID,"CS-001", 1 , "Fall", 2009 from student where dept_name="Comp. Sci.";

-- 11 Delete the enrollment that just got added from above
DELETE from takes where ID=(SELECT ID FROM student where name="Chavez") and course_id="CS-001";

-- 12
-- The table which having the data of CS-001 will be disappeared too [ section , takes, ... ]
DELETE from course where course_id="CS-001";

-- 13
DELETE FROM takes where course_id=(SELECT course_id FROM course as T WHERE title like "%database%" and exists(SELECT x.course_id from section as x where course_id=T.course_id));

