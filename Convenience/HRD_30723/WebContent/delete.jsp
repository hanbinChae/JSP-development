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
		
		String id = Util.getParamNN(request.getParameter("id"));
	
		Connection conn = Util.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "delete from tbl_goods_01 where goods_cd = '"+id+"'";
		stmt.executeUpdate(sql);
		response.sendRedirect("2.jsp");
	%>
</body>
</html>