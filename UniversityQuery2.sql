-- Write a query that finds the SIDs and Names of all students with at least one project partner who is enrolled in (EECS 482 or EECS 483) and (EECS 484 or EECS 485) and (EECS 280). Students who are Members of the same Project are considered project partners (a student is not a project partner of themselves). Note that each course’s name is stored in the C_Name field with no space between the department abbreviation and the course number (e.g. EECS 484 is stored as ‘EECS484’.) The results should be sorted in descending order by the students’ names. Hint: you should be able to implement this query without using views or set operators (Union, Minus, Intersect).
SELECT S1.SID, S1.Name
FROM Students S1
WHERE EXISTS (
    SELECT 1
    FROM Members M1
    INNER JOIN Members M2 ON M1.PID = M2.PID AND M1.SID != M2.SID
    INNER JOIN Enrollments E1 ON M2.SID = E1.SID
    INNER JOIN Courses C1 ON E1.CID = C1.CID
    WHERE M1.SID = S1.SID AND (
        C1.C_Name IN ('EECS482', 'EECS483') AND
        EXISTS (
            SELECT 1
            FROM Enrollments E2
            JOIN Courses C2 ON E2.CID = C2.CID
            WHERE E2.SID = M2.SID AND C2.C_Name IN ('EECS484', 'EECS485')
        ) AND EXISTS (
            SELECT 1
            FROM Enrollments E3
            JOIN Courses C3 ON E3.CID = C3.CID
            WHERE E3.SID = M2.SID AND C3.C_Name = 'EECS280'
        )
    )
)
ORDER BY S1.Name DESC;