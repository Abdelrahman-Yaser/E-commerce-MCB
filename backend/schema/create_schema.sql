-- Create Category table
CREATE TABLE IF NOT EXISTS Category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Create Product table
CREATE TABLE IF NOT EXISTS Product (
    product_id SERIAL PRIMARY KEY,
    category_id INT NOT NULL REFERENCES Category(category_id),
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price NUMERIC(10,2) NOT NULL,
    stock INT NOT NULL
);

-- Create Customer table
CREATE TABLE IF NOT EXISTS Customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(200) NOT NULL
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES Customer(customer_id),
    order_date TIMESTAMP DEFAULT NOW(),
    total_amount NUMERIC(10,2) NOT NULL
);

-- Create Order Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES Orders(order_id),
    product_id INT NOT NULL REFERENCES Product(product_id),
    quantity INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL
);



SELECT c.category_name, SUM(p.price) AS total_revenue
FROM Category c
LEFT JOIN Product p ON c.category_id = p.category_id
GROUP BY c.category_name;
ORDER BY  total_revenue DESC;
 