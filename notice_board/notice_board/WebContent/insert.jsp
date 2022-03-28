<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
<link rel="stylesheet" href="/Paging/CSS/insert_CSS.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js">
	
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		Connection conn = Util.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "select id from page_prac order by id DESC";
		ResultSet temp = stmt.executeQuery(sql);
		temp.next();
		
		int last_id = Integer.parseInt(temp.getString("id"))+1; 
	%>
	
	<div class="box">
		<div class="insert_nav">
			<label id="ment" class="left">Login Page</label>

			<div class="go_home">
				<a href="index.jsp"><button class="img-thumbnail">홈으로</button></a>
			</div>
		</div>
		
		<div class="section">
		<form action="Action/insert_action.jsp" method="get">
			<div class="sec_color" style="border-top: 4px solid black; height: 50px;">
				<p style="font-weight: bold; margin-top: 12px;">* 표시는 필수입력 항목입니다.</p>
			</div>
			<div style="height: auto; background-color: #dddddd;">
				<div style="background-color: navy ;float: left; width: 200px; height: 50px;"><p class="sec_title">번호</p></div>
				<div style="background-color: #ececec; width: 100%; height: 50px;"><input type="text" name="id" readonly="readonly" value="<%= last_id %>" class="s_input"></div>
			</div>
			<div style="height: auto; background-color: #dddddd;">
				<div style="background-color: navy ;float: left; width: 200px; height: 50px;"><p class="sec_title">*제목</p></div>
				<div style="background-color: #ececec; width: 100%; height: 50px;"><input type="text" name="title" required="required" class="s_input"></div>
			</div>
			<div style="height: auto; background-color: #dddddd;">
				<div style="height: 200px; background-color: navy ;float: left; width: 200px;"><p class="sec_title" style="margin-top: 85px;">*내용</p></div>
				<div style="background-color: #ececec; width: 100%; height: 200px;"><textarea class="s_input" style="height: 175px;" name="content"></textarea></div>
			</div>
			<div style="height: auto; background-color: #dddddd;">
				<div style="background-color: navy ;float: left; width: 200px; height: 50px;"><p class="sec_title">작성자</p></div>
				<div style="background-color: #ececec; width: 100%; height: 50px;"><input type="text" name="name" required="required" class="s_input"></div>
			</div>
			<div class="submit">
				<div class="sec_color" style="border-bottom: 4px solid black; height: 70px;">
					<br>
					<input type="submit" class="img-thumbnail" value="등록" onclick=""> 
					<input type="reset" class="img-thumbnail" value="초기화">
				</div>
			</div>
		</form>
		</div>

		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>