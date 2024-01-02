<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	String isSave = request.getParameter("isSave");
	if(isSave != null){
		//아이디 비밀번호를 쿠키로 응답하고 1주일 동안 유지되도록 한다.
		Cookie cook1 = new Cookie("savedEmail", email);
		Cookie cook2 = new Cookie("savedPwd", pwd);
		cook1.setMaxAge(60*60*24*7);
		cook2.setMaxAge(60*60*24*7);
		response.addCookie(cook1);
		response.addCookie(cook2);

	}else{
		//특정 키값으로 저장된 쿠키값 삭제하기 (value 에는 아무 값이나 넣어도 상관없다)
		Cookie cook1 = new Cookie("savedEmail", "");
		Cookie cook2 = new Cookie("savedPwd", null);
		cook1.setMaxAge(0);
		cook2.setMaxAge(0);		
		response.addCookie(cook1);
		response.addCookie(cook2);
	}

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/owner_assets/css/main.css" />
<title>/owner/login.jsp</title>
</head>
<body class="is-preload">
		
		<!-- Header -->
			<header id="header">
			<c:choose>
				<c:when test="${isSuccess}">
					<h1>로그인 성공!</h1>
					<p>축하드립니다!<br/> 
					회원가입이 완료되었습니다. <br/>
					이제 저희 서비스를 자유롭게 이용하실 수 있습니다.<br/> 
					환영합니다!</p>
					<br />
					<a href="${pageContext.request.contextPath}/menu/menu">메뉴 관리 하러 가기</a>
					<br /><br />
					<a href="${pageContext.request.contextPath}/index.jsp">메인 화면으로 가기</a>
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