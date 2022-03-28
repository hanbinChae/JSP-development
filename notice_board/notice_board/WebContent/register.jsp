<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
<link rel="stylesheet" href="/Paging/CSS/css.css">
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
	<div class="box">
		<!-- nav 시작 -->
		<div class="login_nav">
				<label id="ment" class="left">Register Page</label>
			<div class="login">
				<a href="index.jsp"><button class="img-thumbnail">홈으로</button></a>
			</div>
		</div>
		<!-- nav 끝 -->
		<div class="section">
		
		<!-- section 시작 -->
		<form class="form-horizontal" action="/Paging/Action/rst_action.jsp" method="get">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">ID</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="identify" placeholder="ID"
						style="width: 500px;">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="pw"
						placeholder="Password" style="width: 500px;">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="name"
						placeholder="Nickname" style="width: 500px;">
				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">register</button>
					<button type="reset" class="btn btn-default">reset</button>
				</div>
			</div>
		</form>
		</div>
		<!-- section 종료 -->
		
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>