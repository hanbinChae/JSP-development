<%@page import="java.sql.*" %>
<%@page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = Util.getConnection();
	
	String id = Util.getParamNN(request.getParameter("id"));	
	String title = Util.getParamNN(request.getParameter("title"));	
	String content = Util.getParamNN(request.getParameter("content"));	
	String name = Util.getParamNN(request.getParameter("name"));	

	Statement stmt2 = conn.createStatement();
	String insert_sql = "insert into page_prac values('"+id+"','"+title+"','"+content+"','"+name+"')";
	stmt2.executeUpdate(insert_sql);
	response.sendRedirect("../index.jsp");
		
%>