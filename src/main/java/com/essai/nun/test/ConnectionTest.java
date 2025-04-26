package com.essai.nun.test;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.essai.nun.util.DatabaseUtil;

public class ConnectionTest {
    public static void main(String[] args) {
        Connection conn = null;
        try {
            // Attempt to get a connection
            conn = DatabaseUtil.getConnection();
            
            // Get database metadata
            DatabaseMetaData metaData = conn.getMetaData();
            
            // Print connection success message
            System.out.println("✅ Database connection successful!");
            System.out.println("\nConnection Details:");
            System.out.println("----------------------------------------");
            System.out.println("Database Product: " + metaData.getDatabaseProductName());
            System.out.println("Database Version: " + metaData.getDatabaseProductVersion());
            System.out.println("Driver Name: " + metaData.getDriverName());
            System.out.println("Driver Version: " + metaData.getDriverVersion());
            System.out.println("URL: " + metaData.getURL());
            System.out.println("Username: " + metaData.getUserName());
            System.out.println("----------------------------------------");
            
            // Test if we can execute a simple query
            System.out.println("\nTesting simple query execution...");
            try (Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT 1")) {
                if (rs.next()) {
                    System.out.println("✅ Simple query executed successfully!");
                }
            }
            
        } catch (SQLException e) {
            // Print detailed error information
            System.out.println("❌ Database connection failed!");
            System.out.println("\nError Details:");
            System.out.println("----------------------------------------");
            System.out.println("Error Message: " + e.getMessage());
            System.out.println("Error Code: " + e.getErrorCode());
            System.out.println("SQL State: " + e.getSQLState());
            System.out.println("----------------------------------------");
            
            // Print stack trace for debugging
            System.out.println("\nStack Trace:");
            e.printStackTrace();
            
        } finally {
            // Always close the connection
            if (conn != null) {
                try {
                    conn.close();
                    System.out.println("\n✅ Connection closed successfully.");
                } catch (SQLException e) {
                    System.out.println("\n❌ Error closing connection: " + e.getMessage());
                }
            }
        }
    }
} 