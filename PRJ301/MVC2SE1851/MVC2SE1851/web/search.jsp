<%-- 
    Document   : search
    Created on : Jan 29, 2024, 4:54:38 PM
    Author     : trand
--%>

<%--<%@page import="nguyentd.registration.RegistrationDTO"%>
<%@page import="java.util.List"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body >
        <font color="red">
        Welcome, ${sessionScope.USERINFO.fullName}, <a style="color: red" href="LogoutServlet">logout</a>
        </font>
        <h1>Search Page</h1>
        <form action="DispatchServlet" >
            Search Value <input type="text" name="txtSearchValue" 
                                value="${param.txtSearchValue}"/><br/>
            <input type="submit" value="Search" name="btAction"/>
        </form>
        <br/>
        <c:set var="searchValue" value="${param.txtSearchValue}"/>
        <c:if test="${not empty searchValue}">
            <c:set var="result" value="${requestScope.SEARCH_RESULT}"/>
            <c:if test="${not empty result}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Full name</th>
                            <th>Role</th>
                            <th>Delete</th>                            
                            <th>Update</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${result}" varStatus="counter">
                        <form action="DispatchServlet" method="POST">
                            <tr>
                                <td>
                                    ${counter.count}
                                </td>
                                <td>
                                    ${dto.username}
                                    <input type="hidden" name="input_username" value="${dto.username}"/>
                                </td>
                                <td>
                                    <input type="text" name="input_password" value="${dto.password}" />
                                </td>
                                <td>
                                    ${dto.fullName}
                                </td>
                                <td>
                                    <input type="checkbox" name="checkbok_admin" value="ON"
                                           <c:if test="${dto.role}">
                                               checked="checked"
                                           </c:if>/>
                                </td>
                                <td>
                                    <c:url var="deleteLink" value="DispatchServlet">
                                        <c:param name="btAction" value="Delete"/>
                                        <c:param name="pk" value="${dto.username}"/>
                                        <c:param name="lastSearchValue" value="${searchValue}"/>
                                    </c:url>
                                    <a href="${deleteLink}">Delete</a>
                                </td>

                                <td>
                                    <input type="hidden" name="lastSearchValue" value="${searchValue}"/>
                                    <input type="submit" value="Update" name="btAction"/>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>

        </c:if>
        <c:if test="${empty result}">
            No record is matched!!!
        </c:if>
    </c:if>



    <%--  <%
          Cookie[] cookies = request.getCookies();
          if (cookies != null) {
              Cookie lastCookie = cookies[cookies.length - 1];
              String userName = lastCookie.getName();
      %>
      <font color="red">
      Welcome, <%=userName%>, <a style="color: red" href="LogoutServlet">logout</a>
      </font>
      <%
          } else {
              response.sendRedirect("login.html");
          }
      %>

        <h1>Search Page</h1>
        <%
            String searchValue = request.getParameter("txtSearchValue");
            if (searchValue == null) {
                searchValue = "";
            }
        %>
        <form action="DispatchServlet" >
            Search <input type="text" name="txtSearchValue" 
                          value="<%= searchValue%>"/><br/>
            <input type="submit" value="Search" name="btAction"/>
        </form>
        <br/>
        <%
            searchValue = request.getParameter("txtSearchValue");
            if (searchValue != null) {
                List<RegistrationDTO> result
                        = (List<RegistrationDTO>) request.getAttribute("SEARCH_RESULT");
                if (result != null) {
                    if (result.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>User Name</th>
                    <th>Password</th>
                    <th>Last Name</th>
                    <th>Is Admin</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (RegistrationDTO user : result) {
                        String urlRewriting = "DispatchServlet"
                                + "?btAction=Delete"
                                + "&pk=" + user.getUsername()
                                + "&lastSearchValue=" + searchValue;
                %>
            <form action="DispatchServlet" method="POST">
                <tr>
                    <td><%= count++%></td>
                    <td>    
                        <%= user.getUsername()%>
                        <input type="hidden" name="input_username" value="<%= user.getUsername()%>"/>
                    </td>

                    <td>
                        <input type="text" name="input_password" value="<%= user.getPassword()%>" />
                    </td>
                    <td><%= user.getFullName()%></td>
                    <td>
                        <input type="checkbox" name="checkbok_admin" value="ON"                                
                               <%
                                   if (user.getRole()) {
                               %>
                               checked="checked"
                               <%
                                   } else {

                                   }
                               %>
                               />
                    </td>
                    <td>
                        <a href="<%= urlRewriting%>">Delete</a>
                    </td>
                    <td>
                        <input type="hidden" name="lastSearchValue" value="<%= searchValue%>" />
                        <input type="submit" value="Update" name="btAction" />
                    </td>
                </tr>
            </form>   
            <%
                }
            %>
        </tbody>
    </table>

    <%
        }
    } else {
    %>
    <h2>
        <font color="red">No record is matched!!!</font>
    </h2>
    <%
            }//end result is null
        }//seccond time
    %> --%>
</body>
</html>
