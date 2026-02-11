-- Categories
INSERT INTO Category (category_name) VALUES
('Electronics'),
('Clothing'),
('Books');

-- Products
INSERT INTO Product (category_id, name, description, price, stock) VALUES
(1, 'Laptop', 'High performance laptop', 1200.00, 10),
(1, 'Headphones', 'Noise cancelling headphones', 150.00, 50),
(2, 'T-Shirt', 'Cotton T-shirt', 20.00, 100);

-- Customers
INSERT INTO Customer (first_name, last_name, email, password) VALUES
('John', 'Doe', 'john@example.com', 'hashed-password'),
('Jane', 'Smith', 'jane@example.com', 'hashed-password');

-- Orders
INSERT INTO Orders (customer_id, total_amount) VALUES
(1, 1350.00),
(2, 20.00);

-- Order Items
INSERT INTO Order_Details (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 1200.00),
(1, 2, 1, 150.00),
(2, 3, 1, 20.00);

SELECT   o.order_id,
    o.order_date,
    o.total_amount,
    c.customer_id,
    c.first_name,
    c.last_name FROM Orders o 
JOIN Customer c ON o.customer_id = o.customer_id
GROUP BY order_id 
ORDER BY o.order_date LIMIT 1000;