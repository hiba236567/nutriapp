package com.essai.nun.util;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;

public class DatabaseInitializer {
    public static void initializeDatabase() {
        try (Connection conn = DatabaseUtil.getConnection();
             Statement stmt = conn.createStatement()) {
            
            // Create users table
            stmt.execute("CREATE TABLE IF NOT EXISTS users (" +
                        "id SERIAL PRIMARY KEY," +
                        "role VARCHAR(20) NOT NULL," +
                        "first_name VARCHAR(50) NOT NULL," +
                        "last_name VARCHAR(50) NOT NULL," +
                        "email VARCHAR(100) NOT NULL," +
                        "username VARCHAR(50) NOT NULL UNIQUE," +
                        "password_hash VARCHAR(255) NOT NULL" +
                        ")");
            
            // Create dietitians table
            stmt.execute("CREATE TABLE IF NOT EXISTS dietitians (" +
                        "id SERIAL PRIMARY KEY," +
                        "user_id INT NOT NULL," +
                        "license_number VARCHAR(50) NOT NULL," +
                        "specialization VARCHAR(100) NOT NULL," +
                        "years_of_experience INT NOT NULL," +
                        "FOREIGN KEY (user_id) REFERENCES users(id)" +
                        ")");
            
            // Create clients table
            stmt.execute("CREATE TABLE IF NOT EXISTS clients (" +
                        "id SERIAL PRIMARY KEY," +
                        "user_id INT NOT NULL," +
                        "age INT," +
                        "gender VARCHAR(20)," +
                        "height INT," +
                        "weight INT," +
                        "activity_level VARCHAR(50)," +
                        "goals VARCHAR(100)," +
                        "dietary_preferences VARCHAR(100)," +
                        "FOREIGN KEY (user_id) REFERENCES users(id)" +
                        ")");
            
            // Create appointments table
            stmt.execute("CREATE TABLE IF NOT EXISTS appointments (" +
                        "id SERIAL PRIMARY KEY," +
                        "dietitian_id INT NOT NULL," +
                        "client_id INT NOT NULL," +
                        "appointment_date TIMESTAMP NOT NULL," +
                        "status VARCHAR(20) NOT NULL," +
                        "notes TEXT," +
                        "FOREIGN KEY (dietitian_id) REFERENCES users(id)," +
                        "FOREIGN KEY (client_id) REFERENCES users(id)" +
                        ")");
            
            // Create messages table
            stmt.execute("CREATE TABLE IF NOT EXISTS messages (" +
                        "id SERIAL PRIMARY KEY," +
                        "sender_id INT NOT NULL," +
                        "receiver_id INT NOT NULL," +
                        "message TEXT NOT NULL," +
                        "sent_at TIMESTAMP NOT NULL," +
                        "is_read BOOLEAN DEFAULT FALSE," +
                        "FOREIGN KEY (sender_id) REFERENCES users(id)," +
                        "FOREIGN KEY (receiver_id) REFERENCES users(id)" +
                        ")");
            
            System.out.println("✅ Database schema initialized successfully!");
            
        } catch (SQLException e) {
            System.err.println("❌ Error initializing database schema:");
            e.printStackTrace();
            throw new RuntimeException("Failed to initialize database", e);
        }
    }
    
    public static void main(String[] args) {
        System.out.println("Initializing database schema...");
        initializeDatabase();
    }
} 