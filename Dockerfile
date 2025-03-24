# Utilise une image PHP + Apache officielle
FROM php:8.2-apache

# Copie tous les fichiers dans le dossier web de l'image Apache
COPY public/ /var/www/html/

# Active les modules Apache nécessaires (si besoin)
RUN docker-php-ext-install mysqli pdo pdo_mysql
