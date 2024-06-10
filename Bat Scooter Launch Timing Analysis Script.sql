-- Extraction and Analysis of Scooter products in the "Products" and "Sales" Tables to form a new table using INNER JOIN

SELECT *  FROM products 

WHERE product_type = 'scooter';

SELECT * FROM sales 

LIMIT 5;

SELECT products.model, sales.sales_transaction_date

INTO bat_ltd_sales

FROM sales

INNER JOIN products

ON sales.product_id = products.product_id

WHERE sales.product_id = 8

ORDER BY sales.sales_transaction_date;

-- Dataset analysis to uncover the total sales of the "BAT LIMITED EDITION"

SELECT * FROM bat_ltd_sales 

LIMIT 10;

SELECT count(model) FROM bat_ltd_sales;

SELECT MAX(sales_transaction_date) 

FROM bat_ltd_sales;

-- Altering the respective Sales dates to specified dates only and discarding the time component, as its redundant.

ALTER TABLE bat_ltd_sales

ALTER COLUMN sales_transaction_date TYPE date;

-- Generation of Daily Sales Data for the "BAT LIMITED EDITION"

SELECT * FROM bat_ltd_sales

LIMIT 5;

SELECT sales_transaction_date, count(sales_transaction_date)

INTO bat_ltd_sales_count

FROM bat_ltd_sales

GROUP BY sales_transaction_date

ORDER BY sales_transaction_date;

SELECT * FROM bat_ltd_sales_count 

LIMIT 5;

SELECT * FROM bat_ltd_sales_count 

ORDER BY sales_transaction_date

LIMIT 17;

SELECT *, sum(count) OVER (ORDER BY sales_transaction_date)

INTO bat_ltd_sales_growth

FROM bat_ltd_sales_count;

SELECT * FROM bat_ltd_sales_growth

ORDER BY sales_transaction_date

LIMIT 20;

SELECT * FROM bat_sales_growth

ORDER BY sales_date

LIMIT 20;

--Computation of the Lag for the SUM and formation of new table bat_ltd_sales_delay

SELECT *, lag(sum, 7) 

OVER (ORDER BY sales_transaction_date)

INTO bat_ltd_sales_delay

FROM bat_ltd_sales_growth;

-- Computation of Sales Volume growth and formation of new table bat_ltd_sales_vol

SELECT *, (sum-lag)/lag AS Volume

INTO bat_ltd_sales_vol

FROM bat_ltd_sales_delay;

SELECT * FROM bat_ltd_sales_vol

ORDER BY sales_transaction_date

LIMIT 20;