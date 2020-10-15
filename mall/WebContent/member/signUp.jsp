<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--스타일 태그 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 스크립트 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#btn").click(function(){
			//유효성 검사 코드
			if($("#memberEmail").val == ""){
				alert("이메일을 입력해주세요.");
				return;
			}else if($("#memberPw").val == ""){
				alert("비밀번호를 입력해주세요.");
				return;
			}else if($("#memberName").val == ""){
				alert("이름을 입력해주세요.");
				return;
			}
			//submit to action
			$("#signupForm").submit();
		});
	});
</script>
</head>
<body>
<div class = "container">
	<h1>회원 가입</h1>
	<form method="post" action="<%=request.getContextPath()%>/member/signUpAction.jsp" id="signupForm">
		<table class = "table">
			<tr>
				<td>이메일</td>
				<td><input type="text" name="memberEmail" id="memberEmail"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="memberPw" id="memberPw"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="memberName" id="memberName"></td>
			</tr>
		</table>
		<div style="text-align:right;">
			<button type="button" id="btn" class="btn btn-primary">회원가입</button>
			<a href="<%=request.getContextPath()%>/member/login.jsp" class="btn btn-secondary">뒤로가기</a>
		</div>
	</form>
</div>
</body>
</html>