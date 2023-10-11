/* 
storage : local, session : 웹 브라우저에 작은 메모리를 활용하여 해당 정보를 기억시켜 놓는 공간
단점 : 브라우저 종류가 다를 경우 storage값이 유/무로 나누어집니다.
window.localStorage.setItem("별명", 값 또는 변수명) : storage에 저장
window.localStorage.getItem("별명",) : storage에 있는 별명 명칭 값을 가져올 때 사용
*/

var storage = window.localStorage.getItem("userid");
f.uid.value = storage;

function id_save(){
	//아이디 저장 기능
	var ck = document.getElementById("saveid");
	if(f.uid.value == ""){
		alert("아이디를 입력하셔야만 해당 기능을 사용할 수 있습니다.");
		ck.checked = false;
	}
	else{
		if(ck.checked == true){
			window.localStorage.setItem("userid", f.uid.value);
		}
		else{
			window.localStorage.setItem("userid", "");
		}
	}
}

function login(){
	//로그인
	if(f.uid.value == ""){
		alert("아이디를 입력하세요");
		f.uid.focus();
		return false;
	}
	else if(f.upw.value == ""){
		alert("패스워드를 입력하세요");
		f.uid.focus();
		return false;
	}
	else{
		return;
	}
}
	
function join(){
	//회원가입
	if(document.getElementById("mid").value == ""){
		alert("아이디를 입력해주세요.");
	}
	else if(document.getElementById("mname").value == ""){
		alert("이름을 입력해주세요.");
	}
	else if(document.getElementById("mpassword").value == ""){
		alert("패스워드를 입력해주세요.");
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
		else if(isNaN(document.getElementById("mtel").value) == true){	//isNaN 숫자를 변환했을 때 true -> 문자가 포함됨 false 반환 시 -> 숫자만
			alert("정상적인 휴대폰 번호를 입력해주세요.");
		}
		else if(document.getElementById("memail").value.indexOf("@") == -1){	//문자열 중에서 @라는 것이 포함되어 있는지 찾는 것
			alert("올바른 이메일 주소를 입력해주세요.");
		}
		else{
			f.submit();
		}
	}
}