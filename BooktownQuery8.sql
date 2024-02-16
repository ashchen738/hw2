-- Write a query that finds the IDs and names of publishing companies that have published at least one edition of a book written by any author who has written exactly 3 books. The results should be sorted in descending order by the publisher’s ID.
SELECT P.Publisher_ID, P.Name
FROM Publishers P
WHERE P.Publisher_ID IN (
	SELECT E.Publisher_ID
	FROM Editions E
	INNER JOIN Books B ON E.Book_ID = B.Book_ID
	WHERE B.Author_ID IN (
		SELECT B.Author_ID
		FROM Books B
		GROUP BY B.Author_ID
		HAVING COUNT(B.Book_ID) = 3
	)
)
GROUP BY P.Publisher_ID, P.Name
ORDER BY P.Publisher_ID DESC;