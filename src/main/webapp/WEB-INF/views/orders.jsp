
<%@ page import="com.mitesh.model.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            padding-top: 60px;
        }
        nav{
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1000;
            }
        main {
            flex: 1;
            margin-top: 20rem;
        }
         .group:hover .absolute {
                display: block;
            }
    </style>
</head>

<body class="bg-gray-100">

    <nav class="bg-gray-800 p-4 text-white">
        <div class="container mx-auto">
            <div class="flex justify-between items-center">
                <a href="#" class="text-3xl font-bold">Book Store</a>
                <ul class="hidden md:flex space-x-16 text-lg"> <!-- Hide on small screens -->
                    <li><a href="buyerHome" onclick="redirectToSamePage()" class="hover:text-gray-300">Home</a></li>
                    <li><a href="shop" class="hover:text-gray-300">Shop</a></li>
                    <li>
                        <!-- Cart Icon -->
                        <div class="flex items-center">
                            <a href="buyerCart" onclick="redirectToSamePage()" class="hover:text-gray-300 flex items-center">
                                <span class="ml-1">Cart</span>
                            </a>
                        </div>
                    </li>
                    
                    <%Buyer buyer = (Buyer) request.getAttribute("buyer"); %>
                  <div class="relative group hover:text-gray-300">
				        <spanclass="hover:text-gray-300 flex items-center">Profile</span>
				    <div class="absolute hidden group-hover:block bg-white mt-2 p-2 rounded-md shadow-lg top-full right-0 transform translate-x-[-50%]">
				        <p class="text-gray-800">Username : <%=buyer.getBuyerName() %></p>
				        <p class="text-gray-800">Email :<%=buyer.getBuyerEmail() %></p>
				    </div>
				</div>
    
                    <li class="relative group">
                        <a href="orders.html" class="cursor-pointer">Orders</a>
                    </li>
    
                    <li class="relative group">
                        <a href="login" class="cursor-pointer">LogOut</a>
                    </li>
    
                </ul>
    
                <!-- Mobile Menu (Hidden on larger screens) -->
                <div class="md:hidden">
                    <button class="text-white focus:outline-none">
                        <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path></svg>
                    </button>
                </div>
            </div>
        </div>
    </nav>


    <div class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold text-gray-800 mb-6">Orders</h1>

		<%  
		List<Orders> allorders = (List<Orders> ) request.getAttribute("allorders");
		List<Book> buyersBook = (List<Book>) request.getAttribute("buyersBook");
		for(Orders o: allorders)
		{
			if(o.getBuyerEmail().equals(buyer.getBuyerEmail()))
			{

				Book foundBook = null;

				for (Book book : buyersBook) {
				    if (o.getOrderItemId() == (book.getBookId())) {
				        foundBook = book;
				        break; // Once the book is found, exit the loop
				    }
				}
		
		%>
        <!-- Order Card -->
        <div class="max-w-xl bg-white rounded-lg shadow-md overflow-hidden mx-auto mb-4">
            <div class="px-6 py-4">
                <h2 class="text-xl font-semibold text-gray-800 mb-2">Item Name : <%= foundBook.getBookTitle()%></h2>
                <p class="text-sm text-gray-600 mb-2">Order Id : <%=o.getOrderId() %></p>
                <p class="text-sm text-gray-600 mb-2">Sellers Mail : <%=foundBook.getSellerEmail() %></p>
                <p class="text-sm text-gray-600 mb-2">Quantity : <%=o.getItemPrice()/ foundBook.getBookDiscountedPrice() %></p>
                <hr class="my-4 border-gray-300">
                <ul>
                	<li class="flex justify-between mb-2">
                        <span>Status</span>
                        <span> <%=o.getStatus() %> </span>
                    </li>
                
                    <li class="flex justify-between mb-2">
                        <span></span>
                        <span>Rs <%=o.getItemPrice() %> </span>
                    </li>
                    <!-- More products can be added here -->
                </ul>
            </div>
            <div class="px-6 py-4 bg-gray-100 flex justify-between">
                <span class="text-lg font-semibold text-gray-800">Total:</span>
                <span class="text-lg font-semibold text-gray-800">Rs <%=o.getItemPrice() %> </span>
            </div>
            <div class="px-6 py-4 bg-gray-100 flex justify-end">
                <a href="/BookStore/deleteOrderItems/<%=o.getOrderId() %>" class="text-red-500 font-semibold hover:text-red-700">Cancel Order</a>
            </div>
        </div><!-- End Order Card -->
	<%
	
			}
		}
	%>
       
    </div>

</body>

</html>
