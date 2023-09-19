package com.ticketbuddy.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ticketbuddy.model.User;
import com.ticketbuddy.service.UserService;
import com.ticketbuddy.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/editUser")
public class EditUserServlet extends HttpServlet{
	
	private UserService service = new UserServiceImpl();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final int userId = Integer.parseInt(request.getParameter("userId"));
		User user = service.getUserByUserId(userId);
		request.setAttribute("user", user);
		RequestDispatcher rd = request.getRequestDispatcher("userRegistration.jsp");
		rd.forward(request, response);
	}

}
