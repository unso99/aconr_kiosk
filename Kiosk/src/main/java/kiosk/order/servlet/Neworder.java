package kiosk.order.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kiosk.order.dao.OrderDao;
import kiosk.order.dto.OrderDto;

@WebServlet("/customer/neworder")
public class Neworder extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		int tableNum=1;
		
		if(req.getSession().getAttribute("shopList")==null) {
			String url = req.getContextPath();
			resp.sendRedirect(url+"/cutomer/order_menu.jsp");
			return;
		}
		
		List<OrderDto> shopList = (List<OrderDto>) req.getSession().getAttribute("shopList");
	
		boolean success=false;


		//session 에 shoplist 반복문 돌면서 orderdto 에 값 넣고 DB에 insert 하기
		for(OrderDto tmp:shopList){
			List<String> list=OrderDao.getInstance().select(tableNum);
			//
			boolean pass=false;
			//dto에 session에 있는 정보 담기
			OrderDto dto=new OrderDto();
			dto.setMenu(tmp.getMenu());
			dto.setPrice(tmp.getPrice());
			dto.setCount(tmp.getCount());
			dto.setTableNum(tableNum);
			
			
			for(String menu:list){
				if(menu != null&&tmp.getMenu().equals(menu)){
					OrderDao.getInstance().update(menu);
					pass=true;
					success=true;
					break;
				}else if(menu==null){
					success=OrderDao.getInstance().insert(dto);
					break;
				}
			}
			if(!pass){
				success=OrderDao.getInstance().insert(dto);
			}
		}

			req.getSession().removeAttribute("shopList");
			
			RequestDispatcher rd=req.getRequestDispatcher("/index.jsp");
		    rd.forward(req, resp);
	
	}
}
