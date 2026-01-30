#!/bin/bash
# Резервное копирование файлов (темы, плагины)

# What it doin?
# - Архивирует папку data/wp-content
# - Сохраняет с датой в папку backups/files/


# Создаём папку для бэкапов файлов
mkdir -p backups/files

# Имя архива с датой
DATE=$(date +%Y%m%d_%H%M%S)
ARCHIVE_FILE="backups/files/${DATE}_wp-content_backup.tar.gz"

# Создаём архив
echo "Создаём бэкап файлов..."
tar -czf "$ARCHIVE_FILE" wp-content/

# Проверяем результат
if [ $? -eq 0 ]; then
    echo "✅ Бэкап файлов успешно создан: $ARCHIVE_FILE"
else
    echo "❌ Ошибка при создании бэкапа файлов!"
    exit 1
fi


# Use:
# ./scripts/backup-files.sh