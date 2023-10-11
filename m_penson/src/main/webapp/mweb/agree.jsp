<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="subpage">
    <div class="member_agree">
    <p>회원가입 약관동의</p>
    <ol class="agree_ol">
    <li><label><input type="checkbox" class="ckbox" onclick="check_all_agree()"> 이용약관의 동의</label><span class="agree_info">[자세히 보기]</span></li>
    <li><label><input type="checkbox" class="ckbox" onclick="check_all_agree()"> 개인정보 수집의 동의</label><span class="agree_info">[자세히 보기]</span></li>
    <li><label><input type="checkbox" class="ckbox" onclick="check_all_agree()"> 개인정보 제3자 제공 동의</label><span class="agree_info">[자세히 보기]</span></li>
    <li><label><input type="checkbox" class="ckbox" onclick="check_all_agree()"> 개인정보 위탁제공 동의</label><span class="agree_info">[자세히 보기]</span></li>
    <li><label><input type="checkbox" class="ckbox" onclick="check_all_agree()"> 마케팅 활용 동의 (선택)</label><span class="agree_info">[자세히 보기]</span></li>
    <li><label><input type="checkbox" class="ckbox" id="all_agree" onclick="all_agree()"> 위 약관에 모두 동의 합니다.</label></li>
    </ol>
    <div class="member_agreebtn" onclick="agree_ok()">기본정보 등록하기</div>
    </div>
</section>

<script>
	function all_agree() {
	  var all_agree = document.getElementById("all_agree");
	  var ckboxes = document.querySelectorAll(".ckbox");
	  for (var i = 0; i < ckboxes.length; i++) {
	    if (all_agree.checked) {
	      ckboxes[i].checked = true;
	    } else {
	      ckboxes[i].checked = false;
	    }
	  }
	}
	
	function check_all_agree() {
	  var all_checked = true;
	  var ckboxes = document.querySelectorAll(".ckbox");
	  for (var i = 0; i < ckboxes.length - 1; i++) {
	    if (!ckboxes[i].checked) {
	      all_checked = false;
	      break;
	    }
	  }
	  document.getElementById("all_agree").checked = all_checked;
	}
	
	function agree_ok() {
	  var ckboxes = document.querySelectorAll(".ckbox");
	  var all_checked = true;
	  for (var i = 0; i < ckboxes.length - 1; i++) {
	    if (!ckboxes[i].checked) {
	      all_checked = false;
	      break;
	    }
	  }
	  if (all_checked) {
	    window.location.href = "join_step2.jsp";
	  } else {
	    alert("회원가입 약관에 필수 사항은 모두 체크 하셔야 회원가입이 진행 됩니다.");
	  }
	}
</script>