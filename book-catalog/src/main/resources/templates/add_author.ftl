<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Добавить автора | Книжный каталог</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 600px;
            margin: 0 auto;
        }
        .form-header {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 1.5rem;
            color: var(--secondary);
        }
        .form-header i {
            font-size: 1.5rem;
        }
        .form-control {
            transition: border-color 0.3s;
        }
        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(74, 111, 165, 0.25);
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
            <div class="form-container">
                <div class="form-header">
                    <i class="fas fa-user-plus"></i>
                    <h1>Добавление нового автора</h1>
                </div>
                
                <form method="post" action="/authors/add">
                    <div class="form-group">
                        <label for="name" class="form-label">
                            <i class="fas fa-signature"></i> Имя автора:
                        </label>
                        <input type="text" id="name" name="name" class="form-control" required
                               placeholder="Введите полное имя автора"
                               aria-describedby="nameHelp">
                        <small id="nameHelp" class="form-text">
                            Укажите полное имя автора (Фамилия Имя Отчество, если есть)
                        </small>
                    </div>
                    
                    <div class="action-buttons">
                        <button type="submit" class="btn btn-success">
                            <i class="fas fa-save"></i> Сохранить
                        </button>
                        <a href="/authors" class="btn btn-primary">
                            <i class="fas fa-arrow-left"></i> Назад к списку
                        </a>
                    </div>
                </form>
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