<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<!-- 부트 스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 아이콘 사용 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
</head>
<%
	CategoryDao categoryDao = new CategoryDao();
	//전체 카테고리 리스트
	ArrayList<Category> list = categoryDao.selectCategoryList();
	//추천 카테고리 리스트
	ArrayList<Category> list2 = categoryDao.selectCategoryCKList();
	
%>
<body>
<!-- 두번째 클라이언트에서 커밋 -->
<div class = "container">
	<div>
      <jsp:include page="/inc/menu.jsp"></jsp:include>
   </div>
	<div><!-- 전체 카테고리 / 이미지 배너 -->
		<div class = "row">
			<div class="col-sm-3">
				<div class="btn-group-vertical btn-block">
				<a href="#" class = "btn btn-primary" style="margin-top:8px">전체 보기</a>
				<%
					for(Category c : list){
				%>
					<a href="#" class = "btn btn-primary" style="margin-top:8px"><%= c.getCategoryName() %></a>
				<%
					}
				%>
				</div>
			</div>
			<div class="col-sm-9">
				<img src="<%= request.getContextPath()%>/image/center.jpg">
			</div>
		</div>
	</div>
	<div class="row"><!-- 추천 카테고리 -->
		<table width="100%" style="text-align:center;">
			<tr>
		<%
			for(Category c :list2){
		%>
			<td ><a href="">
				<img src="<%=request.getContextPath()%>/image/<%=c.getCategoryPic()%>" class="rounded-circle" width="200" height="200">
				</a>
			</td>
			<td>
				<a href="#" class = "btn btn-primary"><%= c.getCategoryName() %></a>
			</td>			
		<%
			}
		%>
		</tr>
		</table>
	</div>
	<%
		Calendar today = Calendar.getInstance(); //new Calendar()
	%>
	<div><!-- 카테고리 추천 상품 -->
		<h3>오늘의 추천 상품<span class="badge badge-primary"><%=today.get(Calendar.YEAR) %>.<%=today.get(Calendar.MONTH)+1 %>.<%=today.get(Calendar.DAY_OF_MONTH) %></span></h3>
	</div>
	<div>
		<%
					for(Category c : list){
				%>
					<a href="#" class = "btn btn-primary"><%= c.getCategoryName() %></a>
				<%
					}
				%>
	</div>
	<%
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = productDao.selectProductList();
	%>
	<!-- 상품목록 -->
	<table>
		<tr>
			<%
				int i = 0;
				for(Product p : productList){
					i=i+1;
			%>
			<td>
				<div class="card" style="width:400px">
					<img class="card-img-top" src="<%=request.getContextPath()%>/image/<%=p.getProductPic()%>">
					<div class="card-body">
					<h4 class="card-title">
						<a href="<%=request.getContextPath()%>/product/productOne.jsp?productId=<%=p.getProductId()%>">
						<%=p.getProductName() %></a>
					</h4>
					<p class="card-text"><%=p.getProductPrice() %>원</p>
					</div>
				</div>
			</td>
			<%
					if(i%3==0){
			%>
			</tr><tr>
			<%
					}
				}
			%>
		</tr>
	</table>
	
	<!-- 최근 공지 2개 -->
	<%
		NoticeDao noticeDao = new NoticeDao();
		ArrayList<Notice> noticeList = noticeDao.selectNoticeList();
	%>
	<br>
	<div class="row">
		<div class="col-sm-3">
		<!-- 공지사항 전체 리스트로 이동 -->
			<a href="<%=request.getContextPath()%>/notice/noticeList.jsp"><h2 style="padding-top:25px; text-align:right;">공지사항</h2></a>
		</div>
		<div class="col-sm-9">
		<table class = "table">
			<tbody>
				<%
					for(Notice n : noticeList){
				%>
					<tr>
						<td><%=n.getNoticeId() %></td>
						<td><a href ="<%=request.getContextPath()%>/notice/noticeOne.jsp?noticeId=<%=n.getNoticeId()%>"><%=n.getNoticeTitle()%></a></td>
					</tr>
				<%
					}
				%>
			</tbody>
		</table>
		</div>
	</div>
	<div>
      <jsp:include page="/inc/bottomMenu.jsp"></jsp:include>
   </div>
</div>
</body>
</html>