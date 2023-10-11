<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호텔 & 펜션 예약시스템</title>
    <link rel="stylesheet" type="text/css" href="./css/m_index.css?v=1">
    <link rel="stylesheet" type="text/css" href="./css/m_sub.css?v=1">
    <script src="./js/m_index.js"></script>
</head>
<body>
<!-- 상단 시작 -->
<%@ include file="./top.jsp" %>
<!-- 상단 끝 -->

<main>
<!-- 배너 시작 -->
<%@ include file="./banner.jsp" %>
<!-- 배너 끝 -->

<!-- 중간 -->
<%@ include file="./agree.jsp" %>
<!-- 중간 끝 -->

<!-- 퀵메뉴 -->
<%@ include file="./qmenu.jsp" %>
<!-- 퀵메뉴 끝 -->
</main>


<footer>
<!-- 하단 시작 -->
<%@ include file="./copy.jsp" %>
<!-- 하단 끝 -->
</footer>

</body>
</html>