package dao;

import vo.*;

import java.sql.*;

import commons.*;

public class MemberDao {
	//가입 여부 확인
	public Member selectMemberEmailCk(String memberEmail) throws Exception{
		Member member = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select id from (select member_email id from member union select admin_id id from admin) t where id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, memberEmail);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			//중복된 이메일은 가입 불가
			member = new Member();
			//member.memberEmail = rs.getString("id");
			member.setMemberEmail(rs.getString("id"));
		}
		//데이터 베이스 닫기
		conn.close();
		return member;
	}
	//회원 가입 정보 넣기
	public void insertMember(Member member) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "insert into member(member_email, member_pw, member_name, member_date) values (?, ?, ?, now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		stmt.executeLargeUpdate();
		conn.close();
	}
	//로그인
	public Member login(Member member) throws Exception{
		Member m = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "select member_email, member_name from member where member_email = ? and member_pw = ? and member_state='Y'";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.setString(2, member.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) { //로그인 성공
			m = new Member();
			m.setMemberEmail(rs.getString("member_email"));
			m.setMemberName(rs.getString("member_name"));
		}
		conn.close();
		return m;
	}
}
