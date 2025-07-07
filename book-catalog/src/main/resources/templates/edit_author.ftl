<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Редактировать автора | Книжный каталог</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <style>
        .author-books-list {
            margin-top: 2rem;
            border-top: 1px solid #eee;
            padding-top: 1rem;
        }
        .book-item {
            padding: 0.75rem;
            margin-bottom: 0.5rem;
            background: #f9f9f9;
            border-radius: 4px;
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
            <h1><i class="fas fa-user-edit"></i> Редактирование автора</h1>
            
            <form method="post" action="/authors/edit/${author.id}">
                <input type="hidden" name="id" value="${author.id}">
                
                <div class="form-group">
                    <label for="name"><i class="fas fa-signature"></i> Имя автора:</label>
                    <input type="text" id="name" name="name" value="${author.name}" 
                           class="form-control" required>
                </div>
                
                <div class="action-buttons">
                    <button type="submit" class="btn btn-success">
                        <i class="fas fa-save"></i> Сохранить изменения
                    </button>
                    <a href="/authors/${author.id}" class="btn btn-primary">
                        <i class="fas fa-times"></i> Отмена
                    </a>
                </div>
            </form>

            <div class="author-books-list">
                <h3><i class="fas fa-book"></i> Книги этого автора:</h3>
                
                <#if author.books?? && author.books?size gt 0>
                    <#list author.books as book>
                        <div class="book-item">
                            <a href="/books/${book.id}">${book.title}</a>
                        </div>
                    </#list>
                <#else>
                    <p>У автора пока нет книг в каталоге</p>
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