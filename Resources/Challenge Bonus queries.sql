-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT cf_id,
backers_count
FROM campaign
WHERE outcome ='live'
ORDER BY backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT b.cf_id, count(b.backer_id) AS backer_count FROM backers_df AS b
INNER JOIN campaign as c
ON c.cf_id = b.cf_id
WHERE c.outcome = 'live'
GROUP BY b.cf_id
ORDER BY backer_count DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
CREATE TABLE "email_contacts_remaining_goal_amount" (
"first_name" varchar(50) NOT NULL,
"last_name" varchar(50) NOT NULL,
"email" varchar(100) NOT NULL,
"Remaining Goal Amount" numeric(10,2) NOT NULL
);

INSERT INTO email_contacts_remaining_goal_amount(first_name, last_name,  email, "Remaining Goal Amount")
SELECT cn.first_name, cn.last_name, cn.email, (ca.goal - ca.pledge) AS "Remaining Goal Amount"
FROM contacts AS cn
INNER JOIN campaign as ca
ON ca.contact_id = cn.contact_id
WHERE ca.outcome = 'live'
ORDER BY "Remaining Goal Amount" DESC;


-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;


-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
CREATE TABLE "email_backers_remaining_goal_amount" (
"email" varchar(100) NOT NULL,
"first_name" varchar(50) NOT NULL,
"last_name" varchar(50) NOT NULL,
"cf_id" int NOT NULL,
"company_name" varchar(100) NOT NULL,
"description" text NOT NULL,
"end_date" date NOT NULL,
"Left of Goal" numeric(10,2) NOT NULL
);

INSERT INTO email_backers_remaining_goal_amount(email, first_name, last_name, cf_id, company_name, description, end_date, "Left of Goal")
SELECT b.email, b.first_name, b.last_name, b.cf_id, c.company_name, c.description, c.end_date, (c.goal - c.pledge) AS "Left of Goal"
FROM backers_df AS b
INNER JOIN campaign AS c
ON c.cf_id = b.cf_id
WHERE c.outcome = 'live'
ORDER BY b.email DESC;

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;