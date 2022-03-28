<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
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
		
		String id = Util.getParamNN(request.getParameter("identify"));
		String last_pw = Util.getParamNN(request.getParameter("pw"));
		String name = Util.getParamNN(request.getParameter("name"));		
	
		String pw = Util.sha256(last_pw);
		
		Connection conn = Util.getConnection();
		Statement stmt = conn.createStatement();
		String sql="INSERT INTO userinfo VALUES('"+id+"','"+pw+"','"+name+"')";
		stmt.executeUpdate(sql);
		response.sendRedirect("../login.jsp");
		
	%>
</body>
</html>