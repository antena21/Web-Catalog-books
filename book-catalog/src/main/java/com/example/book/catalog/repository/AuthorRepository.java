package com.example.bookcatalog.repository;

import com.example.bookcatalog.model.Author;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.EntityGraph;

public interface AuthorRepository extends JpaRepository<Author, Long> {
    
    @EntityGraph(attributePaths = {"books"}) // Добавьте эту аннотацию для загрузки книг
    Optional<Author> findById(Long id);
    
    List<Author> findAllByOrderByNameAsc();
    List<Author> findByNameContainingIgnoreCaseOrderByNameAsc(String name);
}
