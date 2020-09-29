package dao;
import java.util.*;
import vo.*;
import commons.*;
import java.sql.*;

public class NoticeDao {
	

	//공지사항 전체 리스트
		public ArrayList<Notice> selectNoticeAllList(int currentPage) throws Exception{
			ArrayList<Notice> list = new ArrayList<Notice>();
			//데이터 베이스 연결
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			     
			//sql 문 생성
			String sql = "select notice_id, notice_title, notice_content, notice_date from notice order by notice_id desc limit ?,?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, (currentPage-1)*10);
			stmt.setInt(2, 10);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				Notice n = new Notice();
				//n.noticeId = rs.getInt("notice_id");
				//n.noticeTitle = rs.getString("notice_title");
				//n.noticeContent = rs.getString("notice_content");
				//n.noticeDate = rs.getString("notice_date");
				n.setNoticeId(rs.getInt("notice_id"));
				n.setNoticeTitle(rs.getString("notice_title"));
				n.setNoticeContent(rs.getString("notice_content"));
				n.setNoticeDate(rs.getString("notice_date"));
				//리스트 출력
				list.add(n);
			}
			//데이터베이스 닫기
			conn.close();
			return list;
		}
	//공지사항 리스트 2개 보여주기
	public ArrayList<Notice> selectNoticeList() throws Exception{
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		//sql 문
		String sql= "select notice_id, notice_title from notice order by notice_date desc limit 0,2";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()){
			Notice n = new Notice();
			//n.noticeId = rs.getInt("notice_id");
			//n.noticeTitle = rs.getString("notice_title");
			n.setNoticeId(rs.getInt("notice_id"));
			n.setNoticeTitle(rs.getString("notice_title"));
			list.add(n);
		}
		conn.close();
		return list;
	}
	
	//공지사항 상세보기
	public Notice selectNoticeOne(int noticeId) throws Exception{
		Notice n = null;
		//데이터 베이스 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
	    //쿼리문 생성
		String sql = "select notice_id, notice_title, notice_content, notice_date from notice where notice_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, noticeId);		
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			n = new Notice();
			//n.noticeId = rs.getInt("notice_id");
			//n.noticeTitle = rs.getString("notice_title");
			//n.noticeContent = rs.getString("notice_content");
			//n.noticeDate = rs.getString("notice_date");
			n.setNoticeId(rs.getInt("notice_id"));
			n.setNoticeTitle(rs.getString("notice_title"));
			n.setNoticeContent(rs.getString("notice_content"));
			n.setNoticeDate(rs.getString("notice_date"));
		}
		conn.close();
		return n;
	}
	//공지사항 페이징
	public int getNoticeEndPage() throws Exception{
		//페이지 변수 지정
		int endPage = 1;
		//데이터 베이스 연결
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select count(*) from notice"; 
		//데이터베이스 접속
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()) {
			endPage = rs.getInt("count(*)");
			if(endPage%10 == 0) {
				endPage = (int)(endPage/10);
			}else {
				endPage = (int)(endPage/10) + 1;
			}
		}
	
	
	conn.close();
	return endPage;

}
	
}
