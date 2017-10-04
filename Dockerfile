FROM nginx:stable-alpine

ADD public /usr/share/nginx/html/

RUN chown -R nginx:nginx /usr/share/nginx/html/