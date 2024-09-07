<%@ page import="com.mitesh.model.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <title>Your Cart</title>
</head>
<body class="font-sans bg-gray-100">

    <!-- Navigation Bar -->
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
                    
                    <% Buyer buyer= (Buyer)request.getAttribute("buyer"); %>
                  <div class="relative group hover:text-gray-300">
				        <spanclass="hover:text-gray-300 flex items-center">Profile</span>
				    <div class="absolute hidden group-hover:block bg-white mt-2 p-2 rounded-md shadow-lg top-full right-0 transform translate-x-[-50%]">
				        <p class="text-gray-800">Username : <%= buyer.getBuyerName()%> </p>
				        <p class="text-gray-800">Email : <%=buyer.getBuyerEmail() %></p>
				    </div>
				</div>
    
                    <li class="relative group">
                        <a href="orders" class="cursor-pointer">Orders</a>
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

	

    <!-- Cart Content -->
    <main class="container mx-auto my-8">
        <h1 class="text-3xl font-bold mb-6">Shopping Cart</h1>
        <div class="flex flex-col md:flex-row">
            <div class="md:w-3/4">
                <!-- Cart Items -->
                
                <%
	
                List<Cart> allCartItems = (List<Cart>)request.getAttribute("allCartItems");
				List<Book> allBooks	= (List<Book>) request.getAttribute("buyersBook");			
                Double total = 0.0;
                Double subtotal = 0.0;
				for(Cart c: allCartItems)
				{
					if(c.getBuyerEmail().equals(buyer.getBuyerEmail()))
					{	
						Book foundBook = null;

						for (Book book : allBooks) {
						    if (book.getBookId() == (c.getProductId())) {
						        foundBook = book;
						        break; // Once the book is found, exit the loop
						    }
						}
				%>
                
                <div class="bg-white p-4 mb-4 shadow-md">
                    <div class="flex justify-between items-center mb-2">
                        <img src="product-image.jpg" alt="Product" class="w-16 h-16 object-cover rounded-md mr-4">
                        <div>
                            <h2 class="text-lg font-bold" > Product name : <%=foundBook.getBookTitle() %> </h2>
                            <% subtotal += c.getProductPrice(); %>
                            <p class="text-lg ">Seller's Mail : <%=c.getSellerEmail() %></p>
                            <p class="text-lg">Single Book Price : <%=foundBook.getBookDiscountedPrice() %></p>
                        </div>
                        <div>
                            <p class="text-gray-800 font-bold">Rs <%=c.getProductPrice() %></p>
                            <p class="text-gray-800 font-bold">Quantity : <%=c.getQuantity() %></p>
							<a href="deleteCartItem/<%=c.getCartId()%>" class="mt-4 bg-red-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 inline-block">Delete</a>
                                      
                        </div>
                    </div>
                </div>
			<%
				
				}
			}
				%>
                <!-- Add more cart items here -->

            </div>
            <div class="md:w-1/4 md:ml-4">
    <!-- Order Summary -->
    <div class="bg-white p-4 mb-4 shadow-md">
        <h2 class="text-xl font-bold mb-4">Cart Details</h2>
        <div class="flex justify-between mb-2">
            <span>Subtotal: </span>
            <span class="font-bold"> Rs <%= subtotal %></span>
        </div>
        <div class="flex justify-between mb-2">
            <span>Shipping:</span>
            <span class="font-bold">Rs 5.00</span>
        </div>
        <div class="flex justify-between mb-4">
            <span class="font-bold">Total:</span>
            <% total = subtotal + 5.00;%>
            <span class="font-bold"> Rs <%=total %></span>
        </div>
        <!-- Order Button -->
        <a href="#"><button class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600">Place Order</button>
    </a>
    </div>
</div>

        </div>
    </main>

	
    <!-- Footer -->
    <footer class="bg-gray-800 text-white py-8">
        <div class="container mx-auto text-center">
            <p>&copy; 2024 Your Brand. All rights reserved.</p>
        </div>
    </footer>

    <script>
        // Toggle mobile menu visibility
        document.querySelector('.md\\:hidden button').addEventListener('click', function () {
            document.querySelector('.md\\:flex').classList.toggle('hidden');
        });

        
    function redirectToSamePage() {
        window.location.href = window.location.href;
    }
    </script>

</body>
</html>
