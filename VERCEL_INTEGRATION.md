# Интеграция с Vercel

## Настройка переменных окружения в Vercel

После деплоя PocketBase на Railway, вам нужно настроить следующие переменные в Vercel:

### 1. Переменные окружения в Vercel Dashboard

Перейдите в настройки проекта в Vercel и добавьте:

```env
NEXT_PUBLIC_POCKETBASE_URL=https://your-railway-domain.railway.app
POCKETBASE_ADMIN_EMAIL=admin@jab-martial-arts.com
POCKETBASE_ADMIN_PASSWORD=your-secure-password
```

### 2. Настройка CORS в PocketBase

PocketBase уже настроен для работы с Vercel доменами:
- `https://jab-martial-arts.vercel.app`
- `https://*.vercel.app` (для preview доменов)

### 3. Пример подключения в Next.js

```typescript
// lib/pocketbase.ts
import PocketBase from 'pocketbase';

const pb = new PocketBase(process.env.NEXT_PUBLIC_POCKETBASE_URL);

export default pb;
```

### 4. Пример использования в компонентах

```typescript
// pages/api/auth.ts
import pb from '../../lib/pocketbase';

export default async function handler(req, res) {
  try {
    const { email, password } = req.body;
    
    const authData = await pb.admins.authWithPassword(email, password);
    
    res.status(200).json({ success: true, token: authData.token });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
}
```

### 5. Настройка API Routes

Создайте следующие API routes в Next.js:

- `/api/auth/login` - авторизация
- `/api/auth/logout` - выход
- `/api/auth/refresh` - обновление токена
- `/api/collections/*` - работа с коллекциями

### 6. Безопасность

- Используйте HTTPS для всех запросов
- Настройте правильные CORS политики
- Используйте переменные окружения для чувствительных данных
- Регулярно обновляйте пароли администратора

## Получение URL Railway

После деплоя на Railway:
1. Перейдите в Dashboard Railway
2. Выберите ваш проект
3. Скопируйте URL из раздела "Domains"
4. Добавьте этот URL в переменные Vercel
