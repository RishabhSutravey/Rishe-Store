package com.niit.shoppingcart.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.shoppingcart.dao.CartDAO;
import com.niit.shoppingcart.dao.ProductDAO;
import com.niit.shoppingcart.model.Cart;
import com.niit.shoppingcart.model.Product;

@Controller
public class CartController {
	@Autowired
	CartDAO cartDAO;
	@Autowired
	ProductDAO productDAO;
	
	
	
	@RequestMapping(value="addtocart/{id}")
	public String addproduct(@PathVariable("id") int id,@ModelAttribute("cart") Cart cart,RedirectAttributes attributes){
		int q=1;
		if(cartDAO.getproduct(id)==null){
			Product product = productDAO.get(id);
			cart.setProductid(product.getId());
			cart.setProductname(product.getName());
			cart.setPrice(product.getPrice());
			cart.setQuantity(q);
			cartDAO.save(cart);

		}else{
			System.out.println(q);
			//List<Cart> carta=  cartDAO.getproduct(id);
			 //cart.setId( cart.getId());
q+=1;
 cart.setQuantity(q);
cartDAO.update(cart);
		}
		return "redirect:/";
		
	}
	@RequestMapping(value="delete/{id}")
	public String delete(@ModelAttribute("cart") Cart cart){
		cartDAO.delete(cart);
		return "redirect:/Cart";
	}
	@RequestMapping(value="Cart")
	public ModelAndView cartpage(@ModelAttribute("cart") Cart cart){
		ModelAndView mv= new ModelAndView("/Cart");
		if(cartDAO.list().isEmpty()){
			mv.addObject("emptycart","Sorry your shopping cart is empty");
		}else{
		mv.addObject("cartList", cartDAO.list());
		}
		mv.addObject("UserClickedCart","true");
		return mv;
	}

}
