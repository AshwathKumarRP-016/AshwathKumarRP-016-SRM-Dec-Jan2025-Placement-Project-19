<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.trainbooking.model.Ticket" %>
<%
    // Get tickets from servlet
    List<Ticket> tickets = (List<Ticket>) request.getAttribute("tickets");
    boolean hasTickets = tickets != null && !tickets.isEmpty();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Tickets | Train Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #f0f0f0;
        }
        .nav-links {
            text-align: center;
            margin-bottom: 30px;
        }
        .btn {
            display: inline-block;
            background: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            margin: 0 10px;
        }
        .btn:hover {
            background: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }
        th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }
        td {
            padding: 15px;
            border-bottom: 1px solid #eee;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
        .no-tickets {
            text-align: center;
            padding: 60px 20px;
            color: #666;
            font-size: 18px;
        }
        .ticket-id {
            font-weight: bold;
            color: #667eea;
        }
        .status-confirmed {
            color: #4CAF50;
            font-weight: bold;
        }
        .action-btn {
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-right: 5px;
        }
        .btn-print {
            background: #2196F3;
            color: white;
        }
        .btn-cancel {
            background: #f44336;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>📋 Booked Tickets</h2>
        
        <div class="nav-links">
            <a href="booking.jsp" class="btn">➕ Book New Ticket</a>
            <a href="BookingServlet" class="btn" style="background: #ff9800;">🔄 Refresh</a>
        </div>
        
        <% if (hasTickets) { %>
            <table>
                <thead>
                    <tr>
                        <th>Ticket ID</th>
                        <th>Passenger Name</th>
                        <th>Source</th>
                        <th>Destination</th>
                        <th>Travel Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Ticket ticket : tickets) { %>
                        <tr>
                            <td class="ticket-id">#RLB<%= 1000 + ticket.getId() %></td>
                            <td><%= ticket.getPassengerName() %></td>
                            <td><%= ticket.getSourceStation() %></td>
                            <td><%= ticket.getDestinationStation() %></td>
                            <td><%= ticket.getTravelDate() %></td>
                            <td class="status-confirmed">✅ Confirmed</td>
                            <td>
                                <button class="action-btn btn-print" onclick="printTicket(<%= ticket.getId() %>)">Print</button>
                                <button class="action-btn btn-cancel" onclick="cancelTicket(<%= ticket.getId() %>)">Cancel</button>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
            
            <div style="margin-top: 20px; text-align: center; color: #666; font-size: 14px;">
                Showing <%= tickets.size() %> booking(s)
            </div>
        <% } else { %>
            <div class="no-tickets">
                <div style="font-size: 48px; margin-bottom: 20px;">📭</div>
                <h3>No Tickets Found</h3>
                <p>You haven't booked any tickets yet.</p>
                <p>Click "Book New Ticket" to start your journey!</p>
            </div>
        <% } %>
    </div>
    
    <script>
        function printTicket(ticketId) {
            alert('Printing ticket #' + ticketId);
            // In real implementation, this would open a print dialog
        }
        
        function cancelTicket(ticketId) {
            if (confirm('Are you sure you want to cancel ticket #' + ticketId + '?')) {
                alert('Ticket #' + ticketId + ' has been cancelled.');
                // In real implementation, this would call a servlet
            }
        }
        
        // Auto-refresh every 30 seconds
        setTimeout(function() {
            window.location.reload();
        }, 30000);
    </script>
</body>
</html>