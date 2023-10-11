<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="subpage">
    <div class="member_agree">
        <p>펜션 예약하기</p>
        <form id="p" method="post" action="./reser_ok.do">
            <ol class="reser_ol">
                <li>
				    <span class="reser_part1">펜션명</span>
				    <input type="hidden" id="room_name" name="pnm" value="">
				    <span class="reser_part2" id="room_name_display"></span>
				</li>
                <li>
                    <span class="reser_part1">객실선택</span>
                    <span class="reser_part2">
                        <select class="reser_select" id="r_select" name="r_select">
                            <option value="">객실선택</option>
                            <option>로즈힙 101호</option>
                            <option>튤립 102호</option>
                            <option>레몬 201호</option>
                            <option>만다리 202호</option>
                            <option>피치 301호</option>
                            <option>올리비아 302호</option>
                        </select>
                    </span>
                </li>
                <li>
                    <span class="reser_part1" id="date_select" name="date_select">일자선택</span>
                    <span class="reser_part2">
                        <input type="datetime-local" class="reser_input" name="date_select">
                    </span>
                </li>
                <li>
                    <span class="reser_part1">객실구조</span>
                    <span class="reser_part2">
                        방2, 주방1, 화장실1, 거실1
                    </span>
                </li>
                <li>
                    <span class="reser_part1">입실인원</span>
                    <span class="reser_part2">
                        기준 3인 / 최대 4인
                    </span>
                </li>
                <li>
                    <span class="reser_part1">추가인원</span>
                    <span class="reser_part2">
                        기준인원 초과시 추가요금이 발생합니다.
                    </span>
                </li>
                <li>
				    <span class="reser_part1">구매금액</span>
				    <input type="hidden" id="room_money" name="pmoney" value="">
				    <span class="reser_part2" id="room_money_display"></span>
				</li>
            </ol>
            <p>예약자정보 입력</p>
            <ol class="reser_ol">
                <li>
                    <span class="reser_part1">예약자명</span>
                    <span class="reser_part2" id="pname">
                        <input type="text" class="reser_input" maxlength="30" name="pname">
                    </span>
                </li>
                <li>
                    <span class="reser_part1">휴대폰</span>
                    <span class="reser_part2" id="ptel">
                        <input type="number" class="reser_input" maxlength="11" name="ptel">
                    </span>
                </li>
                <li>
                    <span class="reser_part1">입실인원</span>
                    <span class="reser_part2">
                        <select class="reser_select" id="per_select" name="per_select">
                            <option value="">입실 인원 선택</option>
                            <option>1인</option>
                            <option>2인</option>
                            <option>3인</option>
                            <option>4인</option>
                            <option>5인</option>
                        </select>
                    </span>
                </li>
                <li>
                    <span class="reser_part1">이메일</span>
                    <span class="reser_part2" id="pemail">
                        <input type="email" class="reser_input" maxlength="50" name="pemail">
                    </span>
                </li>
            </ol>
            <input type="button" class="member_agreebtn" value="예약하기" onclick="reserok()"></input>
        </form>
    </div>
</section>

<script>
	function reserok() {
	    //예약하기
		if(document.querySelector("#r_select").value == ""){
	        alert("객실을 선택해주세요.");
	    }
	    else if(document.querySelector("input[type='datetime-local']").value == ""){
	        alert("일자를 선택해주세요.");
	    }
	    else if(document.querySelector("#per_select").value == ""){
	        alert("입실 인원을 선택해주세요.");
	    }
	    else{
	        // 현재 날짜와 시간 가져오기
	        var now = new Date();
	        
	        // 사용자가 선택한 날짜와 시간 가져오기
	        var selectedDate = new Date(document.querySelector("input[type='datetime-local']").value);
	        
	        // 두 날짜 비교하기
	        if(selectedDate < now) {
	            // 사용자가 선택한 날짜가 현재 날짜보다 이전인 경우
	            alert("지난 날짜는 선택할 수 없습니다.");
	        } 
	        else {
	            p.submit();
	        }
	    }
	}

	var params = new URLSearchParams(window.location.search);
	var room = document.getElementById("room_name");
	var roomDisplay = document.getElementById("room_name_display");
	var money = document.getElementById("room_money");
	var moneyDisplay = document.getElementById("room_money_display");

	room.value = params.get("pnm");
	roomDisplay.innerHTML = params.get("pnm");
	money.value = params.get("pmoney");
	moneyDisplay.innerHTML = Number(params.get("pmoney")).toLocaleString() + "원";

	
	//예약하기 목록에 이름과 전화번호와 이메일 데이터베이스에서 꺼내 적용하기
	var name = "<%= session.getAttribute("username") %>";
	var tel = "<%= session.getAttribute("usertel") %>";
	var email = "<%= session.getAttribute("useremail") %>";
	
	document.querySelector("#pname input").value = name;
	document.querySelector("#ptel input").value = tel;
	document.querySelector("#pemail input").value = email;
	
	//readOnly 효과 주어주기
	document.querySelector("#pname input").readOnly = true;
	document.querySelector("#ptel input").readOnly = true;
	document.querySelector("#pemail input").readOnly = true;
</script>