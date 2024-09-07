package com.mitesh.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import com.mitesh.dao.BookDao;
import com.mitesh.dao.BuyerDao;
import com.mitesh.dao.SellerDao;
import com.mitesh.model.Book;
import com.mitesh.model.Buyer;
import com.mitesh.model.Seller;
import com.sun.xml.bind.CycleRecoverable.Context;

@Controller
public class MainController {
	
	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	
	// Object of buyer and buyerdao
	// Object of buyer and seller
	
	
	
	//Mapping for landing page
	@RequestMapping("/")
	public String indexPage(){
		System.out.println("On index Page..");
		return "index";
	}
	
	//to reach the login page path
	@RequestMapping("/login")
	public String loginBuyer()
	{
		System.out.println("onlogin");
		return "login";
	}
	
	
	@RequestMapping("/logout")
	public String logout(){
		return "login";
	}


	// to reach createAccount path
	@RequestMapping("/createAccount")
	public String createAccount(){
		System.out.println("Create Account Page..");
		return "createAccount";
	}
	
	
	
	
	
}
