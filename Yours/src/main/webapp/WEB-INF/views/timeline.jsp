<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="include/header.jsp"></jsp:include>

<link rel="stylesheet" href="/css/timeline.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<script>
	$(function () {
		$("table").on("click", ".empathyBtn", function() {
			if($(this).attr('class') == "empathyBtn material-icons red") {
				$(this).removeClass('red');
				$(this).text("favorite_border");
				
				const item = {
						id : $(".getId").data("id"),
						code : $(this).data("code")
				};
				
				$.ajax("deleteEmpathy", {
					method : "POST",
					data : item,
					success : result => {
					},
					error : xhr => alert(`오류 발생 : ${xhr.statusText}`)
				});
			} else {
				$(this).addClass('red');
				$(this).text("favorite");
				
				const item = {
						id : $(".getId").data("id"),
						code : $(this).data("code")
				};
				
				$.ajax("addEmpathy", {
					method : "POST",
					data : item,
					success : result => {
					},
					error : xhr => alert(`오류 발생 : ${xhr.statusText}`)
				});
			}
		});
	});
</script>

<style>
	@font-face {
	    font-family: 'Material Icons';
	    font-style: normal;
	    font-weight: 400;
	    src: url(https://example.com/MaterialIcons-Regular.eot); /* For IE6-8 */
	    src: local('Material Icons'),
	        local('MaterialIcons-Regular'),
	        url(https://example.com/MaterialIcons-Regular.woff2) format('woff2'),
	        url(https://example.com/MaterialIcons-Regular.woff) format('woff'),
	        url(https://example.com/MaterialIcons-Regular.ttf) format('truetype');
	}
	
	.material-icons {
	    font-family: 'Material Icons';
	    font-weight: normal;
	    font-style: normal;
	    font-size: 24px;  /* Preferred icon size */
	    display: inline-block;
	    line-height: 1;
	    text-transform: none;
	    letter-spacing: normal;
	    word-wrap: normal;
	    white-space: nowrap;
	    direction: ltr;
	
	    /* Support for all WebKit browsers. */
	    -webkit-font-smoothing: antialiased;
	    /* Support for Safari and Chrome. */
	    text-rendering: optimizeLegibility;
	
	    /* Support for Firefox. */
	    -moz-osx-font-smoothing: grayscale;
	
	    /* Support for IE. */
	    font-feature-settings: 'liga';
	}
</style>

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
       		<p id="diary_p" class="getId" data-id="${sessionScope.account.id}"> ${sessionScope.account.name}님은 어떤 일기에 공감하시나요?</p>
       		<div id="table_box">
                <table>
                    <thead>
                        <tr>
                            <th id="th1">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</th>
                            <th id="th2">감 정</th>
                            <th id="th3">공 감</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${list.size() < 1}">
							<tr>
								<td colspan="3">공유된 일기가 없습니다 ㅠㅅㅠ</td>
							</tr>
						</c:if>
						
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.content}</td>
								<td>${item.strFeels}</td>
								<c:if test="${item.empathy == 1}">
								<td><span class="empathyBtn material-icons red" data-code="${item.code}">favorite</span></td>
								</c:if>
								<c:if test="${item.empathy == 0}">
								<td><span class="empathyBtn material-icons" data-code="${item.code}">favorite_border</span></td>
								</c:if>
							</tr>
						</c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3" id="pager_td">
                                <div id="pager_box">
                                    <div class="pager_btn btn_text"><a href="?page=1">처음</a></div>
                                    <div class="pager_btn btn_text"><a href="?page=${pager.prev}">이전</a></div>
                                    
                                    <c:forEach var="item" items="${pager.list}">
                                    <div class="pager_btn btn_num"><a href="?page=${item}">1</a></div>
                                    </c:forEach>
                                    
                                    <div class="pager_btn btn_text"><a href="?page=${pager.next}">다음</a></div>
                                    <div class="pager_btn btn_text"><a href="?page=${pager.last}">마지막</a></div>
                                </div>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </section>
	</div>
</body>
</html>