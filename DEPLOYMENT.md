# Agro Culture - Deployment Guide

## Deployment Options

This application is built with PHP and can be deployed to multiple platforms:

### 1. **Render.com (Recommended - Docker)**
Best for traditional PHP applications with containerization.

#### Deployment Steps:
1. Push your code to GitHub
2. Go to [render.com](https://render.com) and create an account
3. Click "New +" → "Web Service"
4. Connect your GitHub repository
5. Select "Docker" as the environment
6. Configure environment variables:
   - `DB_HOST`: Your database host
   - `DB_USER`: Database username
   - `DB_PASS`: Database password
   - `DB_NAME`: Database name
7. Click "Create Web Service"

#### Local Testing:
```bash
# Start the application locally with Docker Compose
docker-compose up

# Application will be available at http://localhost:8080
```

#### Database Setup:
- The `docker-compose.yml` automatically imports `agroculture.sql`
- For production on Render, set up a MySQL database separately and update environment variables

---

### 2. **Railway.app (Docker)**
Simple and beginner-friendly deployment.

#### Steps:
1. Install Railway CLI: `npm i -g @railway/cli`
2. Login: `railway login`
3. Init project: `railway init`
4. Link database: `railway add` → MySQL
5. Deploy: `railway up`

---

### 3. **Vercel (Limited Support)**
Note: Vercel has limited PHP support. Use `vercel.json` for basic routing configuration.

---

### 4. **Traditional Hosting**
Works with any host supporting:
- PHP 8.1+
- MySQL/MariaDB
- Apache with mod_rewrite

Simply upload files via FTP/SSH and configure database credentials in environment variables.

---

## Environment Variables

Create a `.env` file (never commit to Git):
```
DB_HOST=your_host
DB_USER=your_user
DB_PASS=your_password
DB_NAME=agroculture
```

---

## Project Structure

```
├── Dockerfile              # Docker configuration
├── docker-compose.yml      # Local development setup
├── render.yaml            # Render.com deployment config
├── vercel.json            # Vercel configuration
├── .htaccess              # URL rewriting rules
├── .env.example           # Environment template
├── index.php              # Main application
├── db.php                 # Database connection
├── css/                   # Stylesheets
├── js/                    # JavaScript files
├── images/                # Images
├── bootstrap/             # Bootstrap framework
├── fonts/                 # Custom fonts
├── Blog/                  # Blog module
├── Profile/               # Profile module
├── Login/                 # Authentication module
└── ImagesAg/              # Agricultural images
```

---

## Security Checklist

- ✅ Environment variables for sensitive data
- ✅ `.htaccess` with security headers
- ✅ `.env` added to `.gitignore`
- ✅ Database password never hardcoded
- ✅ PHP extensions for mysqli/PDO

---

## Troubleshooting

**Database connection fails:**
- Verify environment variables are set
- Check database host accessibility
- Ensure database user has correct permissions

**504 Gateway Timeout:**
- Check application logs in your deployment platform
- Verify database connection is working
- Increase timeout limits if needed

**Static files not loading:**
- Ensure Apache mod_rewrite is enabled
- Check `.htaccess` permissions (644)
- Verify file paths in HTML

---

## Next Steps

1. Test locally with `docker-compose up`
2. Push to GitHub
3. Deploy to Render, Railway, or your preferred platform
4. Monitor logs and performance
