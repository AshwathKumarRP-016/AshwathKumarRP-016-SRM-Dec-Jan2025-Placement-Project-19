# Train Ticket Booking System

## 📋 Project Overview
A **Mini MVC-based Train Ticket Booking System** built using Java EE technologies that follows the Model-View-Controller architectural pattern for managing railway ticket reservations.
CLICK REFRESH BUTTOM IN VIEWTICKET.JSP


## 🏗️ Architecture
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│      VIEW       │    │   CONTROLLER    │    │      MODEL      │
│   (JSP Pages)   │◄──►│    (Servlet)    │◄──►│  (Java Beans)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │                      │
         ▼                      ▼                      ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│    booking.jsp  │    │ BookingServlet  │    │   Ticket.java   │
│ viewTicket.jsp  │    │                 │    │   TicketDAO.java│
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📁 Project Structure
```
TrainTicketBooking/
├── src/main/java/com/trainbooking/
│   ├── model/Ticket.java              # Data model class
│   ├── dao/TicketDAO.java             # Database operations
│   └── servlet/BookingServlet.java    # Controller servlet
├── WebContent/
│   ├── booking.jsp                    # Ticket booking form
│   ├── viewTicket.jsp                 # Display all tickets
│   └── WEB-INF/
│       ├── lib/                       # Dependencies (MySQL driver)
│       └── web.xml                    # Deployment descriptor
```

## ✨ Features
- ✅ **User-friendly booking interface** with form validation
- ✅ **Database persistence** using JDBC (MySQL)
- ✅ **View all bookings** in a professional table layout
- ✅ **MVC pattern implementation** with clear separation
- ✅ **Responsive design** with modern UI
- ✅ **Error handling** and user feedback

## 📊 Flow Diagram
```
User → booking.jsp (Form) → BookingServlet (Controller) 
      → TicketDAO (Database) → MySQL Database
      → viewTicket.jsp (Display) → User
```

## 🚀 Setup Instructions

## 📋 MVC Components

### **Model (M)**
- `Ticket.java` - Data bean representing a ticket
- `TicketDAO.java` - Data Access Object for database operations

### **View (V)**
- `booking.jsp` - Input form for ticket details
- `viewTicket.jsp` - Display page for booked tickets

### **Controller (C)**
- `BookingServlet.java` - Processes requests, interacts with model, forwards to view

## 🔧 Key Functions
1. **Ticket Booking**: Collect passenger details and store in database
2. **View Tickets**: Retrieve and display all booked tickets
3. **Data Validation**: Client-side and server-side validation
4. **Error Handling**: Comprehensive error messages and logging

## 🎨 UI Features
- Clean, professional interface
- Responsive design
- Form validation with visual feedback
- Real-time date validation
- Ticket status indicators
- Print and cancel functionality (UI only)

