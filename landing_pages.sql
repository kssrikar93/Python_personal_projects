
-- landing pages

-- laying out the steps
-- Step 1 - identify the landing pages for each session within the time range
-- Step 2 - Map the pageview_url with the landing page so that we have the landing pageiew urls
-- Step 3 - Count the website sessions and group by pageview_url

select * from website_pageviews
limit 10;

create temporary table landing_pv
select website_session_id,
min(website_pageview_id) as landing_pageview_id
from website_pageviews
where created_at < '2012-06-12' -- as instructed
group by 1;

select * from landing_pv;

 -- mapping landing pageview ids to pageview_url and counting sessions grouped by url

SELECT 
    COUNT(DISTINCT lp.website_session_id) AS sessions,
    pageview_url
FROM
    landing_pv lp
        LEFT JOIN
    website_pageviews wp ON lp.landing_pageview_id = wp.website_pageview_id
GROUP BY 2;




