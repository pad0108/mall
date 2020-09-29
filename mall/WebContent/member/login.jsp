<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--스타일 태그 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	if(session.getAttribute("loginMemberEmail") !=null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
%>

<div class="container">
	<a href="<%=request.getContextPath()%>/index.jsp" class ="text-dark"><h1 style="text-align:center;">GoodeeShop</h1></a>
	<form method="post" action="<%=request.getContextPath() %>/member/loginAction.jsp">
		<table class = "table table-borderless"style="text-align:center;">
			<tr>
				<td>
					<input type="text" name="memberEmail" class="form-control" placeholder="이메일">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="memberPw" class="form-control" placeholder="비밀번호">
				</td>
			</tr>
		</table>
		<div style="text-align:right;">
		<button type="submit" class=" btn btn-primary" >로그인</button>
		<a href="<%=request.getContextPath() %>/member/signUp.jsp" class=" btn btn-primary">회원가입</a>
		</div>
	</form>
</div>
</body>
</html>