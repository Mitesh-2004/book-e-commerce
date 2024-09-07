<%@ page import="com.mitesh.model.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
	Book book = (Book)request.getAttribute("bookbyId");
	
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <title><%=book.getBookTitle() %> - Book</title>
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
<body>

    <nav class="bg-gray-800 p-4 text-white">
        <div class="container mx-auto">
            <div class="flex justify-between items-center">
                <a href="#" class="text-3xl font-bold">Book Store</a>
                <ul class="hidden md:flex space-x-16 text-lg"> <!-- Hide on small screens -->
                    <li><a href="/BookStore/buyerHome" class="hover:text-gray-300">Home</a></li>
                    <li><a href="/BookStore/shop" class="hover:text-gray-300">Shop</a></li>
                    <li>
                        <!-- Cart Icon -->
                        <div class="flex items-center">
                            <a href="/BookStore/buyerCart" class="hover:text-gray-300 flex items-center">
                                <span class="ml-1">Cart</span>
                            </a>
                        </div>
                    </li>
                    
                    <%
                    Buyer buyer = (Buyer) request.getAttribute("buyer");
                    %>
                  <div class="relative group hover:text-gray-300">
				        <spanclass="hover:text-gray-300 flex items-center">Profile</span>
				    <div class="absolute hidden group-hover:block bg-white mt-2 p-2 rounded-md shadow-lg top-full right-0 transform translate-x-[-50%]">
				        <p class="text-gray-800">Username : <%=buyer.getBuyerName() %> </p>
				        <p class="text-gray-800">Email :<%=buyer.getBuyerEmail() %> </p>
				    </div>
				</div>
    
                    <li class="relative group">
                        <a href="/BookStore/orders" class="cursor-pointer">Orders</a>
                    </li>
    
                    <li class="relative group">
                        <a href="index.html" class="cursor-pointer">LogOut</a>
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


    <section class="overflow-hidden bg-white py-11 font-poppins dark:bg-gray-800">
        <div class="max-w-6xl px-4 py-4 mx-auto lg:py-8 md:px-6">
            <div class="flex flex-wrap -mx-4">
                <div class="w-full px-4 md:w-1/2 ">
                    <div class="sticky top-0 z-50 overflow-hidden ">
                        <div class="relative mb-6 lg:mb-10 lg:h-2/4 ">
                            <img src="" alt="Product"
                                class="object-cover w-full lg:h-full ">
                        </div>
                    </div>
                </div>
                <div class="w-full px-4 md:w-1/2 ">
                    <div class="lg:pl-20">
                        <div class="mb-8 ">
                            <span class="text-lg font-medium text-rose-500 dark:text-rose-200">New</span>
                            <h2 class="max-w-xl mt-2 mb-6 text-2xl font-bold dark:text-gray-400 md:text-4xl">
                                <%=book.getBookTitle() %></h2>
                            <div class="flex items-center mb-6">
                                <ul class="flex mr-2">
                                    <li>
                                        <a href="#">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                fill="currentColor"
                                                class="w-4 mr-1 text-red-500 dark:text-gray-400 bi bi-star "
                                                viewBox="0 0 16 16">
                                                <path
                                                    d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />
                                            </svg>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                fill="currentColor"
                                                class="w-4 mr-1 text-red-500 dark:text-gray-400 bi bi-star "
                                                viewBox="0 0 16 16">
                                                <path
                                                    d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />
                                            </svg>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                fill="currentColor"
                                                class="w-4 mr-1 text-red-500 dark:text-gray-400 bi bi-star "
                                                viewBox="0 0 16 16">
                                                <path
                                                    d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />
                                            </svg>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                fill="currentColor"
                                                class="w-4 mr-1 text-red-500 dark:text-gray-400 bi bi-star "
                                                viewBox="0 0 16 16">
                                                <path
                                                    d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />
                                            </svg>
                                        </a>
                                    </li>
                                </ul>
                                <p class="text-xs dark:text-gray-400 ">(2 customer reviews)</p>
                            </div>
                            <p class="max-w-md mb-8 text-gray-700 dark:text-gray-400">
                          		This Book is Sold by Seller Email - <%=book.getSellerEmail() %>
                          
                            </p>
                            <p class="inline-block mb-8 text-4xl font-bold text-gray-700 dark:text-gray-400 ">
                                <span> Rs <%=book.getBookDiscountedPrice() %></span>
                                <span
                                    class="text-base font-normal text-gray-500 line-through dark:text-gray-400">Rs <%= book.getBookOriginalPrice() %> </span>
                            </p>
                        </div>
                        <div class="w-32 mb-8 ">
                            <label for=""
                                class="w-full text-xl font-semibold text-gray-700 dark:text-gray-400">Quantity</label>
                            <div class="relative flex flex-row w-full h-10 mt-4 bg-transparent rounded-lg">
							    <button id="decrementBtn"
							        class="w-20 h-full text-gray-600 bg-gray-300 rounded-l outline-none cursor-pointer dark:hover:bg-gray-700 dark:text-gray-400 hover:text-gray-700 dark:bg-gray-900 hover:bg-gray-400">
							        <span class="m-auto text-2xl font-thin">-</span>
							    </button>
							    <input id="numericInput" type="number"
							        class="flex items-center w-full font-semibold text-center text-gray-700 placeholder-gray-700 bg-gray-300 outline-none dark:text-gray-400 dark:placeholder-gray-400 dark:bg-gray-900 focus:outline-none text-md hover:text-black"
							        placeholder="1" min="1" value="1">
							    <button id="incrementBtn"
							        class="w-20 h-full text-gray-600 bg-gray-300 rounded-r outline-none cursor-pointer dark:hover:bg-gray-700 dark:text-gray-400 dark:bg-gray-900 hover:text-gray-700 hover:bg-gray-400">
							        <span class="m-auto text-2xl font-thin">+</span>
							    </button>
							</div>

                        </div>
                        <div class="flex flex-wrap items-center -mx-4 ">
                            <div class="w-full px-4 mb-4 lg:w-1/2 lg:mb-0">
                                <a id="link" href=<%="/BookStore/addtoCart/"+book.getBookId()+"?quantity=1"%>
                                     class="flex items-center justify-center w-full p-4 text-blue-500 border border-blue-500 rounded-md dark:text-gray-200 dark:border-blue-600 hover:bg-blue-600 hover:border-blue-600 hover:text-gray-100 dark:bg-blue-600 dark:hover:bg-blue-700 dark:hover:border-blue-700 dark:hover:text-gray-300">
                                    Add to Cart
                                </a>
                            </div>
                            <div class="w-full px-4 mb-4 lg:mb-0 lg:w-1/2">
                               <a id="orderLink" href=<%="/BookStore/order/"+book.getBookId()+"?quantity=1"%>
                                     class="flex items-center justify-center w-full p-4 text-blue-500 border border-blue-500 rounded-md dark:text-gray-200 dark:border-blue-600 hover:bg-blue-600 hover:border-blue-600 hover:text-gray-100 dark:bg-blue-600 dark:hover:bg-blue-700 dark:hover:border-blue-700 dark:hover:text-gray-300">
                                   Buy Now
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
    document.addEventListener("DOMContentLoaded", function () {
        const decrementBtn = document.getElementById("decrementBtn");
        const incrementBtn = document.getElementById("incrementBtn");
        const numericInput = document.getElementById("numericInput");
        const atag = document.getElementById("link");
		const buynow=document.getElementById("orderLink");
        decrementBtn.addEventListener("click", function () {
            if (numericInput.value > 1) {
                numericInput.value = parseInt(numericInput.value) - 1;
                makeAtag(atag,  numericInput.value )
                makeAtag(buynow,  numericInput.value )
                
              
            }
        });

        incrementBtn.addEventListener("click", function () {
            numericInput.value = parseInt(numericInput.value) + 1;
            makeAtag(atag,  numericInput.value )
            makeAtag(buynow,  numericInput.value )
        });
        function makeAtag(atag,value){
        	let str=atag.href.split("=")[0];
            str+="="+value;
            atag.href=str;
            console.log(atag);
        }
    });
</script>
</body>
</html>