FROM ireceptor/service-php-mongodb:${API_TAG:-turnkey-v3}
ADD https://raw.githubusercontent.com/ireceptorplus-inesctec/config/ireceptorchain-integration/AIRR-iReceptorMapping.txt /var/www/html/config/
RUN chmod 644 /var/www/html/config/AIRR-iReceptorMapping.txt