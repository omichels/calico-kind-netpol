FROM nginx:latest

COPY db2.html /usr/share/nginx/html/index.html

EXPOSE 80

