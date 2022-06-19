<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" href="/css/signup.css">

<script>
	const validation = {
		id : "",
		passwdCheck : false,
		passwdConfirm : false,
		emailCheck : false
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
		$("#email").change(function() {
			const emailVal = $(this).val();
			var emailRule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			
			if(!emailRule.test(emailVal)) {
				if(validation.emailCheck != false)
					validation.emailCheck = false;
				
				$("#emailMsg").text("사용 불가능한 이메일주소입니다!");
			} else {
				if(validation.emailCheck != true)
					validation.emailCheck = true;
				
				$("#emailMsg").text("사용 가능한 이메일주소입니다!");
			}
		});
		
		$("#id").change(function() {
			validation.id = "";
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
		
		$("#signupBtn").click(function() {
			if(validation.id != "") {
				if(validation.passwdConfirm == true) {
					if(validation.passwdCheck == true) {
						if(validation.emailCheck == true) {
							if($("#name").val() != "") {
								alert("회원가입이 완료되었습니다!")
								$("form").submit();
								return;
							}
							alert("이름을 입력해주세요!");
							return;
						}
						alert("이메일을 확인해주세요!");
						return;
					}
					alert("비밀번호가 일치하지 않습니다!")
					return;
				}
				alert("비밀번호를 확인해주세요!");
				return;
			} else {
				alert("아이디 중복검사를 해주세요!");
			}
		});
		
		$("#checkId").click(function() {
			const form = $("input[name='id']");
			const idVal = $("input[name='id']").val();
			
			var idRule = /^[a-zA-Z].{5,}$/;
			var blankPattern = /[\s]/g;
			
			if( blankPattern.test(idVal) == true) {
			    alert("공백은 사용할수 없습니다!");
			    return;
			}
					
			if(idRule.test(idVal)) {
				$.ajax("checkId", {
					method : "POST",
					data : form,
					success : result => {
						if(result == true) {
							validation.id = idVal;
							
							alert(idVal + "은(는) 사용 가능한 아이디 입니다!");
						} else
							alert(idVal + "은(는) 이미 사용중인 아이디 입니다!");
					},
					error : xhr => alert(`오류 발생 : ${xhr.statusText}`)
				});
			} else {
				alert("아이디는 6자리 이상으로 만들어 주세요.")
			}
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
                        <a href="../"><img src="/src/logo.png"></a>
                    </div>
                </div>
            </div>
        </header>
        
        <section>
        	<form id="signupForm" method="post">
                <div id="formInfo">
                    <p id="wrn_text">모든 정보를 올바르게 입력해 주세요!</p>
                    <div>
                        <input type="text" id="name" name="name" placeholder="<성 명>이름을 입력해 주세요.">
                    </div>
                    <div>
                        <input type="text" id="id"  name="id" placeholder="<아이디>영문, 숫자를 이용한 6자리 이상">
                        <button type="button" id="checkId">중복확인</button>
                    </div>
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
                    <div>
                        <input type="email" id="email" name="email" placeholder="<이메일>비밀번호를 찾을때 이용되니 올바르게 작성해주세요!">
                    </div>
                    <div class="text_div"><p id="emailMsg"></p></div>
                    <div>
                        <button type="button" id="signupBtn">회원가입</button>
                    </div>
                </div>
            </form>
        </section>
		
		<jsp:include page="../include/footer.jsp"></jsp:include>
		
	</div>
</body>
</html>