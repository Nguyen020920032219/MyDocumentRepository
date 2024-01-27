package nguyentd.util;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

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

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        //1.Load driver (driver is available in project)
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2.Create connection string
        String url = "jdbc:sqlserver://localhost:1433;"
                + "databaseName=master;";
        //3.Open connection
        Connection con = DriverManager.getConnection(url, "sa", "123456");
        return con;
    }

}
