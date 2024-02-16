-- Write a query that finds the IDs of all authors who have written exactly 1 book. The results should be sorted in ascending order.
SELECT A.Author_ID
FROM Authors A, Books B
WHERE A.Author_ID = B.Author_ID
GROUP BY A.Author_ID
HAVING COUNT(*) = 1
ORDER BY A.Author_ID;