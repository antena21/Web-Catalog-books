<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Список авторов | Книжный каталог</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <style>
        .author-card {
            transition: transform 0.2s;
        }
        .author-card:hover {
            transform: translateY(-3px);
        }
        .books-count {
            color: #666;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <nav>
                <div class="logo">
                    <i class="fas fa-book-open"></i>
                    <a href="/">Книжный каталог</a>
                </div>
                <div class="nav-links">
                    <a href="/books"><i class="fas fa-book"></i> Книги</a>
                    <a href="/authors"><i class="fas fa-user-edit"></i> Авторы</a>
                    <a href="/books/add"><i class="fas fa-plus-circle"></i> Добавить книгу</a>
                </div>
            </nav>
        </div>
    </header>

    <main class="container">
        <div class="card">
            <h1><i class="fas fa-user-edit"></i> Список авторов</h1>
            
            <form method="get" action="/authors" class="search-form">
                <input type="text" name="search" placeholder="Поиск по имени автора..." 
                       value="${search!}" class="form-control">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-search"></i> Найти
                </button>
                <a href="/authors/add" class="btn btn-success">
                    <i class="fas fa-plus"></i> Добавить автора
                </a>
            </form>

            <div class="book-list">
                <#if authors?? && authors?size gt 0>
                    <#list authors as author>
                        <div class="book-card author-card">
                            <div class="book-card-content">
                                <h3>
                                    <i class="fas fa-user-edit" style="align-self: center;"></i>
                                    <a href="/authors/${author.id}">${author.name}</a>
                                    <span class="books-count">
                                        (${author.books?size} <#if author.books?size == 1>книга<#else>книг</#if>)
                                    </span>
                                </h3>
                                <div class="action-buttons">
                                    <a href="/authors/${author.id}" class="btn btn-primary">
                                        <i class="fas fa-info-circle"></i> Подробнее
                                    </a>
                                    <a href="/authors/edit/${author.id}" class="btn btn-secondary">
                                        <i class="fas fa-edit"></i> Редактировать
                                    </a>
                                    <a href="/authors/delete-confirm/${author.id}" class="btn btn-danger">
                                        <i class="fas fa-trash-alt"></i> Удалить
                                    </a>
                                </div>
                            </div>
                        </div>
                    </#list>
                <#else>
                    <p>Авторы не найдены</p>
                </#if>
            </div>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2025 Книжный каталог. Все права защищены.</p>
        </div>
    </footer>
</body>
</html>