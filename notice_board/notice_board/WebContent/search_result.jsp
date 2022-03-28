<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<!-- 로그인 전/후 화면 수정 -->
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
					<label id="ment">Search Page</label>
				</div>
				<div style="float: right;">
					<a href="index.jsp" style="margin-right: 20px; margin-left: 10px;"><button
							class="img-thumbnail">홈으로</button></a>
				</div>
			</div>

		</div>

		<%
		request.setCharacterEncoding("UTF-8");
		Connection conn = Util.getConnection();
		Statement stmt = conn.createStatement();

		String SearchWhat = Util.getParamNN(request.getParameter("SearchWhat"));
		String Search_value = Util.getParamNN(request.getParameter("Search_value"));

		String sql = "select * from page_prac where " + SearchWhat + " LIKE '%" + Search_value + "%'";
		ResultSet rs = stmt.executeQuery(sql);
		%>

		<div class="section">
			<!-- 게시판 제목 영역 -->
			<div style="width: 100%; margin-left: 300px;">
				<h2 style="margin-bottom: 20px; color: navy;">
					<%
					switch (SearchWhat) {
					case "name":
						out.print("작성자");
						break;
					case "title":
						out.print("제목");
						break;
					}
					%>
					 "<%=Search_value%>"에 대한 검색 결과
				</h2>
			</div>
			<!--    게시판 내용 영역-->
			<table class="table table-condensed">
				<tr>
					<td>번호</td>
					<td style="width: 850px;">제목</td>
					<td>작성자</td>
				</tr>
				<%
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("id")%></td>
					<td><a href='content.jsp?id=<%=rs.getString("id")%>'><%=rs.getString("title")%></a></td>
					<td><%=rs.getString("name")%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
		<!-- section 끝 -->

		<!--    FOOTER영역-->
		<jsp:include page="footer.jsp"></jsp:include>

	</div>
</body>
</html>
</body>
</html>