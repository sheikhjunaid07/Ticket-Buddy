package com.ticketbuddy.servlets;

import java.io.IOException;

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

@WebServlet(urlPatterns = "/saveUser")
public class SaveUserServlet extends HttpServlet {

	private UserService service = new UserServiceImpl();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		user.setUserName(request.getParameter("name"));
		user.setUserAddress(request.getParameter("address"));
		user.setUserMobile(request.getParameter("mobile"));
		user.setUserEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		String userId = request.getParameter("userId");

		if (userId == null || "".equals(userId)) {
			user = service.saveUser(user);
			if(user == null) {
				request.setAttribute("login", "tab active");
				request.setAttribute("register", "tab");
				request.setAttribute("duplicateUserErrMsg", "Email Already Exists.");
				RequestDispatcher rd = request.getRequestDispatcher("userForm.jsp");
				rd.forward(request, response);
			}
		} else {
			user.setUserId(Integer.parseInt(request.getParameter("userId")));
			service.updateUser(user);
		}

		HttpSession session = request.getSession();
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("user", user);
		response.sendRedirect("userDashboard.jsp");
//		response.sendRedirect("/TicketBuddy/listUser");
	}

}
