<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="kiosk.owner.dao.OwnerDao"%>
<%@page import="kiosk.owner.dto.OwnerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String sto_Num = request.getParameter("sto_Num");
	String sto_Name = request.getParameter("sto_Name");
	String o_name = request.getParameter("o_Name");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	
	// 1.변수선언
	String url = "jdbc:oracle:thin:@14.63.164.99:1521/XE";
	String uid = "kiosk";
	String upw = "TIGER1541";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "insert into owner_info values(?, ?, ?, ?, ?)";
	
	try{
	   // 1. 드라이버 로드
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   
	   // 2. conn 생성
	   conn = DriverManager.getConnection(url, uid, upw);
	   
	   // 3. pstmt 생성
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, sto_Num);
	   pstmt.setString(2, sto_Name);
	   pstmt.setString(3, o_name);
	   pstmt.setString(4, email);
	   pstmt.setString(5, pwd);
	   
	   // 4. sql문 실행
	   if (pstmt.executeUpdate() > 0) {
	   		request.setAttribute("isSuccess", true);
	   }
	} catch(Exception e){
	   e.printStackTrace();
	} finally{
	   try{
	      if(conn != null) conn.close();
	      if(pstmt != null) pstmt.close();
	   } catch(Exception e){
	      e.printStackTrace();
	   }
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/owner_assets/css/main.css" />
<title>/owner/signup.jsp</title>
</head>
<body class="is-preload">

		<!-- Header -->
			<header id="header">
			
			<c:choose>
				<c:when test="${isSuccess}">
					<h1>회원 가입 성공!</h1>
					<p>축하드립니다!<br/> 
					회원가입이 완료되었습니다. <br/>
					이제 저희 서비스를 자유롭게 이용하실 수 있습니다.<br/> 
					환영합니다!</p>
					<a href="${pageContext.request.contextPath}/owner/login_form.jsp">로그인 하러 가기</a>
				</c:when>
				<c:otherwise>
					<p>
					일시적인 오류로 서비스 접속에 실패했습니다.<br/>
					잠시 후 다시 시도해 주시기 바랍니다.<br/>
					<a href="signup_form.jsp">다시 가입하러가기</a>
					</p>
				</c:otherwise>
			</c:choose>
	
			</header>

		<!-- Footer -->
			<footer id="footer">
				<ul class="icons">
					<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
					<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
					<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
				</ul>
				<ul class="copyright">
					<li>&copy; Acorn Order. Design: Team1.</li>
				</ul>
			</footer>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/owner_assets/js/main.js"></script>

	</body>
</html>