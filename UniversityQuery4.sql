-- Create a view called StudentPairs with two columns, SID1 and SID2. The contents of this view should be all pairs of SIDs of two students who are enrolled in at least one common class but are not already partners on any project. You should report each student pair exactly once. The lower ID should be SID1, and the higher ID should be SID2. The contents of the view do not need to be sorted, and you do not need to drop the view. You must NOT create views other than the StudentPairs view.
CREATE VIEW StudentPairs AS (
    SELECT E1.SID AS SID1, E2.SID AS SID2
    FROM Enrollments E1
    JOIN Enrollments E2 ON E1.CID = E2.CID AND E1.SID < E2.SID
    WHERE NOT EXISTS (
        SELECT M1.PID FROM Members M1 WHERE M1.SID = E1.SID
        INTERSECT
        SELECT M2.PID FROM Members M2 WHERE M2.SID = E2.SID
    )
)
UNION (
    SELECT E2.SID AS SID1, E1.SID AS SID2
    FROM Enrollments E1
    JOIN Enrollments E2 ON E1.CID = E2.CID AND E1.SID > E2.SID
    WHERE NOT EXISTS (
        SELECT M1.PID FROM Members M1 WHERE M1.SID = E1.SID
        INTERSECT
        SELECT M2.PID FROM Members M2 WHERE M2.SID = E2.SID
    )
);