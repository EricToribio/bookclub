package com.bookclub.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.bookclub.bookclub.models.LoginUser;
import com.bookclub.bookclub.models.User;
import com.bookclub.bookclub.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {
    
    // Add once service is implemented:
    @Autowired
    private UserService userServ;
    
    @GetMapping("/")
    public String index(Model model, HttpSession session) {
        if(session.getAttribute("user_id") != null){
            return "redirect:/home";
        }
        // Bind empty User and LoginUser objects to the JSP
        // to capture the form input
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
        // TO-DO Later -- call a register method in the service 
        // to do some extra validations and create a new user!
        
        if(result.hasErrors()) {
            // Be sure to send in the empty LoginUser before 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
        // in other words, log them in.
        User registerUser = userServ.register(newUser, result);
        session.setAttribute("user_id", registerUser.getId());
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
        // User user = userServ.login(newLogin, result);
    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        User user = userServ.login(newLogin, result);
        session.setAttribute("user_id", user.getId());
            
            return "redirect:/home";
    }
    @GetMapping("/home")
    public String home(HttpSession session){
        if(session.getAttribute("user_id") == null){
            return "redirect:/";
        }
        return "dashboard.jsp";
    }

    @PostMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("user_id");
        return "redirect:/";
    }

    
}