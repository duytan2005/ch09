package model;

import java.io.Serializable;
import java.util.ArrayList;

public class Cart implements Serializable {
    private ArrayList<LineItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public ArrayList<LineItem> getItems() {
        return items;
    }

    public void addItem(LineItem item) {
        for (LineItem li : items) {
            if (li.getProduct().getCode().equals(item.getProduct().getCode())) {
                li.setQuantity(li.getQuantity() + item.getQuantity());
                return;
            }
        }
        items.add(item);
    }

    public void removeItem(Product product) {
        items.removeIf(li -> li.getProduct().getCode().equals(product.getCode()));
    }
}
