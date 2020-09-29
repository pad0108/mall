<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*"  %>
<%@ page import="vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productOne</title>
<!-- 부트 스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 아이콘 사용 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
</head>
<body>
<%
	int productId = Integer.parseInt(request.getParameter("productId"));
	ProductDao productDao = new ProductDao();
	Product product = productDao.selectProductOne(productId);
%>
<div class="container">
<div><!-- 상단 메뉴바 -->
      <jsp:include page="/inc/menu.jsp"></jsp:include>
</div>
	<h1>상품 상세보기</h1>
	<table class="table">
		<tr>
			<td width="30%">제품 번호</td>
			<td width="70%"><%=product.getProductId()%></td>
		</tr>
		<tr>
			<td>제품 이미지</td>
			<td><img src="<%=request.getContextPath()%>/img/<%=product.getProductPic()%>"></td>
		</tr>
		<tr>
			<td>제품 이름</td>
			<td><%=product.getProductName() %></td>
		</tr>
		<tr>
			<td>제품 설명</td>
			<td><%=product.getProductContent() %></td>
		</tr>
		<tr>
			<td>제품 가격</td>
			<td><%=product.getProductPrice() %></td>
		</tr>
		<tr>
			<td>판매 현황</td>
	<%
	if(product.getProductSoldout().equals("Y")) {
	%>
			<td>품절</td>
	<%
		}else{
	%>
		<td>판매중</td>
	<%
		}
	%>
		</tr>
	</table>
	<%if(product.getProductSoldout().equals("N")){ %>
	<form method="post" action="<%=request.getContextPath()%>/orders/addOrdersAction.jsp" style="text-align:right;">
		<table class="table-mr-right">	
		<tr>	
			<td><input type="hidden" value="<%=product.getProductId()%>" name="productId"></td>
			<td><input type="hidden" value="<%=product.getProductPrice()%>" name="productPrice"></td>
		</tr>
		<tr>
		<td>수량 :</td>
		<td><select name="ordersAmount">
				<%
					for(int i=1; i<11; i+=1) {
				%>
						<option value="<%=i%>"><%=i%></option>
				<%		
					}
				%>
			</select>개</td>
		</tr>
		<tr>
			<td>배송주소 :</td>
			<td><input type="text" class="form-control" name="ordersAddr"></td>
		</tr>
		</table>
		<div>
			<button type="submit" class="btn btn-primary">주문</button>
			<a href="<%=request.getContextPath()%>/index.jsp"class="btn btn-secondary">뒤로가기</a>	
		</div>
	</form>
	<%}else{ %>
	<div style="text-align:right;">
		<a href="<%=request.getContextPath()%>/index.jsp"class="btn btn-secondary">뒤로가기</a>
	</div>
	<% }%>
</div>
</body>
</html>