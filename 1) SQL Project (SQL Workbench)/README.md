
# MovieBooking - SQL Database Project


A complete **MySQL database schema** and **sample data** for a Movie Ticket Booking System. 

This project demonstrates relational database design, foreign keys, joins, aggregations, and real-world queries.

Built as a mini-project for learning SQL (joins, grouping, subqueries, etc.).

---

##  Project Screenshot 

[MovieBooking Database Screenshot]

### Snap 1 :-

 <img width="1366" height="768" alt="Image" src="https://github.com/user-attachments/assets/7bda44f0-af34-4e0f-9adb-d19480f3efd7" />

### Snap 2 :-

<img width="1366" height="768" alt="Image" src="https://github.com/user-attachments/assets/8c153ef7-325a-45e1-a612-afaded4fa4fa" />

### Snap 3 :- 

<img width="1366" height="768" alt="Image" src="https://github.com/user-attachments/assets/74d30d45-e674-4e4b-be96-12b665c60c0c" />


---

##  Database Schema

### Tables Created :-
- **Movies** — movie details (name, genre, duration)

- **Theaters** — theater information (name, location)

- **Shows** — movie screenings with time, price & venue

- **Customers** — customer records

- **Bookings** — booking transactions with seats & date


All tables use proper **PRIMARY KEY**, **AUTO_INCREMENT**, and **FOREIGN KEY** constraints.

---

##  Sample Data Inserted

- 3 Movies :- *Dhurandhar*, *Partner*, *Badla*

- 3 Theaters :- PVR Thane, INOX Mumbai, Cinepolis Navi Mumbai

- 3 Shows (Jan 2025)

- 3 Customers :- Pawan, Samyak, Aman

- 3 Bookings


---

## 10 Real-World SQL Queries Included

All queries are tested and ready to run :-

1. **Show all booked tickets** with customer & movie name 

2. **Total revenue** from each movie  

3. **Most watched movie** (by total tickets sold)  

4. **Theater-wise earnings**  

5. Customers who booked **more than 2 seats**  

6. **List all available shows** with details  

7. Total bookings & seats booked by **each customer** 

8. **Average ticket price** across all sold tickets  

9. Customers who booked on **15th January 2025**  

10. **Total amount spent** by each customer

*(All queries are present in the repository as `queries.sql`)*

---

##  How to Run / Setup

### Using MySQL Command Line / Workbench


- Run the entire setup file 

  source moviebooking_setup.sql;

- Run individual queries

  source queries.sql;

## What You Will Learn

- Designing normalized relational databases
- Using FOREIGN KEY constraints
- INNER JOIN, LEFT JOIN
- GROUP BY + HAVING + aggregate functions (SUM, AVG, COUNT)
- Filtering with WHERE and DATE
- Real-world business queries for a booking system

## Author

**SAMYAK VAIDYA**  
Artificial Intelligence & Data Science Enthusiast  
Connect on [LinkedIn](https://www.linkedin.com/in/samyak-vaidya-4bb9b4282)
