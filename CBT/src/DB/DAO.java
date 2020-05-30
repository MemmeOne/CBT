package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DAO {
	private String url="jdbc:oracle:thin:@localhost:1521:xe";
	private String user="jsp";
	private String pwd="1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	//DB 접근
	public DAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	//
	public String loginchk(String userid) {
		String dbpwd=""; //DB에 저장된 비밀번호
		String sql = "select pwd from member where id=?";
		try {
			con=DriverManager.getConnection(url,user,pwd);
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			if(rs.next()) {
				dbpwd=rs.getString("pwd");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dbpwd;
	}
//	// 글 저장 기능
//	public void write_save(String name,String title,String content) {
//		//String sql="insert into test_board(id,name,title,content,hit,idgroup,step,indent)"
//		//		+"values(test_board_seq.nextval,?,?,?,0,test_board_seq.currval,0,0)";
//		// => hit는 기본값이 0으로 설정되어 있으니 빼도 무관
//		String sql="insert into test_board(id,name,title,content,idgroup,step,indent)"
//				+"values(test_board_seq.nextval,?,?,?,test_board_seq.currval,0,0)";
//		try {
//			con=DriverManager.getConnection(url,user,pwd);
//			ps=con.prepareStatement(sql);
//			ps.setString(1, name);
//			ps.setString(2, title);
//			ps.setString(3, content);
//			ps.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
}
