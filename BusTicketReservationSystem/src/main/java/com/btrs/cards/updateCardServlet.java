package com.btrs.cards;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateCardServlet")
public class updateCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("update")!=null) { 
		
		
		String cNum = request.getParameter("cno");
		String name = request.getParameter("hName"); 
		String cv = request.getParameter("cvv");
		String expD = request.getParameter("date");

		boolean check;
		
		check = cardsDBUtil.updateCard(cNum,name,cv,expD);
		if(check == true) {
			 
			 
		     RequestDispatcher dis = request.getRequestDispatcher("ManagePayment.jsp");
		     dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("result2.jsp");
		     dis2.forward(request, response);
		}
	}
		
		
		if(request.getParameter("delete")!= null) {
			String cardNo = request.getParameter("cno");
			
		boolean	check = cardsDBUtil.deleteCard(cardNo);
		
		if(check == true) {
			RequestDispatcher dis = request.getRequestDispatcher("ManagePayment.jsp");
		    dis.forward(request, response);
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("result2.jsp");
		     dis2.forward(request, response);
		}
	}
}

}
         

//HttpSession session = request.getSession();
//Session for user ID
//session.setAttribute("userID", userID);
//session.setAttribute("mode", mode);

//to retrive session
//int test = (int)session.getAttribute("userID");

//to delete session
//session.removeAttribute("mode");
