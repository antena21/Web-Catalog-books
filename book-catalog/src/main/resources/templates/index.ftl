<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Книжный каталог</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <style>
        .book-card {
            position: relative;
            transition: transform 0.3s;
        }
        .book-card:hover {
            transform: translateY(-5px);
        }
        .book-title {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 0.5rem;
        }
        .book-title i {
            color: var(--primary);
        }
        .authors {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin: 0.5rem 0;
        }
        .author-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            background: #f0f4f8;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.9rem;
        }
        .author-badge i {
            color: var(--secondary);
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
            <h1><i class="fas fa-home"></i> Добро пожаловать в книжный каталог!</h1>
            <p>Здесь вы можете найти книги и авторов, а также управлять каталогом.</p>
            
            <h2><i class="fas fa-star"></i> Последние добавленные книги</h2>
            <div class="book-list">
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
                            </div>
                        </div>
                    </div>
                </#list>
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