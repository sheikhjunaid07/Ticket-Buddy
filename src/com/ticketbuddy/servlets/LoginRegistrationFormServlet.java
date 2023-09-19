package com.ticketbuddy.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginRegistrationFormServlet
 */
@WebServlet("/loginRegistrationForm")
public class LoginRegistrationFormServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String action = request.getParameter("action");
		if(action.equals("login")) {
			request.setAttribute("login", "tab active");
			request.setAttribute("register", "tab");
		}else {
			request.setAttribute("login", "tab");
			request.setAttribute("register", "tab active");
		}
		// tab active
		RequestDispatcher rd = request.getRequestDispatcher("userForm.jsp");
		rd.forward(request, response);
	}

}
