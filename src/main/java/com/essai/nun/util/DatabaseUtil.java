package com.essai.nun.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
    // Database connection parameters
    private static final String URL = "jdbc:postgresql://localhost:5432/nutriguide";
    private static final String USERNAME = "postgres";  // Change this to your PostgreSQL username
    private static final String PASSWORD = "hibabiba";  // Change this to your PostgreSQL password
    
    static {
        try {
            // Load the PostgreSQL JDBC driver
            Class.forName("org.postgresql.Driver");
            System.out.println("PostgreSQL JDBC Driver successfully loaded.");
        } catch (ClassNotFoundException e) {
            System.err.println("PostgreSQL JDBC Driver not found.");
            e.printStackTrace();
            System.exit(1);
        }
    }
    
    public static Connection getConnection() throws SQLException {
        try {
            System.out.println("Attempting to connect to database...");
            System.out.println("URL: " + URL);
            System.out.println("Username: " + USERNAME);
            Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("Connection established successfully!");
            return conn;
        } catch (SQLException e) {
            System.err.println("Failed to connect to the database!");
            System.err.println("Please check:");
            System.err.println("1. Is PostgreSQL running?");
            System.err.println("2. Is the database 'nutriguide' created?");
            System.err.println("3. Are the username and password correct?");
            System.err.println("4. Is the port 5432 open?");
            throw e;
        }
    }
    
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Database connection closed successfully.");
            } catch (SQLException e) {
                System.err.println("Error closing connection: " + e.getMessage());
            }
        }
    }
} 