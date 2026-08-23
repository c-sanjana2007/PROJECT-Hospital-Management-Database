# PROJECT-Hospital-Management-Database
# 🏥 Hospital Management System

A **relational database project built using MySQL and SQL** to manage essential hospital operations, including **patients, doctors, appointments, treatments, and billing**.

This project demonstrates how SQL can be used to design a structured database, maintain relationships between entities, perform CRUD operations, and extract meaningful information from real-world healthcare data.

## 📌 Project Overview

The Hospital Management System consists of **five interconnected tables**:

* **Patients** – Stores patient personal and medical-related information.
* **Doctors** – Stores doctor details, specialization, experience, and department.
* **Appointments** – Manages appointments between patients and doctors.
* **Treatments** – Stores diagnosis and treatment cost associated with appointments.
* **Bills** – Manages billing amounts, payment status, and billing dates.

The database uses **Primary Keys and Foreign Keys** to establish relationships between tables and maintain data integrity.

## 🎯 Key Features

* Structured relational database design
* Patient and doctor record management
* Appointment management
* Treatment and diagnosis records
* Billing and payment tracking
* CRUD operations
* Data filtering and sorting
* Revenue and treatment analysis
* Doctor ranking based on experience
* Patient-doctor information through database views

## 🛠️ SQL Concepts Demonstrated

* Database & Table Creation (DDL)
* Data Manipulation (DML)
* Primary Keys & Foreign Keys
* `NOT NULL` and `UNIQUE` constraints
* CRUD Operations
* `WHERE`, `ORDER BY`, `LIMIT`
* Aggregate Functions: `COUNT()`, `SUM()`, `AVG()`, `MAX()`, `MIN()`
* `GROUP BY` & `HAVING`
* Joins: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
* Subqueries
* Window Functions: `RANK()`, `ROW_NUMBER()`, `DENSE_RANK()`
* SQL Views

## 📊 Example Analysis

The project includes SQL queries to:

* Identify patients above a certain age
* Find experienced doctors
* Retrieve pending appointments
* Find the highest treatment costs
* Calculate total paid revenue
* Calculate average treatment costs
* Analyze revenue by payment status
* Find the most experienced doctors
* Rank doctors based on experience
* Retrieve combined patient, doctor, treatment, and billing information

## 🗃️ Database Relationships

```text
Patients
   │
   ├── Appointments ─── Doctors
   │        │
   │        └── Treatments
   │                │
   └────────────── Bills
```

These relationships allow related hospital information to be connected and queried efficiently.

## 💻 Tech Stack

| Technology          | Purpose                                  |
| ------------------- | ---------------------------------------- |
| **MySQL**           | Relational Database Management System    |
| **SQL**             | Database design, manipulation & querying |
| **MySQL Workbench** | Database development and query execution |

## 🚀 How to Run

1. Install **MySQL** and **MySQL Workbench**.
2. Open the `Hospital_db.sql` file in MySQL Workbench.
3. Execute the SQL script to create the database and tables.
4. Insert the sample records.
5. Run the provided queries to explore the database.

## 📁 Project Files

* `Hospital_db.sql` – Database creation, table definitions, sample data, and SQL queries.
* `Hospital Management System Analysis.pdf` – Project documentation with SQL queries and outputs.

## 📚 What I Learned

Through this project, I gained practical experience in **relational database design and SQL querying**. I learned how to create connected tables, define keys and constraints, manage data using CRUD operations, and retrieve meaningful information using joins, aggregate functions, subqueries, window functions, and views.

