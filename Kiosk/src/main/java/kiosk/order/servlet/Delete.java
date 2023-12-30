package kiosk.order.servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kiosk.order.dto.OrderDto;

@WebServlet("/customer/delete")
public class Delete extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String menu=req.getParameter("menu");
		
		List<OrderDto> shoplist = (List<OrderDto>) req.getSession().getAttribute("shoplist");
		
		if(shoplist==null) {
			 RequestDispatcher rd=req.getRequestDispatcher("/customer/main.jsp");
		     rd.forward(req, resp);
		     return;
		}else {
		Iterator<OrderDto> iter=shoplist.iterator();

		while(iter.hasNext()){
			OrderDto order=iter.next();
			 if (order.getMenu().equals(menu)) {
				iter.remove();	
			 }
		
		}
		
		req.setAttribute("shoplist", shoplist);
	     RequestDispatcher rd=req.getRequestDispatcher("/customer/basket.jsp");
	     rd.forward(req, resp);
		}
	}
}
