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

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      RequestDispatcher rd = request.getRequestDispatcher("/jsp/signup.jsp");
      rd.forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html;charset=utf-8");

      request.setCharacterEncoding("utf-8");
      String id = request.getParameter("id");
      String pwd = request.getParameter("pwd");
      String name = request.getParameter("name");
      String nickname = request.getParameter("nickname");
      System.out.printf("id : %s, pwd : %s", id, pwd);

      boolean result = true;
      if (!result) {
         // 세션에 사용자 생성
         HttpSession session = request.getSession();

         RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
         rd.forward(request, response);
      }else {
         UserVO user = new UserVO();
         user.setId(id);
         user.setName(name);
         user.setNickname(nickname);
         request.setAttribute("user", user);
         request.setAttribute("pwd", pwd);
         request.setAttribute("msg", "error");
         RequestDispatcher rd = request.getRequestDispatcher("jsp/signup.jsp");
         rd.forward(request, response);
      }
   }

}