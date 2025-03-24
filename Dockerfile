FROM php:8.2-apache

# Copie les fichiers publics
COPY public/ /var/www/html/

# Copie la configuration Apache personnalisée
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

# Fix des permissions
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html
