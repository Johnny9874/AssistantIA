FROM php:8.2-apache

# Copie les fichiers dans le dossier web d'Apache
COPY public/ /var/www/html/

# Applique les bonnes permissions
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# 🛠️ Définir assistant.html comme page d'accueil dans Apache
RUN sed -i 's|DirectoryIndex .*|DirectoryIndex assistant.html|' /etc/apache2/mods-enabled/dir.conf
