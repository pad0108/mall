<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
	//로그아웃인 경우 인덱스 페이지로 이동
	if(session.getAttribute("loginMemberEmail") ==null){
	response.sendRedirect(request.getContextPath()+"/index.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트 스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 아이콘 사용 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<%
	MemberDao memberDao = new MemberDao();
	// 세션으로 이메일 받아와서 tostring으로 형 변환 
	System.out.println(session.getAttribute("loginMemberEmail").toString()+"<----------------------");
	Member member = memberDao.selectMemberListByEmail(session.getAttribute("loginMemberEmail").toString());
	System.out.println(member.getMemberEmail() + member.getMemberName() + member.getMemberDate() + member.getMemberState() + "<-------");
	%>
	<br>
	<h1 style="text-align:center;">마이 페이지</h1>
	<br>
	<table style="margin:auto;text-align:center;"class="table">
		<tr>
			<td>이메일:</td>
			<td><%=member.getMemberEmail()%></td>
		</tr>
		<tr>
			<td>이름:</td>
			<td><%=member.getMemberName()%></td>
		</tr>
		<tr>
			<td>가입 날짜:</td>
			<td><%=member.getMemberDate()%></td>
		</tr>
		<tr>
			<td>상태:</td>
		<%
			if(member.getMemberState().equals("Y")){ 
		%>	
			<td><a class="btn btn-outline-success">활동 중</a></td>
		<%
			}else{
		%>
			<td><a class="btn btn-outline-danger">탈퇴</a></td>
		<%
			}
		%>
		</tr>
	</table>
	
	<div style="margin-top:30px;">
		<jsp:include page="/inc/bottomMenu.jsp"></jsp:include>
	</div>
</div>
</body>
</html>