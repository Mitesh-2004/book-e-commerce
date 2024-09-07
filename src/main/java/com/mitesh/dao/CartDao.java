package com.mitesh.dao;

import java.util.*;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mitesh.model.Cart;

@Component
public class CartDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	@Transactional
	public int addToCart(Cart cart)
	{
		Integer id = (Integer)this.hibernateTemplate.save(cart);
		return id;
	}
	
	public List<Cart> getAllCartItems()
	{
		List<Cart> allCartItems = this.hibernateTemplate.loadAll(Cart.class);
		return allCartItems;
	}
	
	@Transactional
	public void deleteCartItem(int cartid)
	{
		Cart cart = this.hibernateTemplate.get(Cart.class, cartid);
		this.hibernateTemplate.delete(cart);
	}
}
