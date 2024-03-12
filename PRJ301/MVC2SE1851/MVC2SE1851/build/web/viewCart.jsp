<%-- 
    Document   : ViewCart
    Created on : Feb 26, 2024, 4:53:16 PM
    Author     : trand
--%>

<%@page import="nguyentd.product.ProductDAO"%>
<%@page import="nguyentd.product.ProductDTO"%>
<%@page import="java.util.Map"%>
<%@page import="nguyentd.cart.CartObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Book Store</h1>
        <%--  <%
              //1.customer goes to his/her cart place
              if (session != null) {
                  //2.customer take his/her cart
                  CartObject cart = (CartObject) session.getAttribute("CART");
                  if (cart != null) {
                      //3.customer gets items
                      Map<String, Integer> items = cart.getItems();
                      if (items != null) {
                          //4.all items is shown
  %>--%>

        <c:if test="${not empty sessionScope.CART.items}">
            <form action="DispatchServlet">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%--     <%
                            int count = 0;
                            ProductDAO productDao = new ProductDAO();
                            ProductDTO product = null;
                            for (String productId : items.keySet()) {
                                product = productDao.getProductById(productId);
                                if (product == null) continue;
    %>--%>
                        <c:forEach var="item" items="${sessionScope.CART.items}" >
                            <c:forEach var="product" items="${requestScope.PRODUCTS}">
                                <c:if test="${item.key eq product.productId}">
                                    <tr>
                                        <td>1</td>
                                        <td>
                                            ${product.productName}
                                        </td>
                                        <td>
                                            ${item.value}
                                        </td>
                                        <td>
                                            <input type="checkbox" name="checkItem" value="${item.key}">
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                        <%--      <%
                    }//traverse items/map
%>--%>
                        <tr>
                            <td colspan="3"><a href="AddToCartServlet">Add more book to your cart</a> </td>
                            <td> <input type="submit" value="Remove Selected Items" name="btAction" /></td>
                        </tr>

                    </tbody>
                </table>
                <hr/>
                Address: <input type="text" value="" name="txtAddress"/>
                <input type="submit" value="Checkout" name="btAction"/>
            </form>

            <%-- <%
                return;
            }//items has existed
        }//cart has existed
    }//session has existed 
%>--%>
        </c:if>   

        <c:if test="${ empty sessionScope.CART.items}">
            <h2 style="color: red">
                No cart is existed!!!           
            </h2>
            <a href="AddToCartServlet">Add more book to your cart</a>
        </c:if>
    </body>
</html>
