<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ 
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="include/header.jsp" />

<link rel="stylesheet" href="/css/index.css">

</head>
<body>
	<div class="box">
		<header>
            <div id="header">
                <div id="head_line">
                    <div id="logo">
                        <a><img src="/src/logo.png"></a>
                    </div>
                    <div id="hd_space"></div>
                    <div id="navigation">
                        <ul>
                            <li><a href="diary/">Diary</a></li>
                            <li><a href="timeline">Time Line</a></li>
                            <c:if test="${sessionScope.account == null }">
                            	<li><a href="account/login">로그인</a></li>
                            </c:if>
                            <c:if test="${sessionScope.account != null }">
                            	<li><a href="./logout">로그 아웃</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <div id="header_image">
                    <img src="/src/headerImage.png">
                </div>
            </div>
        </header>
		
		<section>
            <div id="main">
                <p id="p1">Yours Project Story</p>
                <p id="p2">'Yours'<br><u>'당신'</u>의 감정은<br><u>'당신'</u>의 것 이니까요.</p>
                <p id="p3">너무나도 바쁘게 일상을 살아내는 우리들...<br>때로는 모든 것을 내려놓고 쉬어가고 싶을 때도,<br>너무 기쁜 나머지 다른 이와 축하하고 싶을 때도 있지요.<br>'Yours'에서 당신의 감정을 털어놓아 보세요.</p>
                <hr>
                <p id="p4">'Yours'<br>이렇게 사용해보세요.</p>
                <div id="content">
                    <div class="content_box">
                        <img src="/src/diary.png">
                        <p class="content_phead">하루를 마무리하는 '감정일기'</p>
                        <p class="content_p">당신의 오늘 하루는 어떤 감정들로 이루어져 있나요?<br>오늘 하루를 생각하며, 하루 동안의 감정을 정리해보세요.<br>슬픈일은 슬프게, 행복한 일은 행복하게 감정을 분리하세요.</p>
                    </div>
                    <div class="div_line"></div>
                    <div class="content_box">
                        <img src="/src/meeting.png">
                        <p class="content_phead">나는 이럴때 이런 감정이 들어 '감정공유'</p>
                        <p class="content_p">기쁘거나 슬픈 일이 있으신가요?<br>감정 공유 버튼을 통해 감정을 공유해 보세요.<br>누군가 당신의 감정에 공감해 줄 겁니다!</p>
                    </div>
                </div>
            </div>
        </section>
        
        <jsp:include page="include/footer.jsp"></jsp:include>
	</div>
</body>
</html>