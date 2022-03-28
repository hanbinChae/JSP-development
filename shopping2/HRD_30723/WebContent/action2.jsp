<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
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
	
		String id = Util.getParamNN(request.getParameter("custno"));
		String custname = Util.getParamNN(request.getParameter("custname"));
		String phone = Util.getParamNN(request.getParameter("phone"));
		String address = Util.getParamNN(request.getParameter("address"));
		String joindate = Util.getParamNN(request.getParameter("joindate"));
		String grade = Util.getParamNN(request.getParameter("grade"));
		String city = Util.getParamNN(request.getParameter("city"));
		
		
		Connection conn = Util.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "UPDATE member_tbl_02 SET custname='"+custname+"', phone = '"+phone+"', address = '"+address+"', joindate = '"+joindate+"', grade = '"+grade+"', city = '"+city+"' WHERE custno ="+id;
		stmt.executeUpdate(sql);
		response.sendRedirect("2.jsp");
	%>
</body>
</html>