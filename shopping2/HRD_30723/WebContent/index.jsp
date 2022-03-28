<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="css.css">
<style type="text/css">
	.selected4{
	color:gold;
	text-decoration: underline;}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>쇼핑몰 회원관리 프로그램</h2>
		<p>쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리프로그램을 작성하는 프로그램이다.</p>
		<p>프로그램 작성 순서</p>
		<ol>
			<li>회원정보 테이블을 생성한다.</li>
			<li>매출정보 테이블을 생성한다.</li>
			<li>회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.</li>
			<li>회원정보 입력 화면프로그램을 작성한다.</li>
			<li>회원정보 조회 프로그램을 작성한다.</li>
			<li>회원매출정보 조회 프로그램을 작성한다.</li>
		</ol>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>