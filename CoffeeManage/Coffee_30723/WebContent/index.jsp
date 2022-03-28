<%@page import ="java.sql.*" %>
<%@page import ="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="CSS.css">
<style>.selected5{text-decoration:underline; color:"white";}</style>
</head>
<body> 
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
	<h3>매장별 커피 판매관리 프로그램</h3>
	
	<p style="padding-left: 15px;">매장별 커피 판매를 관리하기 위한 프로그램이다.</p>
	<br>
	<p id="mg">1. 상품테이블, 매장테이블, 판매테이블을 추가한다.</p>
	<p id="mg">2. 판매등록, 판매현황, 매장별판매액, 상품별판매액 페이지를 작성한다.</p>
	<p id="mg">3. 올바르게 구현되었는지를 확인한다.</p>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>