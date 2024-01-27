/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyentd.registration;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import nguyentd.util.DBHelper;

/**
 *
 * @author trand
 */
public class RegistrationDAO implements Serializable {

    public boolean checkLogin(String username, String password)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            //1. Get connection
            con = DBHelper.getConnection();
            if (con != null) {
                //2. create SQL string
                String sql = "Select username "
                        + "From Registration "
                        + "Where username = ? "
                        + "And password = ?";
                //3. Create Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                //4. Execute Query
                rs = stm.executeQuery();
                //5. Process Result
                if (rs.next()) {
                    result = true;
                }//username and password have been existed
            }//Connection has been available
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

    private List<RegistrationDTO> accountList;

    public List<RegistrationDTO> getAccountList() {
        return this.accountList;
    }

    public void searchLastname(String searchValue)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            //1. Get connection
            con = DBHelper.getConnection();
            if (con != null) {
                //2. create SQL string
                String sql = "Select username, password, lastname, isAdmin "
                        + "From Registration "
                        + "Where lastname Like ?";
                //3. Create Statement Object
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                //4. Execute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    //5.1 get data from Result set
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String fullName = rs.getString("lastname");
                    Boolean role = rs.getBoolean("isAdmin");
                    //5.2 set data to DTO properties
                    RegistrationDTO dto = new RegistrationDTO(
                            username, password, fullName, role);
                    if (this.accountList == null) {
                        this.accountList = new ArrayList<>();
                    }//end account List has not existed
                    this.accountList.add(dto);
                }//end account has existed
            }//Connection has been available
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}
