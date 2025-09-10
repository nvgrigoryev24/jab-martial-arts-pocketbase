FROM alpine:latest

# Устанавливаем необходимые пакеты
RUN apk add --no-cache ca-certificates

# Копируем PocketBase бинарник
COPY pocketbase /usr/local/bin/pocketbase

# Копируем данные PocketBase
COPY pb_data /pb_data

# Делаем бинарник исполняемым
RUN chmod +x /usr/local/bin/pocketbase

# Открываем порт
EXPOSE 8090

# Запускаем PocketBase
CMD ["pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/pb_data"]
