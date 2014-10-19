package com.home.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.home.model.User;
import com.home.service.UserService;

@Controller
@RequestMapping("/admin")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/allusers", method = RequestMethod.GET)
	@ResponseBody
	public String listAllUsers(ModelMap model) {
		String json = "";
		List list = new ArrayList();
		model.addAttribute("user", new User());
		list = userService.listPersons();
		json = new Gson().toJson(list);
		return json;

	}

	@ModelAttribute
	public void user(ModelMap modelMap) {
		modelMap.addAttribute("user", new User());
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String getHomePage(ModelMap modelMap) {

		return "homePage";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String addUserPage(ModelMap modelMap) {

		return "addUser";
	}

	@RequestMapping(value = "/updateUser", method = RequestMethod.GET)
	public String updateUserPage(ModelMap modelMap) {

		return "updateUser";
	}

	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
	public String deleteUserPage(ModelMap modelMap) {

		return "deleteUser";
	}

	@RequestMapping(value = "/listUser", method = RequestMethod.GET)
	public String listUser(ModelMap modelMap) {

		// modelMap.addAttribute("userList", list);
		return "listUser";
	}

	@RequestMapping(value = "/search/{id}", method = RequestMethod.GET)
	@ResponseBody
	public String searchUser(@PathVariable("id") int id, ModelMap modelMap) {
		User user = userService.getPersonById(id);
		modelMap.addAttribute("user", user);
		return new Gson().toJson(user);

	}

	// For add and update person both
	@RequestMapping(value = "/user/add", method = RequestMethod.POST)
	public String addPerson(@ModelAttribute("user") User user, ModelMap map,
			HttpServletRequest request) {

		HttpSession ses = request.getSession();
		String msg = userService.addPerson(user);
		User users = userService.getPersonById(user.getId());
		List list = new ArrayList();
		list.add(users);
		request.setAttribute("msg", msg);
		map.addAttribute("userList", list);

		map.addAttribute("user", user);

		return "addUser";

	}

	@RequestMapping("/user/delete")
	public String deletePerson(@ModelAttribute User user, Model model,
			HttpServletRequest request) {
		HttpSession ses = request.getSession();
		String result = this.userService.deletePerson(user);
		ses.setAttribute("msg", result);
		return "deleteUser";
	}

	@RequestMapping("/user/edit")
	public String editPerson(@ModelAttribute User user, Model model,
			HttpServletRequest request) {
		HttpSession ses = request.getSession();
		String result = this.userService.updatePerson(user);
		ses.setAttribute("msg", result);
		return "updateUser";
	}

}
