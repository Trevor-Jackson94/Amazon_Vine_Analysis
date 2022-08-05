# Amazon_Vine_Analysis
ETL Process using AWS S3 buckets, AWS RDS, pgAdmin4 with PostgreSQL, and Google Colab with PySpark.

## Overview
The purpose of this analysis was to fully complete the ETL process for a dataset pulled from the Amazon Reviews API for Video Games into Google Colab and cleaning the data with PySpark, transferring from our cleaned dataset from Google Colab into our AWS database, and querying the data to refine our results using SQL in pgAdmin4. 

## Results
- There are a total of 2375 significant "Vine" Amazon reviews for video games and a total of 3 significant "Non-Vine" Amazon reviews for video games.
- Of these two categories 66.66% of the "Vine" Amazon reviews are 5 star (the 3rd review being 3 stars) and 56.04% "Non-Vine" Amazon reviews.
- 1331 of the "Non-Vine" reviews were ratings of 5-stars and 2 out of 3 of the "Vine" reviews were ratings of 5-stars.

![Vine Review Stats](https://github.com/Trevor-Jackson94/Amazon_Vine_Analysis/blob/main/vine.PNG?raw=true)

![Non-Vine Review Stats](https://github.com/Trevor-Jackson94/Amazon_Vine_Analysis/blob/main/nonvine.PNG?raw=true)

## Summary
While our sample set of "Vine" reviews is quite small compared to our sample set for "Non-Vine" reviews in the video games category, it does seem to show biased (based on the 3 vine reviews) toward positive reviews. More analysis on the ratings based on verified_purchase vs not verified_purchase might show us a better distribution of data. 
