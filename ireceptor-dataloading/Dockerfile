FROM ireceptor/dataloading-mongo:${DATALOADING_TAG:-turnkey-v3-dataloading}
ADD https://raw.githubusercontent.com/ireceptorplus-inesctec/config/ireceptorchain-integration/AIRR-iReceptorMapping.txt /app/config/
RUN chmod 644 /app/config/AIRR-iReceptorMapping.txt