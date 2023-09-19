package com.ticketbuddy.service;

import java.util.List;

import com.ticketbuddy.model.Ticket;
import com.ticketbuddy.model.TicketDTO;

public interface TicketService {

	void saveTicket(Ticket ticket);
	
	List<TicketDTO> getTicketsForTicketType(String ticketType);
	
	List<Ticket> getTicketsForUserId(int userId);
	
	void deleteTicket(int ticketId);
	
	void updateTicket(int ticketId);
}
