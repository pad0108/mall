<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--스타일 태그 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class = "container">
<%
	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	//출력 확인
	System.out.println(noticeId + " < ------");
	Notice n = new Notice();
	NoticeDao noticeDao = new NoticeDao();
	n = noticeDao.selectNoticeOne(noticeId);
	
%>
	<h1>공지사항</h1>
	<table class="table table-bordered table-success table-striped ">
		<tr>
			<td style="width:20%;">번호:</td>
			<td style="width:80%;"><%=n.getNoticeId()%></td>			
		</tr>
		<tr>
			<td>제목:</td>
			<td><%=n.getNoticeTitle() %></td>
		</tr>
		<tr>	
			<td>작성 시간:</td>
			<td><%=n.getNoticeDate() %></td>
		</tr>
		<tr>
			<td style="padding-top:100px; padding-bottom:100px;">내용</td>
			<td ><%=n.getNoticeContent() %></td>
		</tr>
	</table>
	<!-- 메인페이지로 돌아가기 -->
	<div class="btn btn-outline-dark text-light">
	<a href="<%=request.getContextPath()%>/index.jsp">뒤로 가기</a>
	</div>
</div>
</body>
</html>