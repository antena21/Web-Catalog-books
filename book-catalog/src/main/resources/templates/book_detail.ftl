<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>${book.title}</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
    <header>
        <div class="container">
            <nav>
                <div class="logo">
                    <i class="fas fa-book-open"></i>
                    <span>Книжный каталог</span>
                </div>
                <div class="nav-links">
                    <a href="/"><i class="fas fa-home"></i> Главная</a>
                    <a href="/books"><i class="fas fa-book"></i> Книги</a>
                    <a href="/authors"><i class="fas fa-user-edit"></i> Авторы</a>
                    <a href="/books/add"><i class="fas fa-plus-circle"></i> Добавить книгу</a>
                </div>
            </nav>
        </div>
    </header>

    <main class="container">
        <div class="card">
            <h1><i class="fas fa-book"></i> ${book.title}</h1>
            
            <div class="book-details">
                <h3><i class="fas fa-user-edit"></i> Авторы:</h3>
                <div class="authors">
                    <#list book.authors as author>
                        <span class="author-badge"><a href="/authors/${author.id}">${author.name}</a></span>
                    </#list>
                </div>
            </div>

            <div class="action-buttons">
                <a href="/books/edit/${book.id}" class="btn btn-secondary"><i class="fas fa-edit"></i> Редактировать</a>
                <a href="/books/delete-confirm/${book.id}" class="btn btn-danger"><i class="fas fa-trash-alt"></i> Удалить</a>
                <a href="/books" class="btn btn-primary"><i class="fas fa-arrow-left"></i> Назад к списку книг</a>
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