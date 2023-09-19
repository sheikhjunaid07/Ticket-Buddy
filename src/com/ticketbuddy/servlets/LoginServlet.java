package com.ticketbuddy.servlets;

import  java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ticketbuddy.model.User;
import com.ticketbuddy.service.UserService;
import com.ticketbuddy.service.impl.UserServiceImpl;

@WebServlet(urlPatterns = "/login")
public class LoginSer vlet extends HttpServlet {

	private UserService service = new UserServiceImpl();
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String userEmail = request.getParameter("email");
		final String userPassword = request.getParameter("password");
		User user = service.login(userEmail, userPassword);
		
		if (user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getUserId());
			session.setAttribute("user", user);
			response.sendRedirect("userDashboard.jsp");
		} else {
			request.setAttribute("login", "tab active");
			request.setAttribute("register", "tab");
			request.setAttribute("errMsg", "Invalid Credentials.");
			RequestDispatcher rd = request.getRequestDispatcher("userForm.jsp");
			rd.forward(request, response);
		}
	}
}
