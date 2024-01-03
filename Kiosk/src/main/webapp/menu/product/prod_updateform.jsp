<%@page import="kiosk.menu.dto.MenuDto"%>
<%@page import="kiosk.menu.dao.MenuDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
	MenuDto dto=(MenuDto)request.getAttribute("dto");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/menu/product/prod_updateform</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/menu_assets/css/main.css" />
<style>
	#image{
		display: none;
	}
	
	#imageUrl{
		width: 400px;
		height: 400px;
		text-decoration:none;
		border-radius:10px;
		
	}
	.imageUrl{
		border: solid 10px black;
	}
	
	.small{
	font-size:12px;
	color: red; 
	}
	/* 체크박스 기본 스타일 숨기기 */
	input[type="checkbox"] {
	    appearance: none; /* 대부분의 브라우저에서 기본 스타일 숨김 */
	    -webkit-appearance: none; /* WebKit 기반 브라우저에서 기본 스타일 숨김 */
	    -moz-appearance: none; /* Firefox에서 기본 스타일 숨김 */
	    /* 다른 브라우저 지원을 위한 속성 추가 */
	    /* 원하는 스타일 적용 */
	    /* 예시 스타일 - 원하는 디자인으로 변경 */
	    width: 64.33px;
	    height: 64.33px;
	    border: 2px solid #ccc;
	    border-radius: 3px;
	}
	
		/* 체크 표시 스타일 */
	input[type="checkbox"]:checked::before {
		z-index:3;
	    content: "\2713"; /* 체크 표시 유니코드 사용 */
	    display: block;
	    text-align: center;
	    color: #2196F3; /* 체크된 상태의 색상 */
	    font-size: 40px; /* 텍스트 크기에 따라 조정 */
	}
		
	.prod-img{
		text-align:center;
	}
</style>
</head>
<body class="is-preload">

<!-- Header -->
	<div id="header">

		<div class="top">

			<!-- Logo -->
				<div id="logo">
					<span class="image avatar48"><img src="${pageContext.request.contextPath}/images/avatar.jpg" alt="" /></span>
					<h1 id="title">${sessionScope.oName}</h1>
					<p>${sessionScope.email}</p>
				</div>

			<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a href="${pageContext.request.contextPath}/menu/menu" id="top-link"><span class="icon solid fa-home">메뉴 화면</span></a></li>
						<%--<li><a href="" id="portfolio-link"><span class="icon solid fa-th">메뉴 </span></a></li>--%>
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
	
	<div id="main">
		<!-- Contact -->
		<section id="contact" class="three">
			<div class="container">

				<header>
					<h2>메뉴 수정하기</h2>
				</header>
	
				<p>새롭게 출시된 메뉴를 손쉽게 등록하세요! 간단한 정보 입력으로 메뉴 이름, 가격, 상세 설명을 추가하고, 매력적인 이미지로 고객의 눈길을 사로잡으세요. 품절 정보와 카테고리 분류로 메뉴 관리가 한결 편리해집니다. 지금 바로 시작해 보세요.</p>

				<form action="prod_update_delete" id="prod_update_delete" method="post">
					<div class="row">
						<input type="hidden" name="imageUrl" value="${dto.imageUrl}"/>
						<div class="col-12 ">
							<label for="imageUrl" class="prod-img">상품사진</label>
							<div>
								<a href="javascript:" id="imageUrl">
									<c:choose>
									    <c:when test="${empty dto.imageUrl}">
									         <img src="${pageContext.request.contextPath}/images/prepare.jpg" width="400px" height="400px" alt="" />
									    </c:when>
									    <c:otherwise>
									        <img id="imageUrl" class="imageUrl" src="${pageContext.request.contextPath}/upload/${dto.imageUrl}" width="400px" height="400px" alt="상품 이미지"/>
									    </c:otherwise>
									</c:choose>
								</a>
							</div>
						</div>
						
						<div class="col-4 col-12-mobile">
							<label for="name">메뉴이름</label>
							<input type="text" name="name" id="name" value="${dto.name}" placeholder="상품 이름 입력" />
							<small class="small" id="smallName"></small>
						</div>
						<div class="col-2 col-12-mobile">
							<label for="price">가격</label>
							<input type="text" name="price" id="price" value="${dto.price}" placeholder="가격 입력" />
							<small class="small" id="smallPrice"></small>
						</div>
						<div class="col-4 col-12-mobile">
							<label for="category">카테고리</label>
							<input type="text" name="category" id="category" value="${dto.getCategory()}" placeholder="카테고리 입력" />
							<small class="small" id="smallCategory"></small>
						</div>
						<div class=" col-12-mobile">
							<label for="sell" style="text-align:center;">품절여부</label>
							 <input type="checkbox" class="sell" id="sell" name="sell" value="YES" >
							 <input type="hidden" id="sellChecked" value="${dto.sell}">
						</div>
						
						<div class="col-12">
							<label for="description">메뉴설명</label>
							<textarea name="description" id="description"  cols="30" rows="10">${dto.getDescription() }</textarea>
						</div>
						
						
						
						
							<div class="aln-center col-6">
								<input type="submit" name="action" value='수정' onclick="handleCheckbox()"/>
							</div>		
							<div class="aln-center col-6">
								<input type="submit" name="action" value="삭제" />
							</div>
							
					
						
					<div>
				</form>
				<!-- 화면에 보이지 않는 이미지 선택할 input type="file" -->
				<input type="file" id="image" accept="image/*"/>
				</div>
		</section>
	</div>	
		
