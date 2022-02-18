package com.bookclub.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.bookclub.bookclub.models.Book;
import com.bookclub.bookclub.service.BookService;
import com.bookclub.bookclub.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
@Controller
public class BookController {
    @Autowired
    BookService bookService;
    @Autowired
    UserService userService;

    @GetMapping("/books")
    public String home(HttpSession session,Model model){
        if( session.getAttribute("user_id") == null){
            return "redirect:/";
        }
        Long id = (Long) session.getAttribute("user_id");
        model.addAttribute("user", userService.getUserById(id));
        model.addAttribute("books",bookService.allBooks());
        return "dashboard.jsp";
    }

    @GetMapping("/books/new")
    public String newBook(@ModelAttribute("book") Book book,HttpSession session,Model model){
        if( session.getAttribute("user_id") == null){
            return "redirect:/";
        }
        Long id = (Long) session.getAttribute("user_id");
        model.addAttribute("user", userService.getUserById(id));
        return "bookForm.jsp";
    }

    @PostMapping("/books/data")
    public String addBook(@Valid @ModelAttribute("book") Book book, BindingResult result,HttpSession session,Model model){
        if(result.hasErrors()) {
        Long id = (Long) session.getAttribute("user_id");
        model.addAttribute("user", userService.getUserById(id));
            return "bookForm.jsp";
        }
        
        
        bookService.createBook(book);
        return "redirect:/books";
    }
    
    @GetMapping("/books/{id}")
    public String OneBook(@PathVariable("id") Long id,Model model,HttpSession session){
        if( session.getAttribute("user_id") == null){
            return "redirect:/";
        }
        model.addAttribute("book", bookService.findBookById(id));
        return "showOneBook.jsp";
    }

    @GetMapping("/books/{id}/edit")
    public String editForm(@PathVariable("id") Long id,Model model, HttpSession session) {
		Book bookToEdit = bookService.findBookById(id);
		if( session.getAttribute("user_id") == null){
            return "redirect:/";
        }
        System.out.println(bookToEdit.getUser().getId().equals(session.getAttribute("user_id")));
	
        if(bookToEdit.getUser().getId().equals(session.getAttribute("user_id"))) {
            
			model.addAttribute("book",bookToEdit);
			return "editBook.jsp";
        }
            return "redirect:/books";
	}

    @PutMapping("/books/{id}/update")
    public String editBook(@Valid @ModelAttribute("book") Book book,BindingResult result,Model model, HttpSession session){
        if( session.getAttribute("user_id") == null){
            return "redirect:/";
        }
        if(result.hasErrors()) {
            Book bookToEdit = bookService.findBookById(book.getId());
            model.addAttribute("book",bookToEdit);
                return "editBook.jsp";
            }
            
            
            bookService.editBook(book);
            return "redirect:/books";
    }
}
