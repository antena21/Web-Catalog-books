<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Подтверждение удаления: ${book.title}</title>
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
            <h1><i class="fas fa-exclamation-triangle"></i> Подтверждение удаления</h1>
            
            <div class="confirmation-box">
                <p>Вы действительно хотите удалить книгу <strong>${book.title}</strong>?</p>
                
                <#if book.authors?size gt 0>
                    <p>Эта книга связана с авторами:
                        <#list book.authors as author>
                            <span class="author-badge">${author.name}</span>
                        </#list>
                    </p>
                </#if>
                
                <div class="action-buttons">
                    <a href="/books/delete/${book.id}" class="btn btn-danger"><i class="fas fa-trash-alt"></i> Удалить</a>
                    <a href="/books/${book.id}" class="btn btn-primary"><i class="fas fa-times"></i> Отмена</a>
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