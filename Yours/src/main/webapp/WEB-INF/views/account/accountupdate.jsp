<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" href="/css/accountupdate.css">

<script>
	const validation = {
		passwdCheck : false,
		passwdConfirm : false
	};

	function passwdCheck() {
		const passwdVal = $("#passwd").val();
		const passwdCheckVal = $("#passwdCheck").val();
		
		if(passwdVal != passwdCheckVal) {
			if(validation.passwdCheck != false)
				validation.passwdCheck = false;
			
			$("#passwdCheckMsg").text("비밀번호가 일치하지 않습니다!");
		} else {
			if(validation.passwdCheck != true)
				validation.passwdCheck = true;
			
			$("#passwdCheckMsg").text("비밀번호가 일치합니다!");
		}
	};

	$(function() {
		$("#deleteBtn").click(function() {
			$.ajax("deleteaccount", {
				method: "POST",
				data: const form {
					id : $("#diary_p").data("id");
				},
				success : result => {
					alert("그동안 이용해주셔서 감사드립니다.");
					location.href="../../";
				}
			})	
		});
		
		$("#passwdBtn").click(function() {
			if(validation.passwdConfirm != true) {
				alert("비밀번호를 확인해주세요.")
				return;
			}
			
			if(validation.passwdCheck != true) {
				alert("비밀번호가 일치하지 않습니다.")
				return;
			}
			
			$("#passwdupdateForm").submit();
		})
		
		$("#accountBtn").click(function() {
			const emailValue = $("#email").val();
			
			if(emailValue == "") {
				$("#email").val($("#email").data("email"));
			}
			
			$("#accountupdateForm").submit();
		});
		
		$("#email").change(function() {
			const emailVal = $(this).val();
			var emailRule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			if(!emailRule.test(emailVal)) {
				$("#emailMsg").text("사용 불가능한 이메일주소입니다!");
			} else {
				$("#emailMsg").text("사용 가능한 이메일주소입니다!");
			}
		});
		
		$("#passwdCheck").change(function() {
			passwdCheck();
		});
		
		$("#passwd").change(function() {
			const passwdVal = $(this).val();
			var passwdRule = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
			
			if(!passwdRule.test(passwdVal)) {
				if(validation.passwdConfirm != false)
					validation.passwdConfirm = false;
				
				$("#passwdMsg").text("사용 불가능한 비밀번호 입니다!");
			} else {
				if(validation.passwdConfirm != true)
					validation.passwdConfirm = true;
				
				$("#passwdMsg").text("사용 가능한 비밀번호 입니다!");
			}
			passwdCheck();
		});
	})
</script>

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
                            <li><a href="../diary/">Diary</a></li>
                            <li><a href="../timeline">Time Line</a></li>
                            <li><a href="../logout">로그 아웃</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>
        <section>
        	<p id="diary_p" data-id="${sessionScope.account.id}"> ${sessionScope.account.name}'s Diary</p>
        	<div id="form_area">
        		<div>
                    <form id="accountupdateForm" method="post" action="accountupdate">
                        <div>
                            <input type="text" name="name" value="${item.name}" readonly>
                        </div>
                        <div id="date_div">
                            <p>가입일 : <fmt:formatDate value="${item.regDate}" pattern="yyyy/MM/dd"/></p>
                        </div>
                        <div>
                            <input type="email" id="email" name="email" value="${item.email}">
                            <p id="emailMsg"></p>
                        </div>
                        <button type="button" id="accountBtn">이메일 변경하기</button>
                    </form>
                </div>
                <hr>
                <form id="passwdupdateForm" method="post" action="passwdupdate">
                    <div>
                        <input type="password" id="passwd" name="passwd" placeholder="<비밀번호>영문, 특수문자, 숫자를 이용한 8~16자리">
                    </div>
                    <div class="text_div">
                        <p id="passwd_worn">사용 가능한 특수문자 : !@#$%^*+=-</p>
                        <p id="passwdMsg"></p>
                    </div>
                    <div>
                        <input type="password" id="passwdCheck" name="passwdchek" placeholder="비밀번호를 한번더 입력해주세요.">
                    </div>
                    <div class="text_div"><p id="passwdCheckMsg"></p></div>
                    <button type="button" id="passwdBtn">비밀번호 변경하기</button>
                    <button type="button" id="deleteBtn">회원 탈퇴</button>
                </form>
        	</div>
        </section>
		
		<jsp:include page="../include/footer.jsp" />
		
	</div>
</body>
</html>