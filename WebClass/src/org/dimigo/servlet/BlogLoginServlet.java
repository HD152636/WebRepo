package org.dimigo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dimigo.vo.UserVO;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

/**
 * Servlet implementation class BlogLoginServlet
 */
@WebServlet(name= "bloglogin", urlPatterns = {"/bloglogin"})
public class BlogLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		 PrintWriter out = response.getWriter();
		 
		 request.setCharacterEncoding("utf-8");
		 String id = request.getParameter("id");
		 String pwd = request.getParameter("pwd");
	      System.out.printf("id : %s, pwd : %s\n",id, pwd);
	      
	      if(id.equals("test@naver.com")){
	     
	    	  HttpSession session = request.getSession();
	    	  session.setAttribute("id", id);
	    	  
	    	  UserVO user = new UserVO();
	    	  user.setId(id);
	    	  user.setName("허고운");
	    	  user.setNickname("의적");
	    	  
	    	  session.setAttribute("user", user);
	    	  
	    	  RequestDispatcher rd = request.getRequestDispatcher("myblog/myblog.jsp");
	    	  rd.forward(request, response);		  
	      } 
	
	      else {
	    	  request.setAttribute("msg", "error");
	    	  RequestDispatcher rd = request.getRequestDispatcher("myblog/myblog.jsp");
	    	  rd.forward(request, response);		  
	      }
	      object.addProperty("id", id);
	      
	     		 
	       out.close();
	      
	      }
	      
	}


