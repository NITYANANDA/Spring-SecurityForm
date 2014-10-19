package com.home.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.home.model.User;

@Repository
public class UserDAOImpl implements UserDAO {

	private static final Logger logger = LoggerFactory
			.getLogger(UserDAOImpl.class);

	@Autowired
	private HibernateTemplate template;

	@Override
	public String addPerson(User user) {

		template.save(user);
		logger.info("Person saved successfully, Person Details=" + user);
		return "UserId  <b>" + user.getId()
				+ "</b>has been created successfully";
	}

	@Override
	public String updatePerson(User user) {

		template.update(user);
		logger.info("Person updated successfully, Person Details=" + user);
		return "Userid" + user.getId() + "has been successfully updated";
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> listPersons() {

		List<User> personsList = template.find("from User");
		for (User p : personsList) {
			logger.info("Person List::" + p);
		}
		return personsList;
	}

	@Override
	@Transactional(readOnly = true)
	public User getPersonById(int id) {

		User user = (User) template.get(User.class, new Integer(id));
		logger.info("Person loaded successfully, Person details=" + user);
		return user;
	}

	public String deletePerson(User user) {
		User users = (User) template.load(User.class, new Integer(user.getId()));
		if (null != user) {
			template.delete(user);
		}
		logger.info("Person deleted successfully, person details=" + user);
		return "userId  <b>"+user.getId()+"</b> has been successfully deleted";
	}
	
}
