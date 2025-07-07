<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Редактировать книгу: ${book.title}</title>
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
            <h1><i class="fas fa-edit"></i> Редактирование книги</h1>
            
            <form method="post" action="/books/save">
                <input type="hidden" name="id" value="${book.id}">
                
                <div class="form-group">
                    <label for="title">Название книги:</label>
                    <input type="text" id="title" name="title" value="${book.title}" class="form-control" required>
                </div>
                
                <div class="form-group">
                    <h3><i class="fas fa-user-edit"></i> Авторы:</h3>
                    <#list allAuthors as author>
                        <div class="form-check">
                            <input type="checkbox" id="author-${author.id}" name="authorIds" value="${author.id}" 
                                   ${book.authorIds?seq_contains(author.id)?string('checked','')}>
                            <label for="author-${author.id}" class="form-check-label">${author.name}</label>
                        </div>
                    </#list>
                </div>
                
                <div class="action-buttons">
                    <button type="submit" class="btn btn-success"><i class="fas fa-save"></i> Сохранить</button>
                    <a href="/books/${book.id}" class="btn btn-primary"><i class="fas fa-times"></i> Отмена</a>
                </div>
            </form>
        </div>
    </main>

    <footer>
        <div class="container">
            <p>&copy; 2025 Книжный каталог. Все права защищены.</p>
        </div>
    </footer>
</body>
</html>