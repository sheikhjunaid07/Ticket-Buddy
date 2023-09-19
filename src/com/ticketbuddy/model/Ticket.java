package com.ticketbuddy.model;

public class Ticket {

	private int ticketId;
	private int userId;
	private String ticketType;
	private String ticketExpiry;
	private int ticketStatus;	
	private String ticketDiscription;
	private String filePath;

	public int getTicketId() {
		return ticketId;
	}

	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getTicketType() {
		return ticketType;
	}

	public void setTicketType(String ticketType) {
		this.ticketType = ticketType;
	}

	public String getTicketExpiry() {
		return ticketExpiry;
	}

	public void setTicketExpiry(String ticketExpiry) {
		this.ticketExpiry = ticketExpiry;
	}

	public int getTicketStatus() {
		return ticketStatus;
	}

	public void setTicketStatus(int ticketStatus) {
		this.ticketStatus = ticketStatus;
	}
	
	public String getTicketDiscription() {
		return ticketDiscription;
	}

	public void setTicketDiscription(String ticketDiscription) {
		this.ticketDiscription = ticketDiscription;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}
