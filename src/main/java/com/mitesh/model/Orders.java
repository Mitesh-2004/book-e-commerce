package com.mitesh.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Component
@Entity
public class Orders {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int orderId;
	private String buyerEmail;
	private String sellerEmail;
	private Double itemPrice;
	private int orderItemId;
	private String status;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getBuyerEmail() {
		return buyerEmail;
	}
	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}
	public String getSellerEmail() {
		return sellerEmail;
	}
	public void setSellerEmail(String sellerEmail) {
		this.sellerEmail = sellerEmail;
	}
	public Double getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(Double itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Orders(int orderId, String buyerEmail, String sellerEmail, Double itemPrice, int orderItemId, String status) {
		super();
		this.orderId = orderId;
		this.buyerEmail = buyerEmail;
		this.sellerEmail = sellerEmail;
		this.itemPrice = itemPrice;
		this.orderItemId = orderItemId;
		this.status = status;
	}
	
}
