package com.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.User;

public class UserDao {
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	
	//get user by email and password
	
	public User getUserByEmailAndPassword(String email, String password) {

		User user= null;
		
		try {
			
			//HQL Hibernate Query language 
			//Query will search from User entity the email and password
			
			String query="From User where userEmail =: e and userPassword =: p";
			
			//open session
			Session session= this.factory.openSession();
			
			//HQL query to search from DB
			Query q= session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			
			user=(User)q.uniqueResult();
			
			//close session
			
			session.close();
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
		
		
	}
	
 
}
