-- 1. Write a query that returns CID of CS-heavy courses, which is defined as the following: strictly fewer than 10 non-CS majors are enrolled (including courses in which 0 non-CS majors are enrolled). A student whose major is CS will have the VARCHAR2 value ‘CS’ for their Major field, while a non-CS student will have something else. Remember that the Major field can be NULL. The results should be sorted in descending order by CID.
SELECT C.CID
FROM Courses C
WHERE (
    SELECT COUNT(*)
    FROM Enrollments E
    INNER JOIN Students S on E.SID = S.SID
    WHERE C.CID = E.CID AND (S.Major IS NULL OR S.Major != 'CS')
) < 10
ORDER BY C.CID DESC;