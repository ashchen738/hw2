-- Write a query that finds the IDs, first names, and last names of all authors who have written at least one book in every subject for which J. K. Rowling has written at least one book, including J. K. Rowling. You may assume there is only one author with a first name ‘J. K.’ and last name ‘Rowling’. The results should be sorted in ascending order by the author’s last name, with ties being broken in favor of the larger ID.
SELECT A.Author_ID, A.First_Name, A.Last_Name
FROM Authors A
WHERE NOT EXISTS (
    SELECT S.Subject_ID
    FROM Books B
    JOIN Subjects S ON B.Subject_ID = S.Subject_ID
    WHERE B.Author_ID = (
        SELECT Author_ID
        FROM Authors
        WHERE First_Name = 'J. K.' AND Last_Name = 'Rowling'
    ) AND S.Subject_ID NOT IN (
        SELECT S2.Subject_ID
        FROM Books B2
        JOIN Subjects S2 ON B2.Subject_ID = S2.Subject_ID
        WHERE B2.Author_ID = A.Author_ID
    )
)
ORDER BY A.Last_Name, A.Author_ID DESC;