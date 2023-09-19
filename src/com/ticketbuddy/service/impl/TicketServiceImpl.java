package com.ticketbuddy.service.impl;

import java.util.List;

import com.ticketbuddy.dao.TicketDao;
import com.ticketbuddy.dao.impl.TicketDaoImpl;
import com.ticketbuddy.model.Ticket;
import com.ticketbuddy.model.TicketDTO;
import com.ticketbuddy.service.TicketService;

public class TicketServiceImpl implements TicketService {
	
	private TicketDao dao = new TicketDaoImpl();
	
	@Override
	public void saveTicket(Ticket ticket) {
		dao.saveTicket(ticket);
	}

	@Override
	public List<TicketDTO> getTicketsForTicketType(String ticketType) {
		return dao.getTicketsForTicketType(ticketType);
	}

	@Override
	public List<Ticket> getTicketsForUserId(int userId) {
		return dao.getTicketsForUserId(userId);
	}

	@Override
	public void deleteTicket(int ticketId) {
		dao.deleteTicket(ticketId);
		
	}

	@Override
	public void updateTicket(int ticketId) {
		dao.updateTicket(ticketId);
	}	
	
	
}
