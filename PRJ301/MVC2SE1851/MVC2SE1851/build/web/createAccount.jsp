<%-- 
    Document   : createAccount
    Created on : Mar 7, 2024, 4:09:16 PM
    Author     : trand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registration</h1>
        <form action="DispatchServlet" method="POST">
            <c:set var="errors" value="${requestScope.CREATE_ERRORS}"/>
            Username*<input type="text" name="txtUsername" 
                            value="${param.txtUsername}"/>(6-20 chars)<br/>
            <c:if test="${not empty errors.usernameLengthError}">
                <font color="red">
                ${errors.usernameLengthError}
                </font>
            </c:if>
            <c:if test="${not empty errors.usernameIsExisted}">
                <font color="red">
                ${errors.usernameIsExisted}
                </font>
            </c:if>
            Password*<input type="password" name="txtPassword" value="${param.txtPassword}"/>(6-30 chars)<br/>
            <c:if test="${not empty errors.passwordLengthError}">
                <font color="red">
                ${errors.passwordLengthError}
                </font>
            </c:if>
            Confirm*<input type="password" name="txtConfirm"  value="${param.txtConfirm}"/><br/>
            <c:if test="${not empty errors.confirmNotMatched}">
                <font color="red">
                ${errors.confirmNotMatched}
                </font>
            </c:if>
            Full name*<input type="text" name="txtFullname" 
                             value="${param.txtFullname}"/>(2-50 chars)<br/>
            <c:if test="${not empty errors.fullNameLengthError}">
                <font color="red">
                ${errors.fullNameLengthError}
                </font>
            </c:if>
            <input type="submit" value="Create New Account" name="btAction"/>
            <input type="reset" value="Reset"/>
        </form>

    </body>
</html>
