FROM php:8.2-apache

# Copie tous les fichiers dans le dossier web d’Apache
COPY public/ /var/www/html/

# Fix permissions
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# 🛠️ Remplace la directive DirectoryIndex pour pointer sur assistant.html
RUN sed -i 's|DirectoryIndex .*|DirectoryIndex assistant.html|' /etc/apache2/mods-enabled/dir.conf
