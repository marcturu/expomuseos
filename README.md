# <img alt="Laravel Logo" src="https://upload.wikimedia.org/wikipedia/commons/9/9a/Laravel.svg" height="45px"> ExpoMuseos — Laravel full-stack museums & exhibitions directory

<sub>🗓️ Developed in January 2026</sub>

This project consists of a **Laravel-based web application**.  
It implements a fully functional directory of museums and exhibitions using **Laravel 12**, **MySQL** (via Eloquent ORM), **Breeze Blade** for authentication, and **Tailwind CSS** with **Vite** for styling — covering migrations, models, factories, seeders, REST API endpoints, user authentication, and server deployment.

---

## ✅ Features

- **MySQL Database**: Three related tables — `museums`, `topics`, and `museum_topic` (pivot) — using Eloquent migrations and a many-to-many relationship. Includes 2 real museums with at least 2 topics each, plus 40 fictional museums generated with **Factory** & **Faker** (42 total).
- **Topics (Temáticas)**: 8 topics total (4 created manually via **Tinker**, 4 generated via **Seeder**). At least 20 museums have 2 or more topics assigned (137 total museum-topic relations).
- **Home Page**: Shows 2 fixed real museums and 3 randomly rotating museums on each page load, each with name (linked), city, price, and image.
- **Museum Detail Page**: Individual page for each museum (`/museum/{id}`) showing all fields plus all associated topics, with a back button to return to the home listing.
- **Navigation Menu**: Full navbar with: Home, API_museums, API_museum, API_topic (always visible); Dashboard, Profile, Log Out (authenticated only); Register, Log In (guest only). Built with **Breeze Blade** components and `@auth` / `@guest` directives.
- **User Authentication**: Register, Log In, Log Out, Profile (update + delete account) — all provided by **Laravel Breeze**. Passwords hashed automatically by Laravel.
- **REST API**: Three read-only JSON endpoints with manual pagination (5 results/page) — `/api/museums/<page>`, `/api/museum/<id>`, `/api/topic/<id>/<page>` — all openable in a new tab from the nav menu. Returns `404` if not found. Tested with **POSTMAN**.
- **Deployed**: Published and tested on the server at `https://eimtcms2.techlab.uoc.edu/~mturur/pec4/dbphppec4_museums/public`.

---

## 🛠 Installation & Setup

> If you encounter any issues running the project locally, you can consult the original WAMP installation guide included at `DOCS/WAMPSetupGuide.pdf`.

### 0. Prerequisites

Make sure you have installed:
- **WAMP / LAMP / MAMP** (or equivalent local server stack)
- **PHP >= 8.2** with PDO and MySQL extensions enabled
- **Composer** (PHP dependency manager)
- **Node.js & npm** (for Vite + Tailwind CSS compilation)
- **MySQL** (via PhpMyAdmin or equivalent)

> ⚠️ On Windows, make sure `php -v` returns a version ≥ 8.2 and that `pdo_mysql` is enabled in `php.ini`.  
> ⚠️ If WAMP does not start correctly, it may require the Visual C++ Redistributable packages.

### 1. Clone the repository
```bash
git clone https://github.com/marcturu/expo-museos.git
```

### 2. Relocate the project
Move or copy the project folder inside WAMP's `www` folder, e.g.:  
`C:\wamp64\www\expo-museos`
> WAMP serves everything inside its `www` folder, so the project must be located there to access it.

### 3. Install PHP dependencies
```bash
composer install
```

### 4. Install Node dependencies and compile assets
```bash
npm install
npm run build
```
> For active development with hot reload, use `npm run dev` in a separate terminal instead of `npm run build`.

### 5. Configure the environment
Copy the example environment file and set your local credentials:
```bash
cp .env.example .env
php artisan key:generate
```

Then edit `.env`:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=dbphppec4_db
DB_USERNAME=root
DB_PASSWORD=

CACHE_STORE=file
SESSION_DRIVER=file
```

### 6. Create the database and run migrations
Create a new database named `dbphppec4_db` in PhpMyAdmin, then run:
```bash
php artisan migrate:fresh
```

> ⚠️ If you encounter a *"Specified key was too long"* error, add the following to `App/Providers/AppServiceProvider.php` in the `boot()` method:
> ```php
> use Illuminate\Support\Facades\Schema;
> Schema::defaultStringLength(191);
> ```
> Then re-run `php artisan migrate:fresh`.

### 7. Seed the database
```bash
php artisan db:seed
```
This will create 4 topics via `TopicSeeder`, 40 fictional museums via `MuseumFactory` + `MuseumSeeder`, and assign topics to each museum.

The 2 real museums and their initial topics were created manually via Tinker. To recreate them:
```bash
php artisan tinker
```
```php
use App\Models\Museum;
use App\Models\Topic;

$history = Topic::create(['name' => 'Historia del arte']);
// ... create other topics

$british = Museum::create([
    'name' => 'Museo Británico',
    'city' => 'Londres',
    'schedule' => 'Lunes a sábado, 10:00–20:00',
    'guided_tours' => 'sí',
    'price' => 15.50,
    'image' => 'british.jpg'
]);
$british->topics()->attach([$history->id, $archaeology->id]);
```

### 8. Access the site
Open your browser and navigate to:
```
http://localhost/expo-museos/public
```
Or start the built-in server:
```bash
php artisan serve
```
Then visit `http://127.0.0.1:8000`.

