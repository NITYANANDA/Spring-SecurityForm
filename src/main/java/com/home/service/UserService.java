package com.home.service;

import java.util.List;

import com.home.model.User;

public interface UserService {

	public String addPerson(User p);
	public String updatePerson(User p);
	public List<User> listPersons();
	public User getPersonById(int id);
	public String deletePerson(User u);
	
}
