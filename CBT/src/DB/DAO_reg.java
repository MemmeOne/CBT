package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class DAO_reg {
		
	private String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private String user = "java";
	private String pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public DAO_reg() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	
	}	
	
	public void membership(Member member) {
		String sql = "insert into member(id,pwd,name) values(?,?,?)";
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPwd());
			ps.setString(3, member.getName());
			rs = ps.executeQuery();
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
