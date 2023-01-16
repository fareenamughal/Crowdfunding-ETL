-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

SELECT B.CF_ID,
	COUNT(B.BACKER_ID) AS BACKER_COUNT
FROM BACKERS_DF AS B
INNER JOIN CAMPAIGN AS C ON C.CF_ID = B.CF_ID
WHERE C.OUTCOME = 'live'
GROUP BY B.CF_ID
ORDER BY BACKER_COUNT DESC;