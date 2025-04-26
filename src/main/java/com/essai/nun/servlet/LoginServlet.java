package com.essai.nun.servlet;

import com.essai.nun.model.User;
import com.essai.nun.util.DatabaseUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DatabaseUtil.getConnection()) {
            String query = "SELECT first_name, last_name, email, username, password_hash, role, user_id " +
                         "FROM public.users WHERE username = ?";
            
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, username);
                
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String hashedPassword = rs.getString("password_hash");
                        
                        if (BCrypt.checkpw(password, hashedPassword)) {
                            User user = new User();
                            user.setUserId(rs.getInt("user_id"));
                            user.setRole(rs.getString("role"));
                            user.setFirstName(rs.getString("first_name"));
                            user.setLastName(rs.getString("last_name"));
                            user.setEmail(rs.getString("email"));
                            user.setUsername(rs.getString("username"));

                            HttpSession session = request.getSession();
                            session.setAttribute("user", user);
                            
                            if ("client".equalsIgnoreCase(user.getRole())) {
                            response.sendRedirect("client_dashboard");
                            }
                            
                            else response.sendRedirect("dietitian-dashboard");
                            return;
                        }
                    }
                    // Invalid credentials
                    
                    request.setAttribute("loginError", "Invalid username or password.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Database error during login", e);
        }
    }
}