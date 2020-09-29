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
<div class = "container">
	<h1>회원 가입</h1>
	<form method="post" action="<%=request.getContextPath()%>/member/signUpAction.jsp">
		<table class = "table">
			<tr>
				<td>이메일</td>
				<td><input type="text" name="memberEmail"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="memberPw"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="memberName"></td>
			</tr>
		</table>
		<div style="text-align:right;">
			<button type="submit" class="btn btn-primary">회원가입</button>
			<a href="<%=request.getContextPath()%>/member/login.jsp" class="btn btn-secondary">뒤로가기</a>
		</div>
	</form>
</div>
</body>
</html>