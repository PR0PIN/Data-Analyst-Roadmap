
-- Step 1: Create a Common Table Expression (CTE) to calculate the "scroll" value for each user
WITH CTE AS (
    SELECT DISTINCT 
        user_id, 
        -- Calculate the scroll ratio: total completion divided by total visits for each user
        SUM(completion) / SUM(n_visits) AS scroll
    FROM (
        -- Extract data for specific content (URL) and calculate engagement metrics for each user
        SELECT 
            '1' AS content,
            a.user_id, 
            headers,
            n_visits,
            engaged_time, 
            completion
        FROM (
            -- Aggregate engagement metrics by user from the pageview_complete_events table
            SELECT 
                user_id, 
                'M' AS header, 
                COUNT(view_id) AS n_visits, -- Count the number of visits (view_id)
                SUM(prop.engaged_time) AS engaged_time, -- Sum of engaged time
                SUM(prop.completion) AS completion -- Sum of completion values
            FROM pageview_complete_events
            WHERE 
                DATE(date_data) BETWEEN '2025-01-01' AND CURRENT_DATE()-1 -- Filter for relevant date range
                AND prop.engaged_time > 0 -- Exclude rows with zero engagement
                AND prop.completion > 0 -- Exclude rows with zero completion
                AND prop.url LIKE '%m.com/61aj99fg%' -- Limit to a specific URL pattern
            GROUP BY user_id -- Group by user to aggregate data
        ) a
    )
    GROUP BY user_id -- Group by user to calculate final scroll values
)

-- Step 2: Classify users into quartiles based on their scroll values and count the users in each quartile
SELECT 
    SUM(CASE WHEN scroll < 0.25 THEN 1 ELSE 0 END) AS fq, -- First Quartile: scroll < 0.25
    SUM(CASE WHEN scroll >= 0.25 AND scroll < 0.5 THEN 1 ELSE 0 END) AS sq, -- Second Quartile: 0.25 <= scroll < 0.5
    SUM(CASE WHEN scroll >= 0.5 AND scroll < 0.75 THEN 1 ELSE 0 END) AS tq, -- Third Quartile: 0.5 <= scroll < 0.75
    SUM(CASE WHEN scroll >= 0.75 THEN 1 ELSE 0 END) AS qq -- Fourth Quartile: scroll >= 0.75
FROM CTE; -- Use the scroll values calculated in the CTE