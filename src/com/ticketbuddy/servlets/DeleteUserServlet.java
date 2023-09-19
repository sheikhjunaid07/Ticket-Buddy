package com.ticketbuddy.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ticketbuddy.service.UserService;
import com.ticketbuddy.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/deleteUser")
public class DeleteUserServlet extends HttpServlet{
	
	private UserService service = new UserServiceImpl();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final int userId = Integer.parseInt(request.getParameter("userId"));
		service.deleteUser(userId);
		response.sendRedirect("/TicketBuddy/listUser");
	}
	
}
