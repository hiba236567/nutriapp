package com.essai.nun.servlet;

import com.essai.nun.util.DatabaseUtil;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "REG", value = "/REG")
public class REG extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set character encoding
        request.setCharacterEncoding("UTF-8");
        Connection connection = null;
        PreparedStatement userStmt = null;
        ResultSet rs = null;

        try {
            // Get form parameters
            String role = request.getParameter("role");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Basic validation
            if (firstName == null || firstName.trim().isEmpty()) {
                throw new ServletException("First name is required");
            }

            // Hash password
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            connection = DatabaseUtil.getConnection();
            connection.setAutoCommit(false);  // Start transaction

            // Insert into users table
            String userQuery = "INSERT INTO users (first_name, last_name, email, username, password_hash, role) " +
                             "VALUES (?, ?, ?, ?, ?, ?::user_role) RETURNING user_id";
            
            userStmt = connection.prepareStatement(userQuery);
            userStmt.setString(1, firstName);
            userStmt.setString(2, lastName);
            userStmt.setString(3, email);
            userStmt.setString(4, username);
            userStmt.setString(5, hashedPassword);
            userStmt.setString(6, role);

            rs = userStmt.executeQuery();
            if (!rs.next()) {
                throw new SQLException("Failed to create user, no ID obtained");
            }
            
            int userId = rs.getInt(1);
            System.out.println("Generated user_id: " + userId);

            // Insert client-specific data if needed
            if ("client".equalsIgnoreCase(role)) {
                insertClientData(connection, userId, request);
            } else insertDietiontData(connection, userId, request);

            connection.commit();  // Commit transaction

            // Store in request scope for confirmation page
            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            request.setAttribute("email", email);
            request.setAttribute("username", username);
            request.setAttribute("role", role);

            // Forward to confirmation page
            request.getRequestDispatcher("/confirmation.jsp").forward(request, response);

        } catch (SQLException | ServletException e) {
            try {
                if (connection != null) connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            request.setAttribute("error", "Registration failed: " + e.getMessage());
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
            e.printStackTrace();
        } finally {
            // Clean up resources
            try {
                if (rs != null) rs.close();
                if (userStmt != null) userStmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void insertClientData(Connection connection, int userId, HttpServletRequest request) 
            throws SQLException, ServletException {
        
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");
        String height = request.getParameter("height");
        String weight = request.getParameter("weight");
        String activityLevel = request.getParameter("activityLevel");
        String goals = request.getParameter("goals");
        String dietaryPreferences = request.getParameter("dietaryPreferences");

        // Validate numeric parameters
        try {
            String clientQuery = "INSERT INTO clients (client_id, age, gender, height, weight, " +
                               "activity_level, health_goals, dietary_preferences) " +
                               "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            
            try (PreparedStatement clientStmt = connection.prepareStatement(clientQuery)) {
                clientStmt.setInt(1, userId);
                clientStmt.setInt(2, Integer.parseInt(age));
                clientStmt.setString(3, gender);
                clientStmt.setDouble(4, Double.parseDouble(height));
                clientStmt.setDouble(5, Double.parseDouble(weight));
                clientStmt.setString(6, activityLevel);
                clientStmt.setString(7, goals);
                clientStmt.setString(8, dietaryPreferences);

                clientStmt.executeUpdate();
            }
        } catch (NumberFormatException e) {
            throw new ServletException("Invalid numeric format in client data", e);
        }
    }
    private void insertDietiontData(Connection connection, int userId, HttpServletRequest request) 
            throws SQLException, ServletException {
        
        String licenseNumber = request.getParameter("licenseNumber");
        String specialization = request.getParameter("specialization");
        String experiencet = request.getParameter("experience");
        String bio = request.getParameter("bio");
        
        // Validate numeric parameters
        try {
            String clientQuery = "INSERT INTO public.dietitians(\r\n"
            		+ "	dietitian_id, license_number, specialization, years_experience, bio)\r\n"
            		+ "	VALUES (?, ?, ?, ?, ?)";
            
            try (PreparedStatement dietitianStmt = connection.prepareStatement(clientQuery)) {
                dietitianStmt.setInt(1, userId);
                dietitianStmt.setInt(2, Integer.parseInt(licenseNumber));
                dietitianStmt.setString(3, specialization);
                dietitianStmt.setInt(4, Integer.parseInt(experiencet));
                dietitianStmt.setString(5, bio);
               

                dietitianStmt.executeUpdate();
            }
        } catch (NumberFormatException e) {
            throw new ServletException("Invalid numeric format in deititian data", e);
        }
    }
}





