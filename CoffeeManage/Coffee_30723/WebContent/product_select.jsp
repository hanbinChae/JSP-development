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
<style>.selected4{text-decoration:underline; color:"white";}</style>
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
			String sql = "SELECT p.pcode pcode, p.name name, TO_CHAR(SUM(p.cost * sl.amount),'999,999,999,999') cost FROM tbl_product_01 p INNER JOIN tbl_salelist_01 sl ON p.pcode = sl.pcode GROUP BY p.pcode, p.name ORDER BY 1"; 
			ResultSet rs = stmt.executeQuery(sql);
		%>
		<h2>상품별 판매액</h2>
		<table border="1">
			<tr>
				<td>상품코드</td>
				<td>상품명</td>
				<td>상품별 판매액</td>
				
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td><%=rs.getString("pcode") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("cost") %></td>
				
			</tr>
			<%} %>
		</table>
		
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>