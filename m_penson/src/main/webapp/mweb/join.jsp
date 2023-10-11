<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="subpage">
    <div class="member_agree">
    <p>회원 기본 정보입력</p>
    <form id="j" method="post" action="./join_ok.do">
    <ol class="join_ol">
        <li><input type="text" class="join_input1" name="mid" id="mid" placeholder="아이디 (영문/숫자 6~16자리)" maxlength="16"></li>
        <li><input type="text" class="join_input1" name="mname" id="mname" placeholder="이름 (홍길동)" maxlength="10"></li>
        <li><input type="password" class="join_input1" name="mpassword" id="mpassword" placeholder="비밀번호 (영문/숫자 6~12자리)" maxlength="12"></li>
        <li><input type="password" class="join_input1" id="mpassword2" placeholder="동일한 패스워드를 입력하세요" maxlength="12"></li>
        <li><input type="email" class="join_input1" name="memail" id="memail" placeholder="이메일을 입력하세요" maxlength="35"></li>
        <li><input type="tel" class="join_input1" name="mtel" id="mtel" placeholder="연락처 ('-'는 미입력)" maxlength="<EUGPSCoordinates>11</EUGPSCoordinates>"></li>
        <li class='security'>
        보안코드 : <input type='text' class='join_input2 bgcolor' id='security_code' maxlength='6' readonly='readonly'>
        <input type='number' class='join_input2' id='security_code_input' placeholder='보안코드 6자리 입력' maxlength='6'>
        </li>
    </ol>
    <input type="button" class='member_agreebtn' value="회원가입" onclick='join()'>
    </form>
    </div>
</section>
<script>    
    function join(){
        //회원가입
        if(document.getElementById("mid").value == ""){
            alert("아이디를 입력해주세요.");
        }
        else if(document.getElementById("mid").value.length < 6 || document.getElementById("mid").value.length > 16){
            alert("아이디는 영문/숫자 포함 최소 6~16자리 까지 입력해주세요.");
        }
        else if(document.getElementById("mname").value == ""){
            alert("이름을 입력해주세요.");
        }
        else if(document.getElementById("mpassword").value == ""){
            alert("패스워드를 입력해주세요.");
        }
        else if(document.getElementById("mpassword").value.length < 6 || document.getElementById("mpassword").value.length > 12){
            alert("비밀번호는 또한 최소 6~12자리까지만 입력해주세요.");
        }
        else if(document.getElementById("mpassword2").value != document.getElementById("mpassword").value){
            alert("패스워드를 동일하게 입력해주세요.");
        }
        else if(document.getElementById("mtel").value == ""){
            alert("전화번호를 입력해주세요.");
        }
        else if(document.getElementById("memail").value == ""){
            alert("이메일을 입력해주세요.");
        }
        
        else{
            if(document.getElementById("mtel").value.length < 10){
                alert("올바른 휴대폰 번호를 입력해주세요.");
            }
            else if(isNaN(document.getElementById("mtel").value) == true){
                alert("정상적인 휴대폰 번호를 입력해주세요.");
            }
            else if(document.getElementById("memail").value.indexOf("@") == -1){
                alert("올바른 이메일 주소를 입력해주세요.");
            }
            else {
                if (document.getElementById('security_code').value !== document.getElementById('security_code_input').value) {
                    alert('보안 코드가 일치하지 않습니다.');
                } else {
                    j.submit();
                }
            }
        }
    }

    window.onload = function() {
        if (document.referrer.indexOf('join_step.jsp') === -1) {
            window.location.href = 'join_step.jsp';
        }
        var securityCode = Math.floor(Math.random() * (999999 - 100000 + 1)) + 100000;
        document.getElementById('security_code').value = securityCode;
    }
</script>
