# SkylineWeb


## 📖 Description
A flexible and scalable web platform that can become the basis for any future project, whether it's a blog, forum, catalog, or social network. Simple, but powerful, with possibilities for expansion.

**Includes:**
- ✅ WordPress (latest version)
- ✅ MySQL 8.0 (database)
- ✅ phpMyAdmin (database management)
- ✅ Configured file upload limits
- ✅ Environment variables for configuration
- Willingness to work in a team


## 📁 Project structure
```bash
my-wordpress-site/
├── docker-compose.yml # Docker configuration
├── .env # Environment variables (private)
├── .env.example # Example environment file
├── uploads.ini # PHP upload settings
├── wp-content/ # Plugins, themes, uploads
│ ├── plugins/
│ ├── themes/
│ └── uploads/
└── README.md # This file
```

## 🚀 Quick Start

```bash
# Start containers
docker-compose up -d

# Check status
docker-compose ps

# View logs if something doesn't work
docker-compose logs -f
```

## 🌐 Local Services Access

After starting the containers with `docker-compose up -d`, access your services using the addresses below:

| Service | URL | Username | Password |
|---------|-----|----------|----------|
| **WordPress (Site)** | http://localhost:8000 | - | - |
| **WordPress (Admin)** | http://localhost:8000/wp-admin | (set during installation) | (set during installation) |
| **phpMyAdmin** | http://localhost:8080 | `root` | Value of `WP_DB_ROOT_PASSWORD` from `.env` |
| **MySQL (Direct)** | `localhost:3307` | `root` or `WP_DB_USER` | `WP_DB_ROOT_PASSWORD` or `WP_DB_PASSWORD` |

---

## 📝 First Time Setup
1. Open http://localhost:8000 in your browser
2. Select language → English → Continue
3. Fill in the information:
- Site Title: My WordPress Site
- Username: admin
- Password: (choose a strong password)
- Your Email: your@email.com
- Uncheck "Search engine visibility" (for local development)
4. Click Install WordPress
5. Click Log In

## 🛑 Stopping the Project
```bash
# Stop containers
docker-compose down

# Stop and remove volumes (WARNING: deletes all data!)
docker-compose down -v
```
## 💾 Backup & Restore
```bash
# Create backup
docker exec wordpress_db mysqldump -u root -p${WP_DB_ROOT_PASSWORD} wordpress > backup.sql

# Restore from backup
docker exec -i wordpress_db mysql -u root -p${WP_DB_ROOT_PASSWORD} wordpress < backup.sql
```

## 📧 Contact
tg — https://t.me/howardd_rorkk
