<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Train Ticket Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 500px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .nav-links {
            text-align: center;
            margin-top: 20px;
        }
        .nav-links a {
            color: #4CAF50;
            text-decoration: none;
            margin: 0 10px;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Train Ticket Booking</h2>
        
        <%-- Display error message if exists --%>
        <c:if test="${not empty errorMessage}">
            <div class="error">${errorMessage}</div>
        </c:if>
        
        <form action="BookingServlet" method="post">
            <div class="form-group">
                <label for="name">Passenger Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="source">Source Station:</label>
                <input type="text" id="source" name="source" required>
            </div>
            
            <div class="form-group">
                <label for="destination">Destination Station:</label>
                <input type="text" id="destination" name="destination" required>
            </div>
            
            <div class="form-group">
                <label for="date">Travel Date:</label>
                <input type="date" id="date" name="date" required>
            </div>
            
            <button type="submit" class="btn">Book Ticket</button>
        </form>
        
        <div class="nav-links">
            <a href="viewTicket.jsp">View All Tickets</a>
        </div>
    </div>
    
    <script>
        
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('date').min = today;
    </script>
</body>
</html>