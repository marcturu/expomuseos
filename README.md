# <img alt="ExpoMuseos Logo" src="screenshots/expo-museos-logo.png" height="65px"> — Laravel full-stack museums & exhibitions directory

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
- **MySQL** (via PhpMyAdmin or equivalent)

> ⚠️ On Windows, make sure `php -v` returns a version ≥ 8.2 and that `pdo_mysql` is enabled in `php.ini`.  
> ⚠️ If WAMP does not start correctly, it may require the Visual C++ Redistributable packages.

### 1. Clone the repository

```bash
git clone https://github.com/marcturu/expomuseos.git
```

### 2. Relocate the project

Move or copy the project folder inside WAMP's `www` folder, e.g.:  
`C:\wamp64\www\expomuseos`
> WAMP serves everything inside its `www` folder, so the project must be located there to access it.  

### 3. Install PHP dependencies

The `vendor/` directory is not included in the repository. Install the required PHP dependencies with:
```bash
composer install
```

### 4. Configure the environment

Create your local `.env` file from the provided example:

```bash
cp .env.example .env
```

On Windows, you can also simply copy `.env.example` and rename the copy to `.env`.

Then generate a new application key:
```bash
php artisan key:generate
```

Configure the database connection in `.env` (if not configurated already):
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=dbphppec4_db
DB_USERNAME=root
DB_PASSWORD=
```

> The `.env` file is intentionally excluded from the repository because it contains environment-specific configuration and application secrets such as `APP_KEY`.

### 5. Import the database

Create a database named `dbphppec4_db` in PhpMyAdmin, then import the provided dump:

**PhpMyAdmin**: Import → Select file → `db/dbphppec4_db.sql` → Go

This will create all tables (`museums`, `topics`, `museum_topic`,...) and populate them with all 42 museums, 8 topics, 137 topic relations, and the test user — ready to use.  
No migrations or seeders are required for the initial setup because the provided SQL dump already contains the complete database.

### 6. Access the site

#### Option A — WAMP / Apache
If using WAMP, make sure the project is located inside the `www` directory, for example:
```text
C:\wamp64\www\expomuseos
```

Start Apache and MySQL through WAMP, then open:
```text
http://localhost/expomuseos/public/
```

#### Option B — Laravel development server
Alternatively, you can use Laravel's built-in PHP development server:
```bash
php artisan serve
```

Then open:
```text
http://127.0.0.1:8000
```

### 7. Frontend assets

The repository includes the **already compiled production assets** in:
```text
public/build/
```

Therefore, **Node.js, `npm install`, `npm run dev`, and `npm run build` are not required to run the application from the cloned repository**.

The original source files are still available under:
```text
resources/
```

If you want to modify the Tailwind CSS or JavaScript source and regenerate the production assets, install the Node.js dependencies and run:
```bash
npm install
npm run build
```

For frontend development with Vite's hot reload:
```bash
npm run dev
```

> These commands are only necessary when modifying or rebuilding the frontend assets. They are not part of the normal execution procedure described above.

### 8. Test credentials

The database dump includes a test user:
* **Name**: `admin`
* **Email**: `admin@fakemail.com`
* **Password**: `uoc-25-S1@`

### 9. Live deployment

#### Current LIVE Status (2026) ![status: inactive](https://img.shields.io/badge/status-inactive-red)

> ⚠️ **Important Note** The project was deployed on the server:
```
https://eimtcms2.techlab.uoc.edu/~mturur/pec4/dbphppec4_museums/public
```
> Which was configured and maintained during 2025/26.  
> As of today, the application is no longer running on their servers (although the screenshots show how it used to).

---

## 📂 Project Structure
> For the purpose of simplifying cloning and execution, this repository intentionally includes the `vendor`, `node_modules`, and `.env` files (`.gitignore`s commented). This decision was made to allow the project to run immediately after download without requiring additional setup steps such as dependency installation or environment configuration. This approach has been adopted strictly for demonstration purposes and the files do not contain any sensitive information, as this is a sample project.  
> In a production or professional environment, these files would be excluded following standard best practices.

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
db/
└── dbphppec4_db.sql            ← Database dump (tables + data)
public/
└── build/                              ← Compiled Tailwind CSS + JS (npm run build)
resources/
└── views/
    ├── home.blade.php                  ← Home page (featured museums)
    ├── museum.blade.php                ← Individual museum detail page
    └── layouts/
        └── navigation.blade.php       ← Session-aware navbar
routes/
├── web.php                             ← Home & museum detail routes
└── api.php                             ← API routes (prefix: /api)
.env                                    ← Environment config (DB, cache, session)
```

