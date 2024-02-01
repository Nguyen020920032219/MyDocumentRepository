package nguyentd.util;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author trand
 */
public class DBHelper implements Serializable {

    public static Connection getConnection1() throws ClassNotFoundException, SQLException {
        //1.Load driver (driver is available in project)
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2.Create connection string
        String url = "jdbc:sqlserver://localhost:1433;"
                + "databaseName=master;";
        //3.Open connection
        Connection con = DriverManager.getConnection(url, "sa", "123456");
        return con;
    }

    public static Connection getConnection() throws ClassNotFoundException, SQLException, NamingException {
        Connection conn = null;
        Context context = new InitialContext();
        Context end = (Context) context.lookup("java:comp/env");
        DataSource ds = (DataSource) end.lookup("DBCon");
        conn = ds.getConnection();
        return conn;
    }

}
