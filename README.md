# -Bus-Tracking-System
A smart and modern Java-based Bus Tracking System built with JSP, Servlets, JDBC &amp; MySQL. Featuring a sleek UI and a powerful admin dashboard, it enables seamless bus management—add, edit, view &amp; delete buses with real-time accuracy and efficient data control.
# 🚍 Bus Tracking System – Full-Stack Bus Tracking System

![Java](https://img.shields.io/badge/Java-FullStack-orange)
![JSP](https://img.shields.io/badge/JSP-2.3-blue)
![Servlets](https://img.shields.io/badge/Servlets-4.0-green)
![MySQL](https://img.shields.io/badge/MySQL-Database-blue)
![Tomcat](https://img.shields.io/badge/Tomcat-Server-yellow)
![Status](https://img.shields.io/badge/Project-Active-brightgreen)

A complete Java-based web application built using **JSP**, **Servlets**, **JDBC**, and **MySQL**, designed to manage bus information through a clean and user-friendly admin panel.

---

## 📌 About the Project

The **Bus Tracking System** is a complete **Full-Stack Java Web Application** built using **JSP**, **Servlets**, **JDBC**, **MySQL**, **HTML/CSS**, and runs on **Apache Tomcat**.

This project includes both **Frontend + Backend**, providing a complete flow from user interface to database management.

It contains:

* Public-facing pages (Home, Bus List)
* Full Admin Dashboard
* Complete CRUD operations
* Real-time MySQL backend
* Clean, responsive UI

---

## ✨ Full Project Features

## 🧑‍💻 User Dashboard (Frontend UI)

The **User Dashboard** is designed for normal users/passengers.
It includes:

* 🏠 **Home Page** – Modern, responsive UI with hero section
* 🚍 **View Available Buses** – Shows list of all buses
* 📍 **Live Location (Upcoming)** – Real-time GPS concept layout
* ⭐ **Services Section** – Details like Real-Time Tracking, Route Planning, Alerts
* 🔐 **User Login & Signup Pages**


## 🛠 Admin Dashboard (Backend Panel)

The **Admin Dashboard** is only for admin and includes full CRUD system.
Admin can:

* ➕ Add Bus
* 📋 View All Buses
* ✏️ Edit Bus Details
* 🗑 Delete Bus Record
* 🔐 Admin Login / Logout

### 🖼 Admin Dashboard Highlights

* Simple & functional JSP pages
* Direct access to database through Servlets
* Full CRUD using MySQL + JDBC

---

## 🔧 System Features Overview

### 🎨 Frontend UI Flow

```
Home Page → View All Buses → (Optional: Search Bus)
                |
                v
        Admin Login Page → LoginServlet
                |
        Successful Login
                v
        Admin Dashboard
   ┌────────────┬───────────────┬───────────────┐
   │ Add Bus    │ View Buses    │ Logout        │
   └────────────┴───────────────┴───────────────┘
```

* ➕ **Add Bus** – Insert new bus details into the system.
* 📋 **View All Buses** – Display all buses stored in the MySQL database.
* ✏️ **Edit Bus** – Update existing bus details.
* 🗑 **Delete Bus** – Remove unwanted bus entries.
* 🔐 **Logout** – Secure session-based logout for admins.

### 👤 Public/User Features

* 🏠 **Home Page** – User-friendly landing page
* 🚍 **View Available Buses** – Fetches live data from MySQL database
* 🔍 **Search Bus (Upcoming Enhancement)**

### 🔐 Admin Features

* 📊 **Admin Dashboard** – Central control for the system
* ➕ **Add Bus** – Insert new bus details
* 📋 **View All Buses** – Read all records from MySQL
* ✏️ **Edit Bus** – Update existing details
* 🗑 **Delete Bus** – Remove entries permanently
* 🔐 **Admin Logout** – Secure session-based logout

All CRUD operations are fully connected to the **MySQL database** using **JDBC**, ensuring real-time data handling.

---

## 🛠 Tech Stack

* **Java (JSP + Servlets)**
* **JDBC**
* **MySQL Database**
* **HTML, CSS,JAVASCRIPT**
* **Apache Tomcat (Server)**
* **Eclipse **

---

## 📂 Project Structure

```
Bus_Tracking_System/
│
├── src/
│   ├── AddBusServlet.java
│   ├── EditBusServlet.java
│   ├── DeleteBusServlet.java
│   ├── ViewBusServlet.java
│   └── DatabaseConnection.java
│
├── WebContent/
│   ├── addbus.jsp
│   ├── viewbus.jsp
│   ├── editbus.jsp
│   ├── deletebus.jsp
│   ├── adminDashboard.jsp
│   └── styles.css
│
└── README.md
```

---

## 🗄 Database Setup (MySQL)

Run the following SQL commands to create the database and table:

```sql
CREATE DATABASE bustrackingsystem;
USE bustrackingsystem;

-- Bus Details Table
CREATE TABLE busdetail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    busNo VARCHAR(50),
    busName VARCHAR(100),
    route VARCHAR(150),
    driverName VARCHAR(100),
    contactNo VARCHAR(20)
);

-- Admin / User Registration Table
CREATE TABLE register (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(200) NOT NULL,
    contact VARCHAR(20)
);
```

USE bustrackingsystem;

-- Bus Details Table
CREATE TABLE busdetail (
id INT AUTO_INCREMENT PRIMARY KEY,
busNo VARCHAR(50),
busName VARCHAR(100),
route VARCHAR(150),
driverName VARCHAR(100),
contactNo VARCHAR(20)
);

````

---

## 🔧 How to Run the Project

1. Install **Apache Tomcat 9/10**.
2. Import the project into **Eclipse/IntelliJ**.
3. Configure Tomcat server.
4. Update database credentials in `DatabaseConnection.java`:

```java
String url = "jdbc:mysql://localhost:3306/bustrackingsystem";
String user = "root";
String password = "your_password";
````

5. Start the server and run the project.
6. Open in browser:

```
http://localhost:8080/Bus_Tracking_System/adminDashboard.jsp
```

---

## 🧩 System Architecture Diagram (ASCII)

```
              [ Client / User ]
                     |
                     v
               (Frontend UI)
     HTML / CSS / JS / JSP Pages
                     |
                     v
     ---------------------------------
     |         Controller Layer      |
     |   JSP Pages + Servlets (MVC) |
     ---------------------------------
                     |
                     v
      -------------------------------
      |       JDBC Connection       |
      -------------------------------
                     |
                     v
      -------------------------------
      |       MySQL Database        |
      |  register   |   busdetail   |
      -------------------------------
```

---

## 🧩 System Flow Diagrams

### 🔐 Login Flow Diagram (Text-Based)

```
User → login.jsp → LoginServlet → Validate Credentials (register table)
      → If valid → adminDashboard.jsp
      → If invalid → login.jsp (error message)
```

### 🔄 CRUD Operation Flow (Bus Management)

```
Admin → adminDashboard.jsp
    → Add Bus → AddBusServlet → busdetail table → Success → viewbus.jsp
    → Edit Bus → EditBusServlet → busdetail table → Success → viewbus.jsp
    → Delete Bus → DeleteBusServlet → busdetail table → Success → viewbus.jsp
    → View All → ViewBusServlet → Fetch From DB → viewbus.jsp
```

### 🗄 ER Diagram (Text Representation)

```
register (Admin/User Table)
---------------------------------------
| id (PK) | fullname | email | password | contact |
---------------------------------------
                | 1
                |------ manages ------
                | n
busdetail (Bus Table)
---------------------------------------------------------------
| id (PK) | busNo | busName | route | driverName | contactNo |
---------------------------------------------------------------
```

## 🚀 Future Enhancements

* Live GPS tracking module
* Admin login authentication
* Bus schedule management
* Mobile-friendly UI redesign

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to open a pull request.

---

## 📬 Contact

**Adarsh Nerlekar**
Full Stack Java Developer
LinkedIn: www.linkedin.com/in/adarsh-nerlekar

---

⭐ If you like this project, don't forget to star the repository!
