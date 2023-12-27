package kiosk.order.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kiosk.menu.dao.MenuDao;
import kiosk.menu.dto.MenuDto;

@WebServlet("/customer/menu")
public class Menu extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		List <MenuDto> list=MenuDao.getInstance().getList();
		req.setAttribute("menulist", list);
		RequestDispatcher rd=req.getRequestDispatcher("/customer/test.jsp");
		rd.forward(req, resp);
	}
}
