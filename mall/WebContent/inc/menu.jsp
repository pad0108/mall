<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
	<div><!--  상단 UI -->
		<div class = "row">
			<div class="col-sm-3"><a href="<%=request.getContextPath()%>/index.jsp" class ="text-dark"><h2>Goodee Shop</h2></a></div>
			<div class="col-sm-6">
				<form><!-- 검색바 -->
				<table >
					<tr>
					<td width="400px"><input type="text" class="form-control" ></td>
					<td align="center" width="100px"><button type="submit" class="btn btn-dark">검색</button></td>
					</tr>
				</table>
				</form>
			</div>
			<div class="col-sm-3" align="right"><!-- 로그인 여부에 따른 분기 -->
			<%
				if(session.getAttribute("loginMemberEmail") == null){
			%>
			<!-- 로그 아웃 상태 -->
			<a href="<%=request.getContextPath()%>/member/login.jsp"><i class='fas fa-user-alt' style='font-size:48px;color:black'></i></a>
			<a href="<%=request.getContextPath()%>/member/login.jsp"><i class='fas fa-shopping-cart' style='font-size:48px;color:black'></i></a>
			<%
				}else{
			%>
			<!-- 로그인 상태 -->
			<a href="<%=request.getContextPath()%>/member/myPage.jsp"><i class='fas fa-user-alt' style='font-size:48px;color:black'></i></a>
			<a href="<%=request.getContextPath()%>/orders/myOrdersList.jsp"><i class='fas fa-shopping-cart' style='font-size:48px;color:black'></i></a>
			<%
				}
			%>
			</div>
		</div>
	</div>
	
	<div><!-- 로그인/회원가입 메뉴바 -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<ul class = "navbar-nav mr-auto"></ul>
		<%
			OrdersDao ordersDao = new OrdersDao();
			if(session.getAttribute("loginMemberEmail") == null){
		%>
			<!--로그아웃 상태 -->
			<ul class="navbar-nav navbar-expand-xl bg-dark navbar-dark mr-right">
				<li class="nav-item"><a class="nav-link btn btn-primary" href="<%=request.getContextPath()%>/member/login.jsp"><font color="black">로그인</font></a></li>
				<li>&nbsp;</li>
				<li class="nav-item"><a href="<%=request.getContextPath() %>/member/signUp.jsp" class="nav-link btn btn-light"><font color="black">회원가입</font></a></li>
			</ul>
		<%
			}else{
		%>
			<!-- 로그인 상태 -->
			<ul class="navbar-nav navbar-expand-xl bg-dark navbar-dark mr-right">
				<li class="nav-item"><a class="nav-link active"><%=session.getAttribute("loginMemberName").toString()%>님 반갑습니다.</a></li>
				<li>&nbsp;</li>
				<li class="nav-item"><a class="nav-link btn btn-primary" href="<%=request.getContextPath()%>/member/logOutAction.jsp"><font color="black">로그아웃</font></a></li>
			</ul>
		<%
			}
		%>
		</nav>	
	</div>