package com.mitesh.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Component
@Entity
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int cartId;
	private int productId;
	private Double productPrice;
	private String buyerEmail;
	private int quantity;
	private String sellerEmail;
	
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public Double getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}
	public String getBuyerEmail() {
		return buyerEmail;
	}
	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getSellerEmail() {
		return sellerEmail;
	}
	public void setSellerEmail(String sellerEmail) {
		this.sellerEmail = sellerEmail;
	}
	public Cart(int cartId, int productId, Double productPrice, String buyerEmail, int quantity, String sellerEmail) {
		super();
		this.cartId = cartId;
		this.productId = productId;
		this.productPrice = productPrice;
		this.buyerEmail = buyerEmail;
		this.quantity = quantity;
		this.sellerEmail = sellerEmail;
	}
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	
}

