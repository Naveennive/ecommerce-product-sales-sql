-- Categories
INSERT INTO Categories VALUES
(1,'Electronics'),
(2,'Home Appliances'),
(3,'Fashion'),
(4,'Books'),
(5,'Sports');

-- Products
INSERT INTO Products VALUES
(101,'iPhone 15',1,'Apple',79999),
(102,'Galaxy S24',1,'Samsung',74999),
(103,'Sony Headphones',1,'Sony',8999),
(104,'LG Refrigerator',2,'LG',45999),
(105,'Nike Running Shoes',5,'Nike',5999),
(106,'Levi''s Jeans',3,'Levis',2999),
(107,'Atomic Habits',4,'Penguin',499),
(108,'Adidas Football',5,'Adidas',1499);

-- Customers
INSERT INTO Customers VALUES
(1,'Rahul Sharma','Chennai','Tamil Nadu'),
(2,'Priya Nair','Bengaluru','Karnataka'),
(3,'Arjun Kumar','Hyderabad','Telangana'),
(4,'Sneha Reddy','Mumbai','Maharashtra'),
(5,'Vikram Singh','Delhi','Delhi');

-- Orders
INSERT INTO Orders VALUES
(1001,1,'2025-01-10'),
(1002,2,'2025-01-15'),
(1003,3,'2025-02-02'),
(1004,1,'2025-02-10'),
(1005,4,'2025-03-12'),
(1006,5,'2025-03-20');

-- Order Items
INSERT INTO Order_Items VALUES
(1,1001,101,1),
(2,1001,103,2),
(3,1002,102,1),
(4,1002,105,2),
(5,1003,107,3),
(6,1004,106,2),
(7,1005,104,1),
(8,1005,108,4),
(9,1006,105,1),
(10,1006,103,1);
