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
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.http.codec.multipart.Part;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.dao.UserDao;
import com.entities.Category;
import com.entities.Product;
import com.entities.User;

import source_package.FactoryProvider;
import javax.servlet.annotation.MultipartConfig;


/**
 * Servlet implementation class RegisterServlet
 */

@MultipartConfig
@WebServlet("/ProductOperationServlet")
public class ProductOperationServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get the printWriter
		PrintWriter out = response.getWriter();
		
		//set content type
		response.setContentType("text/html;charset=UTF-8");
		
		//read the content type from login.jsp form
		String userEmail=request.getParameter("CategoryTitle");
		String userPassword=request.getParameter("CategoryDesc");
		
	
//		out.println("Email :"+Ca);
//		out.println("Password :"+userPassword);
//		out.println(" Form Registered successfully");
		
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
				
				//add category Or add product operation
				//based on operation filed from admin.jsp form part
				String op= request.getParameter("operation");
				
				if(op.trim().equals("addCategory")) {
					
					//fetching category title and category description from admin.jsp form
					
					String title =request.getParameter("CategoryTitle");
					String description =request.getParameter("CategoryDesc");
					
					Category category= new Category();
					
					category.setCategoryTitle(title);
					category.setCategoryDescription(description);
					
					//category database save:
					
					CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
					
					int catId=categoryDao.saveCategory(category);
					
					out.println("category saved");
				}
				
				else if(op.trim().equals("addProduct")) {
					
					//fetching category title and category description from admin.jsp form
					
					String Ptitle =request.getParameter("ProductName");
					String Pdescription =request.getParameter("Productdesc");
					
				    int Pprice =Integer.parseInt(request.getParameter("Productprice"));
				    int Pdiscount =Integer.parseInt(request.getParameter("Productdiscount"));
				    int Pquantity =Integer.parseInt(request.getParameter("Productquantity"));
				    int CId =Integer.parseInt(request.getParameter("categoryId"));
					
				    //to save image
					javax.servlet.http.Part part = request.getPart("Productphoto");
					
					
					Product product= new Product();
					
					product.setProductName(Ptitle);
					product.setProductDesc(Pdescription);
					product.setProductPrice(Pprice);
					product.setProductDiscount(Pdiscount);
					product.setProductQuantity(Pquantity);
					
					product.setProductphoto(part.getSubmittedFileName());
					
					//For categorg create a function , to get category by Id
					
					CategoryDao cdao =  new CategoryDao(FactoryProvider.getFactory());
					Category category = cdao.getCategoryById(CId);
					
					product.setCategory(category);
					
					//product save
					
					ProductDao pdao= new ProductDao(FactoryProvider.getFactory());
					pdao.saveProduct(product);
					
					out.println("Product saved in DB");
					//close the stream
					out.close();
			
				}
				
				

				
			}
			
			catch(Exception e) {
				
				e.printStackTrace();
				
			}
		}
	}
	
}
	
				
			