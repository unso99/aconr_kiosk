<%@page import="kiosk.menu.dao.MenuDao"%>
<%@page import="kiosk.menu.dto.MenuDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
	String name =(String)request.getParameter("name");
	boolean canUse= true;
	
	String inValidName =MenuDao.getInstance().getName(name);
	if(inValidName!=null)canUse=false;
%>

{"canUse" : <%=canUse %>} --%>