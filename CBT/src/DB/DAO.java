package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	//private String url = "jdbc:oracle:thin:@192.168.58.184:1521:xe"; // 지원 학원
	
	private String user = "jsp";
	private String pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	// DB 접근
	public DAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 로그인 체크 기능
	public String loginchk(String userid) {
		String dbpwd = ""; // DB에 저장된 비밀번호
		String sql = "select pwd from member where id=?";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			if (rs.next()) {
				dbpwd = rs.getString("pwd");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dbpwd;
	}

	public void membership(Member member) {
		String sql = "insert into member(id,pwd,name) values(?,?,?)";

		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPwd());
			ps.setString(3, member.getName());
			ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<String> check() {
		
		String sql = "select*from member";
		ArrayList<String> li = new ArrayList<String>();
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs  = ps.executeQuery();
			while(rs.next()) {
				String a = rs.getString("id");
				li.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
} 
