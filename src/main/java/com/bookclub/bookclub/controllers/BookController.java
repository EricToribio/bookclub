package com.bookclub.bookclub.controllers;

import javax.servlet.http.HttpSession;

import com.bookclub.bookclub.service.BookService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

public class BookController {
    @Autowired
    BookService bookService;


    @GetMapping("/books")
    public String home(HttpSession session,Model model){
        if(session.getAttribute("user_id") == null){
            return "redirect:/";
        }
        model.addAttribute(bookService.allBooks());
        return "dashboard.jsp";
    }
}
