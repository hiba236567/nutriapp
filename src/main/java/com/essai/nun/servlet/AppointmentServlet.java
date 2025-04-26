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
    	 System.out.println("doGet method invoked");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        List<Map<String, String>> appointments = new ArrayList<>();
        System.out.println("User role: " + user.getRole());
        try (Connection conn = DatabaseUtil.getConnection()) {
            String query;
            if ("client".equalsIgnoreCase(user.getRole())) {
                query = "SELECT a.appointment_id, a.appointment_time, a.notes, u.first_name, u.last_name, d.specialization " +
                        "FROM appointments a " +
                        "JOIN dietitians d ON a.dietitian_id = d.dietitian_id " +
                        "JOIN users u ON d.dietitian_id = u.user_id " +
                        "WHERE a.client_id = ? " +
                        "ORDER BY a.appointment_time DESC";
                System.out.println("Client query: " + query);
            } else if ("dietitian".equalsIgnoreCase(user.getRole())) {
                query = "SELECT a.appointment_id, a.appointment_time, a.notes, u.first_name, u.last_name, c.age " +
                        "FROM appointments a " +
                        "JOIN clients c ON a.client_id = c.client_id " +
                        "JOIN users u ON c.client_id = u.user_id " +
                        "WHERE a.dietitian_id = ? " +
                        "ORDER BY a.appointment_time DESC";
                System.out.println("Dietitian query: " + query);
            } else {
                response.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }

            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setInt(1, user.getUserId());
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        Map<String, String> appointment = new HashMap<>();
                        appointment.put("id", String.valueOf(rs.getInt("appointment_id")));
                        appointment.put("time", rs.getTimestamp("appointment_time").toLocalDateTime().format(formatter));
                        appointment.put("notes", rs.getString("notes"));
                        appointment.put("name", rs.getString("first_name") + " " + rs.getString("last_name"));

                        if ("client".equalsIgnoreCase(user.getRole())) {
                            appointment.put("specialization", rs.getString("specialization"));
                        } else {
                            appointment.put("age", String.valueOf(rs.getInt("age")));
                        }

                        appointments.add(appointment);
                    }
                }
            }
            System.out.println("Appointments retrieved: ");
            for (Map<String, String> appointment : appointments) {
                System.out.println(appointment);}
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
            int targetId = Integer.parseInt(request.getParameter("target_id"));

            try (Connection conn = DatabaseUtil.getConnection()) {
                String query = "INSERT INTO appointments (client_id, dietitian_id, appointment_time, notes) " +
                               "VALUES (?, ?, ?, ?)";

                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    if ("client".equalsIgnoreCase(user.getRole())) {
                        stmt.setInt(1, user.getUserId());
                        stmt.setInt(2, targetId);
                    } else {
                        stmt.setInt(1, targetId);
                        stmt.setInt(2, user.getUserId());
                    }
                    stmt.setTimestamp(3, Timestamp.valueOf(appointmentTime));
                    stmt.setString(4, notes);
                    stmt.executeUpdate();
                }
            }

            response.sendRedirect("appointments");

        } catch (NumberFormatException e) {
            error = "Invalid ID format";
        } catch (SQLException e) {
            error = "Database error: " + e.getMessage();
        } catch (Exception e) {
            error = "Invalid date/time format";
        }

        if (error != null) {
            request.setAttribute("error", error);
            doGet(request, response);
        }
    }
}

