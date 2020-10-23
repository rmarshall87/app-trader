-- 328 unique instances of companies on both platforms,
-- target those apps to maximize App Trader $$$.
/*WITH both_platforms AS (SELECT distinct(name)
						FROM app_store_apps
						WHERE name IS NOT null
						INTERSECT
						SELECT distinct(name)
						FROM play_store_apps
					    WHERE name IS NOT null)
,combined_avg_review AS (SELECT app_store_apps.name,
						(CAST(app_store_apps.review_count as integer))+play_store_apps.review_count/2 as avg_review
						 FROM app_store_apps INNER JOIN play_store_apps
						 ON app_store_apps.name=play_store_apps.name)
,avg_rating	  		 AS  (SELECT app_store_apps.name,
						 (ROUND(play_store_apps.rating / .5, 0) * .5 +ROUND(app_store_apps.rating / .5, 0) * .5)/2 AS avg_rating
						 FROM app_store_apps INNER JOIN play_store_apps
						 ON app_store_apps.name=play_store_apps.name)
SELECT app_store_apps.name, app_store_apps.price,CAST(app_store_apps.review_count as integer) AS apple_reviews
FROM app_store_apps INNER JOIN play_store_apps ON app_store_apps.name=play_store_apps.name
    INNER JOIN both_platforms AS bp ON app_store_apps.name=bp.name
	INNER JOIN combined_avg_review AS car ON app_store_apps.name=car.name
	INNER JOIN avg_rating AS ar ON app_store_apps.name=ar.name
WHERE car.avg_review>=1000000
	AND ar.avg_rating>4.5
	AND app_store_apps.price<=.99
		OR type='Free'
ORDER BY apple_reviews DESC;
*/

-- Viber should be on list? DOES have microtransactions (calling time)
-- Second select statement to verify presence of Viber on app store, high
-- review count & rating.
   
SELECT *
FROM play_store_apps
WHERE name IS NOT null
ORDER BY CAST(coalesce(install_count, '0') AS varchar) DESC
LIMIT 20;

SELECT *
FROM app_store_apps
WHERE name ILIKE '%Viber%';
*/

--Games in Top 10 review counts from Apple: Clash of Clans, Temple Run,
--Candy Crush Saga, Angry Birds. ALL FREE WITH IN-APP PURCHASES.
-- 4.5 rating for all = 10 year lifecycle.
SELECT *
FROM app_store_apps
ORDER BY CAST(review_count as integer) DESC
LIMIT 10;


SELECT *
FROM play_store_apps
WHERE name ILIKE '%Clash of Clans%';

SELECT *
FROM play_store_apps
WHERE name ILIKE '%Temple Run%';

SELECT *
FROM play_store_apps
WHERE name ILIKE '%Candy Crush Saga%';

SELECT *
FROM play_store_apps
WHERE name ILIKE '%Angry Birds%';
*/

--Ratings from both platforms
/*SELECT rating, COUNT(*)
FROM app_store_apps
GROUP BY rating;

SELECT rating, COUNT(*)
FROM play_store_apps
WHERE rating IS NOT null
GROUP BY rating;
*/

SELECT AVG(rating)
FROM play_store_apps;

SELECT *
FROM play_store_apps
LIMIT 5;

SELECT *
FROM play_store_apps
WHERE NAME ILIKE '%Pou%';