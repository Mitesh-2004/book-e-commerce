<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        nav {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
        }

        main {
            flex: 1;
            margin-top: 20rem; /* Adjust the margin based on your design */
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
                    <li><a href="#" class="hover:text-gray-300">Shop</a></li>

                    <li class="relative group">
                        <a href="login" class="cursor-pointer">Login</a>
                    </li>

                    <li class="relative group">
                        <a href="createAccount" class="cursor-pointer">Register</a>
                    </li>
                </ul>

                <!-- Mobile Menu (Hidden on larger screens) -->
                <div class="md:hidden">
                    <button class="text-white focus:outline-none">
                        <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                            xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round"
                                stroke-linejoin="round" stroke-width="2"
                                d="M4 6h16M4 12h16m-7 6h7"></path></svg>
                    </button>
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="bg-gray-600 text-white py-16">
        <div class="container mx-auto text-center">
            <h1 class="text-4xl md:text-5xl lg:text-6xl font-bold mb-4">Welcome to Your Online BOOK Store</h1>
            <p class="text-lg md:text-xl lg:text-2xl">Discover our latest products and great deals.</p>
            <a href="login.html" class="mt-6 inline-block bg-yellow-500 text-gray-800 px-6 py-3 rounded-full">Shop Now</a>
        </div>
    </section>

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
                    <p class="text-gray-800 font-bold">Rs 210</p>
                    <button onclick="redirectToLogin()" class="mt-2 bg-green-500 text-white px-6 py-3 rounded-full">Buy Now</button>
                </div>
                
                <div class="bg-white p-4 rounded-lg shadow-md">
                    <img src="https://upload.wikimedia.org/wikipedia/en/thumb/d/dc/A_Song_of_Ice_and_Fire_book_collection_box_set_cover.jpg/220px-A_Song_of_Ice_and_Fire_book_collection_box_set_cover.jpg" alt="Product" class="mb-4 w-full h-64 object-cover"> <!-- Increased height to 56 -->
                    <h3 class="text-lg font-bold">GOT</h3>
                    <p class="text-gray-600">Experience the epic tale of Game of Thrones.</p> <!-- Reduced margin bottom and font color to gray-600 -->
                    <p class="text-gray-800 font-bold">Rs 345.90</p> <!-- Updated price -->
                    <button  onclick="redirectToLogin()" class="mt-2 bg-green-500 text-white px-6 py-3 rounded-full">Buy Now</button> <!-- Updated button label and color -->
                </div>
                
                <div class="bg-white p-4 rounded-lg shadow-md">
                    <img src="data:image/jpeg;base64,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" alt="Product" class="mb-4 w-full h-64 object-cover"> <!-- Increased height to 56 -->
                    <h3 class="text-lg font-bold">Atomic Habits</h3>
                    <p class="text-gray-600">Master the art of building good habits.</p> <!-- Reduced margin bottom and font color to gray-600 -->
                    <p class="text-gray-800 font-bold">Rs 499.99</p> <!-- Updated price -->
                    <button  onclick="redirectToLogin()"class="mt-2 bg-green-500 text-white px-6 py-3 rounded-full">Buy Now</button> <!-- Updated button label and color -->
                </div>
                
                <div class="bg-white p-4 rounded-lg shadow-md">
                    <img src="data:image/jpeg;base64,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" alt="Product" class="mb-4 w-full h-64 object-cover"> <!-- Increased height to 56 -->
                    <h3 class="text-lg font-bold">Ikigai</h3>
                    <p class="text-gray-600">Discover the Japanese secret to a long and happy life.</p> <!-- Reduced margin bottom and font color to gray-600 -->
                    <p class="text-gray-800 font-bold">Rs 114.99</p> <!-- Updated price -->
                    <button  onclick="redirectToLogin()" class="mt-2 bg-green-500 text-white px-6 py-3 rounded-full">Buy Now</button> <!-- Updated button label and color -->
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
