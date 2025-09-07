<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Checkout</title>
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
        .total {
            font-weight: bold;
            text-align: right;
        }
        a.btn-home {
            display: inline-block;
            background: #0099ff;
            color: white;
            padding: 10px 16px;
            border-radius: 4px;
            text-decoration: none;
            margin: 20px 0;
        }
    </style>
</head>
<body>
<h2>Thank you for your order!</h2>
<p>Your CDs will be shipped soon.</p>

<%
    model.Cart cart = (model.Cart) session.getAttribute("cart");
    double total = 0;
    if (cart != null && !cart.getItems().isEmpty()) {
%>
    <h3>Your order summary:</h3>
    <table>
        <tr>
            <th>Quantity</th>
            <th>Description</th>
            <th>Price</th>
            <th>Amount</th>
        </tr>
        <%
            for (model.LineItem item : cart.getItems()) {
                total += item.getTotal();
        %>
        <tr>
            <td><%= item.getQuantity() %></td>
            <td><%= item.getProduct().getDescription() %></td>
            <td>$<%= item.getProduct().getPrice() %></td>
            <td>$<%= item.getTotal() %></td>
        </tr>
        <% } %>
        <tr>
            <td colspan="3" class="total">Total:</td>
            <td><strong>$<%= total %></strong></td>
        </tr>
    </table>
<%
        // Clear the cart after checkout
        session.removeAttribute("cart");
    } else {
%>
    <p>Your cart is empty.</p>
<% } %>

<a href="index.jsp" class="btn-home">Return to Home</a>
</body>
</html>
