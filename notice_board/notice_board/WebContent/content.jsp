<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	String id = Util.getParamNN(request.getParameter("id"));

	Connection conn = Util.getConnection();
	Statement stmt = conn.createStatement();
	String sql = "select * from page_prac where id = '"+id+"'";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=id %>번 글</title>
<!-- 로그인 전/후 화면 수정 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="/Paging/CSS/css.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
	button{
		margin-right: 6px;
	}
</style>
</head>
<body>
	<div class="box">
		<div class="header">
			<div style="">
				<a href="index.jsp"><img alt="err"
					src="/Paging/images/채한빈 필기체.png"></a>
			</div>

			<div class="nav">
				<div class="left">
					<label id="ment">Contents Page</label>
				</div>
			</div>		
		</div>
		
		<script type="text/javascript" src="/Paging/CSS/content_script.js"></script>
	
		<!-- section 시작 -->
		<div class="section">
			<div style="margin: 0 auto;">
				<h2 style="color: navy; margin-bottom: 30px;"><%=rs.getString("title") %></h2>
			</div>
			
			<div style="margin: 0 auto; text-align: left;">
				<pre style=" height: 300px; font-size: 16px; font-family: initial;"><%=rs.getString("content") %></pre>
			</div>
			<div style="margin:0 auto; margin-top: 20px; margin-bottom: 30px;">
				<button class="btn btn-danger" onclick="return CheckClick(<%=id%>);">삭제</button>
				<a href="update.jsp?id=<%=id%>"><button class="btn btn-info">수정</button></a>
				<a href="index.jsp"><button class="btn btn-dark">홈으로</button></a>
			</div>
		</div>
		
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	
	
</body>
</html>