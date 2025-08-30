SELECT order_num, COUNT(*) AS order_lines 
FROM OrderItems 
GROUP BY order_num 
ORDER BY order_lines;

SELECT vender_name, MIN(prod_price) AS cheapest_item 
FROM Products 
GROUP BY vender_name 
ORDER BY cheapest_item ASC;

SELECT order_num, SUM(quantity) AS total_quantity 
FROM OrderItems 
GROUP By order_num 
HAVING SUM(quantity) >= 100 
ORDER By order_num, total_quantity;

SELECT order_num, SUM(item_price * quantity) AS total_price 
FROM OrderItems 
GROUP BY order_num 
HAVING total_price >= 1000 
ORDER By order_num, total_price;

