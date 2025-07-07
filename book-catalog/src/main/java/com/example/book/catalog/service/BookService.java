package com.example.bookcatalog.service;

import com.example.bookcatalog.model.Book;
import com.example.bookcatalog.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookService {
    @Autowired
    private BookRepository bookRepo;

    public List<Book> latestBooks() {
        return bookRepo.findTop10ByOrderByIdDesc();
    }
    
    public List<Book> allBooks() {
        return bookRepo.findAllByOrderByTitleAsc();
    }

    public List<Book> searchBooks(String title) {
        return bookRepo.findByTitleContainingIgnoreCase(title);
    }
    
    public Book findById(Long id) {
        return bookRepo.findById(id).orElseThrow(() -> new RuntimeException("Book not found"));
    }
    
    public Book save(Book book) {
        return bookRepo.save(book);
    }
    
    @Transactional
    public void deleteById(Long id) {
        Book book = findById(id);
        // Удаляем связи с авторами перед удалением книги
        book.getAuthors().forEach(author -> author.getBooks().remove(book));
        bookRepo.delete(book);
    }
}