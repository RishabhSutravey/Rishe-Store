package com.niit.shoppingcart.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class AdminController {
	@Autowired 
	UserDetailsDAO userDetailsDAO;
	@Autowired
	CartDAO cartDAO;
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
		session.setAttribute("userid", user.getId());
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
		    	 session.setAttribute("cartsize",cartDAO.getsize((int) session.getAttribute("userid")));
		    	 return "redirect:/";
		     }
		     else 
		     {
		    	 session.setAttribute("Administrator", "true");
			 return "/Admin";
		     }
	}
		return "/Home";
	
	}
	@RequestMapping(value="/loginError")
	public String errorpage(RedirectAttributes attributes){
		attributes.addFlashAttribute("error", "The Username or Password you entered is incorrect please try again");
		return "redirect:/login";
	}

}
