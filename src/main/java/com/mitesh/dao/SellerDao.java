package com.mitesh.dao;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mitesh.model.Seller;

@Component
public class SellerDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Transactional
	public String addNewSeller(Seller seller)
	{
		try {
			String i = (String) this.hibernateTemplate.save(seller);
			return i;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	public Seller viewSeller(String sellerEmail){
		try {
			Seller seller = this.hibernateTemplate.get(Seller.class, sellerEmail);
			return seller;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
	
}
