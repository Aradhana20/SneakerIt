package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entities.User;

import source_package.FactoryProvider;




@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
    
	   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//get the printWriter
		PrintWriter out = response.getWriter();
		
		//set content type
		response.setContentType("text/html;charset=UTF-8");
		
		//get the 
		
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute("current-user");
		response.sendRedirect("login.jsp");
		
		//close the stream
		out.close();
	}


}



