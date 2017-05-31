package sqlconn;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by Administrator on 2017/3/29.
 */
public class SqlConn {
    String sql="jdbc:sqlserver://localhost:1433;DatabaseName=Demo";
    String username="sa";
    String userpwd="wl1996";
    Connection conn;
    public Connection getConn() throws SQLException, ClassNotFoundException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn=DriverManager.getConnection(sql,username,userpwd);
        return conn;
    }
}
