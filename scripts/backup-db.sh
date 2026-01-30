#!/bin/bash
# РЕЗЕРВНОЕ КОПИРОВАНИЕ БАЗЫ ДАННЫХ

# What it doin?
# - Создаёт SQL-дамп базы данных
# - Сохраняет с датой и временем в папку backups/db/


# Создаём папку для бэкапов, если её нет
mkdir -p backups/db

# Читаем переменные из .env файла
export $(grep -v '^#' .env | xargs)

# Имя файла с датой и временем
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="backups/db/${DATE}_wordpress_backup.sql"

# Делаем дамп базы данных
echo "Создаём бэкап базы данных..."
docker exec wordpress_db mysqldump -u root -p"$WP_DB_ROOT_PASSWORD" "$WP_DB_NAME" > "$BACKUP_FILE"

# Проверяем результат
if [ $? -eq 0 ]; then
    echo "✅ Бэкап успешно создан: $BACKUP_FILE"
else
    echo "❌ Ошибка при создании бэкапа!"
    exit 1
fi



# Use:

# Windows (Git Bash или WSL)
# ./scripts/backup-db.sh

# Mac/Linux
# chmod +x scripts/backup-db.sh  # Только первый раз
# ./scripts/backup-db.sh