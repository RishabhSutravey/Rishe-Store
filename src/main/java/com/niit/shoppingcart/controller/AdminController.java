package com.niit.shoppingcart.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class AdminController {
	@Autowired 
	UserDetailsDAO userDetailsDAO;
	@RequestMapping(value ="Admin" )
	public ModelAndView SupplierPage() {
		ModelAndView mv= new ModelAndView("/Admin");
		mv.addObject("UserClickedadmin", "true");
		return mv;
}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/login_session_attributes")
	public String login_session_attributes(HttpSession session) {
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		UserDetails user = userDetailsDAO.get(username);
		session.setAttribute("userId", user.getId());
		session.setAttribute("name", user.getUsername());
		session.setAttribute("LoggedIn", "true");

		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
		.getAuthentication().getAuthorities();
		String role="ROLE_USER";
		for (GrantedAuthority authority : authorities) 
		{
		  
		     if (authority.getAuthority().equals(role)) 
		     {
		    	 session.setAttribute("UserLoggedIn", "true");
		    	 return "/Home";
		     }
		     else 
		     {
		    	 session.setAttribute("Administrator", "true");
			 return "/Admin";
		     }
	}
		return "/Home";
	
	}

}
