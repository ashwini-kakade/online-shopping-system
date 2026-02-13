package com.tka.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tka.model.Customer;
import com.tka.service.CustomerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerController {

    @Autowired
    CustomerService customerService;

    @PostMapping("/verify-login")
    public String verifyLogin(String username, String password,
                              Model model, HttpSession session) {

    	Customer customer = customerService.verifyLogin(username, password);

    	if (customer != null) {

    	    // ⭐ Save customer full name
    	    session.setAttribute("customerName", customer.getName());

    	    return "home";
    	} else {
    	    model.addAttribute("msg", "Invalid username or password!");
    	    return "login";
    	}
    }



    // Handle Registration
    @PostMapping("/register-customer")
    public String registerCustomer(Customer customer, Model model) {

        boolean isAdded = customerService.addCustomer(customer);

        if (isAdded) {
            model.addAttribute("msg", "Registration Successful!");
            return "login";  // After registration → go to login page
        } else {
            model.addAttribute("msg", "Registration Failed! Try Again.");
            return "register";
        }
        
    }
    ///get-productPage
    @GetMapping("/get-allcustomerDetails")
    public String getAllCustomer(Model model) {
        List<Customer> list = customerService.getAllCustomers();
        model.addAttribute("clist", list);  
        return "allcustomerDetails";
    }
 // Delete customer
    @GetMapping("/delete-customer")
    public String deleteCustomer(@RequestParam int customerId) {
        customerService.delete(customerId);
        return "redirect:/get-allcustomerDetails";  // FIXED
    }


    // Load edit form
    @GetMapping("/edit-customer")
    public String editCustomer(@RequestParam int customerId, Model model) {
        Customer c = customerService.getById(customerId);
        model.addAttribute("customer", c);
        return "editcustomer";
    }

    // Update customer
    @PostMapping("/update-customer")
    public String updateCustomer(@ModelAttribute Customer customer) {
        customerService.update(customer);
        return "redirect:/get-allcustomerDetails";  // FIXED
    }
    
   

   
    	}

