package controller;

import data.ProductDB;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet("/loadProducts")
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, Product> products = ProductDB.getAll();
        request.setAttribute("products", products);

        getServletContext()
                .getRequestDispatcher("/products.jsp")
                .forward(request, response);
    }
}