---

## 🔌 API Reference

All three endpoints return **JSON** and are **read-only** (GET). No authentication required. They open in a new browser tab from the nav menu.

| Endpoint | Description |
|---|---|
| `/api/museums` or `/api/museums/<page>` | Returns up to 5 museums per page with all fields and topics |
| `/api/museum/<id>` | Returns all fields + topics for the museum with the given ID |
| `/api/topic/<id>/<page>` | Returns up to 5 museums (id, name, city) for the given topic, paginated |

All endpoints return pagination metadata: `current_page`, `per_page`, `total`, `last_page`.  

**Example response** (`/api/museums/1`):
```json
{
  "current_page": 1,
  "data": [
    {
      "id": 1,
      "nombre": "British Museum",
      "ciudad": "Londres",
      "tematica": "Historia del arte, Arqueología",
      "fechas_horarios": "Lunes a Sábado, 10:00–20:00",
      "visitas_guiadas": "sí",
      "precio": "15.50",
      "imagen": "images/museums/british.jpg"
    },
    ...
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

### Home (Desktop):
![Home(Desktop)](screenshots/Desktop_Home.png)

### Museum Detail Page (Desktop):
![MuseumDetailPage(Desktop)](screenshots/Desktop_MuseumPost.png)

### Dashboard (Desktop):
![Dashboard(Desktop)](screenshots/Desktop_Dashboard.png)

### Log In (Desktop):
![Login(Desktop)](screenshots/Desktop_Login.png)

### Register (Desktop):
![Register(Desktop)](screenshots/Desktop_Register.png)

### Profile (Desktop):
![Profile(Desktop)](screenshots/Desktop_Profile.png)
-

### Home (Tablet):
![Home(Tablet)](screenshots/Tablet_Home.png)

### Museum Detail Page (Tablet):
![MuseumDetailPage(Tablet)](screenshots/Tablet_MuseumPost.png)

### Dashboard (Tablet):
![Dashboard(Tablet)](screenshots/Tablet_Dashboard.png)

### Log In (Tablet):
![Login(Tablet)](screenshots/Tablet_Login.png)

### Register (Tablet):
![Register(Tablet)](screenshots/Tablet_Register.png)

### Profile (Tablet):
![Profile(Tablet)](screenshots/Tablet_Profile.png)
-

### Home w/o menu (Mobile):
![Home(Mobile)](screenshots/Mobile_HomeWOMenu.png)

### Home w/ menu (Mobile):
![Home(Mobile)](screenshots/Mobile_HomeWMenu.png)

### Museum Detail Page (Mobile):
![MuseumDetailPage(Mobile)](screenshots/Mobile_MuseumPost.png)

### Dashboard (Mobile):
![Dashboard(Mobile)](screenshots/Mobile_Dashboard.png)

### Log In (Mobile):
![Login(Mobile)](screenshots/Mobile_Login.png)

### Register (Mobile):
![Register(Mobile)](screenshots/Mobile_Register.png)

### Profile (Mobile):
![Profile(Mobile)](screenshots/Mobile_Profile.png)
-

### POSTMAN — API Museums (page 1):
![PostmanMuseums](screenshots/API_museums(Postman).png)

### POSTMAN — API Museum (id 1):
![PostmanMuseum](screenshots/API_museum(Postman).png)

### POSTMAN — API Topic (topic 1; page 1):
![PostmanTopic](screenshots/API_topic(Postman).png)

---

### Database — museums table:
![MuseumsTable](screenshots/DB_museums.png)

### Database — topics table:
![TopicsTable](screenshots/DB_topics.png)

### Database — museum_topic pivot table:
![PivotTable](screenshots/DB_museum_topic.png)

### Database — users table:
![UsersTable](screenshots/DB_users.png)

---

## ⚖️ Copyright & License

© 2026 Marc Turu Roca. All rights reserved.

This project and its contents are the exclusive intellectual property of Marc Turu Roca.  
All rights reserved. No part of this project may be copied, modified, distributed, or used without prior written permission from the author.
