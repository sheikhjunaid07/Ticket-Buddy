package com.ticketbuddy.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ticketbuddy.model.TicketDTO;
import com.ticketbuddy.service.TicketService;
import com.ticketbuddy.service.impl.TicketServiceImpl;

/**
 * Servlet implementation class TicketListServlet
 */
@WebServlet(urlPatterns = "/ticketListByTicketType")
public class TicketListByTicketTypeServlet extends HttpServlet {
	
	private TicketService service = new TicketServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String ticketType = request.getParameter("ticketType");
		List<TicketDTO> tickets = service.getTicketsForTicketType(ticketType);
		request.setAttribute("ticketType", ticketType);
		request.setAttribute("tickets", tickets);
		RequestDispatcher rd = request.getRequestDispatcher("ticketList.jsp");
		rd.forward(request, response);
	}
	
}