Test credentials (pre-registered user):
- **Email**: admin@fakemail.com
- **Username**: admin
- **Password**: uoc-25-S1@

### 9. Live deployment

#### Current LIVE Status (2026) ![status: inactive](https://img.shields.io/badge/status-inactive-red)

> ⚠️ **Important Note** > The project was deployed on the server:
```
https://eimtcms2.techlab.uoc.edu/~mturur/pec4/dbphppec4_museums/public
```
> Which was configured and maintained during 2025/26.  
> As of today, the application is no longer running on their servers (although the screenshots show how it used to).

---

## 📂 Project Structure

```
DOCS/
├── ExplanationReport.pdf               ← Implementation details.
├── Statement.jpg                       ← Summarized project statement.
├── TestsReport.pdf                     ← Test report verifying each requirement against the live server.
└── WAMPSetupGuide.pdf                  ← Optional reference for original WAMP setup.
app/
├── Http/Controllers/
│   ├── MuseumController.php            ← Home & museum detail logic
│   └── Api/
│       └── MuseumApiController.php     ← API endpoints (museums, museum, topic)
├── Models/
│   ├── Museum.php                      ← Museum model (belongsToMany Topic)
│   └── Topic.php                       ← Topic model (belongsToMany Museum)
└── Providers/
    ├── AppServiceProvider.php          ← defaultStringLength fix
    └── RouteServiceProvider.php        ← API middleware + prefix config
database/
├── factories/
│   └── MuseumFactory.php               ← Faker-based museum data factory
├── migrations/
│   ├── ..._create_museums_table.php
│   ├── ..._create_topics_table.php
│   └── ..._create_museum_topic_table.php
└── seeders/
    ├── DatabaseSeeder.php
    ├── MuseumSeeder.php
    └── TopicSeeder.php
resources/
└── views/
    ├── home.blade.php                  ← Home page (featured museums)
    ├── museum.blade.php                ← Individual museum detail page
    └── layouts/
        └── navigation.blade.php       ← Session-aware navbar
routes/
├── web.php                             ← Home & museum detail routes
└── api.php                             ← API routes (prefix: /api)
public/
└── build/                              ← Compiled Tailwind CSS + JS (npm run build)
.env                                    ← Environment config (DB, cache, session)
```

---

## 🔌 API Reference

All three endpoints return **JSON** and are **read-only** (GET). No authentication required. They open in a new browser tab from the nav menu.

| Endpoint | Description |
|---|---|
| `/api/museums/<page>` | Returns up to 5 museums per page with all fields and topics |
| `/api/museum/<id>` | Returns all fields + topics for the museum with the given ID |
| `/api/topic/<id>/<page>` | Returns up to 5 museums (id, name, city) for the given topic, paginated |

All endpoints return pagination metadata: `current_page`, `per_page`, `total`, `last_page`.  
Returns `404` JSON response if no results are found.

**Example response** (`/api/museums/1`):
```json
{
  "current_page": 1,
  "data": [
    {
      "id": 1,
      "name": "Museo Británico",
      "city": "Londres",
      "schedule": "Lunes a sábado, 10:00–20:00",
      "guided_tours": "sí",
      "price": "15.50",
      "image": "british.jpg",
      "topics": "Historia del arte", "Arqueología"
    },
    {
      ...
    }
  ],
  "per_page": 5,
  "total": 42,
  "last_page": 9
}
```

---

## 🔒 Security

- User authentication and password hashing handled automatically by **Laravel Breeze**.
- All database queries use **Eloquent ORM** with parameterised bindings to prevent SQL injection.
- API endpoints are stateless and use the `api` middleware group.
- All user-facing output is escaped by Blade's `{{ }}` syntax to prevent XSS.

---

## 📷 Screenshots

### Menu (guest):
![MenuGuest](screenshots/MenuGuest.jpg)

### Menu (authenticated):
![MenuAuth](screenshots/MenuAuth.jpg)

### Home:
![Home](screenshots/Home.jpg)

### Museum Detail Page:
![MuseumDetail](screenshots/MuseumDetail.jpg)

### Register:
![Register](screenshots/Register.jpg)

### Log In:
![Login](screenshots/Login.jpg)

### Profile:
![Profile](screenshots/Profile.jpg)

### Dashboard:
![Dashboard](screenshots/Dashboard.jpg)

### API Museums (page 1):
![ApiMuseums](screenshots/API_museums.jpg)

### API Museum (id 1):
![ApiMuseum](screenshots/API_museum.jpg)

### API Topic (id 1, page 1):
![ApiTopic](screenshots/API_topic.jpg)

### POSTMAN — API Museums:
![PostmanMuseums](screenshots/API_museums(Postman).jpg)

### POSTMAN — API Museum:
![PostmanMuseum](screenshots/API_museum(Postman).jpg)

### POSTMAN — API Topic:
![PostmanTopic](screenshots/API_topic(Postman).jpg)

---

### Database — museums table:
![MuseumsTable](screenshots/BD_museums.jpg)

### Database — topics table:
![TopicsTable](screenshots/BD_topics.jpg)

### Database — museum_topic pivot table:
![PivotTable](screenshots/BD_museum_topic.jpg)

### Database — users table:
![UsersTable](screenshots/BD_users.jpg)

---

## ⚖️ Copyright & License

© 2026 Marc Turu Roca. All rights reserved.

This project and its contents are the exclusive intellectual property of Marc Turu Roca.  
All rights reserved. No part of this project may be copied, modified, distributed, or used without prior written permission from the author.
