# Use PHP 8.1 with Apache
FROM php:8.1-apache

# Install required PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite for URL rewriting
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy all application files
COPY . .

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 8080 (Render uses this)
EXPOSE 8080

# Update Apache to listen on 8080
RUN sed -i 's/80/8080/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1

CMD ["apache2-foreground"]
