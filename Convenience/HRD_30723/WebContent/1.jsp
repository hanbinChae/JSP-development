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
<script type="text/javascript" src="script.js"></script>
<style type="text/css">
	.selected1{
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
			String sql = "select goods_cd from tbl_goods_01 order by goods_cd DESC";
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			int goods_cd = rs.getInt("goods_cd")+1;
		%>
		<h2>상품등록</h2>
		
		<form action="action.jsp" name="action" method="get">
			<table border="1">
				<tr>
					<td>상품코드(자동입력)</td>
					<td><input type="text" name="goods_cd" value="<%= goods_cd%>"></td>
				</tr>	
				<tr>
					<td>상품명</td>
					<td><input type="text" name="goods_nm"></td>
				</tr>
				<tr>
					<td>단가</td>
					<td><input type="text" name="goods_price"></td>
				</tr>	
				<tr>
					<td>원가</td>
					<td><input type="text" name="cost"></td>
				</tr>	
				<tr>
					<td>입고일자</td>
					<td><input type="text" name="in_date"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input type="submit" value="상품등록" onclick="return check()"> <input type="reset" value="등록취소" onclick="return rst()"></td>
				</tr>	
			</table>
		</form>
	
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
