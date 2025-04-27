package com.essai.nun.servlet;

import com.essai.nun.model.User;
import com.essai.nun.util.DatabaseUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@WebServlet(name = "AppointmentServlet", value = "/appointments")
public class AppointmentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        List<Map<String, String>> appointments = new ArrayList<>();

        try (Connection conn = DatabaseUtil.getConnection()) {
            String query;
            if ("client".equalsIgnoreCase(user.getRole())) {
                query = "SELECT a.appointment_id, a.appointment_time, a.notes, u.first_name, u.last_name, d.specialization " +
                        "FROM appointments a " +
                        "JOIN dietitians d ON a.dietitian_id = d.dietitian_id " +
                        "JOIN users u ON d.dietitian_id = u.user_id " +
                        // Add join with client_dietitian
                        "JOIN client_dietitian cd ON a.client_id = cd.client_id AND a.dietitian_id = cd.dietitian_id " +
                        "WHERE a.client_id = ? " +
                        "ORDER BY a.appointment_time DESC";
            } else if ("dietitian".equalsIgnoreCase(user.getRole())) {
                query = "SELECT a.appointment_id, a.appointment_time, a.notes, u.first_name, u.last_name, c.age, c.weight, c.gender, c.dietary_preferences, c.height " +
                        "FROM appointments a " +
                        "JOIN clients c ON a.client_id = c.client_id " +
                        "JOIN users u ON c.client_id = u.user_id " +
                        // Add join with client_dietitian
                        "JOIN client_dietitian cd ON a.client_id = cd.client_id AND a.dietitian_id = cd.dietitian_id " +
                        "WHERE a.dietitian_id = ? " +
                        "ORDER BY a.appointment_time DESC";
            } else {
                response.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }

            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, user.getUserId());
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Map<String, String> appointment = new HashMap<>();
                        appointment.put("time", rs.getTimestamp("appointment_time").toLocalDateTime().format(formatter));
                        appointment.put("notes", rs.getString("notes"));
                        appointment.put("name", rs.getString("first_name") + " " + rs.getString("last_name"));

                        if ("client".equalsIgnoreCase(user.getRole())) {
                            appointment.put("specialization", rs.getString("specialization"));
                        } else {
                            appointment.put("age", String.valueOf(rs.getInt("age")));
                            appointment.put("weight", String.valueOf(rs.getInt("weight")));
                            appointment.put("height", String.valueOf(rs.getInt("height")));
                            appointment.put("dietary_preferences", rs.getString("dietary_preferences"));
                            appointment.put("gender", rs.getString("gender"));
                        }
                        appointments.add(appointment);
                    }
                }
            }
            request.setAttribute("appointments", appointments);
            request.getRequestDispatcher("appointments.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Database error retrieving appointments", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        String error = null;

        try {
            LocalDateTime appointmentTime = LocalDateTime.parse(request.getParameter("appointment_time"), formatter);
            String notes = request.getParameter("notes");

            int clientId;
            int dietitianId;

            try (Connection conn = DatabaseUtil.getConnection()) {
                if ("client".equalsIgnoreCase(user.getRole())) {
                    clientId = user.getUserId();

                    // Find the assigned dietitian for this client
                    String findDietitianQuery = "SELECT dietitian_id FROM client_dietitian WHERE client_id = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(findDietitianQuery)) {
                        stmt.setInt(1, clientId);
                        try (ResultSet rs = stmt.executeQuery()) {
                            if (rs.next()) {
                                dietitianId = rs.getInt("dietitian_id");
                            } else {
                                // Client has no dietitian assigned
                                error = "You have no dietitian assigned. Please contact support.";
                                request.setAttribute("error", error);
                                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                                return;
                            }
                        }
                    }

                } else if ("dietitian".equalsIgnoreCase(user.getRole())) {
                    dietitianId = user.getUserId();

                    // Dietitian selects client ID from the form
                    String clientIdParam = request.getParameter("target_id");
                    if (clientIdParam == null || clientIdParam.isEmpty()) {
                        error = "Client ID is required.";
                        request.setAttribute("error", error);
                        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                        return;
                    }
                    clientId = Integer.parseInt(clientIdParam);

                    // OPTIONAL: Check if the client is really linked to this dietitian
                    String checkLinkQuery = "SELECT * FROM client_dietitian WHERE client_id = ? AND dietitian_id = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(checkLinkQuery)) {
                        stmt.setInt(1, clientId);
                        stmt.setInt(2, dietitianId);
                        try (ResultSet rs = stmt.executeQuery()) {
                            if (!rs.next()) {
                                // No link between client and dietitian
                                error = "This client is not assigned to you.";
                                request.setAttribute("error", error);
                                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                                return;
                            }
                        }
                    }
                } else {
                    // Unknown role
                    error = "Unauthorized role.";
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                    return;
                }

                // Insert the appointment
                String insertQuery = "INSERT INTO appointments (client_id, dietitian_id, appointment_time, notes) VALUES (?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(insertQuery)) {
                    stmt.setInt(1, clientId);
                    stmt.setInt(2, dietitianId);
                    stmt.setTimestamp(3, Timestamp.valueOf(appointmentTime));
                    stmt.setString(4, notes);
                    stmt.executeUpdate();
                }
            }

            // Success - redirect to appointments list
            response.sendRedirect("appointments");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

        
    }


