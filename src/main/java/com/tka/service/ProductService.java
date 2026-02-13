package com.tka.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tka.dao.ProductDao;
import com.tka.model.Product;
@Service
public class ProductService {

    @Autowired
    ProductDao productDao;

    public List<Product> getAllProduct() {

        List<Product> productList = productDao.findAll();

        for (Product product : productList) {
            product.setImagePath(product.getProductname().toLowerCase());
        }

        return productList;
    }

    public Product getById(Integer id) {
        return productDao.findById(id).orElse(null);
    }
}
