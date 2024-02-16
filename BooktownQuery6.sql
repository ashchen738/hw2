-- Write a query that finds titles, publication dates, author IDs, author first names, and author last names of ALL editions of books written by authors who have written at least one book with at least one edition published between the dates of 2003-01-01 and 2008-12-31. Both dates should be included in the range. The results should be sorted in ascending order by the author’s ID, then in ascending order by the book title, then in descending order by the date of publication.
SELECT B.Title, E.Publication_Date, A.Author_ID, A.First_Name, A.Last_Name
FROM Authors A
INNER JOIN Books B ON A.Author_ID = B.Author_ID
INNER JOIN Editions E ON B.Book_ID = E.Book_ID
WHERE A.Author_ID IN (
	SELECT B.Author_ID
	FROM Books B
	INNER JOIN Editions E ON B.Book_ID = E.Book_ID
	WHERE E.Publication_Date BETWEEN '2003-01-01' AND '2008-12-31'
)
ORDER BY A.Author_ID, B.Title, E.Publication_Date DESC;