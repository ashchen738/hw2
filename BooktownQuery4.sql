-- Write a query that finds the first and last names of all authors who have written at least one children’s/young adult book (subject: “Children/YA”) and at least one book of fiction (subject: “Fiction”). The results should be sorted first in ascending order by first name and then in ascending order by last name. Note: if there are multiple authors with the same first and last name, their names should appear multiple times in the result.
SELECT A.First_Name, A.Last_Name
FROM Authors A
WHERE A.Author_ID IN (
    SELECT B.Author_ID
    FROM Books B
    INNER JOIN Subjects S ON B.Subject_ID = S.Subject_ID
    WHERE S.Subject = 'Children/YA'
) AND A.Author_ID IN (
    SELECT B.Author_ID
    FROM Books B
    INNER JOIN Subjects S ON B.Subject_ID = S.Subject_ID
    WHERE S.Subject = 'Fiction'
)
ORDER BY A.First_Name, A.Last_Name;