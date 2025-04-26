package com.essai.nun.servlet;

import com.essai.nun.model.User;
import com.essai.nun.util.DatabaseUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "DietitianDashboardServlet", value = "/dietitian-dashboard")

public class dietian_dashboardServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        
        try (Connection conn = DatabaseUtil.getConnection()) {
            if ("dietitian".equalsIgnoreCase(user.getRole())) {
                String dietitianQuery = "SELECT dietitian_id, license_number, specialization, " +
                                      "years_experience, bio FROM public.dietitians " +
                                      "WHERE dietitian_id = ?";
                
                try (PreparedStatement dietitianStmt = conn.prepareStatement(dietitianQuery)) {
                    dietitianStmt.setInt(1, user.getUserId());
                    
                    try (ResultSet dietitianRs = dietitianStmt.executeQuery()) {
                        if (dietitianRs.next()) {
                            request.setAttribute("licenseNumber", dietitianRs.getString("license_number"));
                            request.setAttribute("specialization", dietitianRs.getString("specialization"));
                            request.setAttribute("yearsExperience", dietitianRs.getInt("years_experience"));
                            request.setAttribute("bio", dietitianRs.getString("bio"));
                            request.setAttribute("dietitianId", dietitianRs.getInt("dietitian_id"));
                        }
                    }
                }
            } 
            
            
            // Set common user attributes
            request.setAttribute("firstName", user.getFirstName());
            request.setAttribute("lastName", user.getLastName());
            request.setAttribute("role", user.getRole());
            request.setAttribute("email", user.getEmail());
            request.setAttribute("username", user.getUsername());
            request.setAttribute("user_id", user.getUserId());
            
            request.getRequestDispatcher("dashboard1.jsp").forward(request, response);
            
        } catch (SQLException e) {
            throw new ServletException("Database error loading dietitian dashboard", e);
        }
    }
}


