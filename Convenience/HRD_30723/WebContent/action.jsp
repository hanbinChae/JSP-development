<%@page import ="java.sql.*" %>
<%@page import ="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
			request.setCharacterEncoding("UTF-8");
		
			String goods_cd = Util.getParamNN(request.getParameter("goods_cd"));
			String goods_nm = Util.getParamNN(request.getParameter("goods_nm"));
			String goods_price = Util.getParamNN(request.getParameter("goods_price"));
			String cost = Util.getParamNN(request.getParameter("cost"));
			String in_date = Util.getParamNN(request.getParameter("in_date"));
	
			Connection conn = Util.getConnection();
			Statement stmt = conn.createStatement();
			String sql = "INSERT INTO tbl_goods_01 VALUES('"+goods_cd+"','"+goods_nm+"',"+goods_price+","+cost+",'"+in_date+"')";
			stmt.executeUpdate(sql);
			response.sendRedirect("2.jsp");
		%>
</body>
</html>