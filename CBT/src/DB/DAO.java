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
	//DB ����
	public DAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	//�α��� üũ ���
	public String loginchk(String userid) {
		String dbpwd=""; //DB�� ����� ��й�ȣ
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
}
