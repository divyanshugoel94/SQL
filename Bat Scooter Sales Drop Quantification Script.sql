-- Computation of daily cumulative sum of sales using the OVER and ORDER_BY statements and inserting the subsequent results into bat_sales_growth

SELECT *, sum(count) OVER (ORDER BY sales_date)

INTO bat_sales_growth

FROM bat_sales_daily;

-- Computation of a Seven-day Lag of the Sum Column and insert all columns of bat_sales_daily

SELECT *, lag(sum, 7) OVER (ORDER BY sales_date) 

INTO bat_sales_daily_delay FROM bat_sales_growth;

--Inspection of first 15 rows of bat_sales_growth

SELECT * FROM bat_sales_daily_delay LIMIT 15;

--Computation of the sales Growth as a percentage comparing the current sales volume to the week prior. 

SELECT *, (sum-lag)/lag AS volume

INTO bat_sales_delay_vol FROM bat_sales_daily_delay;

--Comparison of the first 22 values of the newly formed table

SELECT * FROM bat_sales_delay_vol LIMIT 22;