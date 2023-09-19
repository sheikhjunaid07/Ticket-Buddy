package com.ticketbuddy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ticketbuddy.configuration.DBConnection;
import com.ticketbuddy.dao.TicketDao;
import com.ticketbuddy.model.Ticket;
import com.ticketbuddy.model.TicketDTO;

public class TicketDaoImpl implements TicketDao {

	private DBConnection dbConnection = new DBConnection();

	private Connection conn;

	private final String file_directory = "http://localhost:8887/";

	public TicketDaoImpl() {
		conn = dbConnection.getConnection();
	}

	@Override
	public void saveTicket(Ticket ticket) {
		try {
			Statement stmt = conn.createStatement();
			String sql = "INSERT INTO ticket (userId,ticketType,ticketExpiry,ticketDiscription,filePath) VALUES('"
					+ ticket.getUserId() + "','" + ticket.getTicketType() + "','" + ticket.getTicketExpiry() + "','"
					+ ticket.getTicketDiscription() + "','" + ticket.getFilePath() + "')";
			stmt.executeUpdate(sql);
			System.out.println("Ticket saved");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<TicketDTO> getTicketsForTicketType(String ticketType) {
		List<TicketDTO> tickets = new ArrayList<>();
		try {
			String sql = "select u.userName, u.userMobile, t.ticketId, t.ticketStatus, t.userId, t.ticketType, t.ticketExpiry, t.ticketDiscription, t.filePath from user u left join ticket t on u.userId = t.userId where t.ticketStatus=0 AND ticketType=? AND t.ticketExpiry >= DATE(NOW()) ORDER BY t.ticketId DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ticketType);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				TicketDTO dto = new TicketDTO();
				dto.setUserMobile(rs.getString("userMobile"));
				dto.setUserName(rs.getString("userName"));
				Ticket ticket = getTicketObjFromResultSet(rs);
				dto.setTicket(ticket);
				tickets.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tickets;
	}

	private Ticket getTicketObjFromResultSet(ResultSet rs) throws SQLException {
		Ticket ticket = new Ticket();
		ticket.setTicketId(rs.getInt("ticketId"));
		ticket.setFilePath(file_directory + rs.getString("filePath"));
		ticket.setTicketDiscription(rs.getString("ticketDiscription"));
		ticket.setTicketExpiry(rs.getString("ticketExpiry"));
		ticket.setTicketType(rs.getString("TicketType"));
		ticket.setTicketId(rs.getInt("ticketId"));
		ticket.setTicketStatus(rs.getInt("ticketStatus"));
		ticket.setUserId(rs.getInt("userId"));
		return ticket;
	}

	@Override
	public List<Ticket> getTicketsForUserId(int userId) {
		List<Ticket> tickets = new ArrayList<>();
		try {
			String sql = "SELECT * FROM ticketbuddy.ticket where userId=? ORDER BY ticketId DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Ticket ticket = getTicketObjFromResultSet(rs);
				tickets.add(ticket);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tickets;
	}

	@Override
	public void deleteTicket(int ticketId) {
		try {
			String sql = "DELETE FROM ticketbuddy.ticket where ticketId=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ticketId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void updateTicket(int ticketId) {
		try {
			String sql = "UPDATE ticketbuddy.ticket SET ticketStatus=1 where ticketId=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ticketId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
