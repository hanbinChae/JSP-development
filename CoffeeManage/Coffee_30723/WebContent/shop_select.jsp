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
<style>.selected3{text-decoration:underline; color:"white";}</style>
</head>
<body> 
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<%
			request.setCharacterEncoding("UTF-8");
			Connection conn = null;
			Statement stmt = null;
			conn = Util.getConnection();
			stmt = conn.createStatement();
			String sql = "SELECT ts.scode scode, ts.sname sname, TO_CHAR(SUM(tp.cost * tsl.amount), "+
				"'999,999,999,999') "+"cost FROM tbl_product_01 tp INNER JOIN tbl_salelist_01 tsl ON tp.pcode = " 
				+ "tsl.pcode INNER JOIN tbl_shop_01 ts ON tsl.scode = ts.scode GROUP BY ts.scode, ts.sname"
				+" ORDER BY 1";
			ResultSet rs = stmt.executeQuery(sql);
		%>
		<h2>매장별 판매액</h2>
		<table border="1">
			<tr>
				<td>매장코드</td>
				<td>매장명</td>
				<td>매장별 판매액</td>
				
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td><%=rs.getString("scode") %></td>
				<td><%=rs.getString("sname") %></td>
				<td><%=rs.getString("cost") %></td>
				
			</tr>
			<%} %>
		</table>
		
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>