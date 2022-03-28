<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>30723_채한빈</title>
<!-- 로그인 전/후 화면 수정 -->
<link rel="stylesheet" href="/Paging/CSS/css.css">
<link rel="stylesheet" href="/Paging/CSS/notlog_CSS.css">

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
		<%
		//HttpSession ses = request.getSession(true);
		String userid = (String) session.getAttribute("userid");
		if (userid == null) {
		%>
		<div class="header">
			<div style="">
				<a href="index.jsp"><img alt="err" src="/Paging/images/채한빈 필기체.png"></a>
			</div>
		
			<div class="nav">
				<div class="left">
					<label id="ment">Index Page</label>
				</div>
		
				<div class="login" style="float: right;">
					<a href="login.jsp"><button class="img-thumbnail">로그인</button></a> <a
						href="register.jsp"><button class="img-thumbnail">회원가입</button></a>
				</div>
			</div>
		</div>
		
		<div class="section">
	<!-- 현재 작업중 -->
			<div id = "sec_title">
				<h2>자유게시판</h2>
			</div>		
			<div id="sec_nav">
				<a>HOME</a><span>|</span><a href="register.jsp">회원가입</a><span>|</span><a href="login.jsp">로그인</a><span>|</span><a>게시판</a>
			</div>
			<div id="sec_box1">
				<ul>
					<li>응용프로그래밍 과목에서 배운 내용을 활용하여 만들어진 게시판입니다.</li>
					<li style="margin-top: 10px;">회원가입을 통해 게시글 열람과 등록, 특정 키워드를 이용해 검색 할 수 있습니다.</li>
				</ul>
			</div>
	<!-- 작업중 -->
		</div>
		<%
		} else {
		%>
		<div class="header">
			<div style="">
				<img alt="err" src="/Paging/images/채한빈 필기체.png">
			</div>
		
			<div class="nav">
				<div class="left" style="float:left;">
					<label id="ment">Index Page</label>
				</div>
				<div style="float: right">
					<a href="index.jsp" style="color:white; margin-right:20px; text-decoration: none; font-size: 20px; font-weight: bold;"><p style="color: black;"><%=userid%>님</p></a>
					<a href="/Paging/Action/logout_action.jsp" style="margin-right: 20px; margin-left: 10px;"><button class="img-thumbnail">로그아웃</button></a>
				</div>
				
				<div class="user" style="float: right; display: flex; margin-top: 50px;">
				
					<form action="search_result.jsp" method="get">
						<select name="SearchWhat">
							
							<option value="title" selected="selected">제목</option>
							<option value="name">작성자</option>
						</select>
						<input type="text" style="width: 150px;" name="Search_value">
						<input style="margin-right: 20px;" class="img-thumbnail" type="submit" value="검색">
					</form>	
						
				</div>
			</div>
		</div>
		

	<div class="section">

		<!--  기능 영역 -->
		<%
		request.setCharacterEncoding("UTF-8");
		String page_no = Util.getParamNN(request.getParameter("page_no"));
		Connection conn = Util.getConnection();
		Statement stmt = conn.createStatement();

		String sql = "SELECT * FROM( " + "SELECT A.*, " + "ROWNUM AS RNUM, " + "COUNT(*) OVER() AS TOTCNT "
				+ "FROM ( SELECT * FROM page_prac " + "ORDER BY id desc ) A ) " + "WHERE " + "RNUM > 10 * (" + page_no
				+ " - 1) " + "AND RNUM <= " + page_no + "*10";

		ResultSet rs = stmt.executeQuery(sql);
		%>
		
		<%
		Statement stmt2 = conn.createStatement();
		String sql2 = "SELECT COUNT(*) cnt FROM page_prac";
		ResultSet rs2 = stmt2.executeQuery(sql2);
		rs2.next();
		int pageno = (int) Math.ceil(rs2.getDouble("cnt") / 10);
		int cur = Integer.parseInt(page_no);
		%>
		<!-- 게시판 제목 영역 -->
		<div style="width: 100%; margin-left: 300px;">
			<h2 style="margin-bottom: 20px; color: navy; margin-right: 700
px;"> <%=cur%>페이지 </h2>
		</div>
		<!--    게시판 내용 영역-->
		<table class="table table-condensed" >
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


	<!--    게시판 페이징 영역-->
	<div class="page_nav" style="width: 100%;">
		<a href="index.jsp?page_no=1"><div class="img-thumbnail"><<</div></a>
		<%if(cur>1){ %>
			 <div class="img-thumbnail"><a href="index.jsp?page_no=<%=cur - 1%>"><</a></div>
		<%
		}
		for (int i = 1; i <= pageno; i++) {
		%>

		<a href="index.jsp?page_no=<%=i%>"> 
			<%
			 	if (cur == i) {
			 %>
				<div class="img-thumbnail" style="color: red;"><%=i%></div> <%
			 } else {
			 %>
				<div class="img-thumbnail"><%=i%></div> <%
			 }
			 %>
		</a>

		<%
		}
		%>
		<%if(cur<pageno){ %>
			<a href="index.jsp?page_no=<%=cur + 1%>">
			<div class="img-thumbnail">></div></a> 
		<%} %>
		<a href="index.jsp?page_no=<%=pageno%>"><div class="img-thumbnail">>></div></a>
		<br>
		<%if (userid != null) { %>
			<br>
			<a href="insert.jsp"><div class="img-thumbnail">글작성</div></a>
		<%} %>
	</div>
	<%
		}
		%>
	<!--    FOOTER영역-->
	<jsp:include page="footer.jsp"></jsp:include>
	
	</div>
</body>
</html>