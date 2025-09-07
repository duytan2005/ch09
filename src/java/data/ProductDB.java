package data;

import model.Product;
import java.util.HashMap;

public class ProductDB {
    private static final HashMap<String, Product> products = new HashMap<>();

    static {
        products.put("8601", new Product("8601", "86 (the band) - True Life Songs and Pictures", 14.95));
        products.put("pf01", new Product("pf01", "Paddlefoot - The first CD", 12.95));
        products.put("pf02", new Product("pf02", "Paddlefoot - The second CD", 14.95));
        products.put("jr01", new Product("jr01", "Joe Rut - Genuine Wood Grained Finish", 14.95));
    }

    public static Product getProduct(String code) {
        return products.get(code);
    }

    public static HashMap<String, Product> getAll() {
        return products;
    }
}
