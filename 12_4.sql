// Vendors(vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country)
// Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
// Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
// Orders(order_num, order_date, cust_id)
// OrderItems(item_id, order_num, prod_id, quantity, item_price)


// 第1题
SELECT Customers.cust_name, Orders.order_num 
FROM Customers, Orders 
WHERE Customers.cust_id = Orders.cust_id 
ORDER BY Customers.cust_name, Orders.order_num;

// 第1题（第2种方法）
SELECT Customers.cust_name, Orders.order_num 
FROM Customers 
INNER JOIN Orders 
ON Customers.cust_id = Orders.cust_id 
ORDER BY Customers.cust_name, Orders.order_num;

// 第2题
SELECT Customers.cust_name, Orders.order_num, 
( SELECT SUM(quantity * item_price)
  FROM OrderItems 
  WHERE OrderItems.order_num = Orders.order_num 
) AS OrderTotal 
FROM Customers, Orders 
WHERE Customers.cust_id = Orders.cust_id 
ORDER BY Customers.cust_name, Orders.order_num;

// 第2题（第2种方法）
SELECT Customers.cust_name, Orders.order_num, SUM(OrderItems.quantity * OrderItems.item_price) AS OrderItems 
FROM Customers, Orders, OrderItems 
WHERE Customers.cust_id = Orders.cust_id 
AND Orders.order_num = OrderItems.order_num 
GROUP BY Customers.cust_name, Orders.order_num 
ORDER BY Customers.cust_name, Orders.order_num;

// 第3题
SELECT cust_id, order_date 
FROM Orders, OrderItems 
WHERE Orders.order_num = OrderItems.order_num 
AND OrderItems.prod_id = 'BR01' 
ORDER BY order_date;

// 第3题（第2种方法）
SELECT cust_id, order_date 
FROM Orders 
INNER JOIN OrderItems 
ON Orders.order_num = OrderItems.order_num
AND OrderItems.prod_id = 'BR01' 
ORDER BY order_date;

// 第4题
SELECT cust_contact 
FROM Customers 
WHERE cust_id IN 
( SELECT cust_id 
  FROM Orders 
  WHERE order_num IN 
  ( SELECT order_num 
    FROM OrderItems 
    WHERE prod_id = 'BR01' 
  )
);

SELECT cust_contact 
FROM Customers 
INNER JOIN Orders 
ON Orders.cust_id = Customers.cust_id
INNER JOIN OrderItems 
ON OrderItems.order_num = Orders.order_num
WHERE OrderItems.prod_id = 'BR01';

// 第5题
SELECT Customers.cust_id, Customers.cust_name, SUM(OrderItems.quantity * OrderItems.prod_price) AS total_price
FROM Customers, OrderItems, Orders 
WHERE Customers.cust_id = Orders.cust_id 
AND Orders.order_num = OrderItems.order_num 
GROUP BY cust_id
HAVING  total_price >= 1000
ORDER BY total_price DESC;