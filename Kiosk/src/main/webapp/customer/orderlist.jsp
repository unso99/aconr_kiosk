<%@page import="java.util.List"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="kiosk.order.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//test data
int tablenum = 1;

List<OrderDto> list =(List<OrderDto>)request.getAttribute("orderlist");
	
%>

		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록 테스트</title>
<style>
	.container{
		justify-content:center;
		text-align: center;
	}
</style>
</head>
<body>

    <div class="container">
	<table> 
	 <caption> 주문내역	
	 <a href="${pageContext.request.contextPath}/customer/menu">닫기</a>
</caption>
		<thead>
			<tr>
				<th>상품명</th>
				<th>수량</th>
				<th>가격</th>
				<th>총가격</th>
			</tr>
		</thead>

		<tbody>
			<%
			int total=0;
			for (OrderDto tmp : list) {
			int price=tmp.getPrice()*tmp.getCount() ;
			total +=price;
			%>
			<tr>
				<td><%=tmp.getMenu()%></td>
				<td><%=tmp.getCount()%></td>
				<td><%=tmp.getPrice()%></td>
				<td><%=tmp.getPrice()*tmp.getCount() %></td>
				
			</tr>
			<%}%>
		</tbody>
		
		<tfoot>
			<tr>
				<th>합계</th>
				
				<td><%=total%></td>
			</tr>
		</tfoot>

		

	</table>
</div>

</body>
</html>