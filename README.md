# JAB Martial Arts - PocketBase Backend

Этот репозиторий содержит PocketBase backend для проекта JAB Martial Arts.

## Деплой на Railway

1. Подключите этот репозиторий к Railway
2. Railway автоматически определит Dockerfile и запустит сборку
3. После деплоя получите URL и добавьте его в Vercel как `NEXT_PUBLIC_POCKETBASE_URL`

## Структура

- `pocketbase` - PocketBase бинарник
- `pb_data/` - Данные PocketBase (коллекции, настройки)
- `Dockerfile` - Конфигурация для Docker
- `railway.json` - Конфигурация для Railway

## Переменные окружения

- `PORT` - Порт (автоматически устанавливается Railway)
- `POCKETBASE_DATA_DIR` - Путь к данным (по умолчанию `/pb_data`)


