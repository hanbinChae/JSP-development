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
	.selected2{
			color:blue;
			text-decoration: underline;
		}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<%
			request.setCharacterEncoding("UTF-8");
			Connection conn = Util.getConnection();
			Statement stmt = conn.createStatement();
			String sql = "select * from tbl_goods_01";
			ResultSet rs = stmt.executeQuery(sql);
		%>
		<h2>상품관리</h2>
		<table border="1">
				<tr>
					<td>상품코드</td>
					<td>상품명</td>
					<td>단가</td>
					<td>원가</td>
					<td>입고일자</td>
					<td>삭제</td>
				</tr>	
				<%while(rs.next()){ %>
				<tr>
					<td><%=rs.getString("goods_cd") %></td>
					<td><%=rs.getString("goods_nm") %></td>
					<td><%=rs.getString("goods_price") %></td>
					<td><%=rs.getString("cost") %></td>
					<td><%=rs.getString("in_date").substring(0,10) %></td>
					<td><a href='delete.jsp?=<%=rs.getString("goods_cd") %>'><input type="button" value="삭제"></a></td>
				</tr>
				<%} %>
			</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>