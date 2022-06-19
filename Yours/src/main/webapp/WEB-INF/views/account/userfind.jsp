<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" href="/css/accountfind.css">

<script>
	$(function() {
		$("#idFindBtn").click(function() {
			
			if($("#idEmail").val() != "") {
				if($("#name") != "") {
					$.ajax("idfind", {
						method : "POST",
						data : {
								email : $("#idEmail").val(),
								name : $("#name").val()
								},
						success : result => {
							if(result != "") {
								alert("아이디는 " + result + " 입니다!");
								location.href = "./";
							} else {
								alert("이메일 또는 이름을 확인해주세요!");
							}
						},
						error : xhr => alert(`오류 발생 : ${xhr.statusText}`)
					});
				} else {
					alert("이름을 입력해주세요!");
					return;
				}
			} else {
				alert("이메일을 입력해주세요!");
				return;
			}
			
		});
		
		$("#passwdFindBtn").click(function() {
			
			if($("#passwdEmail").val() != "") {
				if($("#id") != "") {
					$.ajax("passwdfind", {
						method : "POST",
						data : {
								email : $("#passwdEmail").val(),
								id : $("#id").val()
								},
						success : result => {
							if(result) {
								alert("회원님의 이메일로 임시비밀번호가 발급되었습니다! 비밀번호 변경 후 이용해주세요!");
								location.href = "./";
							} else {
								alert("이메일 또는 아이디를 확인해주세요!");
							}
						},
						error : xhr => alert(`오류 발생 : ${xhr.statusText}`)
					});
				} else {
					alert("아이디를 입력해주세요!");
					return;
				}
			} else {
				alert("이메일을 입력해주세요!");
				return;
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
        	<div id="form_box">
                <form id="idForm" action="idfind" method="post">
                    <div>
                        <input type="text" id="idEmail" name="email" placeholder="이메일을 입력해주세요.">
                    </div>
                    <div>
                        <input type="text" id="name" name="name" placeholder="이름을 입력해주세요.">
                    </div>
                    <div>
                        <button type="button" id="idFindBtn">아이디 찾기</button>
                    </div>
                </form>
                <hr>
                <form method="post" action="passwdfind" id="passwdForm">
                    <div>
                        <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요.">
                    </div>
                    <div>
                        <input type="text" id="passwdEmail" name="email" placeholder="이메일을 입력해주세요.">
                    </div>
                    <div>
                        <button type="button" id="passwdFindBtn">비밀번호 찾기</button>
                    </div>
                </form>
            </div>
        </section>
		
		<jsp:include page="../include/footer.jsp"></jsp:include>
		
	</div>
</body>
</html>