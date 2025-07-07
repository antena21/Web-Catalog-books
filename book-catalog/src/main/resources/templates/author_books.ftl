<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Книги автора: ${author.name} | Книжный каталог</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <style>
        .author-header {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 2rem;
        }
        .author-title {
            color: var(--secondary);
            margin-bottom: 0;
        }
        .books-count {
            font-size: 1.1rem;
            color: #666;
            margin-left: 10px;
        }
        .books-list {
            margin-top: 2rem;
        }
        .book-item {
            padding: 1rem;
            margin-bottom: 1rem;
            background: white;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }
        .book-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .no-books {
            padding: 2rem;
            text-align: center;
            color: #666;
            background: #f9f9f9;
            border-radius: 8px;
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
            <div class="author-header">
                <i class="fas fa-user-edit fa-3x" style="color: var(--primary);"></i>
                <div>
                    <h1 class="author-title">${author.name}</h1>
                    <#if books?? && books?size gt 0>
                        <span class="books-count">
                            ${books?size} <#if books?size == 1>книга<#elseif books?size < 5>книги<#else>книг</#if>
                        </span>
                    </#if>
                </div>
            </div>

            <#if books?? && books?size gt 0>
                <div class="books-list">
                    <h2><i class="fas fa-book"></i> Список книг</h2>
                    <#list books as book>
                        <div class="book-item">
                            <h3>
                                <a href="/books/${book.id}">${book.title}</a>
                            </h3>
                            <#if book.authors?size gt 1>
                                <div class="authors">
                                    <span>Соавторы: </span>
                                    <#list book.authors as coauthor>
                                        <#if coauthor.id != author.id>
                                            <span class="author-badge">
                                                <a href="/authors/${coauthor.id}">${coauthor.name}</a>
                                            </span>
                                        </#if>
                                    </#list>
                                </div>
                            </#if>
                        </div>
                    </#list>
                </div>
            <#else>
                <div class="no-books">
                    <i class="fas fa-book-open fa-3x" style="color: #ddd; margin-bottom: 1rem;"></i>
                    <h3>У этого автора пока нет книг в каталоге</h3>
                    <p>Вы можете добавить книги через <a href="/books/add">форму добавления книг</a></p>
                </div>
            </#if>

            <div class="action-buttons" style="margin-top: 2rem;">
                <a href="/authors/edit/${author.id}" class="btn btn-secondary">
                    <i class="fas fa-edit"></i> Редактировать автора
                </a>
                <a href="/authors/delete-confirm/${author.id}" class="btn btn-danger">
                    <i class="fas fa-trash-alt"></i> Удалить автора
                </a>
                <a href="/authors" class="btn btn-primary">
                    <i class="fas fa-arrow-left"></i> Назад к списку авторов
                </a>
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