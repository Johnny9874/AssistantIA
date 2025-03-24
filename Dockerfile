FROM php:8.2-apache

# Copie le projet dans le dossier web
COPY public/ /var/www/html/

# Fix des permissions
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Définit assistant.html comme page d'accueil dans Apache
RUN sed -i 's|DirectoryIndex index.html|DirectoryIndex assistant.html|' /etc/apache2/mods-enabled/dir.conf \
    && echo "<Directory /var/www/html/>\\nOptions +Indexes\\nAllowOverride All\\nRequire all granted\\n</Directory>" > /etc/apache2/sites-enabled/000-default.conf
