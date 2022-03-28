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
		Connection conn = Util.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "SELECT * from member_tbl_02";
		ResultSet rs = stmt.executeQuery(sql);
		
	%>
		<h2>회원목록조회/수정</h2>
		<table border="">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td><a href='update.jsp?id=<%=rs.getString("custno") %>'><%=rs.getString("custno") %></a></td>
				<td><%=rs.getString("custname") %></td>
				<td><%=rs.getString("phone") %></td>
				<td><%=rs.getString("address") %></td>
				<td><%=rs.getString("joindate").substring(0,10)%></td>
				<td><%
					switch(rs.getString("grade")){
					case "A":out.print("VIP"); break;
					case "B":out.print("일반"); break;
					case "C":out.print("직원"); break;
					}
				%></td>
				<td><%=rs.getString("city") %></td>
			</tr>
			<%} %>
		</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>