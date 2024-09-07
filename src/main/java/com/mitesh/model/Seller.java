package com.mitesh.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name = "Seller", uniqueConstraints = {
        @UniqueConstraint(columnNames = "sellerId"),
        @UniqueConstraint(columnNames = "sellerEmail")
})
public class Seller {
    @Id
    @Column(name = "sellerEmail")
    private String sellerEmail;
    
    @GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "sellerId", unique = true)
    private int sellerId;

    private String sellerPassword;
    private String sellerName;
    private String sellerContact;
    
    public Seller(String sellerEmail, int sellerId, String sellerPassword, String sellerName, String sellerContact) {
		super();
		this.sellerEmail = sellerEmail;
		this.sellerId = sellerId;
		this.sellerPassword = sellerPassword;
		this.sellerName = sellerName;
		this.sellerContact = sellerContact;
	}
	public Seller() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getSellerEmail() {
		return sellerEmail;
	}
	public void setSellerEmail(String sellerEmail) {
		this.sellerEmail = sellerEmail;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public String getSellerPassword() {
		return sellerPassword;
	}
	public void setSellerPassword(String sellerPassword) {
		this.sellerPassword = sellerPassword;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	public String getSellerContact() {
		return sellerContact;
	}
	public void setSellerContact(String sellerContact) {
		this.sellerContact = sellerContact;
	}
    
}
