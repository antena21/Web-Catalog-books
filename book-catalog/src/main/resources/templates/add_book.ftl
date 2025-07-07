<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Добавить книгу | Книжный каталог</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <style>
        .author-checkbox {
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .author-checkbox input {
            margin: 0;
        }
        .authors-section {
            margin-top: 1.5rem;
            padding-top: 1rem;
            border-top: 1px solid #eee;
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
            <h1><i class="fas fa-plus-circle"></i> Добавление новой книги</h1>
            
            <form method="post" action="/books/save">
                <div class="form-group">
                    <label for="title"><i class="fas fa-book"></i> Название книги:</label>
                    <input type="text" id="title" name="title" class="form-control" required
                           placeholder="Введите название книги">
                </div>
                
                <div class="authors-section">
                    <h3><i class="fas fa-user-edit"></i> Авторы:</h3>
                    <#if allAuthors?size gt 0>
                        <#list allAuthors as author>
                            <label class="author-checkbox">
                                <input type="checkbox" name="authorIds" value="${author.id}">
                                ${author.name}
                            </label>
                        </#list>
                    <#else>
                        <p>Нет доступных авторов. Сначала <a href="/authors/add">добавьте автора</a>.</p>
                    </#if>
                </div>
                
                <div class="action-buttons">
                    <button type="submit" class="btn btn-success">
                        <i class="fas fa-save"></i> Сохранить
                    </button>
                    <a href="/books" class="btn btn-primary">
                        <i class="fas fa-arrow-left"></i> Назад к списку
                    </a>
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