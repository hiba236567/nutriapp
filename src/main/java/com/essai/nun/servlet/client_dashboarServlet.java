package com.essai.nun.servlet;

import com.essai.nun.model.User;
import com.essai.nun.util.DatabaseUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "client_dashboarServlet", value = "/client_dashboard")
public class client_dashboarServlet extends HttpServlet {

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
            if ("client".equalsIgnoreCase(user.getRole())) {
                String clientQuery = "SELECT client_id, age, gender, height, weight, " +
                                    "activity_level, health_goals, dietary_preferences " +
                                    "FROM public.clients WHERE client_id = ?";
                
                try (PreparedStatement clientStmt = conn.prepareStatement(clientQuery)) {
                    clientStmt.setInt(1, user.getUserId());
                    
                    try (ResultSet clientRs = clientStmt.executeQuery()) {
                        if (clientRs.next()) {
                            request.setAttribute("age", clientRs.getInt("age"));
                            request.setAttribute("gender", clientRs.getString("gender"));
                            request.setAttribute("height", clientRs.getDouble("height"));
                            request.setAttribute("weight", clientRs.getDouble("weight"));
                            request.setAttribute("activityLevel", 
                                clientRs.getString("activity_level"));
                            request.setAttribute("goals", 
                                clientRs.getString("health_goals"));
                            request.setAttribute("dietaryPreferences", 
                                clientRs.getString("dietary_preferences"));
                        }
                    }
                }
            }
            
            // Set user attributes for display
            request.setAttribute("firstName", user.getFirstName());
            request.setAttribute("lastName", user.getLastName());
            request.setAttribute("role", user.getRole());
            request.setAttribute("email", user.getEmail());
            request.setAttribute("username", user.getUsername());
            request.setAttribute("user_id", user.getUserId());
            
            request.getRequestDispatcher("dashbord.jsp").forward(request, response);
            
        } catch (SQLException e) {
            throw new ServletException("Database error loading dashboard", e);
        }
    }
}
