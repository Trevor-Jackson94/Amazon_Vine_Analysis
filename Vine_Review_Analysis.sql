-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);
SELECT * FROM vine_table;

-- Table for 20 or more votes
SELECT * INTO vine_table_with_votes
	FROM vine_table	
	WHERE total_votes > 19;
	
-- Table where % helpful votes >= 50%
SELECT * INTO vine_helpful_votes
	FROM vine_table_with_votes
	WHERE total_votes > 0 
	AND (helpful_votes/total_votes) >= 0.5;
	
-- Table where there IS a vine review
SELECT * INTO vine_table_paid
	FROM vine_helpful_votes
	WHERE vine = 'Y';
	
-- Table where there IS NOT a vine review
SELECT * INTO vine_table_unpaid
	FROM vine_helpful_votes
	WHERE vine = 'N';

SELECT * FROM vine_table_paid;
SELECT * FROM vine_table_unpaid;

-- Total number of reviews, 5 star,
-- 	and 5 star % paid reviews
SELECT COUNT(review_id) AS total_number_of_reviews, 
	(SELECT 
	 	COUNT(star_rating) AS five_star_ratings
	 	FROM vine_table_paid
		WHERE star_rating = 5) AS five_star_ratings
	INTO vine_table_paid_stats
	FROM vine_table_paid;

SELECT total_number_of_reviews, 
	five_star_ratings,
	CAST(five_star_ratings AS FLOAT) / CAST(total_number_of_reviews AS FLOAT) * 100 AS percent_five_stars
	FROM vine_table_paid_stats;
	
	
-- Total number of reviews, 5 star,
-- 	and 5 star % NOT paid reviews
SELECT COUNT(review_id) AS total_number_of_reviews, 
	(SELECT 
	 	COUNT(star_rating) AS five_star_ratings
	 	FROM vine_table_unpaid
		WHERE star_rating = 5) AS five_star_ratings
	INTO vine_table_unpaid_stats
	FROM vine_table_unpaid;

SELECT total_number_of_reviews, 
	five_star_ratings,
	CAST(five_star_ratings AS FLOAT) / CAST(total_number_of_reviews AS FLOAT) * 100 AS percent_five_stars
	FROM vine_table_unpaid_stats;