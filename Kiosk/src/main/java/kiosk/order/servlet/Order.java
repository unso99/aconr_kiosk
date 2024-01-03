package kiosk.order.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kiosk.order.dto.OrderDto;

@WebServlet("/customer/order")
public class Order extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<OrderDto> shopList = new ArrayList<>();
		
		req.getSession().setAttribute("shopList", shopList);
		String cpath = req.getContextPath();
		
		RequestDispatcher rd = req.getRequestDispatcher("/customer/order_menu.jsp"); //요청 전달자 객체
				
		rd.forward(req, resp);
	
	}
}
