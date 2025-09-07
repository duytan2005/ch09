package controller;

import data.ProductDB;
import model.Cart;
import model.LineItem;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        if ("add".equals(action)) {
            String code = request.getParameter("productCode");
            Product product = ProductDB.getProduct(code);
            LineItem item = new LineItem(product, 1);
            cart.addItem(item);

        } else if ("remove".equals(action)) {
            String code = request.getParameter("productCode");
            Product product = ProductDB.getProduct(code);
            cart.removeItem(product);
        }

        getServletContext()
                .getRequestDispatcher("/cart.jsp")
                .forward(request, response);
    }
}
