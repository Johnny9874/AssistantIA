# Utilise l’image officielle PHP + Apache
FROM php:8.2-apache

# Copie tous les fichiers dans le dossier web de l'image Apache
COPY public/ /var/www/html/

# Définir assistant.html comme page d'accueil
RUN echo "DirectoryIndex assistant.html" > /etc/apache2/conf-available/custom-directory-index.conf \
    && a2enconf custom-directory-index

# Corriger les permissions (Apache utilise l'utilisateur www-data)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html
