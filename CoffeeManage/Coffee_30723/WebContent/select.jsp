<%@page import ="java.sql.*" %>
<%@page import ="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style>.selected2{text-decoration:underline; color:"white";}</style>
<link rel="stylesheet" href="CSS.css">
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
			String sql = "SELECT sl.saleno, sl.pcode, TO_CHAR(sl.saledate,'YYYY-MM-DD') saledate, sl.scode, p.name, sl.amount, TO_CHAR(p.cost*sl.amount,'999,999,999,999') total FROM tbl_salelist_01 sl JOIN tbl_product_01 p ON sl.pcode = p.pcode";
			ResultSet rs = stmt.executeQuery(sql);
		%>
		<h2>판매현황</h2>
		<table border="1">
			<tr>
				<td>판매번호</td>
				<td>상품코드</td>
				<td>판매날짜</td>
				<td>매장코드</td>
				<td>상품명</td>
				<td>판매수량</td>
				<td>총판매액</td>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td><%=rs.getString("saleno") %></td>
				<td><%=rs.getString("pcode") %></td>
				<td><%=rs.getString("saledate") %></td>
				<td><%=rs.getString("scode") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("amount") %></td>
				<td><%=rs.getString("total") %></td>
			</tr>
			<%} %>
		</table>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>