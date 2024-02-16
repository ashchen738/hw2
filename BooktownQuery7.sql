-- Write a query that finds the titles of books and the sum of pages across all editions of each respective book. The column containing the cumulative total should be named Total_Pages. Only books that have editions listed need to be included in the results, which should be sorted in descending order by the cumulative total number of pages across all editions.
SELECT B.Title, SUM(E.Pages) AS Total_Pages
FROM Books B
INNER JOIN Editions E ON B.Book_ID = E.Book_ID
GROUP BY B.Title
ORDER BY Total_Pages DESC;
