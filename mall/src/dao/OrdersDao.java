package dao;

import commons.DBUtil;
import vo.*;
import java.sql.*;
import java.util.*;

public class OrdersDao {
	
	//주문한 상품 보기
	/*public ArrayList<Orders> selectOrdersLsitByEmail(String memberEmail) throws Exception{
		ArrayList<Orders> list = new ArrayList<Orders>();
		
		//db 주소, 아이디 , 비밀번호 변수 지정
		String driver ="org.mariadb.jdbc.Driver";
		String dbaddr = "jdbc:mariadb://localhost:3306/mall";
		String dbid = "root";
		String dbpw = "java1004";
		//sql 문
		String sql ="select orders_id, product_id, orders_amount, orders_price, members_email, orders_addr,orders_state,orders_date form orders where members_email = ?";
		Class.forName(driver);
		//마리아 db 연결
		Connection conn = DriverManager.getConnection(dbaddr, dbid,dbpw);
		//데이터 베이스 접속
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Orders o = new Orders();
			
			o.setOrdersId(rs.getInt("orders_id"));
			o.setProductId(rs.getInt("product_id"));
			o.setOrdersAmount(rs.getInt("orders_amount"));
			o.setOrdersPrice(rs.getInt("orders_price"));
			o.setMembersEmail(rs.getString("members_email"));
			o.setOrdersAddr(rs.getString("orders_addr"));
			o.setOrdersState(rs.getString("orders_state"));
			o.setOrdersDate(rs.getString("orders_date"));
			
			list.add(o);
		}
		conn.close();
		return list;
	}*/
	//상품 결제
	public void insertOrders(Orders orders) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into orders(product_id, orders_amount, orders_price, members_email, orders_addr, orders_state, orders_date) values(?,?,?,?,?,'결재완료',now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orders.getProductId());
		stmt.setInt(2, orders.getOrdersAmount());
		stmt.setInt(3, orders.getOrdersPrice());
		stmt.setString(4, orders.getMembersEmail());
		stmt.setString(5, orders.getOrdersAddr());
		//업데이트
		stmt.executeLargeUpdate();
		//데이터베이스 닫기
		conn.close();
	}
	//로그인한 이메일에 맞는 주문 내역 출력
		public ArrayList<OrdersAndProduct> selectOrdersLsitByEmail(String memberEmail) throws Exception{
			 ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		      
			//데이터 베이스 연결
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
		     
		      //sql 문 생성
		      String sql = "select o.orders_id, o.product_id, o.orders_amount, o.orders_price, o.members_email, o.orders_addr, o.orders_state, o.orders_date, p.product_name from orders o inner join product p on o.product_id = p.product_id where members_email = ?  order by orders_date desc";
		      PreparedStatement stmt = conn.prepareStatement(sql);
		      stmt.setString(1, memberEmail);
		      ResultSet rs = stmt.executeQuery();
		      
		      while(rs.next()) {
		         OrdersAndProduct oap = new OrdersAndProduct();
		        /* oap.orders = new Orders();
		         oap.product = new Product();
		         oap.orders.ordersId = rs.getInt("o.orders_id");
		         oap.orders.productId = rs.getInt("o.product_id");
		         oap.product.productName = rs.getString("p.product_name");
		         oap.orders.ordersAmount = rs.getInt("o.orders_amount");
		         oap.orders.ordersPrice = rs.getInt("o.orders_price");
		         oap.orders.membersEmail = rs.getString("o.members_email");
		         oap.orders.ordersAddr = rs.getString("o.orders_addr");
		         oap.orders.ordersState = rs.getString("o.orders_state");
		         oap.orders.ordersDate = rs.getString("o.orders_date"); */
		         oap.setOrders(new Orders());
		         oap.setProduct(new Product());
		         oap.getOrders().setOrdersId(rs.getInt("o.orders_id"));
		         oap.getOrders().setProductId(rs.getInt("o.product_id"));
		         oap.getProduct().setProductName(rs.getString("p.product_name"));
		         oap.getOrders().setOrdersAmount(rs.getInt("o.orders_amount"));
		         oap.getOrders().setOrdersPrice(rs.getInt("o.orders_price"));
		         oap.getOrders().setMembersEmail(rs.getString("o.members_email"));
		         oap.getOrders().setOrdersAddr(rs.getString("o.orders_addr"));
		         oap.getOrders().setOrdersState(rs.getString("o.orders_state"));
		         oap.getOrders().setOrdersDate(rs.getString("o.orders_date"));
		         
		         
		         //리스트 출력
		         list.add(oap);
		      }
		      //데이터베이스 닫기
		      conn.close();
		      return list;   
		}
}
