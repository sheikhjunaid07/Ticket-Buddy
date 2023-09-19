package com.ticketbuddy.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ticketbuddy.model.Ticket;
import com.ticketbuddy.service.TicketService;
import com.ticketbuddy.service.impl.TicketServiceImpl;

@WebServlet(urlPatterns = "/saveTicket")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		)
public class SaveTicketServlet extends HttpServlet {

	private TicketService service = new TicketServiceImpl();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getSession(false).getAttribute("userId") == null){
			response.sendRedirect("index.jsp");
		}
		Ticket ticket = new Ticket();

		ticket.setTicketType(request.getParameter("ticketType"));
		ticket.setTicketExpiry(request.getParameter("ticketExpiry"));
		ticket.setTicketDiscription(request.getParameter("ticketDescription"));

		int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
		ticket.setUserId(userId);
		final String UPLOAD_DIRECTORY = "D:\\\\upload\\\\";
		Part filePart = request.getPart("ticketImage");
		String fileName = System.currentTimeMillis() + filePart.getSubmittedFileName();
		InputStream stream = filePart.getInputStream();
		try(FileOutputStream writer = new FileOutputStream(new File(UPLOAD_DIRECTORY + fileName))){
			int readBytes = 0;
            byte[] readArray = new byte[1024]; // Initializing a byte array with size 1024
            
            while ((readBytes = stream.read(readArray)) != -1) {
                writer.write(readArray, 0, readBytes);
            } 
		}
		ticket.setFilePath(fileName);
		service.saveTicket(ticket);
		RequestDispatcher rd = request.getRequestDispatcher("/ticketListByUserId");
		rd.forward(request, response);
	}

}
