package model;

import java.io.Serializable;

public class Product implements Serializable {
    private String code;
    private String description;
    private double price;

    public Product() {}

    public Product(String code, String description, double price) {
        this.code = code;
        this.description = description;
        this.price = price;
    }

    public String getCode() { return code; }
    public String getDescription() { return description; }
    public double getPrice() { return price; }

    public void setCode(String code) { this.code = code; }
    public void setDescription(String description) { this.description = description; }
    public void setPrice(double price) { this.price = price; }
}
