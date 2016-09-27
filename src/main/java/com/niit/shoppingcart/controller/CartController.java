package com.niit.shoppingcart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	
	@RequestMapping(value="addtocart/{productid}/{userid}")
	public String addproduct(@PathVariable("productid") int productid,@PathVariable("userid") int userid,@ModelAttribute("cart") Cart cart,RedirectAttributes attributes){
		int q=1;
		float p;
		if(cartDAO.getproduct(productid,userid)==null){
			Cart cart2= new Cart(); 
			Product product = productDAO.get(productid);
			cart2.setProductid(product.getId());
			cart2.setProductname(product.getName());
			cart2.setPrice(product.getPrice());
			cart2.setUserid(userid);
			cart2.setSubtotal(product.getPrice());
			cart2.setQuantity(q);
			cartDAO.save(cart2);
			
			return "redirect:/";

		}else{
			Cart cart1 = cartDAO.getproduct(productid,userid);
			Product product1 = productDAO.get(productid);
			q=cart1.getQuantity();
		 p=product1.getPrice();
			q+=1;
			p=q*p;
 cart1.setQuantity(q);
 cart1.setSubtotal(p);
cartDAO.update(cart1);
return "redirect:/Cart";
		}
		
	}
	@RequestMapping(value="editcart/{id}")
	public String editcart(@PathVariable("id") int id,@RequestParam("quantity") int quantity,RedirectAttributes attributes){
		
			Cart cart1=cartDAO.get(id);
			int q=cart1.getProductid();
			Product product = productDAO.get(q);
			float price=product.getPrice();
			cart1.setQuantity(quantity);
			cart1.setPrice(price);
			float subtotal=quantity*price;
			cart1.setSubtotal(subtotal);
			cartDAO.update(cart1);
			return "redirect:/Cart";
			
	}
	@RequestMapping(value="delete/{id}")
	public String delete(@ModelAttribute("cart") Cart cart){
		cartDAO.delete(cart);
		return "redirect:/Cart";
	}
	@RequestMapping(value="Cart")
	public ModelAndView cartpage(@ModelAttribute("cart") Cart cart,BindingResult result,HttpSession session){
		ModelAndView mv= new ModelAndView("/Home");
		if(cartDAO.list().isEmpty()){
			mv.addObject("emptycart","Sorry your shopping cart is empty");
		}else{
		mv.addObject("cartList", cartDAO.list());
		mv.addObject("price",cartDAO.getprice((int) session.getAttribute("userid")));
		}
		
		mv.addObject("UserClickedCart","true");
		return mv;
	}

}
