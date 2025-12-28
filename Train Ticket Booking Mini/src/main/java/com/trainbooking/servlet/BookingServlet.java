package com.trainbooking.servlet;

import com.trainbooking.dao.TicketDAO;
import com.trainbooking.model.Ticket;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.List;



@SuppressWarnings("serial")
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	 private TicketDAO ticketDAO;
	    
	    @Override
	    public void init() {
	        ticketDAO = new TicketDAO();
	    }
	    
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	        
	        
	        String passengerName = request.getParameter("name");
	        String source = request.getParameter("source");
	        String destination = request.getParameter("destination");
	        String dateString = request.getParameter("date");
	        
	        
	        Date travelDate = Date.valueOf(dateString);
	        
	        
	        Ticket ticket = new Ticket(passengerName, source, destination, travelDate);
	        
	       
	        boolean result = ticketDAO.insertTicket(ticket);
	        
	        if (result) {
	            
	            response.sendRedirect("viewTicket.jsp");
	        } else {
	            request.setAttribute("errorMessage", "Failed to book ticket. Please try again.");
	            request.getRequestDispatcher("booking.jsp").forward(request, response);
	        }
	    }
	    
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {
	    	 try {
	    	       
	    	        List<Ticket> tickets = ticketDAO.getAllTickets();
	    	        
	    	       
	    	        request.setAttribute("tickets", tickets);
	    	        
	    	        
	    	        request.getRequestDispatcher("viewTicket.jsp").forward(request, response);
	    	        
	    	    } catch (Exception e) {
	    	        System.err.println("Error retrieving tickets: " + e.getMessage());
	    	        e.printStackTrace();
	    	        response.sendRedirect("booking.jsp");
	    	    }
	        
	        request.setAttribute("tickets", ticketDAO.getAllTickets());
	        request.getRequestDispatcher("viewTicket.jsp").forward(request, response);
	    }

}
