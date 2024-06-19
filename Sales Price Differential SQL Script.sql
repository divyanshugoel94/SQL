SELECT sales_transaction_date

INTO lemon_sales

FROM sales

WHERE product_id = 3

SELECT count(sales_transaction_date)

FROM lemon_sales

ALTER TABLE lemon_sales

ALTER COLUMN sales_transaction_date TYPE DATE

SELECT sales_transaction_date, count(sales_transaction_date)

INTO lemon_sales_count

FROM lemon_sales

GROUP BY sales_transaction_date

ORDER BY sales_transaction_date

SELECT *, sum(count) OVER (ORDER BY sales_transaction_date)

INTO lemon_sales_sum

FROM lemon_sales_count

SELECT *, lag(sum, 7) OVER (ORDER BY sales_transaction_date)

INTO lemon_sales_delay

FROM lemon_sales_sum

SELECT *, (sum-lag)/lag AS volume

INTO lemon_sales_growth

FROM lemon_sales_delay

SELECT * FROM lemon_sales_growth 

ORDER BY sales_transaction_date

LIMIT 25;