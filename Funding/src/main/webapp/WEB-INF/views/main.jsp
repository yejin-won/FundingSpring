<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해피펀딩</title>
<link rel="stylesheet" href="resources/init.css">
<link rel="stylesheet" href="resources/base.css">
<link rel="stylesheet" href="resources/fundingCards.css">
<script type="text/javascript" src="resources/moment.js"></script>
<style>
.loadMore {
	width: 100%;
	height: 52px;
	line-height: 52px;
	border: 1px solid rgba(0, 0, 0, .07);
	background-color: #f6f6f6;
	font-size: 15px;c
	text-align: center;
	overflow-anchor: none;
	cursor: pointer;
}

#toast {
	position: fixed;
	bottom: 30px;
	left: 50%;
	padding: 15px 20px;
	transform: translate(-50%, 10px);
	border-radius: 30px;
	overflow: hidden;
	opacity: 0;
	visibility: hidden;
	transition: opacity .5s, visibility .5s, transform .5s;
	background: rgba(0, 0, 0, 0.5);
	color: #fff;
	z-index: 5;
}

#toast.reveal {
	opacity: 1;
	visibility: visible;
	transform: translate(-50%, 0)
}
</style>
</head>
<script>
let pastURL = localStorage.getItem("pastURL");
if(pastURL){
	localStorage.removeItem("pastURL");
	location.href = pastURL;
}

let words = ["핸드메이드 카네이션 굿즈로 마음을 전해요","NON-GMO 콩으로 만든 유기농 볶음 콩가루","'인어를 위한 수영교실' 단행본4-7권과 굿즈","네팔 여성들의 자립을 돕는 네팔리 백과 굿즈","순수 원재료만 담은 진심가래떡","바다를 위한 동행, 커피 스크럽 바디바 KI","화분과 지구에 나무를 심는 환경교육키트","초벌 옹기에 담아 직접 구운 소금","지구를 위하는 고체 치약과 대나무 칫솔","동물복지 유정란으로 만든 건강한 계란과자","시들지 않는 선물, 매듭 카네이션","완주 농산물로 만든 샛노란 단호박 식혜","주니어와 어른을 위한  가슴 편한 티셔츠","집에서도 해물탕을? 간편한 갓해물 밀키","'현혹'의 감동을 다시 만나는 단행본과 굿즈","루게릭병 환우에게 희망을 선물하는 팔찌","농부의 딸, 세 자매가 만든 진한 생강청","취약계층의 자립을 응원하는 티크 원목 도마","자연이 준 선물, 꿀벌 벌집으로 만든 롤밀랍랩","스틱 한 포로 완성하는 루이보스 밀크티","춘천 엄마들이 만든 진짜 춘천 닭갈","김희재와 희랑별이 함께 행복을 전하는 너찌","국내산 표고버섯으로 만든 건강 ","세상을 바꾸는 특별한 커피, 히즈빈","매일 간편하게 즐기는 7가지 해초샐러","미세플라스틱 걱정 덜은 옥수수로 만든 칫","호랑이의 기운이 담긴 호랑이 쿠키 틴케이","영양과 맛 모두 잡은 반려동물 요거트","매듭으로 엮은 한국의 멋, 전통 매듭 액세서","우리 밀, 유기농 곡물로 만든 쿠키와 스","코르크 가죽으로 만든 에코백과 카드지","Non-GMO 콩으로 만든 순콩 단백","지구를 지키는 업사이클링 플로깅 굿","100% 한우 순수 사골육수 이든곰","핸드메이드 카네이션 굿즈로 마음을 전해요","NON-GMO 콩으로 만든 유기농 볶음 콩가루","'인어를 위한 수영교실' 단행본4-7권과 굿즈","네팔 여성들의 자립을 돕는 네팔리 백과 굿즈","순수 원재료만 담은 진심가래떡","바다를 위한 동행, 커피 스크럽 바디바 KI","화분과 지구에 나무를 심는 환경교육키","초벌 옹기에 담아 직접 구운 소금","지구를 위하는 고체 치약과 대나무 칫솔","동물복지 유정란으로 만든 건강한 계란과자","시들지 않는 선물, 매듭 카네이션","완주 농산물로 만든 샛노란 단호박 식혜","주니어와 어른을 위한  가슴 편한 티셔츠","집에서도 해물탕을? 간편한 갓해물 밀키","'현혹'의 감동을 다시 만나는 단행본과 굿즈","루게릭병 환우에게 희망을 선물하는 팔찌","농부의 딸, 세 자매가 만든 진한 생강청","취약계층의 자립을 응원하는 티크 원목 도마","자연이 준 선물, 꿀벌 벌집으로 만든 롤밀랍랩","스틱 한 포로 완성하는 루이보스 밀크티","춘천 엄마들이 만든 진짜 춘천 닭갈","김희재와 희랑별이 함께 행복을 전하는 너찌","국내산 표고버섯으로 만든 건강 ","세상을 바꾸는 특별한 커피, 히즈빈","매일 간편하게 즐기는 7가지 해초샐러","미세플라스틱 걱정 덜은 옥수수로 만든 칫","호랑이의 기운이 담긴 호랑이 쿠키 틴케이","영양과 맛 모두 잡은 반려동물 요거트","매듭으로 엮은 한국의 멋, 전통 매듭 액세서","우리 밀, 유기농 곡물로 만든 쿠키와 스","코르크 가죽으로 만든 에코백과 카드지","Non-GMO 콩으로 만든 순콩 단백","지구를 지키는 업사이클링 플로깅 굿","100% 한우 순수 사골육수 이든곰"]
let page = 0;
document.addEventListener('DOMContentLoaded', function() {
	loadMore();
	let email = "<%=session.getAttribute("id")%>";

	let firstLogin = "<%=session.getAttribute("loginFirst")%>";
	
	if(firstLogin !== "null" && email !== "null"){
		toast(email + '로 로그인 되었습니다.');
		<%session.removeAttribute("loginFirst");%>;
	}
	
	let message = "<%= request.getAttribute("change") %>"
	if(message === "pw"){
		toast("비밀번호가 변경되었습니다. 다시 로그인 해주세요");
	}
});

