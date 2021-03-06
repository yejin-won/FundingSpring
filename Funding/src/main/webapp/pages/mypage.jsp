<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="resources/init.css">
<link rel="stylesheet" href="resources/base.css">
<link rel="stylesheet" href="resources/fundingCards.css">
<link rel="stylesheet" href="resources/mypage.css">
<style type="text/css">

.pages__box{
	display: flex;
	justify-content: center;
	margin: 20px 0;
}
.pages__box > a{
	margin-right: 8px;
	width: 36px;
	height: 32px;
	border: 1px solid #999;
	border-radius: 4px;
	box-sizing: border-box;
	line-height: 32px;
	text-align: center;
}
.pages__box > .selected{
	background-color: #333;
	color: white;
}
</style>
</head>
<script src="resources/jQuery.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
	let email = "<%=session.getAttribute("id")%>";

		if (email == "null") {
			location.href = "/Funding/main.jsp"
		}
	});
</script>
<body>
	<jsp:include page="../WEB-INF/views/components/header.jsp" />
	<div class="my__wrap__wrap">
		<div class="my__wrap">
			<div class="my__tab">
				<p class="my__tab__btn" id="tab__1">참여한 펀딩</p>
				<p class="my__tab__btn" id="tab__2">찜한 펀딩</p>
				<p class="my__tab__btn" id="tab__3">시스템 문의</p>
				<p class="my__tab__btn" id="tab__4">펀딩 문의</p>
				<p class="my__tab__btn" id="tab__5">개인정보 관리</p>
			</div>
			<div class="tab__content" id="tab__1__content">
				<div class="list__wrap">
					<div class="list__header">
						<h1 class="list__pageTitle">참여한 펀딩 목록</h1>
					</div>

					<ul class="list__box">
						<li class="list__liner"><p class="list__title">펀딩명</p>
							<p class="list__seller">판매자</p>
							<p class="list__date">오픈일</p>
							<p class="list__date">마감일</p>
							<p class="list__detail"></p>
						</li>
						<c:forEach items="${funding}" var="funding">
							<li class="list__liner">
								<p class="list__title">${funding.funding_title }</p>
								<p class="list__seller">${funding.funding_seller }</p>
								<p class="list__date">${funding.funding_openAt }</p>
								<p class="list__date">${funding.funding_closeAt }</p>
								<p class="list__detail">
									<a href="/Funding/myorder_detail?funding_num=${funding.funding_num }">상세보기</a>
								</p>
							</li>
						</c:forEach>
					</ul>
					<div class="pages__box" id="pages__box__1"></div>
				</div>

			</div>
			<div class="tab__content" id="tab__2__content">
				<div class="list__wrap">
					<div class="list__header">
						<h1 class="list__pageTitle">찜한 펀딩 목록</h1>
					</div>

					<ul class="list__box">
						<li class="list__liner"><p class="list__title">펀딩명</p>
							<p class="list__seller">판매자</p>
							<p class="list__date">오픈일</p>
							<p class="list__date">마감일</p></li>
						<c:forEach items="${like}" var="like">
							<li class="list__liner"><a
								href="/Funding/fundingContent_view?fid=${like.funding_num}"
								class="list__title">${like.funding_title }</a>
								<p class="list__seller">${like.funding_seller }</p>
								<p class="list__date">${like.funding_openAt }</p>
								<p class="list__date">${like.funding_closeAt }</p></li>
						</c:forEach>
					</ul>
					<div class="pages__box" id="pages__box__2"></div>
				</div>
			</div>
			<div class="tab__content" id="tab__3__content">
				<div class="question__wrap">
					<div class="question__header">
						<h1 class="question__pageTitle">SYSTEM 문의</h1>
					</div>
					<ul class="question__box">
						<li class="question__liner">
							<p class="question__num">번호</p>
							<p class="question__title">제목</p>
							<p class="question__date">질문 생성일</p>
							<p class="list__detail">답변유무</p>
						</li>
						<c:forEach items="${question }" var="dto">
							<li class="question__liner">
								<p class="question__num">${dto.question_num }</p> <a
								href="/Funding/systemQuestion_detail?question_num=${dto.question_num}"
								class="question__title">${dto.question_title }</a>
								<p class="question__date">${dto.question_at }</p>
								<p class="list__detail">${dto.question_state }</p>
							</li>
						</c:forEach>
					</ul>
					<div class="pages__box" id="pages__box__3"></div>
				</div>
			</div>
			<div class="tab__content" id="tab__4__content">
				<div class="question__wrap">
					<div class="question__header">
						<h1 class="question__pageTitle">펀딩 문의</h1>
					</div>
					<ul class="question__box">
						<li class="question__liner">
							<p class="question__title">펀딩명</p>
							<p class="question__title">질문 내용</p>
							<p class="question__date">질문 일자</p>
						</li>
						<li class="question__liner">
							<p class="question__title">답변유무</p>
							<p class="question__title">답변 내용</p>
							<p class="question__date">답변 일자</p>
						</li>
						<c:forEach items="${fundingquestion }" var="dto">
							<li class="question__liner"><a
								href="/Funding/fundingContent_view?fid=${dto.question_funding}&tab=3"
								class="question__title">${dto.question_funding_title }</a>
								<p class="question_title">${dto.question_content }</p>
								<p class="question__date">${dto.question_at }</p></li>
							<li class="question__liner">
								<p class="question_title">${dto.question_state }</p>
								<p class="question_title">${dto.question_answer }</p>
								<p class="question__date">${dto.question_answer_at }</p>
							</li>
						</c:forEach>
					</ul>
					<div class="pages__box" id="pages__box__4"></div>
				</div>
			</div>
			<div class="tab__content" id="tab__5__content">
				<h2 class="my__title">개인정보 관리</h2>
				<form name="form" method="post" action="/Funding/myinformation_modify">
					<div class="my__formzone">
						<div class="my__liner">
							<p class="my__form__subtitle">변경할 비밀번호</p>
							<input class="my__form__input" type="password" id="pw1"
								name="customer_pw">
						</div>
						<div class="my__liner">
							<p class="my__form__subtitle">비밀번호 확인</p>
							<input class="my__form__input" type="password" id="pw2">
						</div>
						<div class="my__liner">
							<p class="my__form__subtitle">전화번호</p>
							<input class="my__form__input" id="phone"
								placeholder="ex)010-0000-0000" name="phone">
						</div>
						<div class="my__form__submit" onclick="checkMyForm()">변경하기</div>
						<div class="my__form__leave" onclick="leave()">탈퇴하기</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="resources/mypage.js"></script>
	<script>
		function checkMyForm() {
			let form = document.form;
			form.submit();
		}
		
		function leave(){
			let id = "<%=session.getAttribute("id")%>";
			let emailCheck = prompt("탈퇴하면 입력한 개인정보가 사라집니다. \n참여한 펀딩에 관한 기록은 관련 법률에 따라 3년간 보관됩니다. \n정말 탈퇴하시려면 이메일을 입력해주세요");
			if(id === emailCheck){
				location.href = "/Funding/leave"
			}
		}

		let tab = <%=request.getParameter("tab")%> * 1
		;
		let id = "tab__" + tab;

		$(".my__tab__btn").removeClass("selected");
		$("#" + id).addClass("selected");

		$(".tab__content").removeClass("selected");
		$("#" + id + "__content").addClass("selected");

		$(".my__tab__btn").click(function() {
			let id = $(this).attr("id");
			$(".my__tab__btn").removeClass("selected");
			$(this).addClass("selected");

			$(".tab__content").removeClass("selected");
			$("#" + id + "__content").addClass("selected");
		})
		
	let currentPage = <%=request.getParameter("page")%>*1;
	
	let myFundingCount = ${myFundingCount}
	let myFundingpages = Math.floor((myFundingCount - 1) / 10) + 1;
	let myFundingpageTxt = "";
	
	if(tab === 1){
		for (var i = 1; i <= myFundingpages; i++) {
			if(i === currentPage){
				myFundingpageTxt += '<a class="selected" href="/Funding/mypage?tab='+tab+'&page='+i+'">'+i+'</a>'
			}else{
				myFundingpageTxt += '<a href="/Funding/mypage?tab='+tab+'&page='+i+'">'+i+'</a>'
			}
		}
	}else{
		for (var i = 1; i <= myFundingpages; i++) {
			if(i === 1){
				myFundingpageTxt += '<a class="selected" href="/Funding/mypage?tab=1&page='+i+'">'+i+'</a>'
			}else{
				myFundingpageTxt += '<a href="/Funding/mypage?tab=1&page='+i+'">'+i+'</a>'
			}
		}
	}
	
	
	let myLikeCount = ${myLikeCount}
	let myLikepages = Math.floor((myLikeCount - 1) / 10) + 1;
	let myLikepagesTxt = "";
	
	if(tab === 2){
		for (var i = 1; i <= myLikepages; i++) {
			if(i === currentPage){
				myLikepagesTxt += '<a class="selected" href="/Funding/mypage.do?tab=2&page='+i+'">'+i+'</a>'
			}else{
				myLikepagesTxt += '<a href="/Funding/mypage.do?tab=2&page='+i+'">'+i+'</a>'
			}
		}
	}else{
		for (var i = 1; i <= myLikepages; i++) {
			if(i === 1){
				myLikepagesTxt += '<a class="selected" href="/Funding/mypage.do?tab=2&page='+i+'">'+i+'</a>'
			}else{
				myLikepagesTxt += '<a href="/Funding/mypage.do?tab=2&page='+i+'">'+i+'</a>'
			}
		}
	}
	
	
	let mySystemQuestionCount = ${mySystemQuestionCount}
	let mySQpages = Math.floor((mySystemQuestionCount - 1) / 10) + 1;
	let mySQpagesTxt = "";
	
	if(tab === 3){
		for (var i = 1; i <= mySQpages; i++) {
			if(i === currentPage){
				mySQpagesTxt += '<a class="selected" href="/Funding/mypage.do?tab=2&page='+i+'">'+i+'</a>'
			}else{
				mySQpagesTxt += '<a href="/Funding/mypage.do?tab=2&page='+i+'">'+i+'</a>'
			}
		}
	}else{
		for (var i = 1; i <= mySQpages; i++) {
			if(i === 1){
				mySQpagesTxt += '<a class="selected" href="/Funding/mypage.do?tab=3&page='+i+'">'+i+'</a>'
			}else{
				mySQpagesTxt += '<a href="/Funding/mypage.do?tab=3&page='+i+'">'+i+'</a>'
			}
		}
	}
	
	
	
	let myFundingQuestionCount = ${myFundingQuestionCount}
	let myFQpages = Math.floor((myFundingQuestionCount - 1) / 10) + 1;
	let myFQpagesTxt = "";
	
	if(tab === 4){
		for (var i = 1; i <= myFQpages; i++) {
			if(i === currentPage){
				myFQpagesTxt += '<a class="selected" href="/Funding/mypage.do?tab=4&page='+i+'">'+i+'</a>'
			}else{
				myFQpagesTxt += '<a href="/Funding/mypage.do?tab=2&page='+i+'">'+i+'</a>'
			}
		}
	}else{
		for (var i = 1; i <= myFQpages; i++) {
			if(i === 1){
				myFQpagesTxt += '<a class="selected" href="/Funding/mypage.do?tab=4&page='+i+'">'+i+'</a>'
			}else{
				myFQpagesTxt += '<a href="/Funding/mypage.do?tab=2&page='+i+'">'+i+'</a>'
			}
		}
	}
	
	console.log(myFQpagesTxt)
	
	$("#pages__box__1").html(myFundingpageTxt);
	$("#pages__box__2").html(myLikepagesTxt);
	$("#pages__box__3").html(mySQpagesTxt);
	$("#pages__box__4").html(myFQpagesTxt);
	
	for (var i = 0; i < $("li .list__date").length; i++) {
		let dom = $("li .list__date").eq(i);
		let txt = dom.html().split(" ")[0];
		dom.html(txt);
	}
	for (var i = 0; i < $("li .question__date").length; i++) {
		let dom = $("li .question__date").eq(i);
		let txt = dom.html().split(" ")[0];
		dom.html(txt);
	}
	</script>
</body>
</html>