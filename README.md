# سامانه رزرواسیون هتل (Spring Boot + HTML/CSS/JS + MySQL + Docker)

این مخزن شامل یک نمونه سامانه ساده رزرواسیون هتل است که اجزای زیر را دارد:

- بک‌اند: Spring Boot (REST API)، دیتابیس MySQL، مستندات Swagger/OpenAPI
- فرانت‌اند: HTML + CSS + JS ساده (بدون فریم‌ورک) که از API بک‌اند مصرف می‌کند
- اجرا با Docker Compose: اجرای همزمان MySQL، بک‌اند و فرانت‌اند
- تست‌های اولیه در بک‌اند با Spring Boot Test/MockMvc

## ساختار پوشه‌ها

```
backend/               # کد جاوا (Spring Boot)
frontend/              # صفحات استاتیک HTML/CSS/JS
docker-compose.yml     # ارکستریشن سرویس‌ها
```

## اجرای سریع با Docker

پیش‌نیاز: نصب `Docker` و `Docker Compose`

1) اجرای سرویس‌ها:

```bash
docker compose up --build -d
```

- MySQL روی پورت `3306`
- بک‌اند روی پورت `8080`
- فرانت‌اند روی پورت `8081`

2) دسترسی‌ها:

- Swagger UI: `http://localhost:8080/swagger-ui.html`
- API Docs: `http://localhost:8080/v3/api-docs`
- فرانت‌اند: `http://localhost:8081`

3) توقف سرویس‌ها:

```bash
docker compose down
```

4) پاک کردن داده‌های دیتابیس:

```bash
docker compose down -v
```

## پیکربندی‌ها

- متغیرهای محیطی دیتابیس در `docker-compose.yml` تنظیم شده‌اند.
- تنظیمات اتصال دیتابیس در `backend/src/main/resources/application.yml` از متغیرها استفاده می‌کند:
    - `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`
- برای فرانت‌اند، فایل `frontend/public/config.js` آدرس پایه بک‌اند را تعیین می‌کند. برای حالت Compose می‌توانید مقدار
  را به `http://backend:8080` تغییر دهید یا همان‌طور که در `docker-compose.yml` مونت شده استفاده کنید.

نمونه `config.js`:

```js
window.BACKEND_BASE_URL = 'http://localhost:8080';
```

در حالت Docker Compose می‌توانید به جای آن از:

```js
window.BACKEND_BASE_URL = 'http://backend:8080';
```

استفاده کنید (با مونت کردن فایل).

## API های اصلی

- `GET /api/hotels` لیست هتل‌ها
- `GET /api/hotels/{id}/rooms?available=true&from=YYYY-MM-DD&to=YYYY-MM-DD` اتاق‌های خالی یک هتل در بازه
- `POST /api/reservations` ثبت رزرو

نمونه `POST /api/reservations`:

```json
{
  "roomId": 1,
  "guestName": "Ali Ahmadi",
  "guestEmail": "ali@example.com",
  "startDate": "2025-11-12",
  "endDate": "2025-11-14"
}
```

## توسعه محلی (بدون Docker)

پیش‌نیازها: JDK 17، Maven، MySQL

1) اجرای MySQL و ساخت دیتابیس:

```sql
CREATE
DATABASE hotel_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE
USER 'hotel'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON hotel_db.* TO
'hotel'@'%';
FLUSH
PRIVILEGES;
```

2) اجرای بک‌اند:

```bash
cd backend
mvn spring-boot:run
```

3) باز کردن فرانت‌اند:
   فایل `frontend/public/index.html` را در مرورگر باز کنید یا با یک سرور استاتیک روی پورت دلخواه سرو کنید.

## تست‌ها

اجرای تست‌های بک‌اند:

```bash
cd backend
mvn test
```

## نکات فنی

- CORS برای کنترلرها با `@CrossOrigin` فعال شده تا فرانت‌اند بتواند مستقیم به API درخواست بزند.
- مستندات Swagger با `springdoc-openapi` در مسیر `/swagger-ui.html` در دسترس است.
- استراتژی JPA `ddl-auto=update` برای ساده‌سازی توسعه تنظیم شده است. در محیط‌های واقعی پیشنهاد می‌شود از migration (
  مانند Flyway/liquibase) استفاده شود.

## برنامه توسعه آتی (پیشنهادی)

- احراز هویت کاربران و مدیریت نقش‌ها
- مدیریت پرداخت و صورتحساب
- بهبود اعتبارسنجی تاریخ‌ها و جلوگیری از تداخل رزرو
- تست‌های یکپارچه و داده‌های نمونه (seed)
