<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="../include/header.jsp"></jsp:include>

<link rel="stylesheet" href="/css/diary.css">

</head>
<body>
	<div class="box">
		<header>
	    	<div id="header">
	            <div id="head_line">
	                <div id="logo">
	                    <a href="../"><img src="/src/logo.png"></a>
	                </div>
	                <div id="hd_space"></div>
	                <div id="navigation">
	                    <ul>
	                        <li><a href="./">Diary</a></li>
	                        <li><a href="../timeline">Time Line</a></li>
	                        <li><a href="../logout">로그 아웃</a></li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </header>
	<section>
            <p id="diary_p"> ${sessionScope.account.name}'s Diary</p>
            <div id="content_top">
                <div id="top_div1">
                    <ul>
                        <li><a href="add">일기 쓰기</a></li>
                        <li><a href="../account/accountupdate">개인정보수정</a></li>
                    </ul>
                </div>
                <div id="top_div2">
                    <p>나의 감정 - 지금까지의 Diary는 어떤 감정들로 이루어져 있는지 알아보아요.</p>
                    <p id="feeling_p">기쁨은 ${pager.category1}장,
                    행복은 ${pager.category2}장,
                    슬픔은 ${pager.category3}장,
                    우울함은 ${pager.category4}장,
                    화남은 ${pager.category5}장 있습니다!</p>
                </div>
            </div>
            <div id="table_box">
                <table>
                    <thead>
                        <tr>
                            <th id="th1">내용</th>
                            <th id="th2">감정</th>
                            <th id="th3">일자</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${list.size() < 1}">
							<tr>
								<td colspan="3">등록된 일기가 없습니다!</td>
							</tr>
						</c:if>
						
						<c:forEach var="item" items="${list}">
							<tr>
								<td class="content_td"><a href="view/${item.code}">${item.content}</a></td>
								<td>${item.category}</td>
								<td><fmt:formatDate value="${item.regDate}" pattern="yyyy/MM/dd"/></td>
							</tr>
						</c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3" id="pager_td">
                                <div id="pager_box">
                                    <div class="pager_btn btn_text"><a href="?page=1">처음</a></div>
                                    <div class="pager_btn btn_text"><a href="?page=${pager.prev}">이전</a></div>
                                    
                                    <div id="page_div">
                                    <c:forEach var="item" items="${pager.list}">
                                    	<div class="pager_btn btn_num ${pager.page }"><a href="?page=${item}">${item}</a></div>
                                    </c:forEach>
                                    </div>
                                    
                                    <div class="pager_btn btn_text"><a href="?page=${pager.next}">다음</a></div>
                                    <div class="pager_btn btn_text"><a href="?page=${pager.last}">마지막</a></div>
                                </div>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </section>
        
        <jsp:include page="../include/footer.jsp"></jsp:include>
        
    </div>
</body>
</html>