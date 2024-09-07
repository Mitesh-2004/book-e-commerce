package com.mitesh.dao;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.mitesh.model.Buyer;

@Component
public class BuyerDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Transactional
	public String addNewBuyer(Buyer buyer){
		try {
			String i =  (String) this.hibernateTemplate.save(buyer);
			return i;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
	@Transactional
	public Buyer viewBuyer(String buyerEmail)
	{
		try {
			Buyer buyer = this.hibernateTemplate.get(Buyer.class, buyerEmail);
			return buyer;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
}
