-- Write a query that returns the “Subject” attribute of all subjects for which no book has been written by any author. The results should be sorted in ascending order.
SELECT S.Subject
FROM Subjects S
LEFT JOIN Books B ON S.Subject_ID = B.Subject_ID
WHERE B.Book_ID IS NULL
ORDER BY S.Subject;