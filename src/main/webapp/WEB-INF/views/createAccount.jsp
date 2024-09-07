<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html lang="en">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <title>Add Account - Bank Application</title>
</head>

<body class="bg-gray-800 h-screen flex items-center justify-center">

    <div class="bg-gray-700 p-8 shadow-md rounded-md w-96">
        <h2 id="formHeading" class="text-2xl font-bold mb-6 text-white text-center">Create a Buyer Account</h2>

        <form action="createAccountBuyer" method="POST" id="buyerForm" class="visible">
            <!-- Buyer Registration Form -->
            <div class="mb-4">
                <label for="buyerName" class="block text-sm font-medium text-white">Name:</label>
                <input type="text" id="buyerName" name="buyerName" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="buyerEmail" class="block text-sm font-medium text-white">Email:</label>
                <input type="text" id="buyerEmail" name="buyerEmail" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="buyerContact" class="block text-sm font-medium text-white">Contact:</label>
                <input type="text" id="buyerContact" name="buyerContact" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="buyerPassword" class="block text-sm font-medium text-white">Password:</label>
                <input type="password" id="buyerPassword" name="buyerPassword" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>
            
            <div class="mb-4">
                <label for="buyerPassword" class="block text-sm font-medium text-white">Enter Otp:</label>
                <input type="text" id="otp" name="enteredOtp" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>
				
			<button type="button" class="w-full bg-green-500 mb -2 text-white p-2 rounded-md hover:bg-blue-600 focus:outline-none focus:ring focus:border-yellow-300">Send Otp</button>
				
				
            <button type="submit" class="w-full bg-yellow-500 mt-2 text-white p-2 rounded-md hover:bg-yellow-600 focus:outline-none focus:ring focus:border-yellow-300">Add Account</button>

            <p class="mt-2 text-sm text-center text-gray-400">Already have an account? <a href="login.html"  class="text-blue-500 hover:underline">Login</a> or <a href="#" onclick="toggleForm('sellerForm')" class="text-blue-500 hover:underline">Create as Seller</a></p>
        </form>

        <form action="createAccountSeller" method="POST" id="sellerForm" class="hidden">
            <!-- Seller Registration Form -->
            <div class="mb-4">
                <label for="sellerName" class="block text-sm font-medium text-white">Seller Name:</label>
                <input type="text" id="sellerName" name="sellerName" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="sellerEmail" class="block text-sm font-medium text-white">Seller Email:</label>
                <input type="text" id="sellerEmail" name="sellerEmail" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="sellerContact" class="block text-sm font-medium text-white">Seller Contact:</label>
                <input type="text" id="sellerContact" name="sellerContact" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="sellerPassword" class="block text-sm font-medium text-white">Password:</label>
                <input type="password" id="sellerPassword" name="sellerPassword" class="mt-1 p-2 w-full border rounded-md bg-gray-600 text-white focus:outline-none focus:border-blue-500">
            </div>

            <button type="submit" class="w-full bg-yellow-500 text-white p-2 rounded-md hover:bg-yellow-600 focus:outline-none focus:ring focus:border-yellow-300">Add Account</button>

            <p class="mt-2 text-sm text-center text-gray-400">Already have an account? <a href="login.html"  class="text-blue-500 hover:underline">Login</a> or <a href="#" onclick="toggleForm('buyerForm')" class="text-blue-500 hover:underline">Create as Buyer</a></p>
        </form>
    </div>

    <script>
        function toggleForm(formId) {
            const forms = document.querySelectorAll('form');
            forms.forEach(form => {
                if (form.id === formId) {
                    form.classList.remove('hidden');
                    form.classList.add('visible');
                    updateHeading(formId);
                } else {
                    form.classList.remove('visible');
                    form.classList.add('hidden');
                }
            });
        }

        function updateHeading(formId) {
            const heading = document.getElementById('formHeading');
            heading.innerText = formId === 'buyerForm' ? 'Create a Buyer Account' : 'Create a Seller Account';
        }
    </script>

</body>

</html>
