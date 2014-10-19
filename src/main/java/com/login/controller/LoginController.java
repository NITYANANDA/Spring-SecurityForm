package com.login.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RequestMapping("/home")
@Controller
public class LoginController {
	@RequestMapping("/secured/mypage")

	public String mypage(Model model, Principal principal) {

		return "redirect:/admin/home";
	}
	
	@RequestMapping(value = "/logoutPage", method = RequestMethod.GET)
	
	public String logoutPage() {
		return "logoutPage";
	}
	
	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage() {
		return "loginPage";
	}
}
