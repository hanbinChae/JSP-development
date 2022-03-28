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
	
		String saleno = Util.getParamNN(request.getParameter("saleno"));
		String pcode = Util.getParamNN(request.getParameter("pcode"));
	 	String saledate = Util.getParamNN(request.getParameter("saledate"));
		String scode = Util.getParamNN(request.getParameter("scode"));
		String amount = Util.getParamNN(request.getParameter("amount"));
	
		Connection conn = null;
		Statement stmt = null;
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "INSERT INTO tbl_salelist_01 VALUES("+saleno+",'"+pcode+"','"+saledate+"','"+scode+"',"+amount+")";
		
		stmt.executeUpdate(sql);
		response.sendRedirect("select.jsp");
		           
	%>
</body>
</html>