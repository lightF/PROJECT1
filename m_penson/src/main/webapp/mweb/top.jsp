<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mid = "";
	String name = "";
	String tel = "";
	String email = "";
	
	try{
		mid = session.getAttribute("userid").toString();
		name = session.getAttribute("username").toString();
		tel = session.getAttribute("usertel").toString();
		email = session.getAttribute("useremail").toString();
	}
	catch(Exception e){
		//out.print("세션 오류로 인하여 서비스 중지!!");
	}
%>
<header>
<ul class="top_menu">
    <li><img src="./img/menu.svg"></li>
    <li onclick="location.href='./index.jsp';"><img src="./img/header_logo.png"></li>
    <li id="userhtml" onclick="login_pop();"><img src="./img/login.svg"></li>
</ul>
</header>
<form id="f" method="post" action="./m_loginok.do" enctype="application/x-www-form-urlencoded">
<aside class="popup" id="popup" style="display:none;">
	<div class="login">
		<span class="close" onclick="pop_close();">X</span>
		<p>MEMBER-LOGIN</p>
		<ol>
		<li><input type="text" name="uid" id="uid" class="login_input" placeholder="아이디를 입력하세요"></li>
		<li><input type="password" name="pwd" id="pwd" class="login_input" placeholder="패스워드를 입력하세요"></li>
		<li><label><input type="checkbox" id="saveid" class="login_check" onclick="id_save()">자동로그인</label></li>
		<li><input type="button" value="로그인" class="login_btn" onclick="checkPassword()"></li>
		<li class="login_info">
		<span onclick="page_location(1)">아이디 찾기</span>
		<span onclick="page_location(2)">회원가입</span>
		</li>
		</ol>
	</div>
</aside>
</form>

<script>
	function id_save() {
	    if (document.getElementById("saveid").checked) {
	        if (document.getElementById("uid").value === "") {
	            alert("아이디를 작성하셔야 적용이 가능하십니다.");
	            document.getElementById("saveid").checked = false;
	            return false;
	        }
	        localStorage.setItem("uid", document.getElementById("uid").value);
	    } else {
	        localStorage.removeItem("uid");
	    }
	    return true;
	}
	
	function checkPassword() {
	    var uid = document.getElementById("uid").value;
	    var pwd = document.getElementById("pwd").value;
	    if (uid === "" || pwd === "") {
	        alert("아이디와 비밀번호를 모두 입력해주세요.");
	        return;
	    }
	    f.submit();
	}
	
	window.onload = function() {
	    if (localStorage.getItem("uid")) {
	        document.getElementById("uid").value = localStorage.getItem("uid");
	        document.getElementById("saveid").checked = true;
	    }
	    
	    var user = "<%=name%>";
		var li = document.getElementById("userhtml");
		if(user != ""){
			li.setAttribute("onclick", "");
			li.innerHTML = user + "님" + "<a href='./logout.jsp'>[로그아웃]</a>";
			li.style.width = "40%";
		}
	}
</script>