//funding_num, funding_seller, funding_banner, funding_title, 
//funding_openAt, funding_closeAt, funding_state, funding_achievement);
	function loadMore(){
		let txt = '';
		let today = new Date();
		let closeDay = new Date();
		let dif = 0;
		let days = 0;
		let hours = 0;
		let timeTxt = "";
		let mins = 0;
		
		<c:forEach items="${list}" var="fd">
		closeDay = moment("${fd.funding_closeAt}");
		dif = closeDay.diff(today, 'hours')
		days = Math.round(dif/24)
		hours = dif%24
		if(days>0){
			timeTxt = days +  '일 '
		}else{
			timeTxt = ''
		}
		if(hours>0){
			timeTxt += hours + '시간 '
		}else{
			timeTxt += ''
		}
		if(dif < 1){
			if(dif < 0){
				timeTxt = '마감됨'	
			}else{
				timeTxt = closeDay.diff(today, 'minutes') + '분'
			}
		}
		
		
		txt += '<a href="/Funding/fundingContent_view.do?fid=${fd.funding_num}"><div class="fundingCard">'
		txt += '<div class="fundingCardHover"><p>펀딩 진행중</p>'
		txt += '<p>'+timeTxt+'</p></div>'
		txt	+= '<div class="fundingThumbBox">';
		txt += '<img src=${fd.funding_banner}></div>';
		txt += '<div class="fundingContentBox"><div class="fundingContentLeft">'
		txt += '<p class="fundingTitle">${fd.funding_title}</p>' //해당부분 erro 발생
		txt += '<p class="fundingSeller"></p></div>'
		txt += '<div class="fundingRate">${fd.funding_achievement}%</div></div>'
		txt += '<div class="fundingCardBottom">'
		txt += '<p class="fundingLeftDate">'+timeTxt+'</p><p class="fundingAmount">${fd.total}원</p>'
		txt += '</div></div></a>';
		
		</c:forEach>
		
		document.getElementById("fundingCards").innerHTML = txt;
		if(page<5){
			page ++;
		}
		if(page===4){
			document.getElementById("loadMoreBox").innerHTML = ""
		}
	}
	function toast(string) {
	    const toast = document.getElementById("toast");

	    toast.classList.contains("reveal") ?
	        (clearTimeout(removeToast), removeToast = setTimeout(function () {
	            document.getElementById("toast").classList.remove("reveal")
	        }, 3000)) :
	        removeToast = setTimeout(function () { 
	            document.getElementById("toast").classList.remove("reveal")
	        }, 3000)
	    toast.classList.add("reveal"),
	        toast.innerText = string
	}
</script>
<body>
	<jsp:include page="./components/header.jsp" />
	<jsp:include page="./components/banner.jsp" />
	<jsp:include page="./components/categories.jsp" />
	<div class="fundingCards" id="fundingCards"></div>
	<div id="toast"></div>
</body>
</html>