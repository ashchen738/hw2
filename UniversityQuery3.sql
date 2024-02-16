-- Write a query that finds the list of the SIDs of all students who are enrolled in (EECS442 and EECS445 and EECS492) or (EECS482 and EECS486) or (EECS281). Do not return duplicates. The results should be sorted in ascending order by SID.
SELECT E.SID
FROM Enrollments E
INNER JOIN Courses C ON E.CID = C.CID
WHERE C.C_Name IN ('EECS442', 'EECS445', 'EECS492', 'EECS482', 'EECS486', 'EECS281')
GROUP BY E.SID
HAVING
    (
        SUM(CASE WHEN C.C_Name = 'EECS442' THEN 1 ELSE 0 END) > 0 AND
        SUM(CASE WHEN C.C_Name = 'EECS445' THEN 1 ELSE 0 END) > 0 AND
        SUM(CASE WHEN C.C_Name = 'EECS492' THEN 1 ELSE 0 END) > 0
    ) OR (
        SUM(CASE WHEN C.C_Name = 'EECS482' THEN 1 ELSE 0 END) > 0 AND
        SUM(CASE WHEN C.C_Name = 'EECS486' THEN 1 ELSE 0 END) > 0
    ) OR (
        SUM(CASE WHEN C.C_Name = 'EECS281' THEN 1 ELSE 0 END) > 0
    )
ORDER BY E.SID;