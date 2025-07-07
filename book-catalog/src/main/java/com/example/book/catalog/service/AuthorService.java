package com.example.bookcatalog.service;

import com.example.bookcatalog.model.Author;
import com.example.bookcatalog.repository.AuthorRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AuthorService {

    private final AuthorRepository authorRepository;

    public AuthorService(AuthorRepository authorRepository) {
        this.authorRepository = authorRepository;
    }

    public List<Author> findAllSorted() {
        return authorRepository.findAllByOrderByNameAsc();
    }

    public List<Author> searchByName(String name) {
        return authorRepository.findByNameContainingIgnoreCaseOrderByNameAsc(name);
    }

    public Author findById(Long id) {
        return authorRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Author not found with id: " + id));
    }

    public Author findByIdWithBooks(Long id) {
        return authorRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Author not found with id: " + id));
    }

    public Author save(Author author) {
        return authorRepository.save(author);
    }

    @Transactional
    public void deleteById(Long id) {
        Author author = findById(id);
        // Удаляем связи с книгами перед удалением автора
        author.getBooks().forEach(book -> book.getAuthors().remove(author));
        authorRepository.delete(author);
    }
}