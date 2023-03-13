package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Product;

public class ProductDao {
	
private SessionFactory factory;
	
	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	public boolean saveProduct(Product product) {
		//by default no data so false
		boolean f = false;
		
		try {
			
			Session session=this.factory.openSession();
			
			Transaction tx= session.beginTransaction();
			
			session.save(product);
			
			tx.commit();
			session.close();
			//product is saved
			f=true;
			
		}
		catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		
		return f;
	}

}
