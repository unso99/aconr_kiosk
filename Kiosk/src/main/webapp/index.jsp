<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="main_assets/css/main.css" />
<noscript><link rel="stylesheet" href="main_assets/css/noscript.css" /></noscript>
<title>index.jsp</title>
</head>
<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<div class="logo">
							<span class="icon fa-gem"></span>
						</div>
						<div class="content">
							<div class="inner">
								<h1>Acorn Order</h1>
								<p>메뉴를 선택하고 원하는 옵션을 추가하여 주문하며, 결제까지 간편하게 진행할 수 있습니다.</p>
								<p>사용자 친화적인 인터페이스와 직관적인 기능으로 편리한 주문 경험을 제공합니다.</p>
								<p>신속하고 정확한 주문 처리를 통해 음식점 운영 효율을 높이는 동시에 고객 만족도를 높일 수 있습니다</p>
							</div>
						</div>
						<nav>
							<ul>
								<li><a href="owner/login_form">사장님 페이지</a></li>
								<!-- 서블릿 이동  -->
								<li><a href="${pageContext.request.contextPath}/customer/order_menu.jsp">손님 페이지</a></li>
								<li><a href="#about">음식점 소개 페이지</a></li>
							</ul>
						</nav>
					</header>

				<!-- Main -->
					<div id="main">

						<!-- About -->
							<article id="about">
								<h2 class="major">About</h2>
								<span class="image main"><center><img src="images/about.jpg" style="max-width: 100%; height: auto;" alt="" /></center></span>
								<p>저희 음식점은 아늑한 분위기의 카페입니다. 고객 여러분께 신선하고 맛있는 음식과 음료를 제공하며, 편안한 환경에서 휴식을 취할 수 있는 공간을 제공합니다. 우리는 신선한 재료를 사용하여 정성껏 음식을 준비하고, 다양한 메뉴를 제공합니다. 커피, 차, 스무디 등 다양한 음료도 함께 즐기실 수 있습니다. 고객 여러분의 만족을 위해 항상 최선을 다하는 것을 원칙으로 하고 있으며, 친절하고 신속한 서비스로 여러분을 맞이할 준비가 되어 있습니다. 언제든지 방문하셔서 특별한 시간을 보내실 수 있도록 최선을 다할 것을 약속드립니다. 감사합니다</p>
							</article>
					</div>

				<!-- Footer -->
					<footer id="footer">
						<p class="copyright">&copy; Acorn Order. Design: Team1.</p>
					</footer>

			</div>

		<!-- BG -->
			<div id="bg"></div>

		<!-- Scripts -->
			<script src="main_assets/js/jquery.min.js"></script>
			<script src="main_assets/js/browser.min.js"></script>
			<script src="main_assets/js/breakpoints.min.js"></script>
			<script src="main_assets/js/util.js"></script>
			<script src="main_assets/js/main.js"></script>

	</body>
</html>