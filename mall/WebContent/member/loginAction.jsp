<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*"%>
<%@ page import = "vo.*" %>
<%
	//로그인인 경우 이 파일 접근을 막음
	if(session.getAttribute("loginMemberEmail") !=null){
		response.sendRedirect(request.getContextPath()+"/index.jsp");
		return;
	}
	request.setCharacterEncoding("utf-8");
	String memberEmail = request.getParameter("memberEmail");
	String memberPw = request.getParameter("memberPw");
	Member paramMember = new Member();
	paramMember.setMemberEmail(memberEmail);
	paramMember.setMemberPw(memberPw);
	
	MemberDao memberDao = new MemberDao();
	Member loginMember = memberDao.login(paramMember);
	
	if(loginMember == null){
%>		
		<script>
		alert("존재 하지 않은 아이디거나 비밀번호가 틀렸습니다."); // 로그인 실패시 팝업창 출력
		history.go(-1); //이전 페이지로 이동
		</script>
<%	
	}else{

		
		session.setAttribute("loginMemberEmail", loginMember.getMemberEmail());
		
		session.setAttribute("loginMemberName", loginMember.getMemberName());
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}
%>