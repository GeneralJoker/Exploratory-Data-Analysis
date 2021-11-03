/* QUESTIONS I WANT TO ANSWER: 

- Is our hotel revenue growing by year?
We have two hotel types so it would be good to segment revenue
by hotel type 

- Should we increase our parking lot size?
We want to understand if there is a trend in guests with personal cars

- What trends can we see in the data? 
Focus on average daily rate and guests to explore seasonality

*/

-- QUESTION 1:
/*SELECT 
arrival_date_year,
hotel,
round(sum((stays_in_week_nights+stays_in_weekend_nights) * adr), 0) as revenue 
FROM hotels
GROUP BY arrival_date_year, hotel
ORDER BY revenue desc*/


with hotels as (
SELECT * FROM dbo.['2018$']
union
SELECT * FROM dbo.['2019$']
union
SELECT * FROM dbo.['2020$'])

select * from hotels
left join market_segment$
on hotels.market_segment = market_segment$.market_segment
left join dbo.meal_cost$
on meal_cost$.meal = hotels.meal