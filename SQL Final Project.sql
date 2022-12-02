-- Analyzing data using SQL Queries
-- Case Project: The International breweries data recorded for a duration of three years 2017 - 2019
-- Case Areas: • Profit Analysis • Brand Analysis • Geo-Location Analysis

CREATE DATABASE International_Breweries;
-- SELECT * FROM international_breweries.
SELECT * FROM international_breweries.`international breweries`;

									-- PROFIT ANALYSIS
                                    
-- Within the space of the last three years, what was the profit worth of the breweries, inclusive of the anglophone and the francophone territories?
SELECT Years, sum(Profit) AS Total_Profit
FROM international_breweries.`international breweries`
GROUP BY YEARS
ORDER BY sum(profit);

-- Compare the total profit between these two territories in order for the territory  manager, Mr. Stone made a strategic decision that will aid profit maximization in 2020.
SELECT Territories, sum(PROFIT)
FROM  international_breweries.`international breweries`
GROUP BY Territories
ORDER BY sum(PROFIT);


-- Country that generated the highest profit in 2019
SELECT COUNTRIES,SUM(profit)
FROM international_breweries.`international breweries`
WHERE YEARS = 2019
GROUP BY countries
ORDER BY sum(profit) DESC
limit 10;

-- Help him find the year with the highest profit.
SELECT YEARS,SUM(profit)
FROM international_breweries.`international breweries`
GROUP BY YEARS
ORDER BY  sum(profit)
limit 1;

-- Which month in the three years was the least profit generated?
SELECT MONTHS,SUM(profit)
FROM international_breweries.`international breweries`
GROUP BY MONTHS
ORDER BY  sum(profit) DESC
limit 1;

-- What was the minimum profit in the month of December 2018?
SELECT MIN(Profit)
FROM international_breweries.`international breweries`
WHERE MONTHS = "December" AND YEARS = 2018;

-- Compare the profit in percentage for each of the month in 2019
SELECT Months, (profit * 0.01) AS percentage_Profit 
FROM international_breweries.`international breweries`
WHERE YEARS = 2019
GROUP BY MONTHS
ORDER BY PROFIT;

-- Which particular brand generated the highest profit in Senegal?
SELECT BRANDS, Sum(profit)
FROM international_breweries.`international breweries`
WHERE COUNTRIES = "Senegal"
GROUP By BRANDS
ORDER BY sum(PROFIT) DESC
limit 1;


										-- BRAND ANALYSIS

-- Within the last two years, the brand manager wants to know the top three brands consumed in the  francophone countries
SELECT BRANDS, sum(QUANTITY) AS Quantity_Consumed
FROM international_breweries.`international breweries`
WHERE YEARS IN (2018, 2019) AND Territories= 'Francophone'
GROUP BY BRANDS
ORDER BY sum(QUANTITY)  DESC
LIMIT 3;

-- Find out the top two choice of consumer brands in Ghana
SELECT BRANDS AS Consumer_Brands, count(COST) 
from international_breweries.`international breweries`
WHERE COUNTRIES = "Ghana"
GROUP BY BRANDS 
ORDER BY count(COST) 
desc limit 2;

-- Find out the details of beers consumed in the past three years in the most oil rich country in West Africa.
SELECT BRANDS, sum(QUANTITY) 
FROM international_breweries.`international breweries`
-- Nigeria is the only oil rich country in west Africa
WHERE COUNTRIES = "Nigeria" AND BRANDS NOT LIKE "%malt"
GROUP BY BRANDS 
ORDER BY sum(QUANTITY) 
desc;

-- Favorites malt brand in Anglophone region between 2018 and 2019
SELECT BRANDS, sum(QUANTITY) 
FROM international_breweries.`international breweries`
WHERE BRANDS LIKE "%malt" AND Territories = 'Anglophone' AND YEARS IN (2018, 2019)
GROUP BY BRANDS 
ORDER BY sum(QUANTITY) 
desc LIMIT 1;

-- Which brands sold the highest in 2019 in Nigeria?
SELECT BRANDS, sum(QUANTITY) 
from international_breweries.`international breweries`
WHERE COUNTRIES = "Nigeria" AND YEARS = 2019
GROUP BY BRANDS 
ORDER BY sum(QUANTITY) 
desc;

-- Favorites brand in South South region in Nigeria
SELECT BRANDS
FROM international_breweries.`international breweries`
WHERE COUNTRIES = "Nigeria" AND REGION = 'Southsouth'
GROUP BY BRANDS
ORDER BY BRANDS desc;

-- Bear consumption in Nigeria
SELECT BRANDS, sum(QUANTITY)
FROM international_breweries.`international breweries`
WHERE COUNTRIES= "Nigeria"
GROUP BY BRANDS
ORDER BY sum(QUANTITY) desc;

-- Level of consumption of Budweiser in the regions in Nigeria
SELECT BRANDS, sum(QUANTITY) 
from international_breweries.`international breweries`
WHERE COUNTRIES = "Nigeria" AND BRANDS = 'Budweiser'
GROUP BY BRANDS 
ORDER BY sum(QUANTITY) 
desc;

-- Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo)
SELECT BRANDS, sum(QUANTITY) 
from international_breweries.`international breweries`
WHERE COUNTRIES = "Nigeria" AND BRANDS = 'Busweiser' AND YEARS = 2019
GROUP BY BRANDS 
ORDER BY sum(QUANTITY) 
desc;



							-- GEO-LOCATION ANALYSIS--
                            
-- Country with the highest consumption of beer.
SELECT COUNTRIES, sum(QUANTITY) 
from international_breweries.`international breweries`
GROUP BY COUNTRIES 
ORDER BY sum(QUANTITY) 
desc LIMIT 1;

--  Highest sales personnel of Budweiser in Senegal
SELECT SALES_REP, sum(PROFIT) 
from international_breweries.`international breweries`
GROUP BY SALES_REP 
ORDER BY sum(PROFIT) 
desc LIMIT 1;

-- Country with the highest profit of the fourth quarter in 2019
SELECT COUNTRIES, sum(PROFIT) 
from international_breweries.`international breweries`
WHERE YEARS = 2019
GROUP BY COUNTRIES 
ORDER BY sum(PROFIT) 
desc LIMIT 1;