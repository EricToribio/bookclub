package com.bookclub.bookclub.service;

import java.util.List;
import java.util.Optional;

import com.bookclub.bookclub.models.Book;
import com.bookclub.bookclub.repositories.BookRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookService {

    @Autowired
    private BookRepository bookRepo;

    public Book oneBook(Long id){
        Optional<Book> optionalBook = bookRepo.findById(id);
        if(optionalBook.isPresent()) {
            return optionalBook.get();
        } else {
            return null;
        }
    }

    public List<Book> allBooks(){
        return bookRepo.findAll();
    }

    public Book createBook(Book book){
        return bookRepo.save(book);
    }
    
}
