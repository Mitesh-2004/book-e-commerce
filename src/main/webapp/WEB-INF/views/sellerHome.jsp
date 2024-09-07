<%@ page import="com.mitesh.model.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
    <head>
        <meta charset="UTF-8">
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
                    <li><a href="#" onclick="redirectToSamePage()" class="hover:text-gray-300">Home</a></li>
                    
                    
                    <li class="relative group">
					    <a href="addBook" class="hover:text-gray-300">Book</a>
					    <div class="absolute hidden group-hover:block bg-white mt-2 p-2 rounded-md shadow-lg top-full right-0 transform translate-x-[-50%] w-48">
					        <a href="addBook" class="block text-gray-700 py-2 border-b border-gray-300">Add Book</a>
					        <a href="viewSellerBooks" class="block text-gray-700 py-2 border-b border-gray-300">View My Books</a>
					    </div>
					</li>

                  
                  
                    <li><a href="contact.html" class="hover:text-gray-300">Contact</a></li>
                    
    
                    <li class="relative group">
                        <a href="sellersOrders" class="cursor-pointer hover:text-gray-300">Orders</a>
                    </li>
                    
                    <% Seller seller = (Seller)request.getAttribute("seller"); %>
                    <div class="relative group hover:text-gray-300">
				    
				        <spanclass="hover:text-gray-300 flex items-center">Profile</span>
					    <div class="absolute hidden group-hover:block bg-white mt-2 p-2 rounded-md shadow-lg top-full right-0 transform translate-x-[-50%]">
					        <p class="text-gray-800">user name : <%= seller.getSellerName()%> </p>
					        <p class="text-gray-800">Email : <%=seller.getSellerEmail() %></p>
					    </div>
					</div>
    
                    <li class="relative group">
                        <a href="login" class="cursor-pointer hover:text-gray-300">LogOut</a>
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
                <div class="bg-white p-4 rounded-lg shadow-md">
                    <img src="https://i.pinimg.com/564x/6f/a1/8f/6fa18f089942e5e82854252700e3f988.jpg" alt="Product" class="mb-4 w-full h-64 object-cover">
                    <h3 class="text-lg font-bold">Harry Potter</h3>
                    <p class="text-gray-600">Discover the magical world of Harry Potter.</p>
                    <p class="text-gray-800 font-bold">$39.99</p>
                    <button  class="mt-2 bg-green-500 text-white px-6 py-3 rounded-full">Buy Now</button>
                </div>
                
                
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
