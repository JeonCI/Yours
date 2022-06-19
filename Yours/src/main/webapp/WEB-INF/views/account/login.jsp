<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="../include/header.jsp" />

<link rel="stylesheet" href="/css/login.css">

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
            <div class="section_space"></div>
            <div id="p_div"><p>아직 회원이 아니신가요?<br>회원가입을 통해서 나만의 <b>다이어리</b>를 받아보세요!</p></div>
            <div id="form_div">
                <div id="border_div">
                    <form method="post" action="loginaction">
                        <div id="input_div">
                            <input type="text" class="form_input" name="id" placeholder="아이디">
                            <input type="password" class="form_input" name="passwd" placeholder="비밀번호">
                        </div>
                        <div id="btn_div">
                            <button>Login</button>
                        </div>
                    </form>
                    <div id="button_box">
                        <ul>
                            <li><a href="signup">회원가입</a></li>
                            <li><a href="userfind">아이디/비밀번호 찾기</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="section_space"></div>
        </section>
        
        <jsp:include page="../include/footer.jsp"></jsp:include>
        
	</div>
</body>
</html>