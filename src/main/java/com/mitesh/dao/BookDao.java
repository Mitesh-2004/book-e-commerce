package com.mitesh.dao;

import java.util.*;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mitesh.model.Book;


@Component
public class BookDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Transactional
	public int addBook(Book book){
		try {
			Integer i = (Integer) this.hibernateTemplate.save(book);
			return i;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	public List<Book> viewSellerAllBooks(){
		List<Book> sellersBook = this.hibernateTemplate.loadAll(Book.class);
		return sellersBook;
	}
	
	@Transactional
	public void deletBookById(int id)
	{
		try {
			Book book = this.hibernateTemplate.get(Book.class, id);
			this.hibernateTemplate.delete(book);
			return;
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
	
	public Book viewSingleBook(int id)
	{
		try {
			Book book = this.hibernateTemplate.get(Book.class, id);
			return book;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
