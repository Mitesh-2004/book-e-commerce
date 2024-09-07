<%@ page import="com.mitesh.model.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <title>Add Book - Book Store</title>
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

<body class="bg-gray-800 h-screen flex items-center justify-center">

    

    

    <div class="bg-gray-700 p-8 shadow-md rounded-md w-96">
        <h2 id="formHeading" class="text-2xl font-bold mb-6 text-white text-center">Add a Book</h2>

        <form action="addNewBook" method="POST">
            <!-- Book Form -->

            <div class="mb-4">
                <label for="bookTitle" class="block text-sm font-medium text-white">Book Title:</label>
                <input type="text" id="bookTitle" name="bookTitle" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="bookAuthor" class="block text-sm font-medium text-white">Book Author:</label>
                <input type="text" id="bookAuthor" name="bookAuthor" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="originalPrice" class="block text-sm font-medium text-white">Original Price:</label>
                <input type="number" min="150" id="originalPrice" name="bookOriginalPrice" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="reSalePrice" class="block text-sm font-medium text-white">Re Sale Price:</label>
                <input type="number" min="100" id="reSalePrice" name="bookDiscountedPrice" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="contact" class="block text-sm font-medium text-white">Contact:</label>
                <input type="text" id="contact" name="bookContact" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="city" class="block text-sm font-medium text-white">City:</label>
                <input type="text" id="city" name="bookCity" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

			<div class="mb-4">
			    <label for="bookCategory" class="block text-sm font-medium text-white">Book Category:</label>
			    <select id="bookCategory" name="bookCategory" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
			        <option value="fiction">Fiction</option>
			        <option value="non-fiction">Non-Fiction</option>
			        <option value="adventure">Adventure</option>
			        <option value="mystery">Mystery</option>
			        <option value="other">Other</option>
			        
			        <!-- Add more options as needed -->
			    </select>
			</div>
	
		 	<% Seller seller = (Seller)request.getAttribute("seller"); %>
		 	
		 	<input type="text" id="sellerEmail" name="sellerEmail" value="<%=seller.getSellerEmail()%>" readonly class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
		 	
            <button type="submit" class="w-full bg-yellow-500 text-white p-2 rounded-md hover:bg-yellow-600 focus:outline-none focus:ring focus:border-yellow-300">Add Book</button>
        </form>
    </div>

</body>

</html>
