package com.niit.shoppingcart.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.niit.shoppingcart.dao.SupplierDAO;
import com.niit.shoppingcart.model.Supplier;

@Controller
public class SupplierController {
	
	@Autowired
	SupplierDAO supplierDAO;

	@Autowired
	Supplier supplier;
	
	@RequestMapping(value = "/suppliergson")
	@ResponseBody
	public String SupplierGson() {
		List<Supplier> list = supplierDAO.list();
		Gson gson = new Gson();
		String data = gson.toJson(list);
		return data;
	}

	
	@RequestMapping(value="editsupplier")
	public String editsupplier(@Valid @ModelAttribute("supplier") Supplier supplier,  Model m,RedirectAttributes attributes,BindingResult result){
		if(result.hasErrors()){
			return "editsupplier";
		}else{
		supplierDAO.saveOrUpdate(supplier);
		attributes.addFlashAttribute("successmessage","Details of Supplier saved successfully");
		return "redirect:/Supplier";
	}
	}
@RequestMapping(value ="Supplier" )
	public ModelAndView SupplierPage(@ModelAttribute("supplier") Supplier supplier,BindingResult result
			) {
		
			ModelAndView mv= new ModelAndView("/Admin");
			//mv.addObject("supplier", new Supplier());
			mv.addObject("supplierList", supplierDAO.list());
			mv.addObject("UserClickedsupplier", "true");
			return mv;
		
	}
@RequestMapping(value ={"addeditsupplier/{id}"} )
public String SupplierPageedit(@PathVariable("id") int id,RedirectAttributes attributes) {
	attributes.addFlashAttribute("supplier", this.supplierDAO.get(id));
	return "redirect:/Supplier";
}
@RequestMapping(value ={"adddeletesupplier/{id}"} )
public String SupplierPagedelete(@ModelAttribute("supplier") Supplier supplier,Model m,RedirectAttributes attributes) {
	attributes.addFlashAttribute("successmessage","Supplier deleted successfully");
	
	supplierDAO.delete(supplier);
	return "redirect:/Supplier";
	
}

}