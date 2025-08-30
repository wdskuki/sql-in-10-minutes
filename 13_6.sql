// Vendors(vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country)
// Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
// Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
// Orders(order_num, order_date, cust_id)
// OrderItems(item_id, order_num, prod_id, quantity, item_price)

// 第1题
SELECT cust_name, order_num
FROM Customers
INNER JOIN Orders
ON Customers.cust_id = Orders.cust_id;

// 第2题
SELECT cust_name 
FROM Customers
LEFT OUTER JOIN Orders
ON Orders.cust_id = Customers.cust_id; 

// 第3题
SELECT prod_name, order_num
FROM Products
LEFT OUTER JOIN OrderItems
ON OrderItems.order_num = Products.order_num
ORDER BY prod_name;

// 第4题
SELECT prod_name, COUNT(order_num)
FROM Products
LEFT OUTER JOIN OrderItems
ON OrderItems.order_num = Products.order_num
GROUP BY prod_name
ORDER BY prod_name;

// 第5题
SELECT vend_id, COUNT(*)
FROM Vendors
LEFT OUTER JOIN Products
ON Products.vend_id = Vendors.vend_id
GROUP BY Vendors.vend_id
ORDER BY vend_id;

