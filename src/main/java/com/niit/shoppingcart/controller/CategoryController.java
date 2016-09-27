package com.niit.shoppingcart.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart.dao.CategoryDAO;
import com.niit.shoppingcart.model.Category;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	Category category;

	@RequestMapping(value="editcategory")
	public String editcategory(@ModelAttribute("category") @Valid Category category,Model m){
	
	return "redirect:/Category";
		}
@RequestMapping(value ="Category" )
	public ModelAndView CategoryPage(@ModelAttribute("category") Category category,BindingResult result) {
		ModelAndView mv= new ModelAndView("/Admin");
		//mv.addObject("category", new Category());
		mv.addObject("categoryList", categoryDAO.list());
		mv.addObject("UserClickedcategory", "true");
		return mv;
	}
@RequestMapping(value ={"addeditcategory/{id}"} )
public String CategoryPageedit(@PathVariable("id") int id,RedirectAttributes attributes) {
	attributes.addFlashAttribute("category", this.categoryDAO.get(id));
	return "redirect:/Category";
}
@RequestMapping(value ={"adddeletecategory/{id}"} )
public String CategoryPagedelete(@ModelAttribute("category") Category category,Model m) {
	//attributes.addFlashAttribute("category", this.categoryDAO.get(id));
	categoryDAO.delete(category);
	return "redirect:/Category";
}
}
