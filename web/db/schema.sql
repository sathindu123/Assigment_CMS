-- Create the database
CREATE DATABASE IF NOT EXISTS cms;
USE cms;


CREATE TABLE users (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       role ENUM('EMPLOYEE', 'ADMIN') NOT NULL
);



CREATE TABLE complaints (
                            id VARCHAR(50) PRIMARY KEY,
                            user_id VARCHAR(50) NOT NULL,
                            description TEXT NOT NULL,
                            status ENUM('Pending', 'In Progress', 'Resolved') DEFAULT 'Pending',
                            remarks TEXT,
                            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            FOREIGN KEY (user_id) REFERENCES users(username) ON DELETE CASCADE
);

-- Insert sample data
INSERT INTO users (id,username, password, role) VALUES
                                                    ('U001','emp1', 'pass123', 'employee'),
                                                    ('U002','emp2', 'pass123', 'employee'),
                                                    ('U003','admin1', 'admin123', 'admin');

INSERT INTO complaints (id,user_id, description, status, remarks) VALUES
                                                                      ('C001','emp1', 'Office AC not working', 'Pending', NULL),
                                                                      ('C002','emp2', 'Broken chair in meeting room', 'In Progress', 'Replacement ordered');