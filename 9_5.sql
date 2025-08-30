// 第1题
SELECT SUM(quantity) AS total_quantity FROM OrderItems;

// 第2题
SELECT SUM(quantity) AS total_quantity_BR01 FROM OrderItems WHERE prod_item = 'BR01';

// 第3题
SELECT MAX(prod_price) AS max_prod_price_less_10 FROM OrderItems WHERE prod_price <= 10;

