-- 1. What are the Top 25 schools (.edu domains)?

SELECT * FROM users WHERE email_domain LIKE "%.edu" LIMIT 25;
SELECT count(*) FROM users WHERE email_domain LIKE "%.edu" AND city = "New York";

SELECT email_domain, COUNT(user_id) as no_of_users FROM users GROUP BY 1 ORDER BY 2 DESC LIMIT 25;


-- 2. How many .edu learners are located in New York?

SELECT city, COUNT(user_id) as no_of_users FROM users WHERE city = 'New York';


-- 3. The mobile_app column contains either mobile-user or NULL. How many of these Codecademy learners are using the mobile app?


SELECT count(*) FROM users WHERE mobile_app = "mobile-user";

SELECT mobile_app, COUNT(mobile_app) as no_of_users FROM users;


-- 4. Now, using this function, query for the sign up counts for each hour.

function
SELECT sign_up_at, strftime('%S', sign_up_at) FROM users GROUP BY 1 LIMIT 30;

Calculate
SELECT strftime('%H', sign_up_at), COUNT(*)FROM users GROUP BY 1 ORDER BY 1;

-- Joining table to check 
-- Do different schools (.edu domains) prefer different courses?
-- What courses are the New Yorkers students taking?
-- What courses are the Chicago students taking?

SELECT 
   users.user_id,
   users.email_domain,
   users.city,
   users.country,
   progress.learn_cpp,
   progress.learn_sql,
   progress.learn_html,
   progress.learn_javascript,
   progress.learn_java
FROM users INNER JOIN progress ON users.user_id = progress.user_id LIMIT 30;