<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Список книг | Книжный каталог</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <style>
        .search-form {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            align-items: center;
            margin-bottom: 2rem;
        }
        .search-form input {
            flex: 1;
            min-width: 250px;
            max-width: 400px;
        }
        .book-card {
            position: relative;
        }
        .book-title {
            margin-bottom: 0.5rem;
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
            <h1><i class="fas fa-book"></i> Список книг</h1>
            
            <form method="get" action="/books" class="search-form">
                <input type="text" name="search" placeholder="Поиск по названию книги..." 
                       value="${search!}" class="form-control">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-search"></i> Найти
                </button>
                <a href="/books/add" class="btn btn-success">
                    <i class="fas fa-plus"></i> Добавить книгу
                </a>
            </form>

            <div class="book-list">
                <#if books?? && books?size gt 0>
                    <#list books as book>
                        <div class="book-card">
                            <div class="book-card-content">
                                <h3 class="book-title">
                                    <i class="fas fa-book"></i>
                                    <a href="/books/${book.id}">${book.title}</a>
                                </h3>
                                <#if book.authors?size gt 0>
                                    <div class="authors">
                                    <i class="fas fa-user-edit" style="align-self: center;"></i>
                                        <#list book.authors as author>
                                            <span class="author-badge">
                                                <a href="/authors/${author.id}">${author.name}</a>
                                            </span>
                                        </#list>
                                    </div>
                                </#if>
                                <div class="action-buttons">
                                    <a href="/books/${book.id}" class="btn btn-primary">
                                        <i class="fas fa-info-circle"></i> Подробнее
                                    </a>
                                    <a href="/books/edit/${book.id}" class="btn btn-secondary">
                                        <i class="fas fa-edit"></i> Редактировать
                                    </a>
                                    <a href="/books/delete-confirm/${book.id}" class="btn btn-danger">
                                        <i class="fas fa-trash-alt"></i> Удалить
                                    </a>
                                </div>
                            </div>
                        </div>
                    </#list>
                <#else>
                    <p>Книги не найдены</p>
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