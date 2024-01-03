<%@page import="kiosk.owner.dto.OwnerDto"%>
<%@page import="kiosk.menu.dao.MenuDao"%>
<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");
	//Object type을 String type으로 casting
	String oName=(String)session.getAttribute("oName");
	String email=(String)session.getAttribute("email");
	String stoNum=(String)session.getAttribute("stoNum");
	
	
	
   //카테고리 받아옴
   
   //옆에 네비바에 이용
   
   //저 리스트를가지고 section을 생성해주면됨
   
   // list.forEach(카테고리 ->{
   //   section id=${카테고리}>
   
   //  그러면은 여기서 해당 카테고리에 맞는 sql을 통해 가져오면 됨 그러면 거기서 다시한 번 반복문
   
      
   
   //})
   //
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/menu_assets/css/main.css" />
<title>menu/menu.jsp</title>
<style>
	#item img{
		width:300px;
		height:300px;
	}
	#item header{
		display:flex;
		justify-content:center;
	}
	#imagefit{
		display:flex;
		justify-content:center;
	}
	
	.imageUrl{
		border: solid 10px black;
	}
	
</style>
</head>
<body class="is-preload">

      <!-- Header -->
         <div id="header">

            <div class="top">

               <!-- Logo -->
                  <div id="logo">
                     <span class="image avatar48"><img src="${pageContext.request.contextPath}/images/coffeeganpan.jpg" alt="" /></span>
                     <h1 id="title">${sessionScope.oName}</h1>
                     <p><%=email %></p>
                     <a href="${pageContext.request.contextPath}/owner/logout.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16">
  <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1"/>
  <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117zM11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5M4 1.934V15h6V1.077z"/>
</svg></a>
                  </div>

               <!-- Nav -->
                  <nav id="nav">
                     <ul>
                        <li><a href="${pageContext.request.contextPath}/index.jsp" id="top-link"><span class="icon solid fa-home">메인화면</span></a></li>
                        <li><a href="product/prod_insertform.jsp" id="portfolio-link"><span class="icon solid fa-th">메뉴 추가하기</span></a></li>
                        <!-- todo 이부분에서 가지고있는 카테고리 종류를 가져와야 함 -->
                        <c:forEach var="item" items="${categoryList}">
                           <li><a href="#${item.category}" class="portfolio-link scroll_move"><span class="icon solid fa-coffee">${item.category}</span></a></li>   
                        </c:forEach>
                     </ul>
                  </nav>

            </div>

            <div class="bottom">

               <!-- Social Icons -->
                  <ul class="icons">
                     <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                     <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                     <li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
                     <li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
                     <li><a href="#" class="icon solid fa-envelope"><span class="label">Email</span></a></li>
                  </ul>

            </div>

         </div>

      <!-- Main -->
         <div id="main">

            <!-- Intro -->
               <section id="top" class="one dark cover">
                  <div class="container">

                     <header>
                        <h2 class="alt">카테고리별 메뉴 관리</h2>
                        <p>키오스크를 통해 카테고리별로 메뉴를 효율적으로 관리합시다. 각 메뉴의 가격, 재고, 그리고 상세 정보 등을 손쉽게 업데이트하고, 실시간으로 변경사항을 고객에게 전달할 수 있습니다.</p>
                     </header>

                     <footer>
                        <a href="product/prod_insertform.jsp" class="button scrolly">메뉴 추가하기</a>
                     </footer>

                  </div>
               </section>
            <c:forEach var="tmp1" items="${categoryList}" >
                  <section id="${tmp1.category}" class="two">
                     <div class="container">
   
                        <header>
                           <h2>${tmp1.category}</h2>
                        </header>
                        <p>${tmp1.category} 카테고리 관리</p>
                         <div class="row">
                           <c:forEach var="tmp2" items="${menu_list}">
                           <c:if test="${tmp2.category eq tmp1.category and tmp2.stoNum eq tmp1.stoNum}">
                                 <div class="col-4">
                                    <article id="item" class="item">
                                       <a href="product/prod_updateform?name=${tmp2.name}" id="imagefit" class="image fit">
                                       <c:choose>   
                                            <c:when test="${tmp2.imageUrl eq  null }">
                                               <img src="${pageContext.request.contextPath}/images/prepare.jpg" alt="" />
                                            </c:when>
                                            <c:otherwise><img id="ImageUrl" class="ImageUrl" src="${pageContext.request.contextPath}/upload/${tmp2.imageUrl }" alt="상품 이미지"/></c:otherwise>
                                         </c:choose>
                                       </a>
                                       
                                       <header>
                                          <h3 style="width:300px;">${tmp2.name}</h3>
                                       </header>
                                    </article>
                                 </div>  
                           </c:if> 
                           </c:forEach>

                        </div>
                     </div>
                  </section>
               </c:forEach>        
      <!-- Scripts -->
         <script src="${pageContext.request.contextPath}/menu_assets/js/jquery.min.js"></script>
         <script src="${pageContext.request.contextPath}/menu_assets/js/jquery.scrolly.min.js"></script>
         <script src="${pageContext.request.contextPath}/menu_assets/js/jquery.scrollex.min.js"></script>
         <script src="${pageContext.request.contextPath}/menu_assets/js/browser.min.js"></script>
         <script src="${pageContext.request.contextPath}/menu_assets/js/breakpoints.min.js"></script>
         <script src="${pageContext.request.contextPath}/menu_assets/js/util.js"></script>
         <script src="${pageContext.request.contextPath}/menu_assets/js/main.js"></script>
		<script>
			$(document).ready(function($) {
	            $(".scroll_move").click(function(event){
	                console.log(".scroll_move");         
	                event.preventDefault();
	                var target = $(this).attr("href");
	                $('html,body').animate({scrollTop:$(target).offset().top}, 500);
	            });
	
	        });
			
			$(document).ready(function($) {
			    // 기존 클릭 이벤트 처리 코드...

			    // 페이지 새로고침 시 맨 위로 스크롤
			    $(window).on('beforeunload', function() {
			        $('html,body').scrollTop(0);
			    });
			});
		</script>
   </body>

</html>