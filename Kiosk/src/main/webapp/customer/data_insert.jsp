<%@page import="kiosk.order.dao.OrderDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.tomcat.util.json.JSONParser"%>
<%@page import="org.apache.catalina.valves.JsonAccessLogValve"%>
<%@page import="kiosk.menu.dto.UpdateMenuDto"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// 추가(수정)사항 : tableNum => 유저ID

String stoNum = (String) session.getAttribute("stoNum");
int tableNum = 1; // 테이블 좌석(테스트코드)
String name = request.getParameter("name");
int price = Integer.parseInt(request.getParameter("price"));
boolean isSuccess = false;
List<OrderDto> shopList = (List<OrderDto>)session.getAttribute("shopList");
System.out.println("data_insert.jsp-json => name: " + name + ", price: " + price + ", shoplist: "+shopList);

if(shopList == null){
	System.out.println("data.jsp-json => shoplist = null");
    shopList = new ArrayList<OrderDto>();
    
 	// 첫 장바구니 작동시작
    OrderDto dto = new OrderDto();
   	dto.setStoNum(stoNum);
   	dto.setTableNum(tableNum);
    dto.setMenu(name);
    dto.setPrice(price);
    dto.setCount(1);
    shopList.add(dto);
    
    session.setAttribute("shopList", shopList);
    isSuccess = true;
    
} else {
    System.out.println("data_insert.jsp-json => shopList = " + shopList);

    boolean found = false;
    for (OrderDto order : shopList) {
        if (order.getMenu().equals(name)) {
            // 이미 존재하는 경우 넘어가기, 수량은 자바스크립트로 처리한다.
            // order.setCount(order.getCount() + 1);
            found = true;
            isSuccess = false;
            break;
        }
    }

    if (!found) {
        // 장바구니에 계속 다른 상품 담기
        OrderDto dto = new OrderDto();
        dto.setStoNum(stoNum);
        dto.setTableNum(tableNum);
        dto.setMenu(name);
        dto.setPrice(price);
        dto.setCount(1);
        shopList.add(dto);
        isSuccess = true;
    }

    session.setAttribute("shopList", shopList);
    System.out.println("data_insert.jsp-json => isSuccesst = " + isSuccess);
} // else
%>
{"isSuccess":"<%= isSuccess %>"}