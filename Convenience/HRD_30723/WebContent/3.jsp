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
			String sql = "select g.goods_cd, g.goods_nm, TO_CHAR((g.goods_price*sum(s.sale_cnt)),'999,999') total, TO_CHAR((g.goods_price*sum(s.sale_cnt))-(g.cost*sum(s.sale_cnt)),'999,999') real_total from tbl_goods_01 g JOIN tbl_sale_01 s ON g.goods_cd = s.goods_cd GROUP BY g.goods_cd, g.goods_nm, g.goods_price, g.cost ORDER BY real_total DESC";
			ResultSet rs = stmt.executeQuery(sql);
		%>
		<h2>매출현황</h2>
		
		<table border="1">
			<tr>
				<td>상품코드</td>
				<td>상품명</td>
				<td>매출</td>
				<td>순이익</td>
			</tr>
			<%while(rs.next()) {%>
			<tr>
				<td><%=rs.getString("goods_cd") %></td>
				<td><%=rs.getString("goods_nm") %></td>
				<td>￦<%=rs.getString("total") %></td>
				<td>￦<%=rs.getString("real_total") %></td>
			</tr>
			<%} %>
		</table>
		
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>