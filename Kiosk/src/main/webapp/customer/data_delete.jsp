<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String menu = request.getParameter("menu");

List<OrderDto> shopList = (List<OrderDto>)session.getAttribute("shopList");
System.out.println("data_delete.jsp-json menu : "+menu);
boolean isSuccess = false;

String menuToDelete = menu;

//리스트가 존재하고 비어 있지 않은 경우에만 진행
if (shopList != null && !shopList.isEmpty()){
	
	// 삭제할 행을 식별하여 제거
    OrderDto rowToDelete = null;
	
    for (OrderDto order : shopList) {
        if (order.getMenu().equals(menuToDelete)) {
            rowToDelete = order;
            break; // 특정 조건에 맞는 첫 번째 행을 찾으면 반복문 종료
        }
    }
    
 	// 찾은 행이 있다면 제거
    if (rowToDelete != null) {
        shopList.remove(rowToDelete);
    }
 	
 	// 세션에 업데이트된 리스트를 저장
    session.setAttribute("shopList", shopList);
    isSuccess = true;
    System.out.println("data_delete.jsp-json => isSuccesst = " + isSuccess);
}
%>
{"isSuccess":"<%= isSuccess %>"}