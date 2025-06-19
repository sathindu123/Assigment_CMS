✅ Final Complete README.md File (Everything Combined & Organized)
# 📌 Web-Based Complaint Management System using JSP

## 🧑‍💻 Project Title

**Advanced API Development – Individual Assignment**  
**Project:** Web-Based Complaint Management System using JSP

---

## 📖 Project Overview

This is a standalone web-based complaint management system developed for an academic assignment using Java technologies.

The system consists of three main roles:

- **Employee:**
  - Can log into the system.
  - Can add, update, delete, and view their own complaints.
  - Cannot view complaints submitted by other employees.

- **Admin:**
  - Can access and manage all complaints in the system.
  - Can update the **status** of each complaint and add **remarks**.

- **System:**
  - Handles user login, session tracking, form submissions, and database interactions through a servlet-based MVC structure.

---

## 🛠️ Technologies Used

- **Frontend:**JSP, HTML, CSS, JavaScript 
- **Backend:** Jakarta EE (Servlets), Apache Commons DBCP
- **Database:** MySQL, accessed via DBCP connection pooling
- **Server:** Apache Tomcat (v11.0.7)
- **Connection Pooling:** Apache Commons DBCP via `context.xml`

---

## 🚀 How to Run the Project (Setup Guide)

### 1. Clone the Repository




2. Set Up the Database
   
1.Open MySQL.
2.Create a database named:

CREATE DATABASE cms;

Import the SQL schema:
Navigate to the project directory.
Locate the SQL file at: db/schema.sql
Import it using MySQL CLI or Workbench:

-- If using MySQL CLI:
SOURCE path/to/db/schema.sql;




4. Configure Database Connection (DBCP)
   
This project uses Apache DBCP connection pooling via context.xml. Add the following configuration to your Tomcat's context.xml:

<Resource
    name="jdbc/pool"
    type="javax.sql.DataSource"
    driverClassName="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/cms"
    username="root"
    password="Ijse@1234"
    maxTotal="100"
    maxIdle="50"
    factory="org.apache.commons.dbcp2.BasicDataSourceFactory"
/>
🔐 Update the username and password values to match your local MySQL credentials if different.

4. Deploy the Application
Open Apache Tomcat (Version 11.0.7 or compatible).
Copy the full project folder or its .war file into the webapps/ directory.
Start the Tomcat server.
5. Access the Application
Once the server is running, visit:

https://github.com/sathindu123/Assigment_CMS.git

🔐 Default Login Credentials
Username	Password	Role
emp	pass123	employee
admin	admin123	admin

📁 Project Structure (Key Files & Folders)
sathindu123/Assigment_CMS
│
├── db/
│   └── schema.sql              # SQL dump for database setup
│
├── src/
│   └── lk/ijse/gdse71/         # Java packages: Servlets, Models, DAO
│
├── web/
│   ├── jsp/                    # JSP views
│   ├── css/                    # CSS stylesheets
│   ├── js/                     # JavaScript files (if any)
│   └── WEB-INF/
│       └── web.xml             # Deployment descriptor
│
└── README.md                   # Project documentation
🙋‍♂️ Author
Name: Sathindu
Course: GDSE71
Institute: IJSE
Assignment: Advanced API Development – Individual Assignment
📄 License
This project is developed as part of an academic coursework assignment and is intended for educational use only.


---

✅ **Instructions for Use:**

1. Copy the above content into a new file named `README.md`.
2. Place it in the root directory of your GitHub repository.
3. Commit and push it:

```bash
git add README.md
git commit -m "Add complete README with setup guide and project details"
git push origin main




