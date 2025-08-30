// Vendors(vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country)
// Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
// Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
// Orders(order_num, order_date, cust_id)
// OrderItems(item_id, order_num, prod_id, quantity, item_price)


// 第1题
SELECT prod_id, quantity
FROM OrderItems
WHERE quantity = 100
UNION
SELECT prod_id, quantity
FROM OrderItems
WHERE prod_id LIKE 'BNBG%'
ORDER BY prod_id;

// 第2题
SELECT prod_id, quantity
FROM OrderItems
WHERE prod_id LIKE 'BNBG%' OR quantity = 100
ORDER BY prod_id;

// 第3题
SELECT prod_name
FROM Products
UNION
SELECT cust_name
FROM Customers
ORDER BY prod_name;

// 第4题

