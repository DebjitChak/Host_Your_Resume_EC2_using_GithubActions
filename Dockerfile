FROM httpd:2.4
WORKDIR /app
COPY ./app/* /app/
RUN cp /app/* /usr/local/apache2/htdocs/
