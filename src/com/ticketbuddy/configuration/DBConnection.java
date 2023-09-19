package com.ticketbuddy.configuration;

import java.sql.Connection;

import java.sql.DriverManager;

public class DBConnection {

	static final String DB_URL = "jdbc:mysql://localhost:3306/ticketbuddy";
	static final String USER = "root";
	static final String PASS = "mysql";
	static final String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";

	private Connection conn;

	public Connection getConnection() {
		try {
			Class.forName(DRIVER_NAME).newInstance();
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

}
