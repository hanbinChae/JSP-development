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
	.selected2{
	color:gold;
	text-decoration: underline;}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = Util.getParamNN(request.getParameter("id"));
	
		Connection conn = Util.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "SELECT * from member_tbl_02";
		ResultSet rs = stmt.executeQuery(sql);
		
	%>
		<h2>홈쇼핑 회원 정보 수정</h2>
		<form action="action2.jsp" method="get" name="action">
		<table border="1">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="<%= id%>"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate"></td>
				</tr>
				<tr>
					<th>고객등급 [A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input type="submit" value="수정" onclick='alert("회원정보수정이 완료되었습니다.");'> <a href="2.jsp"><input type="button" value="조회"></a></td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>