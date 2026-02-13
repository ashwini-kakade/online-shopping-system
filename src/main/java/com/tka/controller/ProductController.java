package com.tka.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map; // ✅ Correct import

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tka.model.Product;
import com.tka.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
    
    @Autowired
    ProductService productService;

    @GetMapping("/shop")
    public String getShopPage(Model model) {
        List<Product> list = productService.getAllProduct();
        model.addAttribute("productList", list);
        return "shop";  
    }



    @GetMapping("/get-allProducts")
    public String getAllProducts(Model model, HttpSession session) {
        List<Product> productList = productService.getAllProduct();
        model.addAttribute("plist", productList);

        // Add cart info for quantity display
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        if(cart == null) {
            cart = new HashMap<>();
        }
        model.addAttribute("cart", cart);

        return "allproductDetails";
    }

    @GetMapping("/home")
    public String home(Model model) {
        List<Product> list = productService.getAllProduct();
        model.addAttribute("plist", list);
        return "home"; // home.jsp
    }
    
    @PostMapping("/update-quantity")
    public String updateQuantity(@RequestParam int productId,
                                 @RequestParam String action,
                                 @RequestParam int quantity,
                                 HttpSession session) {
        
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }

        switch(action) {
            case "increase":
                cart.put(productId, quantity + 1);
                break;
            case "decrease":
                if(quantity > 1) cart.put(productId, quantity - 1);
                break;
            case "addToCart":
                cart.put(productId, quantity);
                session.setAttribute("cart", cart);
                return "redirect:/cart";
            case "buyNow":
                cart.put(productId, quantity);
                session.setAttribute("cart", cart);
                return "redirect:/checkout";
        }

        session.setAttribute("cart", cart);
        return "redirect:/get-allProducts";
    }
    
    @PostMapping("/buyNow")
    public String buyNow(@RequestParam int productId,
                         @RequestParam int quantity,
                         Model model) {

        Product p = productService.getById(productId);

        model.addAttribute("product", p);
        model.addAttribute("quantity", quantity);
        model.addAttribute("total", p.getPrice() * quantity);

        return "bill";   // bill.jsp
    }

    @PostMapping("/addToCart")
    public String addToCart(@RequestParam int productId,
                            @RequestParam int quantity,
                            HttpSession session) {

        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        if (cart == null) cart = new HashMap<>();

        cart.put(productId, quantity);
        session.setAttribute("cart", cart);

        return "redirect:/cart";   // cart.jsp
    }

    @GetMapping("/cart")
    public String cartPage(Model model, HttpSession session) {

        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");

        List<Product> cartProducts = new ArrayList<>();

        if (cart != null) {
            for (Integer id : cart.keySet()) {

                Product p = productService.getById(id);

                if (p != null) {  // 🔥 prevent NULL POINTER

                    Product copy = new Product();
                    copy.setProductid(p.getProductid());
                    copy.setProductname(p.getProductname());
                    copy.setCategory(p.getCategory());
                    copy.setImagePath(p.getImagePath());

                    int qty = cart.get(id);
                    double total = p.getPrice() * qty;

                    copy.setPrice(total); // price = total
                    cartProducts.add(copy);
                }
            }
        }

        model.addAttribute("cartlist", cartProducts);

        return "cart";   
    }

}
