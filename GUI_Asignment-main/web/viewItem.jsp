<%@page import="java.util.List"%>
<%@page import="domain.User"%>
<%@page import="da.UserDA"%>
<jsp:setProperty name="item" property="*"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: auto; }
        th, td { padding: 8px 12px; border: 1px solid #ccc; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h2 style="text-align:center;">All Users</h2>

    <%
        List<User> userList = (List<User>) request.getAttribute("allUsers");
        if (userList != null && !userList.isEmpty()) {
    %>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Birthday</th>
                <th>Password</th>
                <th>Create Date</th>

            </tr>
            <%
                for (User u : userList) {
            %>
            <tr>
                <td><%= u.getId() %></td>
                <td><%= u.getName() %></td>
                <td><%= u.getEmail() %></td>
                <td><%= u.getPhone() %></td>
                <td><%= u.getHbd() %></td>
                <td><%= u.getPwd() %></td>
                <td><%= u.getCreateDate() %></td>
            </tr>
            <%
                }
            %>
        </table>
    <%
        } else {
    %>
        <p style="text-align:center; color:red;">No users found.</p>
    <%
        }
    %>
     <a href="admin.html">Return</a><br>
</body>
</html>