package com.mitesh.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import com.mitesh.model.*;
import org.springframework.stereotype.Component;

import java.util.*;
@Component
@Entity
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bookId;
	private String bookTitle;
    private String bookAuthor;
    private Double bookOriginalPrice;
    private Double bookDiscountedPrice;
    private String bookContact;
    private String bookCity;
    private String bookCategory; // Using List<Byte> for dynamic size
    private String sellerEmail;
    
    
    public Book(int bookId, String bookTitle, String bookAuthor, Double bookOriginalPrice, Double bookDiscountedPrice,
			String bookContact, String bookCity, String bookCategory, String sellerEmail) {
		super();
		this.bookId = bookId;
		this.bookTitle = bookTitle;
		this.bookAuthor = bookAuthor;
		this.bookOriginalPrice = bookOriginalPrice;
		this.bookDiscountedPrice = bookDiscountedPrice;
		this.bookContact = bookContact;
		this.bookCity = bookCity;
		this.bookCategory = bookCategory;
		this.sellerEmail = sellerEmail;
	}
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public Double getBookOriginalPrice() {
		return bookOriginalPrice;
	}
	public void setBookOriginalPrice(Double bookOriginalPrice) {
		this.bookOriginalPrice = bookOriginalPrice;
	}
	public Double getBookDiscountedPrice() {
		return bookDiscountedPrice;
	}
	public void setBookDiscountedPrice(Double bookDiscountedPrice) {
		this.bookDiscountedPrice = bookDiscountedPrice;
	}
	public String getBookContact() {
		return bookContact;
	}
	public void setBookContact(String bookContact) {
		this.bookContact = bookContact;
	}
	public String getBookCity() {
		return bookCity;
	}
	public void setBookCity(String bookCity) {
		this.bookCity = bookCity;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public String getSellerEmail() {
		return sellerEmail;
	}
	public void setSellerEmail(String sellerEmail) {
		this.sellerEmail = sellerEmail;
	}
	
   
}
