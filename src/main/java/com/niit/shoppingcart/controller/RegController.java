package com.niit.shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class RegController {

	@Autowired
	UserDetailsDAO userDetailsDAO;
	
	
	@RequestMapping(value="adduser")
	public String addsupplier(@ModelAttribute("userDetails") UserDetails  userDetails, Model m,RedirectAttributes attributes)
	{
        userDetails.setRole("ROLE_USER");
        userDetails.setEnabled(true);
        if(userDetailsDAO.saveOrUpdate(userDetails)==true){
        	attributes.addFlashAttribute("registered", "You Have Successfully Registered with us Thank You...");
        }
        else{
        	attributes.addFlashAttribute("registered","Registration failed Please try again");
        }
		return "redirect:/registration";
	}
	@RequestMapping(value="registration")
	public ModelAndView user(@ModelAttribute("userDetails") UserDetails userDetails){
		ModelAndView mv=new ModelAndView("/registration");
		mv.addObject("UserClickeduser","true");
		return mv;
	}
}
