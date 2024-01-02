<%@page import="kiosk.menu.dao.MenuDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
	String name = request.getParameter("name");
	String oldName = request.getParameter("oldName");
	
	boolean canUse = true;
	String inValidName = MenuDao.getInstance().getName(name);
	if(!name.equals(oldName) && inValidName != null) canUse = false;
%>
{"canUse" : <%=canUse %>} --%>