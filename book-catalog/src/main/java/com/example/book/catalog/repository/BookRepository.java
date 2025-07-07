// repository/BookRepository.java
package com.example.bookcatalog.repository;

import com.example.bookcatalog.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
    List<Book> findTop10ByOrderByIdDesc();
    List<Book> findAllByOrderByTitleAsc();
    List<Book> findByTitleContainingIgnoreCase(String title);
}