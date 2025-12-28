package com.trainbooking.dao;

import com.trainbooking.model.Ticket;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/train_booking";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";
    
    private Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    
    public boolean insertTicket(Ticket ticket) {
        boolean result = false;
        String sql = "INSERT INTO tickets (passenger_name, source_station, destination_station, travel_date) VALUES (?, ?, ?, ?)";
        
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            
            statement.setString(1, ticket.getPassengerName());
            statement.setString(2, ticket.getSourceStation());
            statement.setString(3, ticket.getDestinationStation());
            statement.setDate(4, ticket.getTravelDate());
            
            result = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    
    public List<Ticket> getAllTickets() {
        List<Ticket> tickets = new ArrayList<>();
        String sql = "SELECT * FROM tickets ORDER BY booking_date DESC";
        
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {
            
            while (resultSet.next()) {
                Ticket ticket = new Ticket();
                ticket.setId(resultSet.getInt("id"));
                ticket.setPassengerName(resultSet.getString("passenger_name"));
                ticket.setSourceStation(resultSet.getString("source_station"));
                ticket.setDestinationStation(resultSet.getString("destination_station"));
                ticket.setTravelDate(resultSet.getDate("travel_date"));
                
                tickets.add(ticket);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tickets;
    }
}