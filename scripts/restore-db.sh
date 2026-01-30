#!/bin/bash
# ВОССТАНОВЛЕНИЕ БД

# What it doin?
# - Удаляет текущую базу данных
# - Создаёт новую базу
# - Импортирует данные из указанного SQL-файла


# Проверяем, передан ли аргумент
if [ $# -eq 0 ]; then
  echo "Использование: ./restore-db.sh <путь_к_файлу.sql>"
  echo "Пример: ./restore-db.sh backups/db/20240131_153022_wordpress_backup.sql"
  exit 1
fi

BACKUP_FILE=$1

# Проверяем существование файла
if [ ! -f "$BACKUP_FILE" ]; then
  echo "❌ Файл не найден: $BACKUP_FILE"
  exit 1
fi

# Загружаем переменные из .env
set -a
source ../.env
set +a

echo "Восстанавливаем базу данных из: $BACKUP_FILE"

# Удаляем и пересоздаём базу данных
docker exec wp_db mysql -u root -p"${WP_DB_ROOT_PASSWORD}" -e "
DROP DATABASE IF EXISTS ${WP_DB_NAME};
CREATE DATABASE ${WP_DB_NAME};
GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%';
FLUSH PRIVILEGES;
"

# Импортируем данные
docker exec -i wp_db mysql \
  -u root \
  -p"${WP_DB_ROOT_PASSWORD}" \
  "${WP_DB_NAME}" < "${BACKUP_FILE}"

if [ $? -eq 0 ]; then
  echo "✅ База данных успешно восстановлена!"
  echo "💡 Не забудьте обновить URL сайта, если нужно:"
  echo "   docker-compose exec wordpress wp search-replace 'старый-url' 'новый-url'"
else
  echo "❌ Ошибка при восстановлении базы данных!"
  exit 1
fi



# Use:
# Восстановить конкретный бэкап
# ./scripts/restore-db.sh backups/db/20240131_153022_wordpress_backup.sql