-- 1. Write a query that returns CID of CS-heavy courses, which is defined as the following: strictly fewer than 10 non-CS majors are enrolled (including courses in which 0 non-CS majors are enrolled). A student whose major is CS will have the VARCHAR2 value ‘CS’ for their Major field, while a non-CS student will have something else. Remember that the Major field can be NULL. The results should be sorted in descending order by CID.
SELECT E.CID
FROM Enrollments E
INNER JOIN Students S ON E.SID = S.SID
WHERE S.Major != 'CS' OR S.Major IS NULL
GROUP BY E.CID
HAVING COUNT(E.SID) < 10
ORDER BY E.CID DESC;