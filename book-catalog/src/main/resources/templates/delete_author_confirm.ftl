<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Подтверждение удаления автора | Книжный каталог</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <style>
        .confirmation-box {
            max-width: 600px;
            margin: 0 auto;
        }
        .author-warning {
            background-color: #fff8f8;
            border-left: 4px solid var(--danger);
            padding: 1rem;
            margin: 1rem 0;
        }
        .author-books-count {
            font-weight: bold;
            color: var(--danger);
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
            <h1><i class="fas fa-exclamation-triangle"></i> Подтверждение удаления автора</h1>
            
            <div class="confirmation-box">
                <div class="author-info">
                    <h2>${author.name}</h2>
                    
                    <#if author.books?size gt 0>
                        <div class="author-warning">
                            <p>
                                <i class="fas fa-exclamation-circle"></i> 
                                У этого автора <span class="author-books-count">${author.books?size}</span> 
                                <#if author.books?size == 1>книга<#else>книг</#if> в каталоге:
                            </p>
                            <ul>
                                <#list author.books as book>
                                    <li>${book.title}</li>
                                </#list>
                            </ul>
                            <p>При удалении автора эти книги останутся в каталоге, но будут отвязаны от автора.</p>
                        </div>
                    <#else>
                        <p>У автора нет книг в каталоге.</p>
                    </#if>
                </div>

                <div class="action-buttons">
    <form method="post" action="/authors/delete/${author.id}" style="display: inline;">
        <!-- Убрали скрытое поле _method, так как используем POST -->
        <button type="submit" class="btn btn-danger">
            <i class="fas fa-trash-alt"></i> Удалить автора
        </button>
    </form>
    <a href="/authors/${author.id}" class="btn btn-primary">
        <i class="fas fa-times"></i> Отмена
    </a>
</div>
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