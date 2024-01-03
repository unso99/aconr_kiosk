<%@page import="kiosk.order.dao.OrderDao"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int tableNum=1;
	
	if(session.getAttribute("shopList")==null) {
		String url = request.getContextPath();
		response.sendRedirect(url+"/cutomer/order_menu.jsp");
		return;
	}
	
	List<OrderDto> shopList = (List<OrderDto>) session.getAttribute("shopList");

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
		session.removeAttribute("shopList");
	}
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<script>
				alert("감사합니다.");
				window.location.href = '${pageContext.request.contextPath}/index.jsp';
			</script>
</body>
</html>