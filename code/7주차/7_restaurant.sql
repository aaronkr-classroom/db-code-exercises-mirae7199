-- Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(13),
    address VARCHAR(100)
);

-- Restaurant Table
CREATE TABLE Restaurant (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(13),
    address VARCHAR(100)
);

-- Order Table
CREATE TABLE Orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_date TIMESTAMP,
    total NUMERIC,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
);

-- Delivery Table
CREATE TABLE Delivery(
    delivery_id INT PRIMARY KEY,
    order_id INT,
    driver_name VARCHAR(100),
    status INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Data 삽입
INSERT INTO Customer values
    (1, '김미래', '01079372524', '동남로 32'),
    (2, '차은호', '01012345678', '경기도 광주시'),
    (3, '정승민', '01045678901', '충청북도 충주시');

INSERT INTO Restaurant values
    (1, '라멘하나시', '02-401-2524', '충주시 호암동'),
    (2, '리밍', '031-422-1623', '충주시 대소원면'),
    (3, '올래국수', '031-242-5256', '충주시 연수동');

INSERT INTO Orders values
    (1, 1, 1,'20260413', '9500'),
    (2, 2, 3, '20260413', '9500'),
    (3, 3, 2, '20260421', '8000');

INSERT INTO Delivery values
    (1, 1, '김다호', 1),
    (2, 2, '임영훈', 1),
    (3, 3, '소재영', 0);

SELECT * FROM Customer;
SELECT * FROM Restaurant;
SELECT * FROM Orders;
SELECT * FROM Delivery;

SELECT * FROM Orders ORDER BY total DESC;
SELECT * FROM Orders WHERE total > 9000;
SELECT * FROM Delivery WHERE status = 1;
