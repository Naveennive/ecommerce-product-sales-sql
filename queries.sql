-- ===========================
-- BASIC SQL QUERIES
-- ===========================

-- 1. View all products
SELECT * FROM Products;

-- 2. View all customers
SELECT * FROM Customers;

-- 3. Count total customers
SELECT COUNT(*) AS Total_Customers
FROM Customers;

-- 4. Count total products
SELECT COUNT(*) AS Total_Products
FROM Products;

-- 5. Display products costing more than ₹5000
SELECT *
FROM Products
WHERE price > 5000;

-- ===========================
-- INTERMEDIATE SQL QUERIES
-- ===========================

-- 6. Total Revenue
SELECT
SUM(p.price * oi.quantity) AS Total_Revenue
FROM Order_Items oi
JOIN Products p
ON oi.product_id = p.product_id;

-- 7. Top Selling Products
SELECT
p.product_name,
SUM(oi.quantity) AS Total_Quantity_Sold
FROM Order_Items oi
JOIN Products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY Total_Quantity_Sold DESC;

-- 8. Revenue by Category
SELECT
c.category_name,
SUM(p.price * oi.quantity) AS Revenue
FROM Order_Items oi
JOIN Products p
ON oi.product_id = p.product_id
JOIN Categories c
ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY Revenue DESC;

-- 9. Top Customers
SELECT
cu.customer_name,
SUM(p.price * oi.quantity) AS Total_Spent
FROM Customers cu
JOIN Orders o
ON cu.customer_id = o.customer_id
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id
GROUP BY cu.customer_name
ORDER BY Total_Spent DESC;

-- 10. Monthly Sales
SELECT
DATE_FORMAT(order_date,'%Y-%m') AS Month,
SUM(p.price * oi.quantity) AS Revenue
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id
GROUP BY Month
ORDER BY Month;

-- ===========================
-- ADVANCED SQL
-- ===========================

-- 11. Rank Customers by Spending
SELECT
customer_name,
Total_Spent,
RANK() OVER(ORDER BY Total_Spent DESC) AS Customer_Rank
FROM
(
SELECT
cu.customer_name,
SUM(p.price * oi.quantity) AS Total_Spent
FROM Customers cu
JOIN Orders o
ON cu.customer_id=o.customer_id
JOIN Order_Items oi
ON o.order_id=oi.order_id
JOIN Products p
ON oi.product_id=p.product_id
GROUP BY cu.customer_name
) t;

-- 12. Products Never Purchased
SELECT product_name
FROM Products
WHERE product_id NOT IN
(
SELECT DISTINCT product_id
FROM Order_Items
);

-- 13. Average Order Value
SELECT
AVG(Order_Total) AS Average_Order_Value
FROM
(
SELECT
o.order_id,
SUM(p.price * oi.quantity) AS Order_Total
FROM Orders o
JOIN Order_Items oi
ON o.order_id=oi.order_id
JOIN Products p
ON oi.product_id=p.product_id
GROUP BY o.order_id
) t;
