SELECT * 

FROM emails

LIMIT 10

SELECT

emails.email_subject,
emails.customer_id,
emails.opened,
emails.sent_date,
emails.opened_date,
bat_sales.sales_date

INTO bat_emails

FROM emails

INNER JOIN bat_sales

ON bat_sales.customer_id = emails.customer_id

ORDER BY bat_sales.sales_date

SELECT *

FROM bat_emails

ORDER BY sales_date

LIMIT 15

SELECT *

FROM bat_emails

WHERE sent_date < sales_date

ORDER BY customer_id

LIMIT 100

DELETE FROM

bat_emails

WHERE sent_date<'2019-06-07'

DELETE FROM

bat_emails

WHERE

sales_date - sent_date > '30 days'

SELECT * FROM bat_emails

ORDER BY customer_id

LIMIT 25

SELECT DISTINCT(email_subject)

FROM bat_emails

DELETE FROM

bat_emails

WHERE position('Black Friday' in email_subject) > 0

DELETE FROM

bat_emails

WHERE position('25 % off all EV' in email_subject) > 0


DELETE FROM

bat_emails

WHERE position('Some New EV' in email_subject) > 0

SELECT count(sales_date)

FROM bat_emails

SELECT count(opened)

FROM bat_emails

WHERE opened = 't'

SELECT count(DISTINCT(customer_id))

FROM bat_emailsSELECT count(DISTINCT(customer_id))

FROM bat_emails

SELECT count(DISTINCT(customer_id))

FROM bat_sales

SELECT 5497.0/6659.0 AS email_rate;


