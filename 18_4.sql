// 第1题
CREATE VIEW CustomersWithOrders AS
SELECT Customers.* 
FROM Customers
INNER JOIN Orders
ON Orders.cust_id = Customers.cust_id;

// 第2题

