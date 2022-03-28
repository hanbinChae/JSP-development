<%@page import ="java.sql.*" %>
<%@page import ="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>편의점 매출관리</title>
<link rel="stylesheet" href="css.css">
<style type="text/css">
	.selected4{
			color:blue;
			text-decoration: underline;
		}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2>편의점 매출 관리 프로그램</h2>
	
	<p>편의점 매출정보와 상품관리를 위한 데이터베이스를 구축하고 편의점 매출관리 프로그램을 작성하는 프로그램이다.</p>
	
	<ol>
		<li>상품정보 테이블을 생성한다.</li>
		<li>매출정보 테이블을 생성한다.</li>
		<li>매출정보 테이블에 제시된 문제지의 참조 데이터를 추가 생성한다.</li>
		<li>매출관리 프로그램을 작성한다.</li>
	</ol>
	
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>