-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT b.cf_id, count(b.backer_id) AS backer_count FROM backers_df AS b
INNER JOIN campaign as c
ON c.cf_id = b.cf_id
WHERE c.outcome = 'live'
GROUP BY b.cf_id
ORDER BY backer_count DESC;