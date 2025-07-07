package com.example.bookcatalog.dto;

import java.util.HashSet;
import java.util.Set;

public class BookEditDto {
    private Long id;
    private String title;
    private Set<Long> authorIds = new HashSet<>();

    // Геттеры и сеттеры
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public Set<Long> getAuthorIds() { return authorIds; }
    public void setAuthorIds(Set<Long> authorIds) { this.authorIds = authorIds; }
}