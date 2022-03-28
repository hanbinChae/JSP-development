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
	.selected3{
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
		String sql = "SELECT m.custno, m.custname, m.grade, (sum(mo.amount*mo.pcost)) total from member_tbl_02 m JOIN money_tbl_02 mo ON m.custno = mo.custno GROUP BY m.custno, m.custname, m.grade ORDER BY total DESC";
		ResultSet rs = stmt.executeQuery(sql);
		
	%>
		<h2>회원매출조회</h2>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td><%=rs.getString("custno") %></td>
				<td><%=rs.getString("custname") %></td>
				<td><%
					switch(rs.getString("grade")){
					case "A":out.print("VIP"); break;
					case "B":out.print("일반"); break;
					case "C":out.print("직원"); break;
					}
				%></td>
				<td><%=rs.getString("total") %></td>
			</tr>
			<%} %>
		</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>