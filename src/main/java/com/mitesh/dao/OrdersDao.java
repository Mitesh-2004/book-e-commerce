package com.mitesh.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import com.mitesh.model.Orders;

@Component
public class OrdersDao {
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@Transactional
	public int addOrder(Orders orders){
		int i = (Integer)this.hibernateTemplate.save(orders);
		return i;
	}
	
	public List<Orders> getAllOrders(){
		List<Orders> allorders = (List<Orders>)this.hibernateTemplate.loadAll(Orders.class);
		return allorders;
	}
	
	@Transactional
	public void deleteOrdersitems(int orderid)
	{
		Orders orders = this.hibernateTemplate.get(Orders.class, orderid);
		this.hibernateTemplate.delete(orders);
	}
	
	@Transactional
	public void changeStatus(int orderid){
		Orders orders = this.hibernateTemplate.get(Orders.class, orderid);
		orders.setStatus("Approved");
		this.hibernateTemplate.save(orders);
		}
}
