<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		session.removeAttribute("userid");
		out.print("로그아웃 되었습니다");
		response.sendRedirect("../index.jsp");
	%>

