<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.tomcat.util.json.JSONParser"%>
<%@page import="org.apache.catalina.valves.JsonAccessLogValve"%>
<%@page import="kiosk.menu.dto.UpdateMenuDto"%>
<%@page import="kiosk.order.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price")) ;
	int count=1;

	List<OrderDto> shoplist = (List<OrderDto>) session.getAttribute("shoplist");
	if(shoplist == null){
        shoplist = new ArrayList<OrderDto>();
        session.setAttribute("shoplist", shoplist);
	}else{
		 for (OrderDto order : shoplist) {
             if (order.getMenu().equals(name)) {
                 // 이미 존재하는경우 카운트만 1 증가시킨다.
                 order.setCount(order.getCount() + 1);
                 session.setAttribute("shoplist", shoplist);
                 return;
             }
         }
		 OrderDto dto = new OrderDto();
	        dto.setMenu(name);
	        dto.setCount(count);
	        dto.setPrice(price);
	  
	        shoplist.add(dto);
	        session.setAttribute("shoplist", shoplist);
	}
	
	
    System.out.println("name:" + name + "price:" + price);
    // name이 null이거나 값이 없는 경우에 대한 예외 처리
    
    //[]
    JSONArray arr=new JSONArray();
    arr.putAll(shoplist);
    //{}
    JSONObject obj=new JSONObject();
    obj.put("shoplist", arr);
%>
<%=obj.toString() %>
	
	
	
	
	
	
	
	
	
	
 