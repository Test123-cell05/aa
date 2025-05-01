<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="item.Item" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Edit Item</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <form method="post" action="getItemServlet" >
            <p><label>Enter item ID to edit</label>
                <input type="text" name="id" size="10" /></p>
                <input type="submit" value="Search">
        </form>
        
        <%
        Item editItem = (Item)request.getAttribute("editItem");

        if (editItem != null) {
        %>
        <h3>Edit Item</h3>
        <form method="post" action="editItemServlet">
        <p>ID: <input type="text" name="id" value="<%= editItem.getID() %>" readonly /></p>
        <p>Name: <input type="text" name="name" value="<%= editItem.getName() %>" /></p>
        <p>Category: <select name="category" value="<%= editItem.getCategory() %>">
                    <option value = "Badminton">Badminton</option>
                    <option value = "Table Tennis">Table Tennis</option>
                    <option value = "General">General</option>
        </select></p>         
        <p>Price: <input type="text" name="price" value="<%= editItem.getPrice() %>" /></p>
        <p>Stock: <input type="text" name="stock" value="<%= editItem.getStock() %>" /></p>
        <input type="submit" value="Update">
    </form>
<%
    }
%>
    <a href="staff.html">Return</a><br>

    </body>
</html>
