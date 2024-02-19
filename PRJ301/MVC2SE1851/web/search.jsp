<%-- 
    Document   : search
    Created on : Jan 29, 2024, 4:54:38 PM
    Author     : trand
--%>

<%@page import="nguyentd.registration.RegistrationDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body>
        <h1>Search Page</h1>
        <form action="DispatchServlet" >
            Search <input type="text" name="txtSearchValue" 
                          value="<%= request.getParameter("txtSearchValue")%>"/><br/>
            <input type="submit" value="Search" name="btAction"/>
        </form>
        <br/>
        <%
            String searchValue = request.getParameter("txtSearchValue");
            if (searchValue != null) {
                List<RegistrationDTO> result
                        = (List<RegistrationDTO>) request.getAttribute("SEARCH_RESULT");
                if (result != null) {
                    if (result.size() > 0) {
        %>
        <table border="1" >
            <thead>
                <tr>
                    <th>No</th>
                    <th>User Name</th>
                    <th>Last Name</th>
                    <th>Password</th>
                    <th>Is Admin</th>
                    <th>Delete</th>
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
                <tr>
                    <td><%=count++%></td>
                    <td><%=user.getUsername()%></td>
                    <td><%=user.getFullName()%></td>
                    <td><%=user.getPassword()%></td>
                    <td><%=user.getRole()%></td>
                    <td>
                        <a href="<%=urlRewriting%>">Delete</a>
                    </td>
                </tr>
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
%>
    </body>
</html>
