package com.mitesh.controller;

import java.lang.annotation.Repeatable;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.mitesh.dao.BookDao;
import com.mitesh.dao.BuyerDao;
import com.mitesh.model.Book;
import com.mitesh.model.Buyer;
import com.mitesh.model.Cart;
import com.mitesh.model.Orders;
import com.mitesh.dao.CartDao;
import com.mitesh.dao.OrdersDao;

@Controller
public class BuyerController {
    ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");

    Buyer buyer = (Buyer) context.getBean("buyer");
    BuyerDao buyerDao = (BuyerDao) context.getBean("buyerDao");

    Book book = (Book) context.getBean("book");
    BookDao bookDao = (BookDao) context.getBean("bookDao");

    Cart cart = (Cart) context.getBean("cart");
    CartDao cartDao = (CartDao) context.getBean("cartDao");

    Orders orders = (Orders) context.getBean("orders");
    OrdersDao ordersDao = (OrdersDao) context.getBean("ordersDao");

    @RequestMapping(path = "/buyerlogin", method = RequestMethod.POST)
    public String onBuyerLogin(HttpServletRequest request, Model m) {
        String email = request.getParameter("buyerEmail");
        String password = request.getParameter("buyerPassword");

        buyer = buyerDao.viewBuyer(email);

        if (buyer != null && buyer.getBuyerEmail().equals(email) && buyer.getBuyerPassword().equals(password)) {
            m.addAttribute("buyer", buyer);
            m.addAttribute("buyerLoginError", false); // Set to false when login is successful
            return "buyerHome";
        } else {
            m.addAttribute("buyerLoginError", true); // Set to true when login fails
            return "login"; // Show the login page again
        }
    }

    //to create a new buyer account
    @RequestMapping(path = "/createAccountBuyer", method = RequestMethod.POST)
    public String onbuyerAccount(@ModelAttribute Buyer buyer, HttpServletRequest request) {

        EmailSend email = new EmailSend();
        String otp = email.sendEmailWithOTP(request.getParameter("buyerEmail"));
        String enteredOtp = request.getParameter("enteredOtp");

        if (otp.equals(enteredOtp)) {
            try {
                System.out.println(buyer);
                String i = buyerDao.addNewBuyer(buyer);
                System.out.println(" account created successfully");
                return "login";
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return "error";
    }

    @RequestMapping("/buyerHome")
    public String buyerHome(Model m) {
        m.addAttribute("buyer", buyer);
        return "buyerHome";
    }

    @RequestMapping("/shop")
    public String shop(Model m, Model h) {
        System.out.println("Inside the /buyerHome");
        m.addAttribute("buyer", buyer);
        List<Book> buyersBook = bookDao.viewSellerAllBooks();
        h.addAttribute("buyersBook", buyersBook);
        return "shop";
    }


    @RequestMapping(path = "/productDetails/{bookId}", method = RequestMethod.GET)
    public String productDetaailsPage(@PathVariable("bookId") int bookId, Model m, Model h) {

        m.addAttribute("buyer", buyer);

        book = bookDao.viewSingleBook(bookId);

        h.addAttribute("bookbyId", book);


        System.out.println("on product Details");
        return "productDetails";
    }

    @RequestMapping(path = "/addtoCart/{bookId}", method = RequestMethod.GET)
    public RedirectView toAddtocart(
            @PathVariable("bookId") int bookId,
            @RequestParam("quantity") int quantity,
            Model m,
            Model h,
            HttpServletRequest req
    ) {
        System.out.println(quantity);
        m.addAttribute("buyer", buyer);

        book = bookDao.viewSingleBook(bookId);

        h.addAttribute("bookbyId", book);

        cart.setProductId(book.getBookId());
        cart.setBuyerEmail(buyer.getBuyerEmail());
        cart.setSellerEmail(book.getSellerEmail());
        cart.setProductPrice(book.getBookDiscountedPrice() * quantity);
        cart.setQuantity(quantity);

        cartDao.addToCart(cart);

        m.addAttribute("cart", cart);
        System.out.println("on product Details");
        return new RedirectView(req.getContextPath() + "/productDetails/" + bookId);
    }


    @RequestMapping("/buyerCart")
    public String buyerCart(Model m) {
        m.addAttribute("buyer", buyer);

        List<Book> buyersBook = bookDao.viewSellerAllBooks();
        m.addAttribute("buyersBook", buyersBook);
        m.addAttribute("bookbyId", book);
        List<Cart> allCartItems = cartDao.getAllCartItems();
        m.addAttribute("allCartItems", allCartItems);
        System.out.println("on cart");
        return "buyerCart";
    }

    @RequestMapping(path = "/deleteCartItem/{cartid}", method = RequestMethod.GET)
    public RedirectView deleteCartItem(@PathVariable("cartid") int cartid, HttpServletRequest request) {
        cartDao.deleteCartItem(cartid);

        System.out.println("on delete cart item path");

        RedirectView redirectView = new RedirectView();
        redirectView.setUrl(request.getContextPath() + "/buyerCart");
        return redirectView;
    }

    @RequestMapping(path = "/order/{bookId}")
    public RedirectView addOrder(@PathVariable("bookId") int bookid,
                                 @RequestParam("quantity") int quantity,
                                 HttpServletRequest request, Model m) {
        m.addAttribute("bookbyId", book);
        m.addAttribute("buyer", buyer);

        book = bookDao.viewSingleBook(bookid);

        List<Cart> allCartItems = cartDao.getAllCartItems();
        m.addAttribute("allCartItems", allCartItems);


        orders.setBuyerEmail(buyer.getBuyerEmail());
        orders.setSellerEmail(book.getSellerEmail());
        orders.setItemPrice(book.getBookDiscountedPrice() * quantity);
        orders.setOrderItemId(bookid);
        orders.setStatus("Pending");

        ordersDao.addOrder(orders);

        RedirectView redirectView = new RedirectView();
        redirectView.setUrl(request.getContextPath() + "/productDetails/" + bookid);
        return redirectView;

    }


    @RequestMapping("/orders")
    public String orders(Model m) {
        m.addAttribute("bookbyId", book);
        m.addAttribute("buyer", buyer);
        List<Book> buyersBook = bookDao.viewSellerAllBooks();
        m.addAttribute("buyersBook", buyersBook);
        try {
            System.out.println("orders Page");
            List<Orders> allorders = (List<Orders>) ordersDao.getAllOrders();
            m.addAttribute("allorders", allorders);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "orders";
    }

    @RequestMapping(path = "/deleteOrderItems/{orderId}", method = RequestMethod.GET)
    public RedirectView deleteOrderItems(@PathVariable("orderId") int orderId, HttpServletRequest request) {
        ordersDao.deleteOrdersitems(orderId);

        System.out.println("on delete order item path");

        RedirectView redirectView = new RedirectView();
        redirectView.setUrl(request.getContextPath() + "/orders");
        return redirectView;
    }

}
