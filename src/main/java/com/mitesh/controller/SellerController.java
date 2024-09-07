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
import com.mitesh.dao.OrdersDao;
import com.mitesh.dao.SellerDao;
import com.mitesh.model.Book;
import com.mitesh.model.Orders;
import com.mitesh.model.Seller;

@Controller
public class SellerController {

	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	
	Seller seller = (Seller)context.getBean("seller");
	SellerDao sellerDao = (SellerDao) context.getBean("sellerDao");
	
	//Object of book class
		Book book = (Book) context.getBean("book");
		BookDao bookDao = (BookDao) context.getBean("bookDao");
		
		
		Orders orders = (Orders) context.getBean("orders");
		OrdersDao ordersDao = (OrdersDao) context.getBean("ordersDao");
	@RequestMapping("/sellerHome")
	public String sellerHome(Model m)
	{
		m.addAttribute("seller",seller);
		return "sellerHome";
	}
		
	//to create a new seller account
		@RequestMapping(path="/createAccountSeller",method=RequestMethod.POST)
		public String onSellerAccount(@ModelAttribute Seller seller)
		{
			try {
				System.out.println(seller);
				String i = sellerDao.addNewSeller(seller);
				System.out.println(i +" account created successfully");
				return "login";
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "error";
		}
		
	
	//seller login verification
		@RequestMapping(path="/sellerlogin", method=RequestMethod.POST)
		public String onSellerLogin(HttpServletRequest request, Model m) {
		    String email = request.getParameter("sellerEmail");
		    String password = request.getParameter("sellerPassword");

		    seller = sellerDao.viewSeller(email);

		    if (seller != null && seller.getSellerEmail().equals(email) && seller.getSellerPassword().equals(password)) {
		        // Authentication successful
		        m.addAttribute("seller",seller);
		        m.addAttribute("sellerLoginError", false); // Set to false when login is successful
		        return "sellerHome";
		    } else {
		        m.addAttribute("sellerLoginError", true); // Set to true when login fails
		        return "login"; // Show the login page again
		    }
		}
		
		// add book -> {Seller}
		@RequestMapping("/addBook")
		public String addBookPage(Model m){
	        m.addAttribute("seller",seller);
			return "addBook";
		}
		
		
		//add book 
		@RequestMapping(path="/addNewBook", method=RequestMethod.POST)
		public String addBookOperation(@ModelAttribute Book book , Model m)
		{	
			System.out.println( book.getBookAuthor() );
			System.out.println( book.getBookTitle() );
			System.out.println( book.getBookOriginalPrice() );
			System.out.println( book.getBookDiscountedPrice() );
			System.out.println( book.getSellerEmail() );
			System.out.println( book.getBookContact() );
			System.out.println( book.getBookCity() );
			System.out.println( book.getSellerEmail() );
			m.addAttribute("seller", seller);
			try {
				System.out.println(book);
				int i = bookDao.addBook(book);
				System.out.println(i+" book added successfully");
				return "sellerHome";
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "error";
		}
		@RequestMapping("/viewSellerBooks")
		public String viewSellerBooks(Model m , Model h){
			m.addAttribute("seller", seller);
			List<Book> sellersBook = bookDao.viewSellerAllBooks();
			h.addAttribute("sellersBook", sellersBook);
			return "viewSellerBooks";
		}
		
		@RequestMapping(path="/deleteBookByid/{bookId}", method=RequestMethod.GET)
		public RedirectView deleteBookById(@PathVariable("bookId") int id,HttpServletRequest request)
		{	
			bookDao.deletBookById(id);
			System.out.println("on delete path");
			
			RedirectView redirectView = new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/viewSellerBooks");
			return redirectView;
		}
		@RequestMapping("/sellersOrders")
		public String sellersOrders(Model m){
			System.out.println("sellersorders");
			m.addAttribute("seller", seller);
			List<Orders> allorders = ordersDao.getAllOrders();
			m.addAttribute("allorders", allorders);
			List<Book> allbooks = bookDao.viewSellerAllBooks();
			m.addAttribute("allBooks",allbooks);
			return "sellersOrders";
		}
		
		@RequestMapping(path="/changeOrderStatus/{orderId}", method=RequestMethod.GET)
		public RedirectView changeOrderStatus(@PathVariable("orderId") int orderid,HttpServletRequest request, Model m)
			{
			ordersDao.changeStatus(orderid);
			RedirectView redirectView = new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/sellersOrders");
			return redirectView;
		}
		
}





























