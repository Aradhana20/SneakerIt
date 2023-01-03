package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.User;

import source_package.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get the printWriter
		PrintWriter out = response.getWriter();
		
		//set content type
		response.setContentType("text/html;charset=UTF-8");
		
		//read the content type
		String userName=request.getParameter("user_name");
		String userEmail=request.getParameter("user_email");
		String userPassword=request.getParameter("user_password");
		String userPhone=request.getParameter("user_phone");
		String userAddress=request.getParameter("user_address");
		
		out.println("Name :"+userName);
		out.println("EMail :"+userEmail);
		out.println("Password :"+userPassword);
		out.println("Phone :"+userPhone);
		out.println("Address :"+userAddress);
		
		//
		
		out.println(" Form Registered successfully");
		//close the stream
		
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try(PrintWriter out = response.getWriter()) {
			
			try {
				String userName=request.getParameter("user_name");
				String userEmail=request.getParameter("user_email");
				String userPassword=request.getParameter("user_password");
				String userPhone=request.getParameter("user_phone");
				String userAddress=request.getParameter("user_address");
				
				//validations
				
				if(userName.isEmpty() ) {
					out.println("Name is blank");
					return;
				}
					
				if(userEmail.isEmpty() ) {
					out.println("Email is blank");
					
				}
				
				//creating user object to store data
				
				User user=new User(userName, userEmail, userPassword, userPhone,"default.jpg", userAddress,"Normal");

				
				// Storing data using hibernate
				
				Session hibernateSession= FactoryProvider.getFactory().openSession();
				Transaction tx = hibernateSession.beginTransaction();
				
				
				//provide an user ID
				int userId=(int)hibernateSession.save(user);
				
				tx.commit();
				hibernateSession.close();
				
				//saving the data and displaying the message
				
				    HttpSession httpSession= request.getSession();
				    httpSession.setAttribute("message", "Registration Successfull !! "+userId);
					response.sendRedirect("register.jsp");
				
				//Direct to register.jsp page after successfully registered
				
//				out.println("Successfully saved");
//				out.println("<br> User Id is"+userId);
				
				
				//close the stream
				
				out.close();

				
			}
			catch (Exception e) {
				e.printStackTrace();
				
				
			}
			

			
			
		}
		
		
		
		
		
		
		
	}

}
