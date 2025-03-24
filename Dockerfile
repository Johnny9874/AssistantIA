# Utilise une image PHP + Apache
FROM php:8.2-apache

# Copie ton code dans le répertoire web d’Apache
COPY public/ /var/www/html/

# Définir assistant.html comme page d'accueil
RUN echo "DirectoryIndex assistant.html" > /etc/apache2/conf-available/custom-directory-index.conf \
    && a2enconf custom-directory-index
