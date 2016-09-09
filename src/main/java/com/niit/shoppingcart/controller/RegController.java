package com.niit.shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class RegController {

	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	@RequestMapping(value="adduser")
	public String addsupplier(@ModelAttribute("user")UserDetails  user, Model m)
	{
		
		userDetailsDAO.save(user);
		return "Home";
	}
	@RequestMapping(value="UserDetails")
	public String user(Model mv ){
		mv.addAttribute("user",new UserDetails());
		mv.addAttribute("UserClickeduser","true");
		return "Home";
	}
}
