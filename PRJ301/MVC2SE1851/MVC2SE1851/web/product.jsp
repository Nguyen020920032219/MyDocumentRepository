<%-- 
    Document   : product
    Created on : Mar 3, 2024, 6:41:27 PM
    Author     : trand
--%>

<%@page import="nguyentd.product.ProductDTO"%>

<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
        <form action="DispatchServlet">
            <select name="cboBook">
                <c:forEach items="${requestScope.PRODUCTS}" var="product">
                    <option value="${product.productId}">${product.productName}</option>
                </c:forEach>
            </select>
            <hr>
            <input type="submit" value="Add Book To Your Cart" name="btAction" />
            <input type="submit" value="View Your Cart" name="btAction" />
        </form>
    </body>
</html>
