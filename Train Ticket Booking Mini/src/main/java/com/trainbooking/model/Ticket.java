package com.trainbooking.model;

import java.sql.Date;

public class Ticket {
    private int id;
    private String passengerName;
    private String sourceStation;
    private String destinationStation;
    private Date travelDate;
    
    
    public Ticket() {}
    
    public Ticket(String passengerName, String sourceStation, 
                  String destinationStation, Date travelDate) {
        this.passengerName = passengerName;
        this.sourceStation = sourceStation;
        this.destinationStation = destinationStation;
        this.travelDate = travelDate;
    }
    
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getPassengerName() { return passengerName; }
    public void setPassengerName(String passengerName) { 
        this.passengerName = passengerName; 
    }
    
    public String getSourceStation() { return sourceStation; }
    public void setSourceStation(String sourceStation) { 
        this.sourceStation = sourceStation; 
    }
    
    public String getDestinationStation() { return destinationStation; }
    public void setDestinationStation(String destinationStation) { 
        this.destinationStation = destinationStation; 
    }
    
    public Date getTravelDate() { return travelDate; }
    public void setTravelDate(Date travelDate) { 
        this.travelDate = travelDate; 
    }
}