-- Write a query that finds the SIDs and Names of all students with at least one project partner who is enrolled in (EECS 482 or EECS 483) and (EECS 484 or EECS 485) and (EECS 280). Students who are Members of the same Project are considered project partners (a student is not a project partner of themselves). Note that each course’s name is stored in the C_Name field with no space between the department abbreviation and the course number (e.g. EECS 484 is stored as ‘EECS484’.) The results should be sorted in descending order by the students’ names. Hint: you should be able to implement this query without using views or set operators (Union, Minus, Intersect).
SELECT S.SID, S.Name
FROM Students S
INNER JOIN Members M1 ON S.SID = M1.SID
INNER JOIN Members M2 ON M1.PID = M2.PID AND M1.SID != M2.SID
INNER JOIN Enrollments E ON M2.SID = E.SID
INNER JOIN Courses C ON E.CID = C.CID
GROUP BY S.SID, S.Name
HAVING
    SUM(CASE WHEN C.C_Name IN ('EECS482', 'EECS483') THEN 1 ELSE 0 END) > 0 AND
    SUM(CASE WHEN C.C_Name IN ('EECS484', 'EECS485') THEN 1 ELSE 0 END) > 0 AND
    SUM(CASE WHEN C.C_Name = 'EECS280' THEN 1 ELSE 0 END) > 0
ORDER BY S.Name DESC;