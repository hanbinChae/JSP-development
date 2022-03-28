<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	String id = Util.getParamNN(request.getParameter("id"));
	String updated_content = Util.getParamNN(request.getParameter("content"));
	String title = Util.getParamNN(request.getParameter("title"));
	
	Connection conn = Util.getConnection();
	Statement stmt = conn.createStatement();
	String sql = "update page_prac set content = '"+updated_content+"', title='"+title+"' where id = '"+id+"'";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	response.sendRedirect("../content.jsp?id="+id);
%>