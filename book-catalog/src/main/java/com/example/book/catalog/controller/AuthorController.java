package com.example.bookcatalog.controller;

import com.example.bookcatalog.model.Author;
import com.example.bookcatalog.service.AuthorService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

@Controller
@RequestMapping("/authors")
public class AuthorController {

    private final AuthorService authorService;

    public AuthorController(AuthorService authorService) {
        this.authorService = authorService;
    }

    @GetMapping
public String listAuthors(@RequestParam(name = "search", required = false) String search, Model model) {
    List<Author> authors = (search == null || search.isEmpty())
            ? authorService.findAllSorted()
            : authorService.searchByName(search);

    model.addAttribute("authors", authors);
    model.addAttribute("search", search);
    return "authors";
}

    @GetMapping("/add")
    public String addAuthorForm(Model model) {
        model.addAttribute("author", new Author());
        return "add_author";
    }

    @PostMapping("/add")
    public String addAuthor(@ModelAttribute Author author) {
        authorService.save(author);
        return "redirect:/authors";
    }

    @GetMapping("/{id}")
public String authorBooks(@PathVariable Long id, Model model) {
    Author author = authorService.findByIdWithBooks(id);
    model.addAttribute("author", author);
    model.addAttribute("books", author.getBooks()); // Добавляем список книг автора
    return "author_books"; // Имя шаблона без .ftl
}

    @GetMapping("/edit/{id}")
public String editAuthorForm(@PathVariable Long id, Model model) {
    Author author = authorService.findByIdWithBooks(id);
    model.addAttribute("author", author);
    model.addAttribute("books", author.getBooks()); // Добавляем список книг
    return "edit_author";
}

    @PostMapping("/edit/{id}")
    public String editAuthor(@PathVariable Long id, @ModelAttribute Author author) {
        author.setId(id);
        authorService.save(author);
        return "redirect:/authors/" + id;
    }

    @GetMapping("/delete-confirm/{id}")
public String confirmDeleteAuthor(@PathVariable Long id, Model model) {
    Author author = authorService.findByIdWithBooks(id);
    model.addAttribute("author", author);
    model.addAttribute("booksCount", author.getBooks().size());
    return "delete_author_confirm";
}
    
    @PostMapping("/delete/{id}")  // Изменили с @GetMapping на @PostMapping
    public String deleteAuthor(@PathVariable Long id) {
        authorService.deleteById(id);
        return "redirect:/authors";
    }
}