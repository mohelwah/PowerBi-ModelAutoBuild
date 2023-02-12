SELECT * 
from orders o
JOIN refunds r on o.id = r.order_id


// group order by countery


'''1. What is the percentage of customers that purchased
devices of the same brand for their first and second
order? Show the results by the brand they used
for their first order.'''
SELECT  o.customer_id, 
 COUNT(*) as total_order_per_category 
FROM orders o
INNER JOIN
    (SELECT customer_id,product_id, MIN(date) As first_order
FROM orders
GROUP BY customer_id) X
ON o.customer_id = X.customer_id AND o.date = X.first_order

'''2. Find the customer that spent the most money in the
fifth largest product category for refurbed (defined as
total number of orders per category in 2020)?
'''
SELECT c.name, 
 COUNT(*) as total_order_per_category 
FROM orders o
JOIN customer c on c.id = o.customer_id
GROUP BY  customer_id
ORDER by total_order_per_category DESC

'''3. Which country has the highest ratio of fully
refunded orders in sales (i.e. refund amount is the
same as initial order amount) in 2019?'''
SELECT o.country, o.charged_eur, r.amount_eur
FROM orders o
JOIN refunds r on r.order_id = o.id
ORDER by r.amount_eur DESC




'''1. What is the percentage of customers that purchased
devices of the same brand for their first and second
order? Show the results by the brand they used
for their first order.'''
SELECT c.id, c.name, p.brand, count(*) as purch_percent_cust
from orders o
JOIN customer c on c.id = o.customer_id
join products p on p.id = o.product_id
GROUP by p.brand


SELECT customer_id,product_id, MIN(date) As first_order
FROM orders
GROUP BY customer_id