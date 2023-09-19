package com.ticketbuddy.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ticketbuddy.service.TicketService;
import com.ticketbuddy.service.impl.TicketServiceImpl;

/**
 * Servlet implementation class UpdateTicketServlet
 */
@WebServlet("/updateTicket")
public class UpdateTicketServlet extends HttpServlet {
	
	private TicketService service = new TicketServiceImpl();

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final int ticketId = Integer.parseInt(request.getParameter("ticketId"));
		if(request.getSession(false).getAttribute("userId") == null){
			response.sendRedirect("index.jsp");
		}
		service.updateTicket(ticketId);
		response.sendRedirect("/TicketBuddy/ticketListByUserId");
	}

}
