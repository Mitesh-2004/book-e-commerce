<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page import="com.mitesh.model.*" %>
<%@ page import="java.util.*" %>

<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Include the link to the "Roboto" font -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
        <style>
            body {
                min-height: 100vh;
                padding-top: 60px;
                display: flex;
                flex-direction: column;
                font-family: 'Roboto', sans-serif; /* Apply the Roboto font to the entire body */
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
                margin: top 20rem; ;
            }
    
            .group:hover .absolute {
                display: block;
            }
        </style>
        <title>Book Store Website</title>
    </head>
    
<body class="font-sans bg-gray-100">

    <!-- Navigation Bar -->
    <nav class="bg-gray-800 p-4 text-white">
        <div class="container mx-auto">
            <div class="flex justify-between items-center">
                <a href="#" class="text-3xl font-bold">Book Store</a>
                



                <ul class="hidden md:flex space-x-16 text-lg"> <!-- Hide on small screens -->
                    <li>
                    
                <div class="flex items-center">
                    <a href="buyerHome" onclick="redirectToSamePage()" class="hover:text-gray-300 flex items-center">
						<span>Home</span>
					</a>
					</div>
					</li>
                    <li><a href="#" class="hover:text-gray-300 draggable-none">Contact</a></li>
                    <li><a href="#" class="hover:text-gray-300" >Shop</a></li>
                    <li>
                        <!-- Cart Icon -->
                        <div class="flex items-center">
                            <a href="buyerCart" class="hover:text-gray-300 flex items-center">
                                <span class="ml-1">Cart</span>
                            </a>
                        </div>
                    </li>
    
                    <li class="relative group">
                        <a href="sellersOrders" class="cursor-pointer hover:text-gray-300">Orders</a>
                    </li>
                    
                     
    			<% Buyer buyer = (Buyer)request.getAttribute("buyer"); %>
                  <div class="relative group hover:text-gray-300">
				        <spanclass="hover:text-gray-300 flex items-center">Profile</span>
				    <div class="absolute hidden group-hover:block bg-white mt-2 p-2 rounded-md shadow-lg top-full right-0 transform translate-x-[-50%]">
				        <p class="text-gray-800">Username : <%= buyer.getBuyerName()%> </p>
				        <p class="text-gray-800">Email : <%=buyer.getBuyerEmail() %></p>
				    </div>
				</div>
                    
                    <li class="relative group">
                        <a href="login" class="cursor-pointer hover:text-gray-300">Logout</a>
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

    <!-- Hero Section -->

    <!-- Featured Products -->
    <section class="py-16">
       
        <div class="container mx-auto">
            <h2 class="text-3xl md:text-4xl lg:text-5xl font-bold mb-8">Best Sellers</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
                <!-- Product Cards go here -->
                
                
      <%List<Book> allBooks = (List<Book>)request.getAttribute("buyersBook");
      
      for(Book b: allBooks)
      {
 
      %><a href="productDetails/<%=b.getBookId() %>" class="block text-decoration-none">
		    <div class="bg-white p-4 rounded-lg shadow-md cursor-pointer">
		        <img src="" alt="Product" class="mb-4 w-full h-64 object-cover">
		        <h2 class="text-lg font-bold">Book Title: <%= b.getBookTitle() %></h2>
		        <p class="text-gray-600 font-bold">Book Author: <%= b.getBookAuthor() %> </p>
		        <p class="text-gray-800 font-bold">Re Sale Price: Rs <%= b.getBookDiscountedPrice() %></p>
		    </div>
		</a>

              <%
      }
              %>
            </div>
        </div>
      
        
    </section>

    <!-- Main Content Ends Here -->


    <section class="bg-gray-700 text-white py-16">
        <div class="container mx-auto flex justify-between items-center">
            <div class="max-w-md">
                <h2 class="text-3xl md:text-4xl lg:text-4xl font-bold mb-4">Why Choose Us?</h2>
                <p class="text-lg">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed dictum nisl, in semper turpis. Integer varius purus non justo bibendum, sed commodo urna tristique.</p>
            </div>
            <div class="max-w-md">
                <h2 class="text-3xl md:text-4xl lg:text-4xl font-bold mb-4">Our Mission</h2>
                <p class="text-lg">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed dictum nisl, in semper turpis. Integer varius purus non justo bibendum, sed commodo urna tristique.</p>
            </div>
        </div>
    </section>
    
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

        function redirectToLogin() {
        window.location.href = 'login.html';
    }

    function redirectToSamePage() {
        window.location.href = window.location.href;
    }
    </script>

</body>
</html>
