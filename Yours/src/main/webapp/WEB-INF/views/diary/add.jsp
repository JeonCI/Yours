<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="../include/header.jsp"></jsp:include>

<link rel="stylesheet" href="/css/add.css">

<script>
	window.onload = function() {
		today = new Date();

		today = today.toLocaleDateString();
		
		bir = document.getElementById("nowDate");
		bir.innerText = today;
	}
	
	$(document).ready(function() {
		const feels = {};
		var count = 0;
		
		function addFeels(value) {
			feels[count] = value;
			count++;
		}
		
		function marginFeels () {
			return Object.values(feels).filter(function (word) {
				return word !== "";
			});
		}
		
		$("#feel").on("keypress", function (e) {
			const strFeel = $(this);
			
			if(e.key === "Enter" || e.keyCode === 32) {
				
				const feelValue = strFeel.val();
				
				if(feelValue !== "") {
					const result = Object.values(feels).filter(function (word) {
						return word === feelValue;
					});
				
					if(result.length == 0) {
						$("#feelsList").append("<li class='feelsItem'><span type='button' class='deleteBtn' idx='" + count + "' data-val='" + feelValue + "'>" + feelValue + "x </span></li>");
						$("#diaryForm").append("<input type='text' hidden='hidden' value='" + feelValue + "' name='feeling'>");
						
						addFeels(feelValue);
						
						strFeel.val("");
					} else {
						alert("감정이 중복됩니다!");
					}
				}
				e.preventDefault();
			}
		});
		
		$(document).on("click", ".deleteBtn", function (e) {
			const index = $(this).attr("idx");
			const val = $(this).data("val");
			
			feels[index] = "";
			$(this).parent().remove();
			$("input[value='" + val + "']").remove();
		});
	});
</script>

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
                            <li><a href="./">Diary</a></li>
                            <li><a href="../../timeline">Time Line</a></li>
                            <li><a href="../../logout">로그 아웃</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        <section>
        	<p id="diary_p"> 전천익's Diary</p>
        	<form method="post" id="diaryForm">
				<input type="text" name="id" value="${sessionScope.account.id}" readonly="readonly" hidden="hidden">
                <div id="content_area">
                    <div class="content first_line">
                        <label id="first_label">일 자</label>
                        <p><span id="nowDate"></span></p>
                        <label id="seccond_label">감 정</label>
                        <select name="category" id="feeling_select">
                            <option value="" disabled="disabled" selected="selected">오늘은 어떤 하루였나요?</option>
                            <option value="기쁨">기쁨</option>
                            <option value="행복">행복</option>
                            <option value="슬픔">슬픔</option>
                            <option value="우울">우울</option>
                            <option value="화남">화남</option>
                        </select>
                    </div>
                    <div class="content second_line">
                        <label>오늘의 태그들</label>
                        <ul id="feelsList">
                        </ul>
                        <input type="text" id="feel" size="10" placeholder="오늘의 감정태그는?" value="">
                    </div>
                    <div id="today">
                        <label>오늘 하루는 어땠나요?</label>
                        <select name="share" id="share_select">
							<option value="" disabled="disabled" selected="selected">일기를 공개할까요?</option>
							<option value="1">공개</option>
							<option value="0">비공개</option>
						</select>
                        <textarea name="content" placeholder="오늘 하루를 들려주세요!"></textarea>
                    </div>
                </div>
                <div>
					<button class="btn_text">일기 쓰기</button>
					<div class="return_btn"><a href="./">목록으로</a></div>
				</div>
            </form>
        </section>
        
        <jsp:include page="../include/footer.jsp"></jsp:include>
        
	</div>
</body>
</html>