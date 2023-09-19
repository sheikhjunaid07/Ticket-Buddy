package com.ticketbuddy.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ticketbuddy.configuration.DBConnection;
import com.ticketbuddy.dao.UserDao;
import com.ticketbuddy.model.User;

public class UserDaoImpl implements UserDao {

	private DBConnection dbConnection = new DBConnection();

	private Connection conn;

	static final String DB_URL = "jdbc:mysql://localhost:3306/ticketbuddy";
	static final String USER = "root";
	static final String PASS = "mysql";
	static final String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";

	@Override
	public User saveUser(User user){

		try {
			conn = dbConnection.getConnection();
			String sql = "INSERT INTO user(userName,userAddress,userMobile,userEmail,password) VALUES(?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserAddress());
			pstmt.setString(3, user.getUserMobile());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getPassword());
			pstmt.executeUpdate();
			ResultSet generatedKeys = pstmt.getGeneratedKeys();
			if (generatedKeys.next()) {
				user.setUserId(generatedKeys.getInt(1));
            }
			System.out.println("User saved with userId: " + user.getUserId());
		}catch(SQLIntegrityConstraintViolationException e) {
			return null;
		}
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;
	}

	@Override
	public List<User> getAllUsers() {
		List<User> users = new ArrayList<User>();
		try {
			conn = dbConnection.getConnection();
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM user";
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				User user = getUserObjFromResultSet(rs);
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return users;
	}

	private User getUserObjFromResultSet(ResultSet rs) throws SQLException {
		User user = new User();
		user.setUserId(rs.getInt("userId"));
		user.setUserName(rs.getString("userName"));
		user.setUserAddress(rs.getString("userAddress"));
		user.setUserMobile(rs.getString("userMobile"));
		user.setUserEmail(rs.getString("userEmail"));
		user.setPassword(rs.getString("password"));
		return user;
	}

	@Override
	public void deleteUser(int userId) {
		try {
			conn = dbConnection.getConnection();
			Statement stmt = conn.createStatement();
			String sql = "DELETE FROM user WHERE userId = " + userId;
			stmt.executeUpdate(sql);
			System.out.println("User deleted of id : " + userId);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	@Override
	public User getUserByUserId(int userId) {
		User user = new User();
		try {
			conn = dbConnection.getConnection();
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM user WHERE userId = " + userId;
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			user = getUserObjFromResultSet(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;
	}

	@Override
	public void updateUser(User user) {
		try {
			conn = dbConnection.getConnection();
			Statement stmt = conn.createStatement();
			String sql = "UPDATE user SET userName='" + user.getUserName() + "', userAddress='" + user.getUserAddress()
					+ "', userMobile='" + user.getUserMobile() + "', userEmail='" + user.getUserEmail() + "',password='"
					+ user.getPassword() + "' WHERE userId = " + user.getUserId();
			stmt.executeUpdate(sql);
			System.out.println("User updated with userId: " + user.getUserId());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	@Override
	public User login(String email, String password) {
		User user = null;
		try {
			conn = dbConnection.getConnection();
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM user WHERE userEmail = '" + email + "' AND password = '" + password + "'";
			ResultSet rs = stmt.executeQuery(sql);

			if (rs.next()) {
				user = getUserObjFromResultSet(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;
	}

}
