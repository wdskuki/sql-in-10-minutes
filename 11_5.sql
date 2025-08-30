// Vendors(vend_id, vend_name, vend_address, vend_city, vend_state, vend_zip, vend_country)
// Products(prod_id, vend_id, prod_name, prod_price, prod_desc)
// Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
// Orders(order_num, order_date, cust_id)
// OrderItems(item_id, order_num, prod_id, quantity, item_price)

// 第1题
SELECT cust_id 
FROM Orders 
WHERE order_num IN 
( SELECT order_num 
  FROM OrderItems 
  WHERE order_price >= 10 
);

// 第2题
SELECT cust_id, order_date 
FROM Orders 
WHERE order_num IN 
( SELECT order_num 
  FROM OrderItems
  WHERE prod_id = 'BR01' 
) 
ORDER BY order_date;

// 第3题
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

// 第4题
SELECT cust_id, 
( SELECT SUM(quantity * item_price)
  FROM OrderItems 
  WHERE OrderItems.order_num = Orders.order_num 
) AS total_ordered  
FROM Orders 
GROUP BY cust_id 
ORDER BY total_ordered DESC;

// 第5题
SELECT Products.prod_name, 
( SELECT SUM(quantity) 
  FROM OrderItems 
  WHERE OrderItems.prod_id = Products.prod_id 
) AS quant_sold 
FROM Products;


