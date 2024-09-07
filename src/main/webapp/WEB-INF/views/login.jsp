<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <title>Book Store Login</title>
</head>

<body class="bg-gray-800 h-screen flex items-center justify-center">
	

    <div class="bg-gray-700 p-8 shadow-md rounded-md w-96" id="buyerLogin">
        <h2 class="text-2xl font-bold mb-6 text-white">Login as Buyer</h2>

        <form action="buyerlogin" method="POST">
            <div class="mb-4">
                <label for="username" class="block text-sm font-medium text-white">Email:</label>
                <input type="text" id="username" name="buyerEmail"
                       class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="password" class="block text-sm font-medium text-white">Password:</label>
                <input type="password" id="password" name="buyerPassword"
                       class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <button type="submit"
                    class="w-full bg-yellow-500 text-white p-2 rounded-md hover:bg-yellow-600 focus:outline-none focus:ring focus:border-yellow-300">Login
            </button>
             <p class="mt-2 text-sm text-center text-gray-400">or <a href="#" onclick="showSellerLogin()"
                                                                  class="text-blue-500 hover:underline">Login as Seller</a>
        </p>
        <p class="mt-2 text-sm text-center text-gray-400">or
        <a href="createAccount" class="text-blue-500 hover:underline">Create a new buyer account</a>
        </p>
        </form>
       
    </div>

    <div class="bg-gray-700 p-8 shadow-md rounded-md w-96 hidden" id="sellerLogin">
        <h2 class="text-2xl font-bold mb-6 text-white">Login as Seller</h2>

        <form action="sellerlogin" method="POST">
            <div class="mb-4">
                <label for="sellerUsername" class="block text-sm font-medium text-white">Seller Email:</label>
                <input type="text" id="sellerUsername" name="sellerEmail"
                       class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="sellerPassword" class="block text-sm font-medium text-white">Seller Password:</label>
                <input type="password" id="sellerPassword" name="sellerPassword"
                       class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <button type="submit"
                    class="w-full bg-blue-500 text-white p-2 rounded-md hover:bg-yellow-600 focus:outline-none focus:ring focus:border-yellow-300">Login
            </button>
            <p class="mt-2 text-sm text-center text-gray-400">or <a href="#" onclick="showBuyerLogin()"
                                                               class="text-blue-500 hover:underline">Login as Buyer</a>
        </p>
        <p class="mt-2 text-sm text-center text-gray-400">or
        <a href="createAccount" class="text-blue-500 text-center hover:underline">Create a new Seller account</a>
  		</p>
        </form>
        
    </div>

    <script>
        function showSellerLogin() {
            document.getElementById('buyerLogin').style.display = 'none';
            document.getElementById('sellerLogin').style.display = 'block';
        }

        function showBuyerLogin() {
            document.getElementById('sellerLogin').style.display = 'none';
            document.getElementById('buyerLogin').style.display = 'block';
        }
    </script>

</body>

</html>
