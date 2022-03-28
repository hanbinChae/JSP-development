<%@page import ="java.sql.*" %>
<%@page import ="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매등록화면</title>
<link rel="stylesheet" href="CSS.css">
<style>.selected1{text-decoration:underline; color:"white";}</style>
<script type="text/javascript" src="script.js"></script>
</head>
<body> 
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
	
	<h2>판매등록</h2>
	
	<form name="action" action="action.jsp" method = "get">
		<table border="1">
			<tr>
				<td>판매번호</td>
				<td><input type="text" name="saleno" id="saleno"></td>
			</tr>
			<tr>
				<td>상품코드</td>
				<td><input type="text" name="pcode" id="pcode"></td>
			</tr>
			<tr>
				<td>판매날짜</td>
				<td><input type="text" name="saledate" id="saledate"></td>
			</tr>
			<tr>
				<td>매장코드</td>
				<td><input type="text" name="scode" id="scode"></td>
			</tr>
			<tr>
				<td>판매수량</td>
				<td><input type="text" name="amount" id="amount"></td>
			</tr>
			<tr>
				<td colspan="2"><input  style="margin-left: 66px;" type="submit" value="등록" onclick="check()"> <input type="reset" value="다시쓰기" onclick="re()"></td>
			</tr>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>