package com.ticketbuddy.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ticketbuddy.model.User;
import com.ticketbuddy.service.UserService;
import com.ticketbuddy.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/listUser")
public class ListUserServlet extends HttpServlet {

	private UserService service = new UserServiceImpl();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<User> users = service.getAllUsers();
		request.setAttribute("users", users);
		RequestDispatcher rd = request.getRequestDispatcher("ListUser.jsp");
		rd.forward(request, response);
	}

}
