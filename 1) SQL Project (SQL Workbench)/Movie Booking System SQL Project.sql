DROP DATABASE  MovieBooking;
CREATE DATABASE MovieBooking;
USE MovieBooking;

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(100),
    genre VARCHAR(50),
    duration INT
);

CREATE TABLE Theaters (
    theater_id INT PRIMARY KEY AUTO_INCREMENT,
    theater_name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    theater_id INT,
    show_time DATETIME,
    price DECIMAL(8,2),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    show_id INT,
    seats INT,
    booking_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

INSERT INTO Movies (movie_name, genre, duration) VALUES
('Dhurandhar', 'Action', 150),
('Partner', 'Comedy', 170),
('Badla', 'Thriller', 145);

INSERT INTO Theaters (theater_name, location) VALUES
('PVR Cinemas', 'Thane'),
('INOX', 'Mumbai'),
('Cinepolis', 'Navi Mumbai');

INSERT INTO Shows (movie_id, theater_id, show_time, price) VALUES
(1, 1, '2025-01-15 18:00:00', 250),
(2, 2, '2025-01-15 20:00:00', 200),
(3, 3, '2025-01-16 19:00:00', 300);

INSERT INTO Customers (customer_name, phone) VALUES
('Pawan', '9167458788'),
('Samyak', '9833983925'),
('Aman', '7709432215');

INSERT INTO Bookings (customer_id, show_id, seats, booking_date) VALUES
(1, 1, 2, '2025-01-15'),
(2, 2, 3, '2025-01-15'),
(3, 3, 1, '2025-01-16');

select * from Customers;


-------------------------------------------# QUESTION ASKED------------------------------------------------

# 1) Show all booked tickets with customer & movie name ---- (Samyak Vaidya)

SELECT b.booking_id, c.customer_name, m.movie_name, b.seats, s.show_time
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id;

# 2) Total revenue from each movie ---- (Samyak Vaidya)

SELECT m.movie_name, SUM(b.seats * s.price) AS total_revenue
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
GROUP BY m.movie_name;

# 3) Most watched movie ----- (Saurabh Singh)

SELECT m.movie_name, SUM(b.seats) AS total_tickets
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
GROUP BY m.movie_name
ORDER BY total_tickets DESC
LIMIT 1;

# 4) Theater wise earnings ----- (Saurabh Singh)

SELECT t.theater_name, SUM(b.seats * s.price) AS earnings
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id
JOIN Theaters t ON s.theater_id = t.theater_id
GROUP BY t.theater_name;

# 5) Customers who booked more than 2 seats ----- (Shashi kumar)

SELECT c.customer_name, SUM(b.seats) AS total_seats
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
GROUP BY c.customer_name
HAVING total_seats > 2;

# 6) List all available shows with movie name, theater, show time and price ----- (Shashi kumar)

SELECT s.show_id, m.movie_name, t.theater_name, s.show_time, s.price 
FROM Shows s 
JOIN Movies m ON s.movie_id = m.movie_id 
JOIN Theaters t ON s.theater_id = t.theater_id;

# 7) Total bookings and seats booked by each customer ----- (Pawan Singh)

SELECT c.customer_name, 
       COUNT(b.booking_id) AS total_bookings, 
       SUM(b.seats) AS total_seats_booked
FROM Customers c
LEFT JOIN Bookings b ON c.customer_id = b.customer_id
GROUP BY c.customer_name;

# 8) Average ticket price across all sold tickets ----- (Pawan Singh)

SELECT AVG(s.price) AS avg_price_per_ticket
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id;

# 9) Customers who booked on 15th January 2025 ----- (Gautam)

SELECT DISTINCT c.customer_name, b.booking_date
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
WHERE b.booking_date = '2025-01-15';

# 10) Total amount spent by each customer ----- (Aman Sonkar)

SELECT c.customer_name, 
       SUM(b.seats * s.price) AS total_spent
FROM Customers c
LEFT JOIN Bookings b ON c.customer_id = b.customer_id
LEFT JOIN Shows s ON b.show_id = s.show_id
GROUP BY c.customer_name;



