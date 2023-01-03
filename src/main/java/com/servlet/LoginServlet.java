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

import com.dao.UserDao;
import com.entities.User;

import source_package.FactoryProvider;



/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
    
	   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get the printWriter
		PrintWriter out = response.getWriter();
		
		//set content type
		response.setContentType("text/html;charset=UTF-8");
		
		//read the content type from login.jsp form
		String userEmail=request.getParameter("email");
		String userPassword=request.getParameter("password");
		
	
		out.println("Email :"+userEmail);
		out.println("Password :"+userPassword);
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
				
				//coding area
				
				String userEmail=request.getParameter("email");
				String userPassword=request.getParameter("password");
				
				//validations
					
				if(userEmail.isEmpty() ) {
					out.println("Email is blank");
					
				}
				
				
				
			//authentication
				
				//to get the Session factory from UserDao 
				UserDao userDao=new UserDao(FactoryProvider.getFactory());
				
				User user=userDao.getUserByEmailAndPassword(userEmail,userPassword);
				
				//System.out.println(user);
				
				//to authenticate from DB
				
				HttpSession httpsession= request.getSession(); 
				
				if(user==null) {
					/* out.println("<h1> Invalid details </h1>"); */
					
					httpsession.setAttribute("errorMessage", "Invalid Invalid details !! Try another one");
					response.sendRedirect("login.jsp");
					return;
				}
				else {
					out.println("<h1> Welcome "+user.getUserName()+ "</h1>");
				}
				
				
				//Login
				
				httpsession.setAttribute("current-user", user);
				
						//normal: -admin.jsp
				if(user.getUserType().equals("Admin")) {
					response.sendRedirect("admin.jsp");
				}
				else if(user.getUserType().equals("Normal")) {
					//normal: -normal.jsp
					response.sendRedirect("normal.jsp");
				}
				else {
					out.println("We have not identified the user");
				}
				
			out.close();

				
			}
			catch (Exception e) {
				e.printStackTrace();
				
				
			}
			

			
			
		}
			
		
		
	}

}

