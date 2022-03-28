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
<title><%=id %>번 글 수정하기</title>
<!-- 로그인 전/후 화면 수정 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="/Paging/CSS/css.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="../Paging/CSS/content_script.js"></script>

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
			<div class="login_nav">
				<label id="ment" class="left">Login Page</label>
	
				<div class="login">
					<a href="index.jsp"><button class="img-thumbnail">홈으로</button></a>
				</div>
	
			</div>
			
			<div class="section">
				<div style="margin: 0 auto;">
						<div style="margin: 0 auto; display: grid; margin-bottom: 10px; background-color: gray; height: 30px;">
							<input class="title" type="text" value="<%=rs.getString("title") %>" style="width: 400px; height: 20px; float: left; font-weight: bold; margin-left: 10px; margin-top: 5px;">
						</div>
						<div style="margin: 0 auto;">
							<pre style="text-align: left;">
								<textarea rows="10" cols="30" name="updated_content" class="updated_content" style="float: left; width: 400px; height: 200px; word-wrap:break-word; font-size: revert; color: navy;"><%=rs.getString("content")%></textarea>
							</pre>
						</div>
					<div style="margin:0 auto; margin-top: 20px; margin-bottom: 30px;">
							<button class="btn btn-info" onclick="return goUpdate(<%=id%>);" id="test">수정완료</button>			
					</div>
				</div>
			
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
	</div>
	
</body>
</html>