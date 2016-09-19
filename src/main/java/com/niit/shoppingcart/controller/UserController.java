package com.niit.shoppingcart.controller;//if admin logs in redirect to admin page  if user logs redirect to welcome else invalid user

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.shoppingcart.dao.UserDetailsDAO;
import com.niit.shoppingcart.model.UserDetails;

@Controller
public class UserController {

	@Autowired
	UserDetailsDAO userDetailsDAO;
	@Autowired
	UserDetails userDetails;

	/*@RequestMapping("/login")
	public ModelAndView login(@RequestParam(value = "id") int id,
			@RequestParam(value = "password") String password,HttpSession session) {
		ModelAndView mv = new ModelAndView("Home");
		@SuppressWarnings("unused")
		String msg;
		userDetails = userDetailsDAO.isValidUser(id, password);
		if (userDetails == null) {
			msg = "Invalid User";
		}
		if (userDetails.getRole().equals("ROLE_ADMIN")) {
			mv = new ModelAndView("Admin");
		} else {
			session.setAttribute("welcomemsg", userDetails.getName());
			session.setAttribute("userId", userDetails.getId());
		}

		return mv;

	}*/
}
