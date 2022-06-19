<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" href="/css/view.css">

</head>
<body>
	<div class="box">
		<header>
            <div id="header">
                <div id="head_line">
                    <div id="logo">
                        <a href="../../"><img src="/src/logo.png"></a>
                    </div>
                    <div id="hd_space"></div>
                    <div id="navigation">
                        <ul>
                            <li><a href="../">Diary</a></li>
                            <li><a href="../../timeline">Time Line</a></li>
                            <li><a href="../../logout">로그 아웃</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        
        <section>
        	<p id="diary_p"> 전천익's Diary</p>
        	<div id="content_area">
        		<div class="content first_line">
                    <label id="first_label">일 자</label>
                    <p><fmt:formatDate value="${item.regDate}" pattern="yyyy/MM/dd"/></p>
                    <label id="seccond_label">감 정</label>
                    <input type="text" id="category" name="category" value="${item.category}" readonly>
                </div>
                <div class="content second_line">
                    <label>오늘의 태그들</label>
                    <input type="text" id="feels" name="feels" value="${item.strFeels}">
                </div>
                <div id="today">
                    <label id="today_label">오늘 하루는 어땠나요?</label>
                    <label id="share_label">${item.strShare}</label>
                    <p>${item.content}</p>
                </div>
        	</div>
        	<div id="btn_box">
                <div class="btn_text"><a href="../diaryupdate/${item.code}">다시쓰기</a></div>
                <div class="btn_text"><a href="../">목록</a></div>
                <div class="btn_text"><a href="../diarydelete/${item.code}">삭제</a></div>
            </div>
        </section>
		
		<jsp:include page="../include/footer.jsp"></jsp:include>
		
	</div>
</body>
</html>