<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"%>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
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
	//인코딩
	request.setCharacterEncoding("utf-8");
	//페이징
		int currentPage = 1; //현재 페이지
		int endPage = 0; // 마지막 페이지
		//페이지 값
		if(request.getParameter("currentPage") !=null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}	
	
		int categoryId = -1;
		if(request.getParameter("categoryId") != null){
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}
		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = null;
		if(categoryId == -1){	//전체 페이지 페이징 분기점
			productList = productDao.selectProductAllList(currentPage);
			endPage = productDao.getProductEndPage();
		}else{	//부분 페이지 페이징 분기점
			productList = productDao.selectProductListByCategoryId(categoryId,currentPage);
			endPage = productDao.getProductEndPage(categoryId);
		}
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
		
		//출력값 확인
		System.out.println(endPage + "<----------------------");
%>
<!-- 카테고리 목록 -->
<div>
	<nav class="navbar navbar-expand-xl bg-secondary navbar-light">
		<ul class="navbar-nav">
		<%
		for(Category c : categoryList) {

		%>
			<li class="nav-item">
				<a href="<%=request.getContextPath() %>/product/productList.jsp?categoryId=<%=c.getCategoryId()%>">
					<button type="button" class="btn btn-success btn-sm"><%=c.getCategoryName()%></button>&nbsp;&nbsp;&nbsp;
				</a>
			</li>	
		<%	
			}
		%>
		</ul>
		</nav>
	</div>
<!-- 상품목록 -->
<table>
	<tr>
		<%
			int i = 0;
			for(Product p : productList){
				i=i+1;
		%>
		<td>
			<div class="card" style="width:369px">
				<img class="card-img-top" src="/mall-admin/image/<%=p.getProductPic()%>"style="width:368px;height:300px">
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
	</tr>
	<tr>
		<%
				}
			}
		%>
	</tr>
</table>
<!-- 페이징 -->
		<table class="pagination justify-content-center">
			<tr>
				<%
				//현재 페이지가 1보다 클 때
				if(currentPage>1){
				%>
					<td><a href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=categoryId %>&currentPage=1"class="btn btn-outline-primary btn-sm">처음</a></td>
					<td><a href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=categoryId %>&currentPage=<%=currentPage-1%>"class="btn btn-outline-primary btn-sm">이전</a></td>
				<%
					//현재 페이지가 1페이지일 때
					}else{
				%>  
					<!-- 테이블 크기 조정 -->
					<td style="width:30px"></td>
					<td style="width:30px"></td>
				<%
					} //현재 페이지
				%>
					<th style="width:30px"><%=currentPage %></th>
				<%
					//현재페이지가 마지막 페이지보다 작을 때
					if(currentPage < endPage){
						 
				%>
					<td><a href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=categoryId %>&currentPage=<%=currentPage+1%>"class="btn btn-outline-primary btn-sm">다음</a></td>
					<td><a href="<%=request.getContextPath()%>/product/productList.jsp?categoryId=<%=categoryId %>&currentPage=<%=endPage %>"class="btn btn-outline-primary btn-sm">맨끝</a></td>
				<%
					//현재 페이지가 마지막일 때
					}else{
				%>
					<!-- 테이블 크기 조정 -->
					<td style="width:30px"></td>
					<td style="width:30px"></td>
				<%
					}
				%>
			</tr>
		</table>
	<div>
      <jsp:include page="/inc/bottomMenu.jsp"></jsp:include>
   </div>
</div>
</body>
</html>