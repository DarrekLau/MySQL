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


SELECT users.email_domain,
  COUNT(CASE WHEN progress.learn_cpp = 'started' OR progress.learn_cpp = 'completed' 
  THEN users.user_id END) AS c_plus_plus,
  COUNT(CASE WHEN progress.learn_sql = 'started' OR progress.learn_sql = 'completed' 
  THEN users.user_id END) AS sql,
  COUNT(CASE WHEN progress.learn_html = 'started' OR progress.learn_html = 'completed' 
  THEN users.user_id END) AS html,
  COUNT(CASE WHEN progress.learn_javascript = 'started' OR progress.learn_javascript = 'completed' 
  THEN users.user_id END) AS javascript,
  COUNT(CASE WHEN progress.learn_java = 'started' OR progress.learn_java = 'completed' 
  THEN users.user_id END) AS java
FROM users JOIN progress ON users.user_id = progress.user_id
  GROUP BY 1;


-- What courses are the New Yorkers students taking?
SELECT 
SUM(case when (learn_cpp = 'started' OR learn_cpp = 'completed') Then 1 else 0 end) as 'learn cpp',
SUM(case when (learn_sql = 'started' OR learn_sql = 'completed') Then 1 else 0 end) as 'learn sql',
SUM(case when (learn_html = 'started' OR learn_html = 'completed') Then 1 else 0 end) as 'learn html',
SUM(case when (learn_javascript = 'started' OR learn_javascript = 'completed') Then 1 else 0 end) as 'learn javascript',
SUM(case when (learn_java = 'started' OR learn_java = 'completed') Then 1 else 0 end) as 'learn java'
FROM users INNER JOIN progress ON users.user_id = progress.user_id
WHERE city = 'New York';


-- What courses are the Chicago students taking?
SELECT 
SUM(case when (learn_cpp = 'started' OR learn_cpp = 'completed') Then 1 else 0 end) as 'learn cpp',
SUM(case when (learn_sql = 'started' OR learn_sql = 'completed') Then 1 else 0 end) as 'learn sql',
SUM(case when (learn_html = 'started' OR learn_html = 'completed') Then 1 else 0 end) as 'learn html',
SUM(case when (learn_javascript = 'started' OR learn_javascript = 'completed') Then 1 else 0 end) as 'learn javascript',
SUM(case when (learn_java = 'started' OR learn_java = 'completed') Then 1 else 0 end) as 'learn java'
FROM users INNER JOIN progress ON users.user_id = progress.user_id
WHERE city = 'Chicago';


-- The whole table
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