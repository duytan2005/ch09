<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Your cart</title>
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
        input[type=submit][value="Update"],
        input[type=submit][value="Add To Cart"] {
            background: #28a745;
            color: white;
        }
        input[type=submit][value="Remove item"] {
            background: #e74c3c;
            color: white;
        }
        a.btn-continue {
            display: inline-block;
            background: #6c757d;
            color: white;
            padding: 10px 16px;
            border-radius: 4px;
            text-decoration: none;
            margin: 20px 10px 0 0;
        }
        a.btn-checkout {
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
<h2>Your cart</h2>
<table>
<tr><th>Quantity</th><th>Description</th><th>Price</th><th>Amount</th><th></th></tr>
<%
    model.Cart cart = (model.Cart) session.getAttribute("cart");
    if (cart != null) {
        for (model.LineItem item : cart.getItems()) {
%>
<tr>
    <td><%= item.getQuantity() %></td>
    <td><%= item.getProduct().getDescription() %></td>
    <td>$<%= item.getProduct().getPrice() %></td>
    <td>$<%= item.getTotal() %></td>
    <td>
        <form action="cart" method="post">
            <input type="hidden" name="action" value="remove">
            <input type="hidden" name="productCode" value="<%= item.getProduct().getCode() %>">
            <input type="submit" value="Remove item">
        </form>
    </td>
</tr>
<%
        }
    }
%>
</table>

<a href="loadProducts" class="btn-continue">Continue shopping</a>
<a href="checkout.jsp" class="btn-checkout">Checkout</a>

</body>
</html>
