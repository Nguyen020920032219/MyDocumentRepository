package nguyentd.product;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import nguyentd.util.DBHelper;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author trand
 */
public class ProductDAO implements Serializable {

    private final String TABLE_NAME = "Product";

    private final String PRODUCT_ID = "productId";
    private final String NAME = "name";
    private final String DESCRIPTION = "description";
    private final String UNIT_PRICE = "unitPrice";
    private final String QUANTITY = "quantity";
    private final String PRODUCT_STATUS = "status";

    public List<ProductDTO> getProductList() throws SQLException, ClassNotFoundException, NamingException {
        Connection connection;
        connection = null;
        ResultSet resultSet = null;

        ArrayList<ProductDTO> productList = new ArrayList();

        try {
            connection = DBHelper.getConnection();
            if (connection != null) {
                String sql = "SELECT "
                        + String.format("%s, %s, %s, %s, %s, %s ", PRODUCT_ID, NAME, DESCRIPTION, UNIT_PRICE, QUANTITY, PRODUCT_STATUS)
                        + " FROM " + TABLE_NAME;

                PreparedStatement preparedStatement = connection.prepareStatement(sql);

                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    // map to DTO
                    productList.add(mapProduct(resultSet));
                }
            }
        } finally {

            if (connection != null) {
                connection.close();
            }

            if (resultSet != null) {
                resultSet.close();
            }
        }

        return productList;
    }

    private ProductDTO mapProduct(ResultSet resultSet) throws SQLException {

        String id = resultSet.getString(PRODUCT_ID);
        String name = resultSet.getString(NAME);
        String description = resultSet.getString(DESCRIPTION);
        float unitPrice = resultSet.getFloat(UNIT_PRICE);
        int quantity = resultSet.getInt(QUANTITY);
        boolean status = resultSet.getBoolean(PRODUCT_STATUS);

        return new ProductDTO(id, name, description, unitPrice, quantity, status);
    }

    public ProductDTO getProductById(String productId) throws SQLException, ClassNotFoundException, NamingException {
        Connection connection;
        connection = null;
        ResultSet resultSet = null;
        ProductDTO product = null;

        try {
            connection = DBHelper.getConnection();
            if (connection != null) {
                String sql = "SELECT "
                        + String.format("%s, %s, %s, %s, %s, %s ", PRODUCT_ID, NAME, DESCRIPTION, UNIT_PRICE, QUANTITY, PRODUCT_STATUS)
                        + " FROM " + TABLE_NAME
                        + " WHERE " + PRODUCT_ID + " = ?";

                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, productId);

                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    product = mapProduct(resultSet);
                }
            }
        } finally {

            if (connection != null) {
                connection.close();
            }

            if (resultSet != null) {
                resultSet.close();
            }
        }
        return product;
    }

}
