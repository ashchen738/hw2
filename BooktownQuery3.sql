-- Write a query that finds the ISBNs of all editions of books written by Agatha Christie. The results should be sorted in descending order.
SELECT E.ISBN
FROM Editions E
INNER JOIN Books B ON E.Book_ID = B.Book_ID
INNER JOIN Authors A ON B.Author_ID = A.Author_ID
WHERE A.First_Name = 'Agatha' AND A.Last_Name = 'Christie'
ORDER BY E.ISBN DESC;