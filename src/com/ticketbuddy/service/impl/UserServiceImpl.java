package com.ticketbuddy.service.impl;

import java.util.List;

import com.ticketbuddy.dao.UserDao;
import com.ticketbuddy.dao.impl.UserDaoImpl;
import com.ticketbuddy.model.User;
import com.ticketbuddy.service.UserService;

public class UserServiceImpl implements UserService {
	
	private UserDao dao = new UserDaoImpl();
	
	@Override
	public User saveUser(User user) {
		return dao.saveUser(user);
	}

	@Override
	public List<User> getAllUsers() {
		return dao.getAllUsers();
	}

	@Override
	public void deleteUser(int userId) {
		dao.deleteUser(userId);
	}

	@Override
	public User getUserByUserId(int userId) {
		return dao.getUserByUserId(userId);
	}

	@Override
	public void updateUser(User user) {
		dao.updateUser(user);
	}

	@Override
	public User login(String email, String password) {
		return dao.login(email, password);
	}

}
