package com.tka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tka.model.Product;
import com.tka.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BillController {

    @Autowired
    ProductService productService;

    @PostMapping("/generateBill")
    public String generateBill(
            @RequestParam("pid") int productId,
            @RequestParam("qty") int quantity,
            Model model,
            HttpSession session) {

        // Fetch product
        Product product = productService.getById(productId);

        if (product == null) {
            model.addAttribute("error", "Product not found!");
            return "error";
        }

        // Fetch name from session
        String customerName = (String) session.getAttribute("customerName");

        if (customerName == null) {
            customerName = "Guest";
        }

        // Calculate total
        double totalAmount = product.getPrice() * quantity;

        // Send data to JSP
        model.addAttribute("product", product);
        model.addAttribute("quantity", quantity);
        model.addAttribute("total", totalAmount);
        model.addAttribute("customerName", customerName);

        return "bill";
    }
    
    

}
