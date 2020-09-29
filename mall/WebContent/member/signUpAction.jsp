<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*" %>
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
	String memberName = request.getParameter("memberName");
	
	System.out.println(memberEmail+"<--------");
	System.out.println(memberPw+"<--------");
	System.out.println(memberName+"<--------");
	
	//중복된 이메일 여부 확인
	MemberDao memberDao = new MemberDao();
	Member member = memberDao.selectMemberEmailCk(memberEmail); //가입 이메일 체크 메서드 호출
	if(member !=null){
		System.out.println("이미 사용 중인 이메일입니다.");
		response.sendRedirect(request.getContextPath()+"/member/signUp.jsp");
		return;
	}
	
	Member paramMember = new Member();
	paramMember.setMemberEmail(memberEmail);
	paramMember.setMemberPw(memberPw);
	paramMember.setMemberName(memberName);
	memberDao.insertMember(paramMember); // 회원 가입 메소드 호출
	
	response.sendRedirect(request.getContextPath()+"/member/login.jsp");
%>