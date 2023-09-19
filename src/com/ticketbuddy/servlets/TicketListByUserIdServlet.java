package com.ticketbuddy.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ticketbuddy.model.Ticket;
import com.ticketbuddy.service.TicketService;
import com.ticketbuddy.service.impl.TicketServiceImpl;

/**
 * Servlet implementation class TicketListServlet
 */
@WebServlet(urlPatterns = "/ticketListByUserId")
public class TicketListByUserIdServlet  extends HttpServlet {
	
	private TicketService service = new TicketServiceImpl();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession(false) == null){
			response.sendRedirect("index.jsp");
		}
		final int userId = (int) request.getSession().getAttribute("userId");
		List<Ticket> tickets = service.getTicketsForUserId(userId);
		request.setAttribute("tickets", tickets);
		RequestDispatcher rd = request.getRequestDispatcher("ticketListForOwner.jsp");
		rd.forward(request, response);
	}
	

}
