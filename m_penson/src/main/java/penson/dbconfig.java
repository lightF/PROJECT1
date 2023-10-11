package penson;
import java.sql.*;

public class dbconfig {
	public static Connection dbinfo() throws Exception {
		String db_drive = "com.mysql.jdbc.Driver";
		String db_url = "jdbc:mysql://localhost:3306/pensonlife";
		String db_user = "penson";
		String db_pass = "pensonlife";
		
		Class.forName(db_drive);
		Connection con = DriverManager.getConnection(db_url, db_user, db_pass);
		
		return con;
	}
}