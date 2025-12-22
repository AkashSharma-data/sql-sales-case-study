# SQL Sales Case Study 📊

## 📌 Project Overview
This project is a SQL case study focused on analyzing sales data using structured queries.
The goal is to answer real-world business questions using SQL concepts such as joins,
aggregations, subqueries, and window functions.

---

## 🧠 Business Problem
A retail company wants to understand:
- Sales performance
- Customer behavior
- Top products
- Revenue trends

Using SQL, we analyze the data to generate actionable insights.

---

## 🗂️ Database Schema
The database consists of three tables:

### 1️⃣ Customers
- customer_id (Primary Key)
- customer_name
- city

### 2️⃣ Products
- product_id (Primary Key)
- product_name
- price

### 3️⃣ Orders
- order_id (Primary Key)
- customer_id (Foreign Key)
- product_id (Foreign Key)
- quantity
- order_date

📌 Relationships:
- One customer can place multiple orders
- One product can appear in multiple orders

📷 ER Diagram included in the repository.

---

## 🛠 Tools & Technologies
- SQL (MySQL / PostgreSQL compatible)
- Relational Database Concepts
- ER Diagram Design

---

## 📊 SQL Concepts Used
- SELECT, WHERE
- JOINS (INNER JOIN)
- GROUP BY & HAVING
- Aggregate Functions (SUM, COUNT, AVG)
- Subqueries
- Window Functions
- ORDER BY & LIMIT

---

## ❓ Business Questions Answered
- Total revenue generated
- Top-selling products
- Customers with highest purchases
- City-wise sales distribution
- Monthly sales trends
- Average order value
- Product-wise revenue contribution

---

## 📈 Key Insights
- A small group of customers contributes the highest revenue
- Certain products consistently outperform others
- Sales show clear monthly trends
- Metropolitan cities generate higher sales volume

---

## ✅ Conclusion
This SQL case study demonstrates the ability to:
- Design relational databases
- Write efficient SQL queries
- Solve real business problems using data

This project reflects strong foundational skills required for a Data Analyst role.
