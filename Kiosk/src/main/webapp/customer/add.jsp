<%@page import="java.util.ArrayList"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String name = request.getParameter("name");
int price = Integer.parseInt(request.getParameter("price"));
boolean isSuccess = false;
List<OrderDto> shopList = (List<OrderDto>) session.getAttribute("shopList");
System.out.println(shopList + "1번째");
if (shopList == null) {
	shopList = new ArrayList<OrderDto>();
	OrderDto dto = new OrderDto();
	dto.setCount(1);
	dto.setMenu(name);
	dto.setPrice(price);
	shopList.add(dto);
	session.setAttribute("shopList", shopList);
	isSuccess = true;
	System.out.println(shopList + "2번째");
} else {
	//그냥 추가 근데 만약 이미 list에 존재하면 갯수만 plus
	for (OrderDto order : shopList) {
		if (order.getMenu().equals(name)) {
	order.setCount(order.getCount() + 1);
	break;
		}
	}

	OrderDto dto = new OrderDto();
	dto.setCount(1);
	dto.setMenu(name);
	dto.setPrice(price);
	shopList.add(dto);

	session.setAttribute("shopList", shopList);
	isSuccess = true;
}
pageContext.setAttribute("isSuccess", isSuccess);

System.out.println("name:" + name + "price:" + price);
// name이 null이거나 값이 없는 경우에 대한 예외 처리
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>customer/add.jsp</title>
</head>
<body>
	<c:choose>
		<c:when test="${isSuccess}">
			<script>
				alert("장바구니에 추가하였습니다.");
				window.location.href = '${pageContext.request.contextPath}/customer/order_menu.jsp?isAdded=true';
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("장바구니에 담지 못하였습니다.");
			 	window.location.href='${pageContext.request.contextPath}/customer/order_menu.jsp';
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>