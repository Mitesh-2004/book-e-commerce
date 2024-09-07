<%@ page import="com.mitesh.model.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <title>Books Page</title>
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
</head>
<body class="bg-gray-100 font-sans flex flex-col min-h-screen">

    <!-- Navigation -->
    <nav class="bg-gray-800 p-4 text-white">
        <div class="container mx-auto">
            <div class="flex justify-between items-center">
                <a href="#" class="text-3xl font-bold">Book Store</a>
                <ul class="hidden md:flex space-x-16 text-lg">
                    <li><a href="sellerHome" class="hover:text-gray-300">Home</a></li>
                    
					<li class="relative group">
					    <a href="addBook" class="hover:text-gray-300">Book</a>
					    <div class="absolute hidden group-hover:block bg-white mt-2 p-2 rounded-md shadow-lg top-full right-0 transform translate-x-[-50%] w-48">
					        <a href="addBook" class="block text-gray-700 py-2 border-b border-gray-300">Add Book</a>
					        <a href="#" class="block text-gray-700 py-2 border-b border-gray-300">Update Book</a>
					        <a href="viewSellerBooks" class="block text-gray-700 py-2 border-b border-gray-300">View My Books</a>
					    </div>
					</li>

                    <li><a href="contact.html" class="hover:text-gray-300">Contact</a></li>
                    <li class="relative group">
                        <a href="orders.html" class="cursor-pointer hover:text-gray-300">Orders</a>
                    </li>
                    <% Seller seller = (Seller)request.getAttribute("seller"); %>
                    
                    <div class="relative group hover:text-gray-300">
                        <span class="hover:text-gray-300 flex items-center">Profile</span>
                        <div class="absolute hidden group-hover:block bg-white mt-2 p-2 rounded-md shadow-lg top-full right-0 transform translate-x-[-50%]">
                            <p class="text-gray-800">Username:<%=seller.getSellerName() %> </p>
                            <p class="text-gray-800">Email: <%=seller.getSellerEmail() %></p>
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

    <!-- Main Content -->
    <div class="container mx-auto mt-8 flex-grow">
        <h2 class="text-3xl font-bold mb-4">Browse Books</h2>

        <!-- Book Cards -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8 mb-8">
            <%
                 seller = (Seller)request.getAttribute("seller");
                List<Book> sellerBooks = (List<Book>)request.getAttribute("sellersBook");
                for (Book b : sellerBooks) {
                    if (seller.getSellerEmail().equals(b.getSellerEmail())) {
            %>
            <!-- Sample Book Card (Repeat this for each book) -->
            <div class="bg-white p-6 rounded-lg shadow-md">
                <img src="book-cover.jpg" alt="Book Cover" class="mb-4 rounded">
                <h3 class="text-xl font-bold mb-2">Book Title :<%=b.getBookTitle() %> </h3>
                
                <p class="text-gray-700">Book ID : <%=b.getBookId() %> </p>
                <p class="text-gray-700">Author Name : <%=b.getBookAuthor() %> </p>
                
                <p class="text-gray-700">Book Original price : <%=b.getBookOriginalPrice()%> </p>
                
                <p class="text-gray-700">Book ReSale price : <%=b.getBookDiscountedPrice()%> </p>
                <p class="text-gray-700">Seller Email : <%=b.getSellerEmail() %> </p>
                <a href="deleteBookByid/<%=b.getBookId() %>" class="mt-4 bg-red-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 inline-block">Delete Book</a>
            </div>
            <!-- End of Sample Book Card -->
            <%
                    }
                }
            %>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-gray-800 text-white p-4 mt-auto">
        <div class="container mx-auto text-center">
            <p>&copy; 2024 My Bookstore. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>
