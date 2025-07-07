package com.example.bookcatalog.controller;

import com.example.bookcatalog.dto.BookEditDto;
import com.example.bookcatalog.model.Book;
import com.example.bookcatalog.service.AuthorService;
import com.example.bookcatalog.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.stream.Collectors;

@Controller
@RequestMapping("/books")
public class BookController {

    private final BookService bookService;
    private final AuthorService authorService;

    @Autowired
    public BookController(BookService bookService, AuthorService authorService) {
        this.bookService = bookService;
        this.authorService = authorService;
    }

    @GetMapping
    public String listBooks(@RequestParam(required = false) String search, Model model) {
        model.addAttribute("books", 
            search == null || search.isEmpty() 
                ? bookService.allBooks() 
                : bookService.searchBooks(search));
        return "books";
    }

    @GetMapping("/{id}")
    public String bookDetail(@PathVariable Long id, Model model) {
        model.addAttribute("book", bookService.findById(id));
        return "book_detail";
    }

    @GetMapping("/add")
    public String addBookForm(Model model) {
        model.addAttribute("book", new BookEditDto());
        model.addAttribute("allAuthors", authorService.findAllSorted());
        return "add_book";
    }

    @GetMapping("/edit/{id}")
    public String editBookForm(@PathVariable Long id, Model model) {
        Book book = bookService.findById(id);
        BookEditDto dto = new BookEditDto();
        dto.setId(book.getId());
        dto.setTitle(book.getTitle());
        dto.setAuthorIds(book.getAuthors().stream()
            .map(author -> author.getId())
            .collect(Collectors.toSet()));
        
        model.addAttribute("book", dto);
        model.addAttribute("allAuthors", authorService.findAllSorted());
        return "edit_book";
    }

    @PostMapping("/save")
    public String saveBook(@ModelAttribute BookEditDto bookDto) {
        Book book = bookDto.getId() == null ? new Book() : bookService.findById(bookDto.getId());
        book.setTitle(bookDto.getTitle());
        
        // Обновляем авторов
        book.getAuthors().clear();
        bookDto.getAuthorIds().forEach(authorId -> {
            book.addAuthor(authorService.findById(authorId));
        });
        
        bookService.save(book);
        return "redirect:/books/" + book.getId();
    }
    
    @GetMapping("/delete-confirm/{id}")
public String confirmDeleteBook(@PathVariable Long id, Model model) {
    model.addAttribute("book", bookService.findById(id));
    return "delete_book_confirm";
}

    @GetMapping("/delete/{id}")
    public String deleteBook(@PathVariable Long id) {
        bookService.deleteById(id);
        return "redirect:/books";
    }
}