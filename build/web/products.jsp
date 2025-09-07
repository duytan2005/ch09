<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>CD list</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f6fa;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        h2 {
            color: #2c3e50;
            margin: 20px 0;
        }
        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            background: #fff;
        }
        th {
            background: #336699;
            color: #fff;
            padding: 12px;
            text-align: left;
        }
        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        input[type=submit] {
            border: none;
            padding: 8px 14px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        input[type=submit][value="Add To Cart"] {
            background: #28a745;
            color: white;
        }
    </style>
</head>
<body>
<h2>CD list</h2>
<table>
<tr><th>Description</th><th>Price</th><th></th></tr>
<%
    java.util.Map<String, model.Product> products =
        (java.util.Map<String, model.Product>) request.getAttribute("products");
    for (model.Product p : products.values()) {
%>
<tr>
    <td><%= p.getDescription() %></td>
    <td>$<%= p.getPrice() %></td>
    <td>
        <form action="cart" method="post">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="productCode" value="<%= p.getCode() %>">
            <input type="submit" value="Add To Cart">
        </form>
    </td>
</tr>
<% } %>
</table>
</body>
</html>
