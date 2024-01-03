<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//쿠키를 불러와야함 -> ownerDto

//쿠키를 불러왔어

//근데 없어? 그러면은 그냥 노터치

//근데 있어? 그러면은 자동완성해줘야함
String savedEmail = "";
String savedPwd = "";
Cookie[] cooks = request.getCookies();
boolean hasCook = false;
if (cooks != null) {
	for (Cookie tmp : cooks) {
		String key = tmp.getName();
		if (key.equals("savedEmail")) {
	savedEmail = tmp.getValue();
	System.out.println("saved email : " + savedEmail);
		}
		if (key.equals("savedPwd")) {
	savedPwd = tmp.getValue();
	System.out.println("saved pwd : " + savedPwd);
	hasCook = true;
	System.out.println(hasCook);
		}
	}

}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/owner/login_form.jsp</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/owner_assets/css/main.css" />
</head>
<body class="is-preload">

	<!-- Header -->
	<header id="header">
		<h1>
			<a href="${pageContext.request.contextPath}/index.jsp">Acorn
				Kiosk</a>
		</h1>
		<p>
			사장님 로그인 페이지에 오신 것을 환영합니다.<br> 이곳에서는 가게 운영에 필요한 모든 관리 기능에 접근하실 수
			있습니다.<br> <strong><a href="signup_form.jsp">회원가입 하러
					가기</a></strong>
		</p>
	</header>
	<!-- Signup Form -->
	<form id="signup-form"
		action="${pageContext.request.contextPath}/owner/login" method="post">
		<div>
			<label for="email">이메일</label> <input type="email" name="email"
				id="email" placeholder="Email Address" value="<%=savedEmail%>" />

		</div>
		<div>
			<label class="form-label" for="pwd">비밀번호</label> <input
				class="form-control" type="password" name="pwd" id="pwd"
				placeholder="비밀번호" value="<%=savedPwd%>" />
		</div>
		<div>
			<input style="margin-top: 1em;" type="checkbox" name="isSave"
				id="isSave"
				<%=(savedEmail != null && !savedEmail.isEmpty()) ? "checked" : ""%>>
			<label for="isSave" style="margin-top: 1em;">로그인 정보 저장</label>
		</div>
		<div style="margin-top: 1em;">
			<button type="submit" id="loginButton" disabled>로그인</button>
		</div>
	</form>

</body>
<!-- Scripts -->
<script src="${pageContext.request.contextPath}/owner_assets/js/main.js"></script>
<script>
		
		
		let emailNN = false;
		let pwdNN = false;
		document.querySelector("#email").addEventListener("input",(e)=>{
			emailNN = true;
			if(e.target.value == "") emailNN = false;
			checkNN();
		});
		document.querySelector("#pwd").addEventListener("input",(e)=>{
			pwdNN = true;
			if(e.target.value == "") pwdNN = false;
			checkNN();
		});

		// 아이디와 비밀번호가 입력이 되어있을 때만 로그인 버튼 활성화하기 위한 함수
		const checkNN = () => {
        const loginButton = document.getElementById("loginButton");
        if (emailNN && pwdNN) loginButton.removeAttribute("disabled");
        else loginButton.setAttribute("disabled", "");

		}
		
		console.log(<%=hasCook%>);
		if(<%=hasCook%>) document.getElementById("loginButton").removeAttribute("disabled");
    
</script>
</html>