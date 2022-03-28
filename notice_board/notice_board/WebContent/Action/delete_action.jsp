<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = Util.getParamNN(request.getParameter("id"));
	
	Connection conn = Util.getConnection();
	Statement stmt = conn.createStatement();
	String sql = "delete from page_prac where id = '"+id+"'";
	stmt.executeUpdate(sql);
	response.sendRedirect("../index.jsp");
%>
