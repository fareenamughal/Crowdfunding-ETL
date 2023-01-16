SELECT cf_id,
backers_count
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC;