<script>
		// 업데이트 폼에 체크 적용부분
		let checkValue= document.querySelector("#sellChecked").value;
		console.log(checkValue);
		
		if(checkValue=="YES"){
			document.querySelector("#sell").checked=true;
		}
		//처음 수정 페이지에 들어왔을때의 메뉴 이름
		const oldName = document.querySelector("#name").value;
		console.log(oldName);
		
		
		function handleCheckbox() {
		    const checkbox = document.getElementById('sell');
		    if (!checkbox.checked) {
		        const form = document.getElementById('prod_update_delete');
		        const hiddenInput = document.createElement('input');
		        hiddenInput.type = 'hidden';
		        hiddenInput.name = 'sell';
		        hiddenInput.value = 'NO';
		        form.appendChild(hiddenInput);
		    }
		}
		//링크를 클릭했을때 
		document.querySelector("#imageUrl").addEventListener("click", ()=>{
			// input type="file" 요소를 강제 클릭해서 파일 선택 창을 띄운다.
			document.querySelector("#image").click();
		});
		//새로운 이미지가 선택되었을때
		document.querySelector("#image").addEventListener("change", (e)=>{
			//전송할 file 데이터를 FormData 객체에 담는다.
			const fileData=e.target.files[0];
			const data=new FormData();
			// myImage 라는 파라미터명으로 fileData 를 담는다. 
			data.append("myImage", fileData);
			//fetch() 함수를 이용해서 페이지 전환없이 업로드
			fetch("upload_profile.jsp",{
				method:"post",
				body:data
			})
			.then(res=>res.json())
			.then(data=>{
				console.log(data);
				//img 요소를 만들 문자열 구성
				let img=`<img id="imageUrl" 
					src="${pageContext.request.contextPath}/upload/\${data.saveFileName}">`;
				//링크안에 출력하면서 html 형식으로 해석되도록 한다.
				document.querySelector("#imageUrl").innerHTML=img;
				//서버에 저장된 프로필 이미지의 이름을 input type="hidden" 의 value 로 넣어준다
				document.querySelector("[name=imageUrl]").value = data.saveFileName;
			});
		});
		
		//유효성 검사 시작------------------------------
		let isNameValid=false;
		let isCategoryValid = false;
		let isPricegoryValid = false;
		
		
		const checkForm = ()=>{
			//만일 아이디도 유효하고 그리고 비밀번호도 유효하고 그리고 비밀번호도 유효하다면
			if(isNameValid && isCategoryValid && isPricegoryValid){
				//전송 버튼에 disabled 속성을 제거하고 
				document.querySelector("[type=submit]").removeAttribute("disabled");
			}else{
				//전송 버튼에 disabled 속성을 추가한다
				document.querySelector("[type=submit]").setAttribute("disabled", "");
			}
		};
		
		//메뉴이름 유효성 검사
		const reg_name=  /\S+/;
		
		document.querySelector("#name").addEventListener("input", (e) => {
		    const name = e.target.value;
		    const small = document.querySelector("#smallName");
		    if (reg_name.test(name)) {
		        //유효한 메뉴이름
		        isNameValid = true;
		        e.target.setCustomValidity('');
		        small.innerText = "";

		    } else {
		        //유효하지 않은 메뉴이름
		        isNameValid = false;
		        e.target.setCustomValidity('메뉴이름을 입력해주세요');
			    e.target.reportValidity();
			    small.innerText = "메뉴이름을 다시 입력해주세요";
		    }
		    
		    fetch("${pageContext.request.contextPath}/menu/check_name_update.jsp?name="+name+"&oldName="+oldName)
			.then(res=>res.json())
			.then(data=>{
				//data 는 {canUse:true} or {canUse:false} 형태의 object 이다.
				console.log(data);
				if(data.canUse){
					//사용할수 있는 이메일이라는 의미에서 true 를 넣어준다.
					isEmailValid=true;
					e.target.setCustomValidity("");
					small.innerText = "사용가능한 메뉴 입니다."
				}else{
					//사용할수 없는 이메일이라는 의미에서 false 를 넣어준다.
					isEmailValid=false;
					e.target.setCustomValidity("중복된 메뉴이름 입니다.");
					e.target.reportValidity();
					small.innerText = "";
				}
				checkForm();
			});
		});
		//카테고리 유효성 검사
		const reg_category=  /\S+/;
		
		document.querySelector("#category").addEventListener("input", (e) => {
		    const category = e.target.value;
		    const small = document.querySelector("#smallCategory");
		   
		    if (reg_category.test(category)) {
		        //유효한 메뉴이름
		        isCategoryValid = true;
		        e.target.setCustomValidity('');
		        small.innerText = "";

		    } else {
		        //유효하지 않은 메뉴이름
		        isCategoryValid = false;
		        e.target.setCustomValidity('카테고리를 입력해주세요');
			    e.target.reportValidity();
			    
			    small.innerText = "카테고리를 다시 입력해주세요";			   
		    }
		    checkForm();	
		});
		
		
		
		//가격 유효성검사
		const reg_price=  /^[1-9][0-9]*$/;
		
		document.querySelector("#price").addEventListener("input", (e) => {
		    const price = e.target.value;
		    const small = document.querySelector("#smallPrice");
		    if (reg_price.test(price)) {
		        //유효한 메뉴이름
		        isPricegoryValid = true;
		        e.target.setCustomValidity('');
		        small.innerText = "";

		    } else {
		        //유효하지 않은 메뉴이름
		        isPricegoryValid = false;
		        e.target.setCustomValidity('숫자형식으로 입력해주세요');
			    e.target.reportValidity();
			    small.innerText = "숫자형식으로 입력해주세요";
		    }
		    checkForm();	
		});
</script>
	
</body>
</html>