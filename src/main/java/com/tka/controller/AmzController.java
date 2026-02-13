package com.tka.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AmzController {

//    @GetMapping("/")
//    public String getIndexPage() {
//        return "index";  // index.jsp
//    }

    @GetMapping("/")
    public String getHomePage() {
        return "home";   // home.jsp
    }

    @GetMapping("/get-loginPage")
    public String getLoginPage() {
        return "login";  // login.jsp
    }

    @GetMapping("/get-registerpage")
    public String getRegisterPage() {
        return "register"; // register.jsp
        
    }
    
    @GetMapping("/get-viewPage")
    public String getviewPage() {
        return "view"; // view.jsp
        
    }

      @GetMapping("/get-logoutPage") 
    public String getlogoutPage() {
        return "login"; // to index.jsp
    }
    
    
    
    
}
