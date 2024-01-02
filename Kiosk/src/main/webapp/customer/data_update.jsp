<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String name = request.getParameter("name"); // 메뉴 이름
int count = Integer.parseInt(request.getParameter("count")); // 메뉴 수량

List<OrderDto> shopList = (List<OrderDto>)session.getAttribute("shopList");
System.out.println("data_update.jsp-json name : "+name+", count : "+count);
boolean isSuccess = false;

// 리스트가 존재하고 비어 있지 않은 경우에만 진행
if (shopList != null && !shopList.isEmpty()) {
    for (OrderDto order : shopList) {
        if (order.getMenu().equals(name)) {
            // 이미 존재하는 경우 
            order.setCount(count);
            isSuccess = true;
            break;
        }
    }
    // 세션에 업데이트된 리스트를 저장
    session.setAttribute("shopList", shopList);
    System.out.println("data_update.jsp-json => isSuccess = " + isSuccess);
}
%>
{"isSuccess":"<%= isSuccess %>"}
