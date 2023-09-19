package com.ticketbuddy.service;

import java.util.List;

import com.ticketbuddy.model.User;

public interface UserService {
	
	User saveUser(User user);
	
	void updateUser(User user);
	
	List<User> getAllUsers();
	
	void deleteUser(int userId);
	
	User getUserByUserId(int userId);
	
	User login(String email, String password);

}
