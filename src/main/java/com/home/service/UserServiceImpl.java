package com.home.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.home.dao.UserDAO;
import com.home.model.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDao;

	@Override
	@Transactional
	public String addPerson(User p) {
		return this.userDao.addPerson(p);
	}

	@Override
	@Transactional
	public String updatePerson(User p) {
		return this.userDao.updatePerson(p);
	}

	@Override
	@Transactional
	public List<User> listPersons() {
		return this.userDao.listPersons();
	}

	@Override
	@Transactional
	public User getPersonById(int id) {
		return this.userDao.getPersonById(id);
	}

	@Override
	@Transactional
	public String deletePerson(User user) {
		return this.userDao.deletePerson(user);
	}

}
